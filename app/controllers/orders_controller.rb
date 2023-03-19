class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :check_order_existence, only: [:new, :create]

  def index
  if user_signed_in?
    @item = Item.find_by(id: params[:item_id])

    if @item.order.present?
      redirect_to root_path
    else
      @order_shipping_address = OrderShippingAddress.new
    end
  else
    redirect_to new_user_session_path
end
end

  def new
    @item = Item.find_by(id: params[:item_id])
    
  end

  def create

    @item = Item.find_by(id: params[:item_id])
    
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      pay_item 
      @order_shipping_address.save
      Order.create(item_id: @item.id, user_id: current_user.id)
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  
  

  private
  
  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:user_id, :item_id, :address,  :postal_code, :prefecture_id, :street, :building, :city, :phone, :token, :number, :month, :year, :cvc).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: @order_shipping_address.token,   
      currency: 'jpy'                 
    )
  end
  
  def check_order_existence
    item = Item.find(params[:item_id])
    if item.order.present?
      redirect_to root_path, alert: "この商品は既に購入されています。"
    elsif !user_signed_in?
      redirect_to new_user_session_path, alert: "ログインが必要です。"
    end
  end

end

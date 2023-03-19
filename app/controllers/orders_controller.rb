class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :check_order_existence, only: [:new, :create, :index]
  before_action :set_item, only: [:create, :index]

  def index
    set_item
    if @item.order.present?
      redirect_to root_path
    else
      @order_shipping_address = OrderShippingAddress.new
    end
  else
    redirect_to new_user_session_path

end

  def new
    
  end

  def create

    set_item    
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      pay_item 
      @order_shipping_address.save
      return redirect_to root_path
  
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

def set_item

    @item = Item.find_by(id: params[:item_id])
end



end

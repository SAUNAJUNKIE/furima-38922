class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :check_order_existence, only: [:new, :create, :index]
  before_action :set_item, only: [:create, :index]

  def index
    set_item
    if @item.order.present?
      redirect_to root_path
   
    end
  else
    redirect_to new_user_session_path

end

 

  def create

    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      pay_item 
      @order_shipping_address.save
      return redirect_to root_path
  else render new
    end 
   end
  
  
  

  private
  
  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:address, :postal_code, :prefecture_id, :street, :building, :city, :phone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] 
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
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to new_user_session_path
    elsif item.user == current_user
      redirect_to root_path
  end
  

def set_item

    @item = Item.find_by(id: params[:item_id])
end



end

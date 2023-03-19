class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user_ownership, only: [:edit, :destroy]



  def index
    @items = Item.all.order(created_at: :desc)
    if @items.empty?
      @dummy_item = OpenStruct.new(name: '商品を出品してね！', price: 99999999, image: 'https://tech-master.s3.amazonaws.com/uploads/curriculums/images/Rails1-4/sample.jpg')
  end
end
  
  def new
    @item = Item.new
   
 end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit    
   end

   def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end
  
  def destroy
      @item.destroy
      redirect_to root_path
end

  
  
  private

  def check_user_ownership
    if @item.order.present?
      redirect_to root_path
    elsif current_user != @item.user
      redirect_to root_path
  end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :seller_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end


end

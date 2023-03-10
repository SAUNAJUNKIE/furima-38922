class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @item = Item.find(params[:id])
  end
  

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :seller_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end


end

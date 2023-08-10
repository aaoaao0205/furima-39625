class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  #def item_order
    #@item = Item.find(params[:id])
    #return unless @item.order

    #redirect_to '/'
  #end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id,
                                 :shipping_fee_responsibility_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end

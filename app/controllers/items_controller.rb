class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :require_owner, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id,
                                 :shipping_fee_responsibility_id, :prefecture_id, :days_to_ship_id, :price)
          .merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def require_owner
    unless @item.user_id == current_user.id
      redirect_to user_session_path
    end
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :days_to_ship_id :price,).merge(user_id: current_user.id)
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_item, only: [:index, :create]
  before_action :require_owner_or_sold, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @orderform = OrderForm.new
  end

  def create
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save(params, current_user.id)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def buy_item
    @item = Item.find(params[:item_id])
  end

  def require_owner_or_sold
    return unless current_user.id == @item.user_id || @item.order.present?

    redirect_to root_path
  end
end

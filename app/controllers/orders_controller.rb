class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orderform = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @orderform.valid?
       pay_item
       @orderform.save(params,current_user.id)
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

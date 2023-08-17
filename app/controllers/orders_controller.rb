class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
       @orderform.save(params,current_user.id)
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_6819d31bb82a61ed9ac905dd"
    Payjp::Charge.create(
      amount: order_params[@item.price], 
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

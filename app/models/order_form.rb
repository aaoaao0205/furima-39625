class OrderForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Please enter numbers only' }
    validates :token
  end

  def save(params, user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id:)
    Address.create(postal_code:, prefecture_id:, city:, street_address:,
                   building_name:, phone_number:, order_id: order.id)
  end
end

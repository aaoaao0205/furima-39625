class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

#ActiveHashを利用するモデルファイルと商品モデルのアソシエーションを記述
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :days_to_ship


  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end


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

end

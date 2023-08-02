# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| password_confirmation | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday          | integer | null: false |

### Association

- has_many :products
- has_many :orders

## products テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | string | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shipping_fee_responsibility | string | null: false |
| origin             | string | null: false |
| days_to_ship       | string | null: false |
| price              | integer | null: false |
| seller_id          | references | null: false foreign_key: true |
| image             | text | null: false |

### Association

- belongs_to :users
- has_one :orders

## address テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string | null: false |
| phone_number       | string | null: false |
| orders_id | references | null: false foreign_key: true |

### Association

- belongs_to :orders

## orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| products_id        | string | references | null: false foreign_key: true |
| buyer_id           | string | references | null: false foreign_key: true |
### Association

- has_one :address
- belongs_to :users
- belongs_to :products
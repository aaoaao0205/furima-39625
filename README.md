# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date | null: false |

### Association

- has_many :items 
- has_many :orders

## items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | string | null: false |
| description        | text   | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_responsibility_id | integer | null: false |
| prefecture_id      | integer | null: false |
| days_to_ship_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture_id      | integer | null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| order             | references | null: false foreign_key: true |

### Association

- belongs_to :order

## orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | string | references | null: false foreign_key: true |
| user               | string | references | null: false foreign_key: true |
### Association

- has_one :address
- belongs_to :user
- belongs_to :item
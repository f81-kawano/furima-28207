# テーブル設計

## users テーブル

|Column|Type|Options|

| nickname | string | null: false, unique: true |
| email | string | null: false, unique: true |
| password | string | null: false |
| last-name | string | null: false |
| first-name | string | null: false |
| last-name-kana | string | null: false |
| first-name-kana | string | null: false |
| birth_y | integer | null: false |
| birth_m | integer | null: false |
| birth_d | integer | null: false |

### Association
- has_many :users
- has_many :buys

## items テーブル

| Column | Type   | Options     |

| image | blob | null: false |
| item_name | text | null: false, limit: 40 |
| information | text | null: false, limit: 1000 |
| category | integer | null: false |
| status | integer | null: false |
| shipping | integer | null: false |
| item_prefecture | integer | null: false |
| send_d | integer | null: false |
| price | integer | null: false |
| user_id | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :item

## buys テーブル

 Column | Type   | Options     |

| user_id | references | null: false, foreign_key: true |
| buy_d | timestamp |  |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

 Column | Type   | Options     |

| postal_code | string | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| house_num | string | null: false |
| building | string |  |
| phone_num | string | null: false |
| buy_id | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
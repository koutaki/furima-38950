## users テーブル

| Column                     | Type   | Options                  |
| -------------------------- | ------ | ----------------------   |
| nickname                   | string | null: false              |
| email                      | string | unique: true, null: false|
| encrypted_password         | string | null: false              |
| family_name                | string | null: false              |
| first_name                 | string | null: false              |
| family_name_kana           | string | null: false              |
| first_name_kana            | string | null: false              |
| birthday                   | date   | null: false              |

### Association

- has_many :items
- has_many  :purchase_histories

## items テーブル

| Column             | Type       | Options                        |
| --------------     | ------     | -----------                    |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :purchase_histories

## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history



## purchase_histories テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer







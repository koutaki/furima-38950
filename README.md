## users テーブル

| Column                     | Type   | Options      |
| -------------------------- | ------ | ------------ |
| nickname                   | string | null: false  |
| email                      | string | unique: true |
| encrypted_password         | string | null: false  |
| family_name                | string | null: false  |
| first_name                 | string | null: false  |
| family_name_kana           | string | null: false  |
| first_name_kana            | string | null: false  |
| birthday                   | date   | null: false  |

### Association

- has_many :items
- has_one  :buyers
- has_one  :purchase_histories

## items テーブル

| Column             | Type       | Options                        |
| --------------     | ------     | -----------                    |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :items_images
- belongs_to :categories
- belongs_to :shipping_costs
- belongs_to :item_conditions
- belongs_to :shipping_area
- belongs_to :shipping_days

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :users



## purchase_histories テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items


## items_images テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false                    |
| url       | string     | null: false                    |

### Association

- belongs_to :items 


## shipping_costs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shipping_cost | string     | null: false                    |

### Association

- has_many   :items , dependent: :destroy


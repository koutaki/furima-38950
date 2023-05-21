## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | null: false |
| password                   | string | null: false |
| family_name                | string | null: false |
| first_name                 | string | null: false |
| family_name_kana           | string | null: false |
| first_name_kana            | string | null: false |
| birth_year                 | string | null: false |
| birth_month                | string | null: false |
| birth_day                  | string | null: false |

### Association

- has_many :items
- has_one  :buyers

## items テーブル

| Column             | Type       | Options                        |
| --------------     | ------     | -----------                    |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false                    |
| item_condition_id  | references | null: false, foreign_key: true |
| category_id        | references | null: false, foreign_key: true |
| shipping_id        | references | null: false, foreign_key: true |
| buyer_id           | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :items_images
- belongs_to :categories
- belongs_to :shippings
- belongs_to :item_conditions

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users


## categories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| ancestry  | string     |                                |

### Association

- has_many   :items , dependent: :destroy


## items_images テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false                    |
| url       | string     | null: false                               |

### Association

- belongs_to :items 


## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shipping_cost | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |

### Association

- has_many   :items , dependent: :destroy


## item_conditions テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_conditions | string     | null: false                    |

### Association

- has_many   :items , dependent: :destroy
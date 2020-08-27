# テーブル設計

## users テーブル

| Column                   | Type    | Options      |
| --------                 | ------  | ------------ |
| nickname                 | string  | null: false  | 
| email                    | string  | null: false  |
| family_name              | string  | null: false  |
| first_name               | string  | null: false  |
| family_name_katakana     | string  | null: false  |
| first_name_katakana      | string  | null: false  |
| birthday                 | string  | null: false  |

### Association

- has_many :items
- has_many :purchase

##  itemsテーブル

| Column         | Type        | Options                        |
| ----------     | ------      | -----------------------------  |
| user_id        | references  | null: false, foreign_key: true |
| name           | string      | null: false                    |
| explanation    | string      | null: false                    |
| category       | string      | null: false                    |
| status         | string      | null: false                    |
| delivery_fee   | string      | null: false                    |
| prefecture     | string      | null: false                    |
| price          | integer     | null: false                    |


### Association

- belongs_to :user
- has_one :purchase

## purchase_items テーブル

| Column     | Type        | Options                        |
| ---------  | ----------  | -----------------------------  |
| user_id    | references  | null false, foreign_key: true  |
| item_id    | references  | null false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one: destination

## destinations テーブル

| Column           | Type        | Options                        |
| ------           | --------    | -----------------------------  |
| purchase_id      | references  | null false, foreign_key: true  |
| post_code        | string      | null false                     |
| prefecure        | string      | null false                     |
| city             | string      | null false                     |
| adress           | string      | null false                     |
| building         | string      |                                |
| phone_namber     | integer     | null false                     |


### Association

- belongs_to :purchase_item
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
| birthday                 | date    | null: false  |

### Association

- has_many :items
- has_many :purchase_items

##  itemsテーブル

| Column           | Type        | Options                        |
| ---------------  | ----------  | -----------------------------  |
| user             | references  | null: false, foreign_key: true |
| name             | string      | null: false                    |
| explanation      | text        | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| delivery_fee_id  | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |
| arrival_date_id  | integer     | null: false                    |
| price            | integer     | null: false                    |


### Association

- belongs_to :user
- has_one :purchase_item

## purchase_items テーブル

| Column  | Type        | Options                        |
| ------  | ----------  | -----------------------------  |
| user    | references  | null false, foreign_key: true  |
| item    | references  | null false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one: destination

## destinations テーブル

| Column            | Type        | Options                        |
| ----------------  | -------     | -----------------------------  |
| purchase_item     | references  | null false, foreign_key: true  |
| post_code         | string      | null false                     |
| prefecure_id      | integer     | null false                     |
| city              | string      | null false                     |
| adress            | string      | null false                     |
| building          | string      |                                |
| phone_number      | string      | null false                     |


### Association

- belongs_to :purchase_item
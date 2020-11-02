users テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| nickname           | string  | null: false |
| encrypted_password | string  | null: false |
| lastname           | string  | null: false |
| firstname          | string  | null: false |
| lname              | string  | null: false |
| fname              | string  | null: false |
| email              | string  | null: false |
| date               | integer | null: false |

- has_many :items
- has_many :buys

items テーブル

| Column        | Type       | Options     |
| --------      | ------     | ----------- |
| name          | string     | null: false |
| exposition    | text       | null: false |
| category_id   | integer    | null: false |
| state_id      | integer    | null: false |
| delivery_id   | integer    | null: false |
| area_id       | integer    | null: false |
| days_id       | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |


- belongs_to :user
- has_one :buys

buys テーブル

| Column    | Type       | Options                        |
| --------  | ------     | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :domain

domains テーブル

| Column         | Type       | Options                        |
| --------       | ------     | ------------------------------ |
| postnumber     | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| town           | string     | null: false                    |
| number         | string     | null: false                    |
| build          | string     | null: false                    |
| phone-number   | string     | null: false                    |
| buys           | references | null: false, foreign_key: true |

- belongs_to :buy


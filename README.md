users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| email      | string | null: false |
| birthday   | string | null: false |

- has_many :items
- has_many :buys

items テーブル

| Column     | Type       | Options     |
| --------   | ------     | ----------- |
| itemname   | string     | null: false |
| exposition | text       | null: false |
| category   | string     | null: false |
| state      | string     | null: false |
| delivery   | string     | null: false |
| area       | string     | null: false |
| days       | string     | null: false |
| price      | string     | null: false |
| user       | references | null: false, foreign_key: true |


- belongs_to :user
- has_one :buys

buys テーブル

| Column    | Type       | Options                        |
| --------  | ------     | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :domains

domains テーブル

| Column      | Type       | Options                        |
| --------    | ------     | ------------------------------ |
| postnumber  | string     | null: false                    |
| prefectures | string     | null: false                    |
| town        | string     | null: false                    |
| number      | string     | null: false                    |
| email       | string     | null: false                    |

- belongs_to :buy


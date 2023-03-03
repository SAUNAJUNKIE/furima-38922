
## users テーブル

| Column             | Type     | Options                      |
| ------------------ | -------- | ---------------------------- |
| name               | string   | null: false                  |
| email              | string   | null: false                  |
| encrypted_password | string   | null: false                  |
| user               | integer  | null: false, foreign_key:true|
| first_name         | string   | null: false                  |
| second_name        | string   | null: false                  |
| first_name_kana    | string   | null: false                  |
| second_name_kana   | string   | null: false                  |
| birthday           | string   | null: false                  |
### Association
- has_many :items
- has_many :orders


## items テーブル

| Column      | Type        | Options                       |
| ------------| ----------- | ------------------------------|
| item        | integer     | null: false,foreign_key: true |
| name	      | string      | null: false                   |
| description	| text	      | null: false                   |
| price	      | integer     | null: false                   | 
| status	    | integer     | null: false                   |
| item_name   | string      | null: false                   |
| category	  | string      | null: false                   |
| content   	| text	      | null: false                   |
| created_at  | integer     | null: false                   | 
| update_at	  | integer     | null: false                   |
| user	      | references  | null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one    :order


## order テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |



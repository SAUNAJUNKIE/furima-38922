
## users テーブル

| Column             | Type     | Options                      |
| ------------------ | -------- | ---------------------------- |
| name               | string   | null: false                  |
| email              | string   | null: false,unique:true      |
| encrypted_password | string   | null: false                  |
| first_name         | string   | null: false                  |
| second_name        | string   | null: false                  |
| first_name_kana    | string   | null: false                  |
| second_name_kana   | string   | null: false                  |
| birthday           | date     | null: false                  |
### Association
- has_many :items
- has_many :orders


## items テーブル

| Column           | Type        | Options                       |
| -----------------| ----------- | ------------------------------|
| name	           | string      | null: false                   |
| description      | text	       | null: false                   |
| price	           | integer     | null: false                   | 
| status_id	       | integer     | null: false                   |
| category_id      | integer     | null: false                   |
| user	           | references  | null: false, foreign_key: true|
|shipping_day_id   | integer     | null: false                   |
|shipping_area_id  | integer     | null: false                   | 
|seller_id         | integer     | null: false                   |
### Association
- belongs_to :user
- belong_to  :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address


## shipping_addresses　テーブル
| Column        | Type        | Options                       |
| --------------| ----------- | ------------------------------|
| postal_code	  | string      | null: false                   |
| prefecture  	| string	    | null: false                   |
| city	        | string      | null: false                   | 
| street        | string      | null: false                   |
| building      | string      |                               |
| phone	        | string      | null: false                   |

 ### Association
- has_many : order

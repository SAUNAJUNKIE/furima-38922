
## users テーブル

| Column             | Type     | Options                      |
| ------------------ | -------- | ---------------------------- |
| name               | string   | null: false                  |
| email              | string   | null: false,unique:ture      |
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

| Column        | Type        | Options                       |
| --------------| ----------- | ------------------------------|
| name	        | string      | null: false                   |
| description  	| text	      | null: false                   |
| price	        | integer     | null: false                   | 
| status	      | integer     | null: false                   |
| category	    | string      | null: false                   |
| user	        | references  | null: false, foreign_key: true|
|shipping_days  | text        | null: false                   |
|shipping_area  | text        | null: false                   | 
|Seller         | text        | null: false                   |
### Association
- belongs_to :user
- has_one    :order


## order テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one    :item
- has_one    :shipping_addresses


## shipping_addresses　テーブル
| Column        | Type        | Options                       |
| --------------| ----------- | ------------------------------|
| postal_code	  | string      | null: false                   |
| prefecture  	| text	      | null: false                   |
| city	        | text        | null: false                   | 
| address_line_1| string      | null: false                   |
| address_line_2| string      | null: false                   |
| user	        | references  | null: false, foreign_key: true|
 ### Association
- has_one : oeder

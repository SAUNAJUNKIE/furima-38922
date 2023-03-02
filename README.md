
furima-38922
概要
ユーザーの登録、編集、消去
商品の出品、編集、削除
商品の購入
商品の検索
クレジットカード決済
商品の配送先情報



データベース
データベースの種類: PostgreSQL 
データベースの設定方法: config/database.ymlファイルで設定
認証:admin  2222


モデル

User
Column	  Type	   Options
name	    string	null: false
email	    string	null: false
password	string	null: false
address   string  null: false
has_many :items
has_many :buy


Item
Column	      Type	      Options
name	       string	null: false
description	 text	null: false
price	       integer	null: false
status	     integer	null: false
user_id	     integer	null: false, foreign_key: true
belongs_to :user
belongs_to :buy
has_one :order


Order
Column	Type	Options
user_id	          integer	null: false, foreign_key: true
item_id	          integer	null: false, foreign_key: true

belongs_to :user
belongs_to :item

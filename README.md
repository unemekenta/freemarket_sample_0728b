# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Name
メルカリクローン

* Overview
フリマサイト「メルカリ」のクローン。
物品を簡単に売買できるフリーマーケットアプリです。
It is a free market app that allows you to easily buy, sell and trade.

* Ruby version
Ruby 2.5.1

* Authors
Hiroki_Katsuyama, Masatomo_Sugai, Yuichi_Motmomura, Kenta_Uneme

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## deliver-addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|pseudonym|string|null: false|
|post_number|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string||
|phone_number|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_number|integer||
|prefecture|string||
|city|string||
|street|string||
|building|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|evaluation|integer|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|string|null: false, foreign_key: true|

### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|secutiry_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## proceedsテーブル
|Column|Type|Options|
|------|----|-------|
|proceed|integer|null: false|
|user|references|null: false, foreign_key: true|
|purchase|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|pseudonym|string|null: false|
|birthday|date|null: false|
|nickname|string|null: false|
|photo|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|null: false|
|address|references|null: false, foreign_key: true|
|delivery_address|references|null: false, foreign_key: true|
|credit-card|references|null: false, foreign_key: true|

### Association
- has_many :evaluations
- has_one :deliver_address
- has_one :address
- has_many :points
- has_one :credit_card
- has_many :proceeds
- has_many :products, through: :purchases
- has_many :products, through: :likes
- has_many :products, through: :messages
- has_many :products, through: :transactions
- has_many :products, through: :todoes

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|seller|string|null: false|
|buyer|string|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
|status|string|null: false|

### Association
- belongs_to :user
- belongs_to :product
- has_many :transactions

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_message|string|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :purchase

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|parent_id|integer||
|brand|references|foreign_key: true|
|size|references|foreign_key: true|

### Association
- belongs_to :product
- has_one :brand
- has_one :size

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand|string|null: false|

### Association
- belongs_to :category

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|

### Association
- belongs_to :category

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|detail|string|null: false|
|category|references|null: false, foreign_key: true|
|status|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|delivery|references|null: false, foreign_key: true|

### Association
- has_many :users, through: :likes
- has_many :users, through: :messages
- has_many :users, through: :todoes
- has_many :users, through: :transactions
- has_many :users, through: :purchases
- has_many :product-image
- has_one :category
- has_one :status
- has_one :condition
- has_one :delivery

## product-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|integer|null: false, foreign_key: true|

### Association
- belongs_to :product

## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- belongs_to :product

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|condition|string|null: false|

### Association
- belongs_to :product

## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|product|integer|null: false, foreign_key: true|
|deliver-method|references|null: false, foreign_key: true|
|deliver-region|references|null: false, foreign_key: true|
|estimated-date|references|null: false, foreign_key: true|
|shipping_fee|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- has_one :deliver-method
- has_one :deliver-region
- has_one :estimated-date

## deliver-methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- belongs_to :delivery

## deliver-regionsテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|

### Association
- belongs_to :delivery

## estimated-datesテーブル
|Column|Type|Options|
|------|----|-------|
|date|integer|null: false|

### Association
- belongs_to :delivery

## shipping_feesテーブル
|Column|Type|Options|
|------|----|-------|
|which|string|null: false|

### Association
- belongs_to :delivery

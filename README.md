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

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|assessment|integer|null: false|
|seller|string|null: false|
|buyer|string|null: false|

### Association
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|photo|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|address|string|null: false|
|delivery_address|string|null: false|
|evaluation|integer|null: false|
|wallet|integer|null: false|

### Association
- has_many :evaluations
- belongs_to :sale
- has_many :products, through: :likes
- has_many :messages

## salesテーブル
|Column|Type|Options|
|------|----|-------|
|seller|string|null: false|
|buyer|string|null: false|
|product|integer|null: false, foreign_key: true|
|status|string|null: false|

### Association
- has_many :users
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null: false, foreign_key: true|
|product|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user|integer|null: false, foreign_key: true|
|product|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :detail-category
- belongs_to :brand
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|detail|string|null: false|
|photo|string|null: false|
|category|integer|null: false, foreign_key: true|
|brand|integer|null: false, foreign_key: true|
|message|integer|null: false, foreign_key: true|
|status|integer|null: false, foreign_key: true|

### Association
- has_many :users, through: :likes
- belongs_to :sale
- belongs_to :category
- belongs_to :product-image
- belongs_to :status
- belongs_to :delivery

## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|product|integer|null: false, foreign_key: true|
|deliver-method|integer|null: false, foreign_key: true|
|deliver-region|integer|null: false, foreign_key: true|
|estimated-date|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :deliver-method
- belongs_to :deliver-region
- belongs_to :estimated-date

## estimated-datesテーブル
|Column|Type|Options|
|------|----|-------|
|date|integer|null: false|

### Association
- belongs_to :delivery

## detail-categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent|integer|null: false, foreign_key: true|

### Association
- belongs_to :category

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent|integer|null: false, foreign_key: true|

### Association
- belongs_to :category

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
|status_name|string|null: false|

### Association
- belongs_to :product

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

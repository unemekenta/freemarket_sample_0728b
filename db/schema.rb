# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_04_003755) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "post_number", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category", null: false
    t.integer "parent_id"
    t.bigint "size_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_type_id"], name: "index_categories_on_size_type_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "condition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliver_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliver_regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "region", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveraddresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_pseudonym", null: false
    t.string "first_name_pseudonym", null: false
    t.string "post_number"
    t.string "prefecture"
    t.string "city"
    t.string "street"
    t.string "building"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deliveraddresses_on_user_id"
  end

  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "shipping_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deliver_method_id", null: false
    t.bigint "estimated_date_id", null: false
    t.bigint "product_id", null: false
    t.bigint "deliver_region_id", null: false
    t.index ["deliver_method_id"], name: "index_deliveries_on_deliver_method_id"
    t.index ["deliver_region_id"], name: "index_deliveries_on_deliver_region_id"
    t.index ["estimated_date_id"], name: "index_deliveries_on_estimated_date_id"
    t.index ["product_id"], name: "index_deliveries_on_product_id"
  end

  create_table "estimated_dates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "rating", null: false
    t.text "comment"
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_evaluations_on_buyer_id"
    t.index ["seller_id"], name: "index_evaluations_on_seller_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "point", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_id", default: 1, null: false
    t.bigint "condition_id", null: false
    t.bigint "brand_id"
    t.bigint "category_id", null: false
    t.bigint "size_id"
    t.bigint "seller_id"
    t.integer "likes_count"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["seller_id"], name: "index_products_on_seller_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["status_id"], name: "index_products_on_status_id"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "seller_id", null: false
    t.bigint "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount"
    t.index ["buyer_id"], name: "index_purchases_on_buyer_id"
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["seller_id"], name: "index_purchases_on_seller_id"
  end

  create_table "size_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "size_type_id", null: false
    t.index ["size_type_id"], name: "index_sizes_on_size_type_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.date "birthday", null: false
    t.string "photo", default: "0"
    t.integer "phone_number", default: 0
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_pseudonym", null: false
    t.string "first_name_pseudonym", null: false
    t.string "provider"
    t.string "uid"
    t.text "profile"
    t.string "line_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "size_types"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "deliveraddresses", "users"
  add_foreign_key "deliveries", "deliver_methods"
  add_foreign_key "deliveries", "deliver_regions"
  add_foreign_key "deliveries", "estimated_dates"
  add_foreign_key "deliveries", "products"
  add_foreign_key "evaluations", "users", column: "buyer_id"
  add_foreign_key "evaluations", "users", column: "seller_id"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "statuses"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "users", column: "buyer_id"
  add_foreign_key "purchases", "users", column: "seller_id"
  add_foreign_key "sizes", "size_types"
end

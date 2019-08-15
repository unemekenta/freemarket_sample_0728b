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

ActiveRecord::Schema.define(version: 2019_08_14_102326) do

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "condition", null: false
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
    t.string "nickname"
    t.date "birthday"
    t.string "photo"
    t.integer "phone_number"
    t.bigint "address_id"
    t.bigint "credit_card_id"
    t.string "family_name"
    t.string "first_name"
    t.string "family_name_pseudonym"
    t.string "first_name_pseudonym"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["credit_card_id"], name: "index_users_on_credit_card_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

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

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
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
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["status_id"], name: "index_products_on_status_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deliveries", "deliver_methods"
  add_foreign_key "deliveries", "deliver_regions"
  add_foreign_key "deliveries", "estimated_dates"
  add_foreign_key "deliveries", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "statuses"

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141118162000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "material_changes", force: true do |t|
    t.string   "name"
    t.float    "amount"
    t.text     "notes"
    t.string   "units"
    t.integer  "material_id"
    t.boolean  "disable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "material_changes", ["material_id"], name: "index_material_changes_on_material_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "unit"
    t.string   "sku_abbreviation"
    t.string   "internal_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_configurations", force: true do |t|
    t.string   "name"
    t.float    "cogs"
    t.float    "weight"
    t.integer  "product_id"
    t.integer  "style_size_id"
    t.integer  "style_color_id"
    t.string   "sku"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_configurations", ["product_id"], name: "index_product_configurations_on_product_id", using: :btree
  add_index "product_configurations", ["style_color_id"], name: "index_product_configurations_on_style_color_id", using: :btree
  add_index "product_configurations", ["style_size_id"], name: "index_product_configurations_on_style_size_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: true do |t|
    t.string   "name"
    t.integer  "purchase_order_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "required_materials", force: true do |t|
    t.string   "name"
    t.integer  "product_configuration_id"
    t.float    "amount"
    t.string   "units"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "required_materials", ["material_id"], name: "index_required_materials_on_material_id", using: :btree
  add_index "required_materials", ["product_configuration_id"], name: "index_required_materials_on_product_configuration_id", using: :btree

  create_table "style_colors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "style_sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "work_order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_orders", force: true do |t|
    t.integer  "worker_id"
    t.integer  "work_order_status_id"
    t.integer  "product_configuration_id"
    t.integer  "purchase_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_orders", ["product_configuration_id"], name: "index_work_orders_on_product_configuration_id", using: :btree
  add_index "work_orders", ["purchase_order_id"], name: "index_work_orders_on_purchase_order_id", using: :btree
  add_index "work_orders", ["worker_id"], name: "index_work_orders_on_worker_id", using: :btree

  create_table "workers", force: true do |t|
    t.string   "name"
    t.string   "photo_url"
    t.string   "cell_phone"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

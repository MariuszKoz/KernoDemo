# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_04_133557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone_number"
    t.string "street_name"
    t.string "building_number"
    t.string "apartment_number"
    t.string "city"
    t.string "post_code"
    t.string "country"
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_clients_on_store_id"
  end

  create_table "door_collections", force: :cascade do |t|
    t.string "collection_name"
    t.bigint "door_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_group_id"], name: "index_door_collections_on_door_group_id"
  end

  create_table "door_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "door_layouts", force: :cascade do |t|
    t.string "layout_name"
    t.bigint "door_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_group_id"], name: "index_door_layouts_on_door_group_id"
  end

  create_table "door_models", force: :cascade do |t|
    t.string "name"
    t.bigint "door_group_id", null: false
    t.bigint "door_collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_collection_id"], name: "index_door_models_on_door_collection_id"
    t.index ["door_group_id"], name: "index_door_models_on_door_group_id"
  end

  create_table "door_types", force: :cascade do |t|
    t.string "type_name"
    t.bigint "door_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_group_id"], name: "index_door_types_on_door_group_id"
  end

  create_table "opening_types", force: :cascade do |t|
    t.string "opening_type_name"
    t.bigint "door_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_group_id"], name: "index_opening_types_on_door_group_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "description"
    t.jsonb "order_status", default: {}, null: false
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "description"
    t.boolean "published", default: false, null: false
    t.bigint "door_group_id", null: false
    t.bigint "door_collection_id", null: false
    t.bigint "door_model_id", null: false
    t.bigint "door_type_id", null: false
    t.bigint "door_layout_id", null: false
    t.bigint "opening_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["door_collection_id"], name: "index_products_on_door_collection_id"
    t.index ["door_group_id"], name: "index_products_on_door_group_id"
    t.index ["door_layout_id"], name: "index_products_on_door_layout_id"
    t.index ["door_model_id"], name: "index_products_on_door_model_id"
    t.index ["door_type_id"], name: "index_products_on_door_type_id"
    t.index ["opening_type_id"], name: "index_products_on_opening_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name"
    t.string "phone_number"
    t.string "street_name"
    t.string "building_number"
    t.string "apartment_number"
    t.string "city"
    t.string "post_code"
    t.string "country"
    t.string "nip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone_number"
    t.string "street_name"
    t.string "building_number"
    t.string "apartment_number"
    t.string "city"
    t.string "post_code"
    t.string "country"
    t.boolean "active", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.bigint "store_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "stores"
  add_foreign_key "users", "stores"
end

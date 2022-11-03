# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :first_name        , null: false, default: ""
      t.string  :last_name         , null: false, default: ""
      t.string  :phone_number
      t.string  :street_name
      t.string  :building_number
      t.string  :apartment_number
      t.string  :city
      t.string  :post_code
      t.string  :country
      t.boolean :active, null: false, default: false
      t.string  :email,              null: false, default: ""
      t.string  :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.references :store, index: true, null: false, foreign_key: true

      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

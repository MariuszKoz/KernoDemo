class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name        , null: false, default: ""
      t.string :last_name         , null: false, default: ""
      t.string :phone_number
      t.string :street_name
      t.string :building_number
      t.string :apartment_number
      t.string :city
      t.string :post_code
      t.string :country

      t.references  :store, index: true, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

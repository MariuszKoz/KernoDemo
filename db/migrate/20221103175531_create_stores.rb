class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string  :store_name
      t.string  :phone_number
      t.string  :street_name
      t.string  :building_number
      t.string  :apartment_number
      t.string  :city
      t.string  :post_code
      t.string  :country
      t.string  :nip

      t.timestamps
    end
  end
end

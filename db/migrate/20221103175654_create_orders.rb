class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text        :description
      t.jsonb       :order_status, null: false, default: {}

      t.references  :user, index: true, null: false
      t.references  :product, index: :true, null: false
      
      t.timestamps
    end
  end
end

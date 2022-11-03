class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text    :description
      t.boolean :published, null: false, default: false
      
      t.references  :door_group, index: true, null: false
      t.references  :door_collection, index: true, null: false
      t.references  :door_model, index: true, null: false
      t.references  :door_type, index: true, null: false
      t.references  :door_layout, index: true, null: false
      t.references  :opening_type, index: true, null: false
      
      t.timestamps
    end
  end
end

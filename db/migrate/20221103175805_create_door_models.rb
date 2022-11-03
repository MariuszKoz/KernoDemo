class CreateDoorModels < ActiveRecord::Migration[7.0]
  def change
    create_table :door_models do |t|
      t.string  :name
      
      t.references :door_group, index: true, null: false
      t.references :door_collection, index: true, null: false

      t.timestamps
    end
  end
end

class CreateDoorCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :door_collections do |t|
      t.string  :collection_name
      
      t.references :door_group, index: true, null: false
      
      t.timestamps
    end
  end
end

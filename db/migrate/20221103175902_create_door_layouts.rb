class CreateDoorLayouts < ActiveRecord::Migration[7.0]
  def change
    create_table :door_layouts do |t|
      t.string  :layout_name
      
      t.references :door_group, index: true, null: false

      t.timestamps
    end
  end
end

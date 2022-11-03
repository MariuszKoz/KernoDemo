class CreateDoorTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :door_types do |t|
      t.string  :type_name
      
      t.references :door_group, index: true, null: false

      t.timestamps
    end
  end
end

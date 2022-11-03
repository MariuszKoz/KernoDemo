class CreateOpeningTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_types do |t|
      t.string :opening_type_name

      t.references :door_group, index: true, null: false

      t.timestamps
    end
  end
end

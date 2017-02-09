class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.integer :theme
      t.string :entity_type

      t.timestamps
    end
  end
end

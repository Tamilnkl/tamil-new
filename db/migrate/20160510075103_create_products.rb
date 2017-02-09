class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :text
      t.string :text_area
      t.string :text_field

      t.timestamps
    end
  end
end

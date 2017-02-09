class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.string :image_path
      t.integer :template_id

      t.timestamps
    end
  end
end

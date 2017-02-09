class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :entity_id
      t.string :entity_type
      t.string :image_file_name
      t.integer :image_file_size
      t.integer :user_id

      t.timestamps
    end
  end
end

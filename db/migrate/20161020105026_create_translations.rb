class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :key
      t.string :value
      t.string :locale

      t.timestamps
    end
  end
end

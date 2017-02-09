class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.integer :phone
      t.integer :template_id
      t.integer :theme_id
      t.timestamps
    end
  end
end

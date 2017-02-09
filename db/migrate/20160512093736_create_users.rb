class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :phone
      t.string :address
      t.string :user_type
      t.string :fullname

      t.timestamps
    end
  end
end

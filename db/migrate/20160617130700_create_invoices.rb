class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end

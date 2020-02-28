class CreateWarrantyReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :warranty_returns do |t|
      t.string :rma_no
      t.boolean :remote, default: false
      t.boolean :stand, default: false
      t.boolean :damage, default: false
      t.timestamps
    end
  end
end

class WarrantyReturnDamageType < ActiveRecord::Migration[5.2]
  def change
    add_column :warranty_returns, :box_type, :string
  end
end

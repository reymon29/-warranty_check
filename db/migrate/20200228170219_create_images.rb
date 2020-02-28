class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :warranty_return_id
      t.string :image

      t.timestamps
    end
  end
end

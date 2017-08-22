class CreateWarehouseItems < ActiveRecord::Migration
  def change
    create_table :warehouse_items do |t|
      t.string :item_name
      t.string :where_are_go
      t.integer :quantity
      t.timestamps null: false
    end
  end
end

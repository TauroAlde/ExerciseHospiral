class CreateWarehouseItemProviders < ActiveRecord::Migration
  def change
    create_table :warehouse_item_providers do |t|
      t.belongs_to :provider
      t.belongs_to :warehouse_item
      t.timestamps null: false
    end
  end
end

class CreateWarehouseItemsDepartments < ActiveRecord::Migration
  def change
    create_table :warehouse_items_departments do |t|
      t.belongs_to :warehouse_item
      t.belongs_to :department
      t.integer :quantity
      t.timestamps null: false
    end
  end
end

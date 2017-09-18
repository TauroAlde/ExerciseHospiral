class CreateWarehouseItemsDepartments < ActiveRecord::Migration
  def change
    create_table :warehouse_items_departments do |t|
      t.integer :warehouse_item_id
      t.integer :source_department_id
      t.integer :quantity
      t.integer :destination_department_id
      t.timestamps null: false
    end
  end
end

class CreateWarehouseItemsDepartments < ActiveRecord::Migration
  def change
    create_table :warehouse_items_departments do |t|
      t.belongs_to :warehouse_items
      t.belongs_to :departments
      t.timestamps null: false
    end
  end
end

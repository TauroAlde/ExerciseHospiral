class AddFieldsToWarehouseItemsDepartment < ActiveRecord::Migration
  def change
    add_column :warehouse_items_departments, :admin_user_id, :integer
  end
end

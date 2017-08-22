class WarehouseItemsDepartment < ActiveRecord::Base
  belongs_to :warehouse_items
  belongs_to :departments
end

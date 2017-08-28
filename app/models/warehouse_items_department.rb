class WarehouseItemsDepartment < ActiveRecord::Base
  belongs_to :warehouse_item
  belongs_to :department
end

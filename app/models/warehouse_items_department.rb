
class WarehouseItemsDepartment < ActiveRecord::Base
  belongs_to :warehouse_item
  belongs_to :department
  belongs_to :admin_user
  belongs_to :source_department, class_name: "Department", foreign_key: :source_department_id
  belongs_to :destination_department, class_name: "Department", foreign_key: :destination_department_id
end

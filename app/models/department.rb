class Department < ActiveRecord::Base
  validates :department_name, presence: true, allow_blank: false
  has_many :warehouse_items, through: :warehouse_items_departments
  has_many :warehouse_items_departments
  accepts_nested_attributes_for :warehouse_items_departments
  has_many :sourced_department, class_name: "warehouse_items_departments", foreign_key: :source_department_id
  has_many :destined_department, class_name: "warehouse_items_departments", foreign_key: :destination_department_id
end

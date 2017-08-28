class Department < ActiveRecord::Base
  validates :department_name, presence: true, allow_blank: false
  has_many :warehouse_items, through: :warehouse_items_departments
  has_many :warehouse_items_departments
  accepts_nested_attributes_for :warehouse_items_departments
end

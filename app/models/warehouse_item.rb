class WarehouseItem < ActiveRecord::Base
  has_many :departments, through: :warehouse_items_department
  has_many :warehouse_items_department
  accepts_nested_attributes_for :warehouse_items_department
end

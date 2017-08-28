class  WarehouseItem < ActiveRecord::Base
  has_many :departments, through: :warehouse_items_departments
  has_many :warehouse_items_departments
  accepts_nested_attributes_for :warehouse_items_departments
end

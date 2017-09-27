class  WarehouseItem < ActiveRecord::Base
  validates :item_name, presence: true, allow_blank: false
  validates :quantity_total, presence: true, allow_blank: false
  has_many :departments, through: :warehouse_items_departments
  has_many :warehouse_items_departments
  accepts_nested_attributes_for :warehouse_items_departments
end

class WarehouseItemProvider < ActiveRecord::Base
  belongs_to :provider
  belongs_to :warehouse_item
end

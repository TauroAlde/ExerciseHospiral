FactoryGirl.define do
  factory :warehouse_item, class: WarehouseItem do |f|
    f.item_name "cuchillo"
    f.quantity_total 50
  end
end
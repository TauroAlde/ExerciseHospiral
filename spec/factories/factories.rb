FactoryGirl.define do
  factory :department, class: Department do |f|
    f.sequence(:department_name) { |n| "Department#{n}"}
  end

  factory :warehouse_item, class: WarehouseItem do |f|
    f.item_name "cuchillo"
    f.quantity_total 50
  end  
end
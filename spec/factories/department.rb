FactoryGirl.define do
  factory :department, class: Department do |f|
    f.sequence(:department_name) { |n| "Department#{n}"}
  end
end
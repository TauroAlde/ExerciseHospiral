 FactoryGirl.define do
  factory :provider, class: Provider do |f|
    f.active true
    f.sequence(:address) { |n| "cielo / cielo rojo#{n}"}
    f.sequence(:name) { |n| "Aluis pantojoa muños#{n}"}
    f.priority 1
  end
end
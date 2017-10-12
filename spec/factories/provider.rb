 FactoryGirl.define do
  factory :provider, class: Provider do |f|
    f.active true
    f.sequence(:address) { |n| "Corozal / presa de la angostura#{n}"}
    f.sequence(:name) { |n| "Amed Salazar Estrella#{n}"}
    f.priority 1
  end
end
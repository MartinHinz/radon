# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :prmat do |f|
    f.sequence(:name) { |n| "material_#{n}" }
  end
end

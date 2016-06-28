FactoryGirl.define do

  factory :role do |f|
    f.name "guest"
    factory :admin_role do |f|
      f.name "admin"
    end
  end

  factory :user do |f|
#    association :roles, factory: :role, strategy: :build
    f.sequence(:login) { |n| "name_#{n}" }
    f.sequence(:email) { |n| "foo#{n}@example.com" }
    f.sequence(:password) { |n| "secret" }
    f.sequence(:password_confirmation) { |n| "secret" }
    f.roles {[FactoryGirl.create(:role)]}
    factory :admin_user do |f|
      f.roles {[FactoryGirl.create(:admin_role)]}
    end
  end
end

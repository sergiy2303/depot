FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@ukr.net" }
    password 'P@ssw0rd'
  end
end

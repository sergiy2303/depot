FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@ukr.net" }
    password 'P@ssw0rd'
    confirmed true
  end

  factory :unconfirmed_user, parent: :user do
    confirmed false
  end
end

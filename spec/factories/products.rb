FactoryGirl.define do
  factory :product do
    association :category
    name 'MyString'
    description 'MyText'
    image 'MyString'
    price '9.99'
  end
end

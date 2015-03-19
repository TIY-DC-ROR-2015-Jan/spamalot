FactoryGirl.define do
  factory :spam do
    url { Faker::Internet.url }
  end
end

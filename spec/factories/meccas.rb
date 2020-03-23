FactoryBot.define do
  factory :mecca do
    sequence(:name) { |n| "MECCA_NAME#{n}"}
    sequence(:body) { |n| "BODY_#{n}"}
    sequence(:mecca_image_id) { Faker::Lorem.characters(60) }
    sequence(:address) { |n| "ADDRESS#{n}"}
    sequence(:post_code) { |n| "123456#{n}"}
  end
end
FactoryBot.define do
  factory :mecca do
    sequence(:name) { |n| "MECCA_NAME#{n}"}
    sequence(:body) { |n| "BODY_#{n}"}
    sequence(:mecca_image) { |n| "MECCA_IMAGE#{n}.JPG"}
    sequence(:address) { |n| "ADDRESS#{n}"}
    sequence(:post_code) { |n| "123456#{n}"}
  end
end
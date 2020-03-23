FactoryBot.define do
  factory :movie_tag do
    sequence(:title) { |n| "MOVIE_TAG_TITLE#{n}"}
    sequence(:body) { |n| "MOVIE_TAG_BODY_#{n}"}
    sequence(:movie_image_id) { Faker::Lorem.characters(60) }
  end
end
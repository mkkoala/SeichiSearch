FactoryBot.define do
  factory :movie_tag do
    sequence(:title) { |n| "MOVIE_TAG_TITLE#{n}"}
    sequence(:body) { |n| "MOVIE_TAG_BODY_#{n}"}
  end
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Name#{n}" }
  end

  factory :article do
    author factory: :user
    categories { [create(:category)] }
    sequence(:title) { |n| "Title#{n}" }
    sequence(:text) { |n| "text#{n}" }
    sequence(:image) { |n| "image#{n}" }
  end

  factory :vote do
    user
    article
  end

  factory :category do
    sequence(:name) { |n| "category#{n}" }
    priority { 1 }
  end
end
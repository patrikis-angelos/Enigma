require 'rails_helper'
require_relative 'factories'

RSpec.describe 'Article', type: :model do
  it 'creates valid articles' do
    expect(create(:article)).to be_valid
  end
  describe 'associations' do
    it 'can have many categories' do
      article = Article.reflect_on_association(:categories)
      expect(article.macro).to eql(:has_many)
    end
    it 'must have at least one category' do
      user = create(:user)
      article = user.articles.build(title: "Title", text: "text", image: "image_url")
      expect(article).to_not be_valid
    end
    it 'belongs to an author' do
      article = Article.reflect_on_association(:author)
      expect(article.macro).to eql(:belongs_to)
    end
    it 'can have many votes' do
      article = Article.reflect_on_association(:votes)
      expect(article.macro).to eql(:has_many)
    end
  end
end
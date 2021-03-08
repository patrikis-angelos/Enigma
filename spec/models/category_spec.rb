require 'rails_helper'
require_relative '../factories'

RSpec.describe 'Category', type: :model do
  it 'creates valid ctegories' do
    expect(create(:category)).to be_valid
  end
  describe 'associations' do
    it 'can have many articles' do
      user = User.reflect_on_association(:articles)
      expect(user.macro).to eql(:has_many)
    end
  end
  describe '#last_article' do
    it 'finds the last article of a category' do
      category = create(:category)
      article = create(:article, categories: [category])
      expect(category.last_article.id).to eql(article.id)
    end
  end
end

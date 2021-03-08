require 'rails_helper'
require_relative '../factories'

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
      article = user.articles.build(title: 'Title', text: 'text', image: 'image_url')
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
  describe '#self.best' do
    it 'finds the most voted article' do
      article1 = create(:article)
      article2 = create(:article)
      create(:vote, article_id: article1.id)
      2.times {create(:vote, article_id: article2.id)}
      expect(Article.best.id).to eql(article2.id)
    end
  end
  describe '#voted_by?(user)' do
    it 'return true if the article was voted by the specified user' do
      user = create(:user)
      article = create(:article)
      create(:vote, user_id: user.id, article_id: article.id)
      expect(article.voted_by?(user)).to eql(true)
    end
    it 'returns false if the article was not voted by the specified user' do
      user = create(:user)
      article = create(:article)
      create(:vote, article_id: article.id)
      expect(article.voted_by?(user)).to eql(false)
    end
  end
end

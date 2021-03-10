require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Votes' do
  scenario 'A user votes an article' do
    user = log_in
    category = create(:category)
    article = create(:article, categories: [category])
    visit root_path
    within 'nav' do
      click_on category.name
    end
    click_on 'Upvote'
    expect(article.voted_by?(user)).to eql(true)
  end
  scenario 'A user downvotes an article he already voted' do
    user = log_in
    category = create(:category)
    article = create(:article, categories: [category])
    create(:vote, user_id: user.id, article_id: article.id)
    visit root_path
    within 'nav' do
      click_on category.name
    end
    click_on 'Downvote'
    expect(article.voted_by?(user)).to eql(false)
  end
end

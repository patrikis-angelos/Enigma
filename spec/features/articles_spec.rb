require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Users' do
  scenario 'A user creates a new article' do
    user = log_in
    category = create(:category)
    visit root_path
    click_on 'Create article'
    fill_in 'article_title', with: 'Title'
    fill_in 'article_image', with: 'Image'
    fill_in 'article_text', with: 'Image'
    find(:css, "#category_ids_#{category.name}[value='1']").set(true)
    click_on 'Submit'
    expect(category.articles.exists?(title: 'Title')).to eql(true)
  end
end
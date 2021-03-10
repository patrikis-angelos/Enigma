require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Users' do
  scenario 'A user creates a new article' do
    log_in
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
  scenario 'A user creates a non valid article' do
    log_in
    category = create(:category)
    visit new_article_path
    fill_in 'article_title', with: ''
    fill_in 'article_image', with: 'Image'
    fill_in 'article_text', with: 'Image'
    find(:css, "#category_ids_#{category.name}[value='2']").set(true)
    click_on 'Submit'
    expect(category.articles.exists?(title: 'Title')).to_not eql(true)
    expect(page).to have_content "Title can't be blank"
  end
  scenario 'A user creates an article but does not pick a category' do
    log_in
    category = create(:category)
    visit new_article_path
    fill_in 'article_title', with: 'Title'
    fill_in 'article_image', with: 'Image'
    fill_in 'article_text', with: 'Image'
    click_on 'Submit'
    expect(category.articles.exists?(title: 'Title')).to_not eql(true)
    expect(page).to have_content "Categories is too short"
  end
  scenario 'A user creates an article with 2 categories selected' do
    log_in
    category1 = create(:category)
    category2 = create(:category)
    visit new_article_path
    fill_in 'article_title', with: 'Title'
    fill_in 'article_image', with: 'Image'
    fill_in 'article_text', with: 'Image'
    find(:css, "#category_ids_#{category1.name}[value='4']").set(true)
    find(:css, "#category_ids_#{category2.name}[value='5']").set(true)
    click_on 'Submit'
    expect(category1.articles.exists?(title: 'Title')).to eql(true)
    expect(category2.articles.exists?(title: 'Title')).to eql(true)
  end
end

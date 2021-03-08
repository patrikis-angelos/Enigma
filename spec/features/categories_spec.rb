require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Categories' do
  scenario 'A user visits a category page' do
    log_in
    category = create(:category)
    visit root_path
    within 'nav' do
      click_on category.name
    end
    expect(current_path).to eql("/categories/#{category.id}")
  end
  scenario 'A user visits the main page' do
    log_in
    4.times { create(:article) }
    create(:vote)
    visit root_path
    within '.best-article' do
      expect(page).to have_content('Title')
    end
    within 'main' do
      expect(page).to have_content('category', count: 4)
    end
  end
end

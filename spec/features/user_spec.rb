require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Users' do
  scenario 'Sign up' do
    visit '/users/new'
    fill_in 'user_name', with: 'User1'
    within("main") do
      click_on 'Sign Up'
    end
    expect(page).to have_content ('User1')
  end
  scenario 'User visits his profile' do
    user = log_in
    click_on user.name
    expect(current_path).to eql("/users/#{user.id}")
  end
end
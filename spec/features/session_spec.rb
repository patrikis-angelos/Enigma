require 'rails_helper'
require_relative '../factories'
require_relative '../helpers'

RSpec.feature 'Sessions' do
  scenario 'Log in' do
    user = create(:user)
    visit '/sessions'
    fill_in 'name', with: user.name
    click_on 'Sign In'
    expect(page).to have_content(user.name)
  end
  scenario 'Log out' do
    log_in
    visit root_path
    click_on 'Logout'
    expect(current_path).to eql('/sessions')
  end
end

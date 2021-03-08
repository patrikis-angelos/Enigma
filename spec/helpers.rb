module Helpers
  def log_in
    user = create(:user)
    visit '/sessions'
    fill_in 'name', with: user.name
    click_on 'Sign In'
    user
  end
end


RSpec.configure do |c|
  c.include Helpers
end
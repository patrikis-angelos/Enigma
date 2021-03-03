require 'rails_helper'
require_relative 'factories'

RSpec.describe 'User', type: :model do
  it 'creates valid users' do
    expect(create(:user)).to be_valid
  end
  describe 'associations' do
    it 'can have many votes' do
      user = User.reflect_on_association(:votes)
      expect(user.macro).to eql(:has_many)
    end
    it 'can have many articles' do
      user = User.reflect_on_association(:articles)
      expect(user.macro).to eql(:has_many)
    end
  end
end
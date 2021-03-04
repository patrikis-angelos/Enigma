require 'rails_helper'
require_relative 'factories'

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
end

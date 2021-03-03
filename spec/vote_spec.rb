require 'rails_helper'
require_relative 'factories'

RSpec.describe 'Vote', type: :model do
  it 'creates valid votes' do
    expect(create(:vote)).to be_valid
  end
  describe 'associations' do
    it 'belongs to a user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eql(:belongs_to)
    end
    it 'belongs to an article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eql(:belongs_to)
    end
  end
end
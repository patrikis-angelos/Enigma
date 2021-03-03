require 'rails_helper'
require_relative 'factories'

RSpec.describe 'User', type: :model do
  it 'creates valid users' do
    expect(create(:user)).to be_valid
  end
end
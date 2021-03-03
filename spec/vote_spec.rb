require 'rails_helper'
require_relative 'factories'

RSpec.describe 'Vote', type: :model do
  it 'creates valid votes' do
    expect(create(:vote)).to be_valid
  end
end
require 'rails_helper'
require_relative 'factories'

RSpec.describe 'Category', type: :model do
  it 'creates valid ctegories' do
    expect(create(:category)).to be_valid
  end
end
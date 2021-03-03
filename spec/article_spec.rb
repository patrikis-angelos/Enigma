require 'rails_helper'
require_relative 'factories'

RSpec.describe 'Article', type: :model do
  it 'creates valid articles' do
    expect(create(:article)).to be_valid
  end
end
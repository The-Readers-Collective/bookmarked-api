require 'rails_helper'

RSpec.describe Placeholder, type: :model do
  it 'is the placeholder test for CIRCLECI' do
    expect(Placeholder.testing).to eq(true)
  end
end
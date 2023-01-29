require 'rails_helper'

RSpec.describe 'Zipcode Facade' do
  context 'Happy Path' do
    it 'returns the distance between books', :vcr do
      distance = ZipcodeFacade.distance_between_books("80241", "80020")

      expect(distance).to be_a Float
      expect(distance).to eq(8.5159)
    end

  end
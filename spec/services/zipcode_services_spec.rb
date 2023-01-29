require 'rails_helper'

RSpec.describe 'Zipcode Service' do
  context 'Happy Path' do
    it 'can return distance between two users', :vcr do
      distance_data = ZipcodeService.distance_details("80241", "80020")
      
      expect(distance_data).to be_a Hash
      expect(distance_data[:route][:distance]).to be_an Float
    end
  end
end
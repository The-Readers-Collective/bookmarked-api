require 'rails_helper'

RSpec.describe UserBook, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :book }
  end
  describe 'validations' do
    it {should validate_presence_of :status}
  end
end

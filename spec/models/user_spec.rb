require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_books }
    it { should have_many(:books).through(:user_books) }
    it { should have_many :followings } 
    
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :zipcode }
  end
end

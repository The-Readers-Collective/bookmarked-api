require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_books }
    it { should have_many(:books).through(:user_books) }
    it { should have_many :followings } 
  end
end

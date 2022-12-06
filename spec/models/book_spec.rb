require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { should have_many :user_books }
    it { should have_many(:users).through(:user_books) }
  end
end

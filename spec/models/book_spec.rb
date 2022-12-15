require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { should have_many :user_books }
    it { should have_many(:users).through(:user_books) }
  end
  describe 'validations' do
    it { should validate_presence_of :google_book_id }
    it { should validate_presence_of :book_title }
    it { should validate_presence_of :author }
    it { should validate_presence_of :isbn_13 }
    it { should validate_presence_of :condition }
    xit { should validate_inclusion_of(:available).in_array([true, false])  }
  end
end

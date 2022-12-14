require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'relationships' do
    it { should belong_to :follower }
    it { should belong_to :followed }
  end
end

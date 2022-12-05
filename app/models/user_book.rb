class UserBook < ApplicationRecord
  has_many :users
  has_many :books

end

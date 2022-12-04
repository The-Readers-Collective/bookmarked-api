module Types
  class UserAttributes < BaseInputObject
    description "Attributes for creating or updating a User"
    argument :name, String
    argument :address, String
    argument :email, String
    argument :password, String
  end
end
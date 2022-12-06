module Types
  class UserAttributes < BaseInputObject
    description "Attributes for creating or updating a User"
    argument :name, String
    argument :zipcode, String
    argument :email, String
  end
end
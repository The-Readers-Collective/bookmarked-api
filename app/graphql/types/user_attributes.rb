module Types
  class UserAttributes < BaseInputObject
    description "Attributes for creating or updating a User"
    argument :name, String, required: false
    argument :zipcode, String, required: false
    argument :email, String, required: false
  end
end
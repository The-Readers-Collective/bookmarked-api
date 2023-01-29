class ZipcodeFacade ## do i need < ZipcodeService

  def self.distance_between_books(start_zipcode, target_zipcode)
    miles = ZipcodeService.distance_details(start_zipcode, target_zipcode)[:route][:distance]
    # require 'pry'; binding.pry
    #might be able to delete 'miles' 
  end

end
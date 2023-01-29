class ZipcodeFacade ## do i need < ZipcodeService

  def self.distance_between_books(zipcode_start, zipcode_end)
    details = ZipcodeService.distance_details(start_zipcode, end_zipcode)[:route].slice(:distance)
    require 'pry'; binding.pry
    #might be able to delete details 
  end

end
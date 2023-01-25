class ZipcodeFacade < NavService

  def self.distance_between_books(zipcode_start, zipcode_end)
    details = distance_details(start_zipcode, end_zipcode)[:route].slice(:distance)
  end

end
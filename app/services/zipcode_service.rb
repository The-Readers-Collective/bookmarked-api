class ZipcodeService

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.distance_details(start_zipcode, end_zipcode)
    response = connection.get("/directions/v2/route", {from: start_zipcode, to: end_zipcode})
    parse(response)
    require 'pry'; binding.pry
  end
  
  def self.connection
     Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: { key: ENV['ZIP_API'] }
      )
  end
end
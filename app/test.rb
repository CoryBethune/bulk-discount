require 'httparty'
require 'pry'
response = HTTParty.get('https://date.nager.at/api/v3/NextPublicHolidays/US')
test = JSON.parse(response.body, symbolize_names: true)
binding.pry

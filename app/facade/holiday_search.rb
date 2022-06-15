require './app/poro/holiday'
require './app/service/esty_service'
require 'pry'
require 'httparty'

class HolidaySearch

  def next_holidays
    holidays = Holiday.new(service.holidays)
    holidays.the_three_holidays
  end
  # def repo_avatars
  #   avatars = Avatar.new(service.repo_usernames)
  #   avatars.avatar_urls
  # end

  def service
    EstyService.new
  end
  # binding.pry
end

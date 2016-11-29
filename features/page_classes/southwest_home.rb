require 'page-object'

class SouthwestHome
  include PageObject

  page_url 'southwest.com'

  text_field(:departure, id: 'air-city-departure')
  text_field(:arrival, id: 'air-city-arrival')
  button(:search, id: 'jb-booking-form-submit-button')

  def set_departure(city1)
    self.departure = city1
  end

  def set_arrival(city2)
    self.arrival = city2
  end

  def carousel_enabled
    @browser.lis(class: 'carouselEnabledSodaIneligible')
  end

  def carousel_today_enabled
    @browser.lis(class: 'carouselTodaySodaIneligible')
  end

end
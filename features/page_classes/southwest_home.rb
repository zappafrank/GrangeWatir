require 'page-object'

class SouthwestHome
  include PageObject

  page_url 'southwest.com'

  text_field(:departure, id: 'air-city-departure')
  text_field(:arrival, id: 'air-city-arrival')
  button(:search, id: 'jb-booking-form-submit-button')

  def SetDeparture(city1)
    self.departure = city1
  end

  def SetArrival(city2)
    self.arrival = city2
  end

  def CarouselEnabled
    @browser.lis(class: 'carouselEnabledSodaIneligible')
  end

  def CarouselTodayEnabled
    @browser.lis(class: 'carouselTodaySodaIneligible')
  end

end
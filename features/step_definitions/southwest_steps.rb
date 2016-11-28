require 'page-object'
include PageObject::PageFactory

When(/^I search for a flight using the default dates$/) do
  visit_page(SouthwestHome) do |page|
    page.SetDeparture 'cmh'
    page.SetArrival 'bna'
    page.search
    sleep 5
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page(SouthwestHome) do |page|
    departTime = Time.new + 60*60*24
    returnTime = Time.new + 60*60*96

    dates = page.CarouselTodayEnabled

    ##departure date should be tomorrow's date
    expect(dates[0].attribute_value('carouselfulldate')).to eq departTime.strftime('%Y/%m/%d')
    puts dates[0].attribute_value('carouselfulldate')

    ##return date should be 3 days from departure
    expect(dates[1].attribute_value('carouselfulldate')).to eq returnTime.strftime('%Y/%m/%d')
    puts dates[1].attribute_value('carouselfulldate')
  end
end

And(/^I can't choose a departure date from the past$/) do
  on_page(SouthwestHome) do |page|
    time = Time.new
    dates = page.CarouselEnabled

    ##first enabled li should be today's date
    expect(dates[0].attribute_value('carouselfulldate')).to eq time.strftime('%Y/%m/%d')
    puts dates[0].attribute_value('carouselfulldate')
  end
end
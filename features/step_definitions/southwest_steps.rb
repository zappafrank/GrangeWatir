require 'page-object'
include PageObject::PageFactory

When(/^I search for a flight using the default dates$/) do
  visit_page(SouthwestHome) do |page|
    page.set_departure 'cmh'
    page.set_arrival 'bna'
    page.search
    sleep 5
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page(SouthwestHome) do |page|
    depart_time = Time.new + 60*60*24
    return_time = Time.new + 60*60*96

    dates = page.carousel_today_enabled

    ##departure date should be tomorrow's date
    expect(dates[0].attribute_value('carouselfulldate')).to eq depart_time.strftime('%Y/%m/%d')
    puts dates[0].attribute_value('carouselfulldate')

    ##return date should be 3 days from departure
    expect(dates[1].attribute_value('carouselfulldate')).to eq return_time.strftime('%Y/%m/%d')
    puts dates[1].attribute_value('carouselfulldate')
  end
end

And(/^I can't choose a departure date from the past$/) do
  on_page(SouthwestHome) do |page|
    time = Time.new
    dates = page.carousel_enabled

    ##first enabled li should be today's date
    expect(dates[0].attribute_value('carouselfulldate')).to eq time.strftime('%Y/%m/%d')
    puts dates[0].attribute_value('carouselfulldate')
  end
end
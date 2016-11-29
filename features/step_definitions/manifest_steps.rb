require 'page-object'
include PageObject::PageFactory


When(/^I filter jobs by Columbus$/) do
  visit_page(ManifestHome) do |page|
    page.set_city
    sleep 5
  end
end

Then(/^only Columbus opportunities are present$/) do
  on_page(ManifestHome) do |page|
    opp_loc_div = page.city_loc_list

    opp_loc_div.each do |opp_loc|
      expect(opp_loc.text).to eq 'Columbus, OH'
      puts opp_loc.text
    end
  end
end


When(/^I filter jobs by contract$/) do
  visit_page(ManifestHome) do |page|
    page.set_job_type
    sleep 5
  end
end

Then(/^only contract opportunities are present$/) do
  on_page(ManifestHome) do |page|
    opp_type_div = page.opp_type_list

    opp_type_div.each do |opp_type|
      expect(opp_type.text).to eq 'Contract'
      puts opp_type.text
    end
  end
end
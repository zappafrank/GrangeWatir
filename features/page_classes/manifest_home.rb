require 'page-object'

class ManifestHome

  include PageObject

  page_url 'manifestcorp.com/opportunities/all-opportunities/'

  def set_city
    @browser.select_list(name: 'opportunity_loc').select('Columbus, OH')
  end

  def city_loc_list
    @browser.divs(class: 'opp-loc')
  end

  def set_job_type
    @browser.select_list(name: 'opportunity_type').select('Contract')
  end

  def opp_type_list
    @browser.divs(class: 'opp-type')
  end

end
require 'page-object'

class ManifestHome

  include PageObject

  page_url 'manifestcorp.com/opportunities/all-opportunities/'

  def SetCity
    @browser.select_list(name: 'opportunity_loc').select('Columbus, OH')
  end

  def CityLocList
    @browser.divs(class: 'opp-loc')
  end

  def SetJobType
    @browser.select_list(name: 'opportunity_type').select('Contract')
  end

  def OppTypeList
    @browser.divs(class: 'opp-type')
  end

end
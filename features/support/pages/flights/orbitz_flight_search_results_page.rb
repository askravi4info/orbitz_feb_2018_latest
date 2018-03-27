class OrbitzFlightSearchResultsPage
  require_relative '../../modules/utilities'

  include PageObject
  include Utilities

  div(:results_title, :class => 'title-departure')
  spans(:flight_price, :class=>"full-bold no-wrap")
  div(:progress_bar, :class=>'progress-bar')


  def verify_flight_results_are_correct? arrival_airport_name
    exp_results_title = "Select your departure to #{arrival_airport_name} #{get_day_details 2}"
    actual_results_title = results_title_element.text
    verify_both_are_equal? actual_results_title, exp_results_title
  end

  def get_all_prices
    # sleep 15
    wait_until(30){
      progress_bar_element.attribute_value('style').include? 'width: 100%'
    }
    all_flight_prices = []
    flight_price_elements.each do |each_flight_price|
      p each_flight_price.text
      all_flight_prices << each_flight_price.text.gsub('$','').to_i
    end

    all_flight_prices
  end

end
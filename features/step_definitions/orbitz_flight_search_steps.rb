Given(/^user is on orbitz home page$/) do
  visit OrbitzHomePage
end

When(/^user selects the flights tab$/) do
  on(OrbitzHomePage).select_flight_tab_element.click
end

And(/^user choose the round trip option$/) do
  on(OrbitzHomePage).select_round_trip_option_element.click
end

And(/^user selects (.+) airport for the city (.+) from the departure edit box$/) do |airport_name, city_name|
  on(OrbitzHomePage).select_dep_airport city_name, airport_name
end

And(/^user selects (.+) airport for the city (.+) from the arrival edit box$/) do |airport_name, city_name|
  on(OrbitzHomePage).select_arr_airport city_name, airport_name
end

And(/^user searches for the available (.+) flights$/) do |which_date|
  on(OrbitzHomePage).search_flights_for_dates which_date
  on(OrbitzHomePage).search_flights_element.click
end

Then(/^verify the search results are related to (.+) airport$/) do |arrival_airport_name|
  # actual_title = on(OrbitzFlightSearchResultsPage).results_title_element.text
  # on(OrbitzFlightSearchResultsPage).verify_both_are_equal? actual_title, arrival_airport_name
  on(OrbitzFlightSearchResultsPage).verify_flight_results_are_correct? arrival_airport_name
end


Then(/^verify user is warned with the following$/) do |table|
  # table is a table.hashes.keys # => [:Departing date is in the past. Please enter a valid departing date.]
  table.hashes.each do |x|
    # on(OrbitzHomePage).verify_warning_message_exists? x['messages']
    #
    all_messages = on(OrbitzHomePage).get_all_error_messages
    # fail "#{x['messages']} not found in all the messages - #{all_messages}" unless all_messages.include? x['messages']
    expect(all_messages).should include x['messages']
  end
end

When(/^user searches for the future available flights$/) do
  # dep_airport = 'Columbus, OH'
  # city_name = "Columbus"
  # step 'user selects the flights tab'
  # step 'user choose the round trip option'
  # step "user selects #{dep_airport} airport for the city #{city_name} from the departure edit box"
  # step 'user selects Boston, MA airport for the city Boston from the arrival edit box'
  # step 'user searches for the available future flights'


  # steps %Q{
  #   When user selects the flights tab
  #   And user choose the round trip option
  #   And user selects Columbus, OH airport for the city Columbus from the departure edit box
  #   And user selects Boston, MA airport for the city Boston from the arrival edit box
  #   And user searches for the available future flights
  #
  #   }
  #
  on(OrbitzHomePage).search_for_future_flights
end

And(/^verify the flights are displayed with the sort order of price$/) do
  actual_prices = on(OrbitzFlightSearchResultsPage).get_all_prices
  expect(actual_prices).should eql? actual_prices.sort
end

Then(/^verify the user is able to access data from yml file$/) do
  on(OrbitzHomePage).get_data_from_yml
end
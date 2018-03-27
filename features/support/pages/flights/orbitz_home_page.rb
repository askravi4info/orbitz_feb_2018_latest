class OrbitzHomePage
  require_relative '../../modules/utilities'

  include PageObject
  include Utilities

  page_url 'www.orbitz.com'

  # link(:select_flight_tab, :id => 'tab-flight-tab')
  button(:select_flight_tab, :id => 'tab-flight-tab-hp')
  label(:select_round_trip_option, :id => 'flight-type-roundtrip-label')
  text_field(:departure_airport, :id => 'flight-origin')
  text_field(:arrival_airport, :id => 'flight-destination')
  ul(:list_of_airports, :class => 'results')
  text_field(:dep_date, :id => 'flight-departing')
  text_field(:arr_date, :id => 'flight-returning')
  button(:search_flights, :id => 'search-button')
  div(:warning_messages, :class => 'alert-message')


  def verify_warning_message_exists? message
    # x = false
    # warning_messages_element.lis.each do |msg|
    #   if msg.text == message
    #     p msg.text
    #     x = true
    #     break
    #   end
    # end
    # fail "#{messfad
    # fd
    # saf
    # dsDfd
    # sf
    # dsfage} not found in the list" if x == false
    # ***************
    all_messages = []
    warning_messages_element.lis.each do |each_msg|
      all_messages << each_msg.text
    end

    fail "#{message} not found in the applicaiton" unless all_messages.include? message
  end

  def get_all_error_messages
    all_messages = []
    warning_messages_element.lis.each do |each_msg|
      all_messages << each_msg.text
    end
    all_messages
  end

  def select_dep_airport city_name, airport_name
    self.departure_airport = city_name
    # departure_airport_element.send_keys city_name
    # departure_airport_element.send_keys :enter
    # @browser.text_field().send_keys city_name
    # @browser.text_field().send_keys :enter
    #
    select_correct_airport airport_name
  end

  def select_arr_airport city_name, airport_name
    # @browser.text_field(:id => 'flight-destination').set city_name
    # arrival_airport_element.set city_name
    self.arrival_airport = city_name
    select_correct_airport airport_name
  end

  def select_correct_airport airport_name
    list_of_airports_element.when_present.lis.each do |airport|
      p airport.text
      if airport.text.include? airport_name
        airport.click
        break
      end
    end
  end

  def search_flights_for_dates future_or_past
    if future_or_past == 'future'
      # dep_date_element.set change_date dep_days
      self.dep_date = change_date 2
      self.arr_date = change_date 2
    else
      self.dep_date = change_date -2
      self.arr_date = change_date -2
    end
  end

  def search_for_future_flights
    select_flight_tab_element.click
    select_round_trip_option_element.click
    select_dep_airport "Columbus", "Columbus, OH"
    select_arr_airport "Boston", "Boston, MA"
    search_flights_for_dates 'future'
    search_flights_element.click

  end

  def get_data_from_yml

    yml_path = 'C:\Users\Ravi\Desktop\Feb 2018\orbitz_flight_feb2018\features\support\data\test_data.yml'
    @file = YAML.load_file yml_path
    p @file.fetch('request')
    p @file['content']['session']

    p @file['city_name']

    @file['request'] = 33333
    @file['content']['session'] = 2 #Modify
    @file['city_name'] = 'boston'
    #
    File.open(yml_path, "w") {|f| f.write(@file.to_yaml) }
    #
    p @file.fetch('request')
    p @file['content']['session']
    p @file['city_name']



  end

end
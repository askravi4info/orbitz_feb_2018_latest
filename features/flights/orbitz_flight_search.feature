@flight_search @one_way_res
Feature: Orbitz Flight Search Functionality

  Background:
    Given user is on orbitz home page

  Scenario: verify the user is able to search for the available flights for the future dates with imperative style
    When user selects the flights tab
    And user choose the round trip option
    And user selects Columbus, OH airport for the city Columbus from the departure edit box
    And user selects Boston, MA airport for the city Boston from the arrival edit box
    And user searches for the available future flights
    Then verify the search results are related to Boston airport

  @release
  Scenario Outline: verify the user is able to search for the available flights for the future dates with different set of data
    When user selects the flights tab
    And user choose the round trip option
    And user selects <dep_airport> airport for the city <dep_city_name> from the departure edit box
    And user selects <arr_airport> airport for the city <arr_city_name> from the arrival edit box
    And user searches for the available future flights
    Then verify the search results are related to <arr_city_name> airport

    Examples:
      | dep_airport  | dep_city_name | arr_airport | arr_city_name |
      | Columbus, OH | Columbus      | Boston, MA  | Boston        |
      | Columbus, OH | Columbus      | Chicago, IL | Chicago       |

  @smoke
  Scenario: verify the user is able to search for the available flights for the future dates with declarative style
    When user searches for the future available flights
    Then verify the search results are related to Boston airport

  @regression
  Scenario: verify the user is warned when searching for a past date flights
    When user selects the flights tab
    And user choose the round trip option
    And user selects Columbus, OH airport for the city Columbus from the departure edit box
    And user selects Boston, MA airport for the city Boston from the arrival edit box
    And user searches for the available past flights
    Then verify user is warned with the following
      | messages                                                             |
      | Departing date is in the past. Please enter a valid departing dates. |
      | Returning date is in the past. Please enter a valid returning date.  |


  Scenario: verify the flights are displayed with the sort order of price
    When user searches for the future available flights
    Then verify the search results are related to Boston airport
    And verify the flights are displayed with the sort order of price

  Scenario: testing the yml functionality
    Then verify the user is able to access data from yml file

  Scenario: last scenario

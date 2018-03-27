Feature: Cars Search functionality

  Scenario: verify user is able to search for the available luxury cars in chicago airport
    Given user is on google home page
    When user searches for available luxury cars for chicago airport
    Then user should see the available luxury cars details



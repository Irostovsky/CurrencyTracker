Feature: See countries
  In order to see his travel itinerary
  Mr. Smart
  wants to see the countries
  
  Scenario: List of countries
    Given user with email "test@mailinator.com" exists
    Given I am on the home page
    And I log in as user with email "test@mailinator.com"
    And I should see "Currencies" within "section"
    
    Then I follow "Countries"
    And I should see "Countries" within "section"
    And I should see "Afghanistan, Islamic State of" within ".items"
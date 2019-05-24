Feature: Invalid Search

@NoResults
Scenario: Unable to search Weather

    Given I am on Login Screen
    When User enters valid credentials
    Then Login is successful

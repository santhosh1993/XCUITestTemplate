Feature: Valid Login

@NoResults
Scenario: Valid login with all possible credentials

    Given I am on Login Screen
    When User enters valid credentials
    Then Login is successful

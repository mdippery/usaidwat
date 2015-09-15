Feature: Display user information

  As a Redditor
  I want to be able to list basic information about another Redditor
  In order to learn more about them

  Scenario: List user information
    Given the Reddit service returns information for the user "mipadi"
    And time is frozen at Sep 15, 2015 3:16 PM
    When I run `usaidwat info mipadi`
    Then the exit status should be 0
    And the output should match:
      """
      Created: [A-Z][a-z]{2} \d{2}, \d{4} \d{2}:\d{2} (A|P)M \(over 7 years ago\)
      Link Karma: 4892
      Comment Karma: 33440
      """

  Scenario: List user information for a non-existent user
    Given the Reddit service does not have a user "testuser"
    When I run `usaidwat info testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: Fail to pass a username when querying for information
    Given the Reddit service returns information for the user "mipadi"
    When I run `usaidwat info`
    Then it should fail with:
      """
      You must specify a username
      """

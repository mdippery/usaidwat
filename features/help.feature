Feature: Get help

  As a Redditor
  I want to be able to list help information for usaidwat
  In order to learn how to use it
  
  Scenario: List usage details
    When I run `usaidwat --help`
    Then it should pass with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """
  
  Scenario: Get version
    When I run `usaidwat --version`
    Then the exit status should be 0
    And the stdout should contain:
      """
      usaidwat v
      """

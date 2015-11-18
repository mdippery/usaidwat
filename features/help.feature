Feature: Get help

  As a Redditor
  I want to be able to list help information for usaidwat
  In order to learn how to use it
  
  Scenario: Pass no arguments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat`
    Then the exit status should be 0
    And stdout should contain:
      """
      Usage:

        usaidwat <command> [options] <args>
      """

  Scenario: List usage details
    When I run `usaidwat --help`
    Then the exit status should be 0
    And stdout should contain:
      """
      Usage:

        usaidwat <command> [options] <args>
      """
  
  Scenario: Get version
    When I run `usaidwat --version`
    Then the exit status should be 0
    And stderr should not contain anything
    And the output should match:
      """
      usaidwat [0-9]+\.[0-9]+\.[0-9]+
      """

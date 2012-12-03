Feature: Browse comments

  As a Redditor
  I want to quickly be able to list another Redditor's comments
  In order to see what they like to talk about
  
  Background: Reddit service
    Given the Reddit service returns comments for the user "mipadi"
  
  Scenario: List all comments
    When I run `usaidwat mipadi`
    Then the exit status should be 0
  
  Scenario: Tally comments
    When I run `usaidwat --tally mipadi`
    Then it should pass with:
      """
      apple            6
      AskReddit        61
      battlefield3     2
      books            2
      django           1
      Games            1
      nyc              1
      personalfinance  1
      photography      1
      programming      20
      redditcasual     1
      wikipedia        1
      worldnews        2
      """
  
  Scenario: List comments for a particular subreddit
    When I run `usaidwat mipadi AskReddit`
    Then the exit status should be 0
  
  Scenario: List comments for a subreddit with no comments
    When I run `usaidwat mipadi nsfw`
    Then it should pass with:
      """
      No comments by mipadi for nsfw.
      """
  
  Scenario: Tally comments with subreddit
    When I run `usaidwat --tally mipadi AskReddit`
    Then the exit status should not be 0
  
  Scenario: Pass no arguments
    When I run `usaidwat`
    Then it should fail with:
      """
      Usage: usaidwat [--tally] <user> [<subreddit>]
      """
  
  Scenario: Pass no arguments when tallying
    When I run `usaidwat --tally`
    Then it should fail with:
      """
      Usage: usaidwat [--tally] <user> [<subreddit>]
      """

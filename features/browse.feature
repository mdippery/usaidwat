Feature: Browse comments

  As a Redditor
  I want to quickly be able to list another Redditor's comments
  In order to see what they like to talk about

  Scenario: List all comments
    When I run `usaidwat mipadi`
    Then the exit status should be 0
  
  Scenario: Tally comments
    When I run `usaidwat --tally mipadi`
    Then the exit status should be 0
  
  Scenario: List comments for a particular subreddit
    When I run `usaidwat mipadi AskReddit`
    Then the exit status should be 0

  Scenario: Tally comments with subreddit
    When I run `usaidwat --tally mipadi AskReddit`
    Then the exit status should not be 0

Feature: Browse comments

  As a Redditor
  I want to quickly be able to list another Redditor's comments
  In order to see what they like to talk about
  
  Scenario: List all comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat mipadi | head -n 16`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6

      It has a fare when the lights are *off.*


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4

      The Judgment of Solomon Accords.
      """

  Scenario: List all comments for a user that does not exist
    Given the Reddit service does not have a user "palorchild"
    When I run `usaidwat palorchild`
    Then it should fail with:
      """
      No such user: palorchild
      """
  
  Scenario: List all comments when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat blank`
    Then it should pass with:
      """
      blank has no comments.
      """
  
  Scenario: Tally comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat -t mipadi`
    Then it should pass with:
      """
      apple              6
      AskReddit         61
      battlefield3       2
      books              2
      django             1
      Games              1
      nyc                1
      personalfinance    1
      photography        1
      programming       20
      redditcasual       1
      wikipedia          1
      worldnews          2
      """
    
  Scenario: Tally comments when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat -t blank`
    Then it should pass with:
      """
      blank has no comments.
      """
  
  Scenario: List comments for a particular subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat mipadi AskReddit | head -n 16`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo

      You didn't slow down for very long though, did you?
      """
  
  Scenario: List comments for a subreddit with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat mipadi nsfw`
    Then it should pass with:
      """
      No comments by mipadi for nsfw.
      """
  
  Scenario: Tally comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat -t mipadi AskReddit`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """
  
  Scenario: Pass no arguments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """
  
  Scenario: Pass no arguments when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat -t`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """

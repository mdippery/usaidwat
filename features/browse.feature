Feature: Browse comments

  As a Redditor
  I want to quickly be able to list another Redditor's comments
  In order to see what they like to talk about

  Scenario: List all comments
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 3 years ago

      It has a fare when the lights are *off.*


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 3 years ago

      The Judgment of Solomon Accords.
      """

  Scenario: List all comments for a user that does not exist
    Given the Reddit service does not have a user "testuser"
    When I run `usaidwat log testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: List all comments when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat log blank`
    Then it should pass with:
      """
      blank has no comments.
      """

  Scenario: Tally comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally mipadi`
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

  Scenario: Sort comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c mipadi`
    Then it should pass with:
      """
      AskReddit         61
      programming       20
      apple              6
      battlefield3       2
      books              2
      worldnews          2
      django             1
      Games              1
      nyc                1
      personalfinance    1
      photography        1
      redditcasual       1
      wikipedia          1
      """

  Scenario: Tally comments when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat tally -c blank`
    Then it should pass with:
      """
      blank has no comments.
      """

  Scenario: Sort comments when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat tally -c blank`
    Then it should pass with:
      """
      blank has no comments.
      """

  Scenario: Sort comments when a user does not exist
    Given the Reddit service does not have a user "testuser"
    When I run `usaidwat tally testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: List comments for a particular subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi AskReddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz
      Do colleges actually teach students how to think critically? Or even to think/qu
      over 3 years ago

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 3 years ago

      You didn't slow down for very long though, did you?
      """

  Scenario: List comments for a particular subreddit specified with the wrong case
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi askreddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz
      Do colleges actually teach students how to think critically? Or even to think/qu
      over 3 years ago

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 3 years ago

      You didn't slow down for very long though, did you?
      """

  Scenario: List comments for a subreddit with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log mipadi nsfw`
    Then it should pass with:
      """
      No comments by mipadi for nsfw.
      """

  Scenario: Tally comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally mipadi AskReddit`
    Then it should fail with:
      """
      ERROR: "usaidwat tally" was called with arguments ["mipadi", "AskReddit"]
      Usage: "usaidwat tally USERNAME"
      """

  Scenario: Sort comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c mipadi AskReddit`
    Then it should fail with:
      """
      ERROR: "usaidwat tally" was called with arguments ["mipadi", "AskReddit"]
      Usage: "usaidwat tally USERNAME"
      """

  Scenario: Pass no arguments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat`
    Then it should pass with:
      """
      Commands:
      """

  Scenario: Pass no arguments when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally`
    Then it should fail with:
      """
      ERROR: "usaidwat tally" was called with no arguments
      Usage: "usaidwat tally USERNAME"
      """

  Scenario: Pass no arguments when sorting
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c`
    Then it should fail with:
      """
      ERROR: "usaidwat tally" was called with no arguments
      Usage: "usaidwat tally USERNAME"
      """

Feature: Tally comments

  As a Redditor
  I want to be able to tally another Redditor's comments
  In order to see what they like to talk about

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

  Scenario: Search for a comment when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally --grep='Heisenbug' mipadi`
    Then the exit status should not be 0
    And stderr should contain:
      """
      invalid option: --grep=Heisenbug
      """

  Scenario: Search for a comment when sorting
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c --grep='Heisenbug' mipadi`
    Then the exit status should not be 0
    And stderr should contain:
      """
      invalid option: --grep=Heisenbug
      """

  Scenario: Sort comments when a user does not exist
    Given the Reddit service does not have a user "testuser"
    When I run `usaidwat tally testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: Tally comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally mipadi AskReddit`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You cannot specify a subreddit when tallying comments
      """

  Scenario: Sort comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c mipadi AskReddit`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You cannot specify a subreddit when tallying comments
      """

  Scenario: Pass no arguments when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You must specify a username
      """

  Scenario: Pass no arguments when sorting
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You must specify a username
      """

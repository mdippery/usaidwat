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
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 3 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 3 years ago • +1

      The Judgment of Solomon Accords.
      """

  Scenario: List a limited selection of comments
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log -n 2 mipadi`
    Then it should pass with exactly:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 3 years ago • +2

      It has a fare when the lights are off.
      """

  Scenario: List all comments without relative dates
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --date=absolute mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      1 Dec 2012 12:14 PM • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      30 Nov 2012 4:44 PM • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      30 Nov 2012 10:09 AM • +1

      The Judgment of Solomon Accords.
      """

  Scenario: List all comments using relative dates explicitly
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --date=relative mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 3 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 3 years ago • +1

      The Judgment of Solomon Accords.
      """

  Scenario: List all comments with comment bodies unformatted
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --raw mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 3 years ago • +2

      It has a fare when the lights are *off.*


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 3 years ago • +1

      The Judgment of Solomon Accords.
      """

  Scenario: List comments for multiple subreddits separated by commas
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi books,django,Games`
    Then it should pass with:
      """
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, &amp;
      over 3 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 3 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like all of the stuff I read in high school, but I got to read great things like Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare, King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: List comments for multiple subreddits separated by commas
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi books+django+Games`
    Then it should pass with:
      """
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, &amp;
      over 3 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 3 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like all of the stuff I read in high school, but I got to read great things like Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare, King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: List comments for multiple subreddits separated by commas
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi books django Games`
    Then it should pass with:
      """
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, &amp;
      over 3 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 3 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 3 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like all of the stuff I read in high school, but I got to read great things like Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare, King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: Output comments on one line
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline mipadi`
    Then it should pass with:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavio
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is ava
      worldnews Palestinians win upgraded UN status by wide margin
      """

  Scenario: Output a limited number of comments on one line
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline -n 2 mipadi`
    Then it should pass with:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavio
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is ava
      """

  Scenario: Search for a specific comment
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='Heisenbug' mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).
      """

  Scenario: Search for a specific comment with wrong case
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='heisenbug' mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one
      over 3 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).
      """

  Scenario: Search for a specific comment with no matches
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='oogabooga' mipadi`
    Then it should pass with:
      """
      mipadi has no comments matching /oogabooga/.
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

  Scenario: Search for a comment for a user that does not exist
    Given the Reddit service does not have a user "testuser"
    When I run `usaidwat log --grep='Heisenbug' testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: Search for a comment when user has no comments
    Given the Reddit service returns comments for the user "blank"
    When I run `usaidwat log --grep='Heisenbug' blank`
    Then it should pass with:
      """
      blank has no comments matching /Heisenbug/.
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

  Scenario: Search for a comment when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally --grep='Heisenbug' mipadi`
    Then it should fail with:
      """
      invalid option: --grep=Heisenbug
      """

  Scenario: Search for a comment when sorting
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c --grep='Heisenbug' mipadi`
    Then it should fail with:
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

  Scenario: List comments for a particular subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi AskReddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz
      Do colleges actually teach students how to think critically? Or even to think/qu
      over 3 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 3 years ago • +1

      You didn't slow down for very long though, did you?
      """

  Scenario: Search in comments for a particular subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='New Jersey' mipadi AskReddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago • +1

      You're from New Jersey? Which exit?
      """

  Scenario: Search in comments for a particular subreddit with wrong case
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='new jersey' mipadi AskReddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago • +1

      You're from New Jersey? Which exit?
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
      over 3 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 3 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 3 years ago • +1

      You didn't slow down for very long though, did you?
      """

  Scenario: List comments for a subreddit with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log mipadi nsfw`
    Then it should pass with:
      """
      No comments by mipadi for nsfw.
      """

  Scenario: List comments for multiple comma-separated subreddits with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log mipadi nsfw,spacedicks`
    Then it should pass with:
      """
      No comments by mipadi for nsfw, spacedicks.
      """

  Scenario: List comments for multiple plus-separated subreddits with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log mipadi nsfw+spacedicks`
    Then it should pass with:
      """
      No comments by mipadi for nsfw, spacedicks.
      """

  Scenario: List comments for multiple subreddits with no comments
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log mipadi nsfw spacedicks`
    Then it should pass with:
      """
      No comments by mipadi for nsfw, spacedicks.
      """

  Scenario: Tally comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally mipadi AskReddit`
    Then it should fail with:
      """
      You cannot specify a subreddit when tallying comments
      """

  Scenario: Sort comments with subreddit
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c mipadi AskReddit`
    Then it should fail with:
      """
      You cannot specify a subreddit when tallying comments
      """

  Scenario: Pass no arguments when tallying
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally`
    Then it should fail with:
      """
      You must specify a username
      """

  Scenario: Pass no arguments when sorting
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat tally -c`
    Then it should fail with:
      """
      You must specify a username
      """

  Scenario: Pass no arguments when searching
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log --grep mipadi`
    Then it should fail with:
      """
      You must specify a username
      """

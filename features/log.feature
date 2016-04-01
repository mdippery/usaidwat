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
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 2 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 2 years ago • +1

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
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 2 years ago • +2

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
      Sat, 1 Dec 2012, 12:14 PM • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      Fri, 30 Nov 2012, 4:44 PM • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      Fri, 30 Nov 2012, 10:09 AM • +1

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
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 2 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 2 years ago • +1

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
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is availab
      over 2 years ago • +2

      It has a fare when the lights are *off.*


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 2 years ago • +1

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
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +11

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
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +11

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
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature n
      over 2 years ago • +11

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

  Scenario: One-line comments should be collapsed into unique titles
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline mipadi`
    Then it should pass with exactly:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavio
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is ava
      worldnews Palestinians win upgraded UN status by wide margin
      AskReddit Do colleges actually teach students how to think critically? Or even t
      AskReddit I'm from Tennessee and most of our jokes are geared toward Mississippi
      AskReddit Today I was going 80mph in a 55 when an unmarked police car pulled up 
      AskReddit Why should I pay for a college degree when all of the information they
      apple iTunes 11 finally available for download - The Verge
      Games The True Story of Battlefield 3, the Battlefield Franchise, Its Community,
      AskReddit Professors/Students of Reddit- What are your feelings towards shit Pro
      books I was saddened hearing this story on the Takeaway this morning- "Is litera
      AskReddit My friends give me crap about not watching "good" movies. Such as I've
      AskReddit Reddit, what is the worst thing about your city?
      AskReddit What is it like to own a decommissioned police car?
      AskReddit When Microsoft was found guilty of violating antitrust law by bundling
      django I need a little help understanding billing and payment
      programming Why software engineers are vastly undervalued
      AskReddit Is Germany racist?
      apple Report: Apple bumps Android from top spot in U.S. smartphone market on str
      AskReddit I got stood up by a girl for the first date. I have to go to work tomm
      AskReddit How much does 'life' costs in your country/city/area?
      programming Apple's proposal for modules in C(++) [PDF slides]
      AskReddit Half of my facebook newsfeed is of people posting this quoted copyrigh
      AskReddit I'm lying in my warm bed with my fiance as my jetpack while Redditing 
      AskReddit I found out tonight that my dad's great grandfather was a Civil War PO
      AskReddit This morning on the way home from walking my dogs I shit myself. What'
      AskReddit Is it just me or do women have less genuine friendships than men?
      programming RubyMonk
      AskReddit How many government officials would have to die in an accident or atta
      programming The X.Org CodingStyle
      AskReddit How would you stop people from pushing others into oncoming subways? C
      worldnews How Israeli Drone Pilots Made Their Life-and-Death Choices Over Gaza -
      AskReddit This entire semester I thought my TA was a girl named Kayla...it's a b
      AskReddit Why is it that mathematical "illiteracy" is ok, but being unable to re
      AskReddit What's your brand of cigarette, and why?
      AskReddit Accomplished Adults of Reddit: Honestly, is it more important to do wh
      AskReddit I m a nutritionist. I often over hear people talk about nutrition like
      personalfinance What's the most expensive mistake you ever made financially?
      AskReddit I want to quit college and enlist in the Air Force. Am I throwing away
      AskReddit Reddit, my boyfriend is abroad for a year. I'm trying to subtly work f
      AskReddit Why is everyone naming Israel as the "aggressor"?? Am I missing someth
      programming Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      battlefield3 Can't argue with those rules..
      AskReddit Who thinks "Mens Gift Ideas" are always super lame? Men of reddit what
      redditcasual Submissions for new clan tag...
      programming How To Package Your Python Code - The Right Way…
      programming Hounded By Recruiters, Coders Put Themselves Up For Auction - Forbes
      photography Do you travel? If so, what camera do you use/prefer?
      AskReddit I want to go to college for music even though it's not the most financ
      AskReddit Reddit, what popular opinions about films do you think the complete op
      AskReddit If someone writes "Should of" instead of "Should have", I immediately 
      AskReddit I'm A Mixed Race Teen (Black Dad, White Mum) And I Constantly Get Peop
      AskReddit Do the James Bond films features occur in any sort of chronological or
      apple iMessage down?
      AskReddit Reddit, how old were you when you officially moved out? I'm 24 and fee
      AskReddit Guys, what do girls wear that you absolutely can't stand?
      AskReddit Looking into getting Windows 8 (Don't really like the looks of it from
      AskReddit My stepdaughter is acting (sexually) inappropriately around me - what 
      programming FizzBuzz Still Works
      AskReddit Reddit, what is your most expensive mistake?
      AskReddit Were you a part of the Occupy Wall Street movement?
      AskReddit I'm coming up on my 6th year free from cocaine.  Anybody else had or h
      programming UserManager.isUserAGoat() -- Oh you silly goat
      AskReddit in regards to choosing a future career, should salary or enjoy-ability
      AskReddit Guy I like asks me out to have coffee; gives me tips on how to get a b
      AskReddit Men of Reddit: How much pressure is there for you guys to look good?
      AskReddit Reddit, what custom ringtone do you use?
      AskReddit Reddit: A lot of talk happens here about taxing the rich at a higher p
      AskReddit I'm dropping out of college and joining the workforce for a while, hav
      AskReddit What ever happened to the cent sign (¢)?
      AskReddit I ask you this reddit, what is your most prized possession in this wor
      AskReddit Reddit seems to hate Papa Johns and Chik-Fil-A with a passion. What ar
      AskReddit Men of Reddit: Do you get turned off when a girl says she is a feminis
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
      over 2 years ago • +1

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
      over 2 years ago • +1

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

  Scenario: List comments for a particular subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi AskReddit`
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz
      Do colleges actually teach students how to think critically? Or even to think/qu
      over 2 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 2 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 2 years ago • +1

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
      over 2 years ago • +1

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
      over 2 years ago • +1

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
      over 2 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alaba
      over 2 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me
      over 2 years ago • +1

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

  Scenario: Pass no arguments when searching
    Given the Reddit service returns comments for the user "mipadi"
    When I run `usaidwat log --grep mipadi`
    Then the exit status should not be 0
    And stderr should contain exactly:
      """
      You must specify a username
      """

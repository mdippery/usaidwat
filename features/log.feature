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
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
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
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
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
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      Sat, 1 Dec 2012, 12:14 PM • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
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
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
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
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
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
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing
      BF3…but it always feels like it has so much more potential to be an awesome
      game.

      And that feeling comes even when the game isn't completely fucking frustrating
      because some admin is kicking you for using some arbitrary weapon he doesn't
      like, or switching you to the losing team because he doesn't like getting his
      ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's
      over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely
      updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like
      all of the stuff I read in high school, but I got to read great things like
      Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare,
      King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: List comments for multiple subreddits separated by commas
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi books+django+Games`
    Then it should pass with:
      """
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing
      BF3…but it always feels like it has so much more potential to be an awesome
      game.

      And that feeling comes even when the game isn't completely fucking frustrating
      because some admin is kicking you for using some arbitrary weapon he doesn't
      like, or switching you to the losing team because he doesn't like getting his
      ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's
      over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely
      updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like
      all of the stuff I read in high school, but I got to read great things like
      Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare,
      King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: List comments for multiple subreddits separated by commas
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log mipadi books django Games`
    Then it should pass with:
      """
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      over 2 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing
      BF3…but it always feels like it has so much more potential to be an awesome
      game.

      And that feeling comes even when the game isn't completely fucking frustrating
      because some admin is kicking you for using some arbitrary weapon he doesn't
      like, or switching you to the losing team because he doesn't like getting his
      ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 2 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's
      over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely
      updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 2 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like
      all of the stuff I read in high school, but I got to read great things like
      Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare,
      King Arthur, A Doll's House, Death of a Salesman, and probably more.
      """

  Scenario: Output comments on one line
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline mipadi`
    Then it should pass with:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
      worldnews Palestinians win upgraded UN status by wide margin
      """

  Scenario: Output a limited number of comments on one line
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline -n 2 mipadi`
    Then it should pass with:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
      """

  Scenario: One-line comments should be collapsed into unique titles
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --oneline mipadi`
    Then it should pass with exactly:
      """
      wikipedia Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      nyc NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
      worldnews Palestinians win upgraded UN status by wide margin
      AskReddit Do colleges actually teach students how to think critically? Or even to think/question at all?
      AskReddit I'm from Tennessee and most of our jokes are geared toward Mississippi and Alabama. Where are you from, and who are your jokes geared toward?
      AskReddit Today I was going 80mph in a 55 when an unmarked police car pulled up next to me. Rather than pull me over, the officer simply mouthed "SLOW DOWN" and drove away. Reddit, when has the law made you crap your pants and then immediately made you day?
      AskReddit Why should I pay for a college degree when all of the information they will teach me is probably available for free on the web?  Why not set up some sort of accreditation program where people just take tests and get a degree?
      apple iTunes 11 finally available for download - The Verge
      Games The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      AskReddit Professors/Students of Reddit- What are your feelings towards shit Professors?
      books I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      AskReddit My friends give me crap about not watching "good" movies. Such as I've never seen any of the James Bonds movies. Reddit what movies do I need to see before I die?
      AskReddit Reddit, what is the worst thing about your city?
      AskReddit What is it like to own a decommissioned police car?
      AskReddit When Microsoft was found guilty of violating antitrust law by bundling Internet Explorer with Windows, how was the average user supposed to download a browser to begin with if IE wasn't there?
      django I need a little help understanding billing and payment
      programming Why software engineers are vastly undervalued
      AskReddit Is Germany racist?
      apple Report: Apple bumps Android from top spot in U.S. smartphone market on strength of iPhone 5
      AskReddit I got stood up by a girl for the first date. I have to go to work tommorrow with her. How should I handle it?
      AskReddit How much does 'life' costs in your country/city/area?
      programming Apple's proposal for modules in C(++) [PDF slides]
      AskReddit Half of my facebook newsfeed is of people posting this quoted copyright protection statement to supposedly keep facebook from using their data. Am I right in assuming that this completely pointless?
      AskReddit I'm lying in my warm bed with my fiance as my jetpack while Redditing and am perfectly, blissfully content. So tell me Reddit, what are some of your moments of contentment where you realized "hey, life doesn't suck."?
      AskReddit I found out tonight that my dad's great grandfather was a Civil War POW.  He was a union soldier from NY by way of MI, held captive by the confederate army in City Center at Richmond, VA and released at the end of the war.  Reddit what have you found in your family's history that has surprised you?
      AskReddit This morning on the way home from walking my dogs I shit myself. What's the most embarrassing kid thing you've done as an adult?
      AskReddit Is it just me or do women have less genuine friendships than men?
      programming RubyMonk
      AskReddit How many government officials would have to die in an accident or attack, before a common citizen would be appointed or elected to the office of the United States?
      programming The X.Org CodingStyle
      AskReddit How would you stop people from pushing others into oncoming subways? Create something.
      worldnews How Israeli Drone Pilots Made Their Life-and-Death Choices Over Gaza - “When you see a target, all you want to do is attack.  But it’s not that simple.”
      AskReddit This entire semester I thought my TA was a girl named Kayla...it's a boy named Caleb. My prof just forwarded him an e-mail where I referred to my TA "Kayla" and now I want to crawl into a hole and die. Has anything similar ever happened to you Reddit?
      AskReddit Why is it that mathematical "illiteracy" is ok, but being unable to read or write is unacceptable?
      AskReddit What's your brand of cigarette, and why?
      AskReddit Accomplished Adults of Reddit: Honestly, is it more important to do what you love, even if it means making little money or is it more important to do something you may enjoy less, but will make lots of money from?
      AskReddit I m a nutritionist. I often over hear people talk about nutrition like they are an expert, but they couldn't be farther from the truth. Reddit, what are some things in your profession that the lay person gets wrong?
      personalfinance What's the most expensive mistake you ever made financially?
      AskReddit I want to quit college and enlist in the Air Force. Am I throwing away my future?
      AskReddit Reddit, my boyfriend is abroad for a year. I'm trying to subtly work fake slang into our conversations with the hope of convincing him to use it when he gets back in the US. Give me your suggestions!
      AskReddit Why is everyone naming Israel as the "aggressor"?? Am I missing something?
      programming Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      battlefield3 Can't argue with those rules..
      AskReddit Who thinks "Mens Gift Ideas" are always super lame? Men of reddit what lame "guy" gifts are you tired of receiving? How would you edit these lists your wives, mothers, sisters are reading?
      redditcasual Submissions for new clan tag...
      programming How To Package Your Python Code - The Right Way…
      programming Hounded By Recruiters, Coders Put Themselves Up For Auction - Forbes
      photography Do you travel? If so, what camera do you use/prefer?
      AskReddit I want to go to college for music even though it's not the most financially stable. Is it better to study your passion rather than a more financially stable option?
      AskReddit Reddit, what popular opinions about films do you think the complete opposite of?
      AskReddit If someone writes "Should of" instead of "Should have", I immediately read the rest of the post like it's a retarded person speaking. Yet I can't do anything about it. What other small annoyances are so widespread that it's beyond fixing?
      AskReddit I'm A Mixed Race Teen (Black Dad, White Mum) And I Constantly Get People Incorrectly Guessing What My Ethnicity Is. Does This Happen To Anyone Else? If So, What Is Your Ethnicity And What Do People Guess You Are?
      AskReddit Do the James Bond films features occur in any sort of chronological order? How severe are any continuity breaks?
      apple iMessage down?
      AskReddit Reddit, how old were you when you officially moved out? I'm 24 and feel like a total loser...
      AskReddit Guys, what do girls wear that you absolutely can't stand?
      AskReddit Looking into getting Windows 8 (Don't really like the looks of it from what I've seen in screenshots, but I figured I'd give it a chance).  Should I go 32-bit or 64-bit?  Why?
      AskReddit My stepdaughter is acting (sexually) inappropriately around me - what actions should I take?
      programming FizzBuzz Still Works
      AskReddit Reddit, what is your most expensive mistake?
      AskReddit Were you a part of the Occupy Wall Street movement?
      AskReddit I'm coming up on my 6th year free from cocaine.  Anybody else had or have a significant milestone this year?
      programming UserManager.isUserAGoat() -- Oh you silly goat
      AskReddit in regards to choosing a future career, should salary or enjoy-ability be a more important deciding factor?
      AskReddit Guy I like asks me out to have coffee; gives me tips on how to get a boyfriend. Reddit, when did you realize that you have been friendzoned?
      AskReddit Men of Reddit: How much pressure is there for you guys to look good?
      AskReddit Reddit, what custom ringtone do you use?
      AskReddit Reddit: A lot of talk happens here about taxing the rich at a higher percentage and is generally approved of. But how high should it actually be?
      AskReddit I'm dropping out of college and joining the workforce for a while, have you dropped out and if so, how did it go?
      AskReddit What ever happened to the cent sign (¢)?
      AskReddit I ask you this reddit, what is your most prized possession in this world. Doesn't necessarily have to be expensive, just important to you.
      AskReddit Reddit seems to hate Papa Johns and Chik-Fil-A with a passion. What are some businesses that we love?
      AskReddit Men of Reddit: Do you get turned off when a girl says she is a feminist?
      """

  Scenario: Search for a specific comment
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='Heisenbug' mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).
      """

  Scenario: Search for a specific comment with wrong case
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='heisenbug' mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).
      """

  Scenario: Search for a specific comment in a specific subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='heisenbug' mipadi wikipedia`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 2 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).
      """

  Scenario: Exclude a subreddit
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Apr 10, 2017 12:08 PM
    When I run `usaidwat log -- mipadi -AskReddit`
    Then it should pass with exactly:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 4 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
      over 4 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 4 years ago • +1

      The Judgment of Solomon Accords.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zb9q
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +1

      I just got rid of the ones "in the cloud". I don't want to lose the play counts
      on the old (protected) files, and I don't use the iTunes Match service anyway.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zas6
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +1

      Let's just say I'm writing checks my body can't cash.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78qp8s
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +3

      Is there anything wrong with just deleting them? I get a warning about their
      being deleted from iCloud, but I don't really care because these duplicates tend
      to mess with syncing on my iPhone anyway. (They're tracks I downloaded from iTMS
      as much as 8 years ago, and in some cases I've changed the ID3 tags which seems
      to confuse iTunes to no end. Or maybe it's because they're the old protected AAC
      files, I dunno.)

      Edit: Ah yes, it appears to happen for protected AAC files.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78p6wa
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +28

      Oh cool, it even duplicated my songs <http://i.imgur.com/8BSE9.png>—for free!


      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      over 4 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing
      BF3…but it always feels like it has so much more potential to be an awesome
      game.

      And that feeling comes even when the game isn't completely fucking frustrating
      because some admin is kicking you for using some arbitrary weapon he doesn't
      like, or switching you to the losing team because he doesn't like getting his
      ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 4 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 4 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's
      over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely
      updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 4 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like
      all of the stuff I read in high school, but I got to read great things like
      Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare,
      King Arthur, A Doll's House, Death of a Salesman, and probably more.


      programming
      http://www.reddit.com/r/programming/comments/13ug2x/z/c77msa1
      Why software engineers are vastly undervalued
      over 4 years ago • +4

      A conductor just collects your tickets.


      apple
      http://www.reddit.com/r/apple/comments/13vgrv/z/c77ksqn
      Report: Apple bumps Android from top spot in U.S. smartphone market on strength of iPhone 5
      over 4 years ago • +13

      I foresee this being on the "Things That Didn't Get More Than 2 Upvotes in
      /r/technology" list.


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c77jtox
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • +1

      I am aware of that. I think that only underscores my point.


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c77jjo6
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • +1

      Well, yes; I'm just pointing out that OS X led to a resurgence in interest and
      usage of Objective-C, years before the iPhone.


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c776z4r
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • +1

      OS X wasn't out yet in 1999, so most Objective-C programmers would've been from
      the NeXTSTEP days.


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c772epw
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • +3

      Objective-C's clunky import system is due to its need to be
      backwards-compatible with C.


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c772dux
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • +7

      Anyone who wrote software for OS X (or NeXTSTEP, even) had used Objective-C
      before the iPhone. ;)


      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c7729jt
      Apple's proposal for modules in C(++) [PDF slides]
      over 4 years ago • -3

      u mad bro?


      programming
      http://www.reddit.com/r/programming/comments/13rnu0/z/c77071r
      RubyMonk
      over 4 years ago • +3

      Proggit: Where knowledge is made up and the karma points don't matter!


      programming
      http://www.reddit.com/r/programming/comments/13rnu0/z/c7706ho
      RubyMonk
      over 4 years ago • +5

      I took the wink to mean that the comment was tongue-in-cheek. (The site's owners
      may have asked for a comment from Matz himself, and that's what he gave as a
      joke.)


      programming
      http://www.reddit.com/r/programming/comments/13pp8j/z/c76gi00
      The X.Org CodingStyle
      over 4 years ago • +2

      Exactly. You can make a "tabs for indentation, spaces for alignment" rule, but
      some dingback invariably screws it up (uses tabs for both or something like
      that), which inevitably makes the alignment/indentation wrong for everyone but
      him. (This is especially true on open source projects, where it's hard to tell
      Random J. Contributor to uses "tabs for indentation, spaces for alignment").
      Using spaces for everything is just easier, and it's not really a that big of a
      deal if indents aren't in your preferred size. (Prefer 8-space tabs to 4-space
      tabs? Too bad, you can live with 4-space tabs?)


      programming
      http://www.reddit.com/r/programming/comments/13pp8j/z/c76gg04
      The X.Org CodingStyle
      over 4 years ago • +3

      It is pretty unreadable, but that's not the X.Org coding style. X.Org would do:

          static int
          nameofthefunction(int arg1,
                            int arg2,
                            int arg3);


      worldnews
      http://www.reddit.com/r/worldnews/comments/13mdw2/z/c758qos
      How Israeli Drone Pilots Made Their Life-and-Death Choices Over Gaza - “When you see a target, all you want to do is attack.  But it’s not that simple.”
      over 4 years ago • -3

      Since when did Wired start publishing PR pieces for the Israeli military?


      personalfinance
      http://www.reddit.com/r/personalfinance/comments/13iea3/z/c74b9j1
      What's the most expensive mistake you ever made financially?
      over 4 years ago • +2

      It's not just money for a piece of paper. If you're serious about writing,
      studying it puts you in contact with serious writers, lets you focus on your
      craft, and provides valuable networking opportunities. And a lot of MFA programs
      are funded.

      It's not necessarily the most pragmatic option (especially not now), and sure,
      you can write without it, but it's about far more than the degree itself.


      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c740nlq
      Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      over 4 years ago • +1

      Not different at all. Implying that they didn't bother to ask anyone is the
      consequence of being ignorant about the situation.


      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73zda5
      Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      over 4 years ago • +1

      Neither. It's not uncommon, though, for the promotional material and even the
      speaker lineup for programming conventions to be aimed at heterosexual white
      males. I don't think that the organizers are actually racist or sexist or
      homophobic; rather, I think they're in a field were most people are straight
      white males, and fail to realize that not everyone is like them.

      This article <http://devblog.avdi.org/2012/11/19/on-britruby/> has a provocative
      analysis. The key point (and obviously I agree with the blogger) is this:

          | I fully believe them when they say that they set out to create a diverse
          | conference. However, I think some implicit bias crept into their
          | selection process.
          | 
          | …
          | 
          | I’m not accusing the BritRuby organizers of being racist, sexist, or
          | misogynistic. And I don’t think anyone else involved in this conversation is
          | accusing them of those things either, despite misguided claims to the
          | contrary. But I don’t think it’s farfetched to suggest that in their
          | process for coming up with names to invite, their brain VMs might have
          | been over-optimized for the common case: white dudes.


      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c73vgqr
      Can't argue with those rules..
      over 4 years ago • +1

      I haven't used the AK-74M since I unlocked other weapons (I only have 1h5m of
      play time on it), but you inspired me to give it another try.


      redditcasual
      http://www.reddit.com/r/redditcasual/comments/13fxv8/z/c73rp5l
      Submissions for new clan tag...
      over 4 years ago • +1

      RDDT was used a lot back in the Black Ops days.


      programming
      http://www.reddit.com/r/programming/comments/13f4tu/z/c73r5l1
      How To Package Your Python Code - The Right Way…
      over 4 years ago • +2

      Python is a little bit like a Reese's Peanut Butter Cup: there's no right way to
      package Python code.


      programming
      http://www.reddit.com/r/programming/comments/13f8y8/z/c73r0ok
      Hounded By Recruiters, Coders Put Themselves Up For Auction - Forbes
      over 4 years ago • +3

      I get at least one email per week, sometimes from a rep at the company, and
      sometimes just from a random recruiter. I'm not even on LinkedIn—these are from
      people who happen to find me on Stack Overflow or GitHub. During some periods,
      I even get 2-4 emails per week. (I've actually stopped responding to them,
      because it's become a bit burdensome to write back.)


      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73qhxi
      Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      over 4 years ago • +11

      Welcome to the wonderful world of Python drama!


      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73qhq1
      Why Brit Ruby 2013 was cancelled and why this is not ok — Gist
      over 4 years ago • +2

        | Turns out, a lot of the prominent Rubyists are white guys and all of the
        | ones who said they'd like to come were, indeed, white guys.

      I do have to wonder if they even bothered to ask anyone who wasn't white and
      male.


      photography
      http://www.reddit.com/r/photography/comments/13fsog/z/c73qesj
      Do you travel? If so, what camera do you use/prefer?
      over 4 years ago • +1

      I usually take my Olympus EP-3 and/or my Fujifilm FinePix X100. The X100 is
      great, but it has a fixed lens, so if need something with zoom or a certain kind
      of lens, I take the EP-3.


      apple
      http://www.reddit.com/r/apple/comments/13erfl/z/c73e3re
      iMessage down?
      over 4 years ago • +3

      Reporting in from New York. I can't message another person who lives in New
      York, so it could just be regional. Who knows.


      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c72wwhw
      Can't argue with those rules..
      over 4 years ago • +16

      I'm still burned that one time I was tearing up an admin (and other people) with
      the M39, and I got kicked for "being a n00b" (yes, the guy sent me a message to
      tell me that). Thing was, the M39 wasn't even listed as a banned weapon in the
      "rules".


      programming
      http://www.reddit.com/r/programming/comments/138od3/z/c71xla4
      FizzBuzz Still Works
      over 4 years ago • +2

      Haskell and Erlang are two languages that don't use `%` as a modulus operator
      (Haskell just doesn't, and in Erlang `%` is the comment sigil).


      programming
      http://www.reddit.com/r/programming/comments/136mxi/z/c71ecky
      UserManager.isUserAGoat() -- Oh you silly goat
      over 4 years ago • +9

      Of course, why else would they have the function?


      programming
      http://www.reddit.com/r/programming/comments/136mxi/z/c71davt
      UserManager.isUserAGoat() -- Oh you silly goat
      over 4 years ago • +6

      Or if they just lit the computer on fire manually, I suppose.
      """

  Scenario: Exclude multiple subreddits
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Apr 10, 2017 12:08 PM
    When I run `usaidwat log -- mipadi -AskReddit -programming`
    Then it should pass with exactly:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed
      Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it
      over 4 years ago • +1

      Yep. My first experience with a Heisenbug occurred in a C++ program, and
      disappeared when I tried to print a variable with printf (only to reappear when
      that call was removed).


      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6
      NYC taxi roof lights get overhaul -  A light simply will mean the cab is available. No light will mean it's not.
      over 4 years ago • +2

      It has a fare when the lights are off.


      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4
      Palestinians win upgraded UN status by wide margin
      over 4 years ago • +1

      The Judgment of Solomon Accords.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zb9q
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +1

      I just got rid of the ones "in the cloud". I don't want to lose the play counts
      on the old (protected) files, and I don't use the iTunes Match service anyway.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zas6
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +1

      Let's just say I'm writing checks my body can't cash.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78qp8s
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +3

      Is there anything wrong with just deleting them? I get a warning about their
      being deleted from iCloud, but I don't really care because these duplicates tend
      to mess with syncing on my iPhone anyway. (They're tracks I downloaded from iTMS
      as much as 8 years ago, and in some cases I've changed the ID3 tags which seems
      to confuse iTunes to no end. Or maybe it's because they're the old protected AAC
      files, I dunno.)

      Edit: Ah yes, it appears to happen for protected AAC files.


      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78p6wa
      iTunes 11 finally available for download - The Verge
      over 4 years ago • +28

      Oh cool, it even duplicated my songs <http://i.imgur.com/8BSE9.png>—for free!


      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8
      The True Story of Battlefield 3, the Battlefield Franchise, Its Community, & EA/DICE
      over 4 years ago • +2

      That's exactly how I feel. There are times when I have a ton of fun playing
      BF3…but it always feels like it has so much more potential to be an awesome
      game.

      And that feeling comes even when the game isn't completely fucking frustrating
      because some admin is kicking you for using some arbitrary weapon he doesn't
      like, or switching you to the losing team because he doesn't like getting his
      ass kicked. Or when the game is simply crashing.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 4 years ago • +1

      I went to a public school.


      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i
      I need a little help understanding billing and payment
      over 4 years ago • +2

      I have a lot of experience working with Satchmo. I don't recommend it. It's
      over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely
      updated anymore.


      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg
      I was saddened hearing this story on the Takeaway this morning- "Is literature necessary?" discussing the new common core standards dictating that 70% of reading be non-fiction.
      over 4 years ago • +11

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like
      all of the stuff I read in high school, but I got to read great things like
      Animal Farm, 1984, Night, Raisin in the Sun, The Glass Menagerie, Shakespeare,
      King Arthur, A Doll's House, Death of a Salesman, and probably more.


      apple
      http://www.reddit.com/r/apple/comments/13vgrv/z/c77ksqn
      Report: Apple bumps Android from top spot in U.S. smartphone market on strength of iPhone 5
      over 4 years ago • +13

      I foresee this being on the "Things That Didn't Get More Than 2 Upvotes in
      /r/technology" list.


      worldnews
      http://www.reddit.com/r/worldnews/comments/13mdw2/z/c758qos
      How Israeli Drone Pilots Made Their Life-and-Death Choices Over Gaza - “When you see a target, all you want to do is attack.  But it’s not that simple.”
      over 4 years ago • -3

      Since when did Wired start publishing PR pieces for the Israeli military?


      personalfinance
      http://www.reddit.com/r/personalfinance/comments/13iea3/z/c74b9j1
      What's the most expensive mistake you ever made financially?
      over 4 years ago • +2

      It's not just money for a piece of paper. If you're serious about writing,
      studying it puts you in contact with serious writers, lets you focus on your
      craft, and provides valuable networking opportunities. And a lot of MFA programs
      are funded.

      It's not necessarily the most pragmatic option (especially not now), and sure,
      you can write without it, but it's about far more than the degree itself.


      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c73vgqr
      Can't argue with those rules..
      over 4 years ago • +1

      I haven't used the AK-74M since I unlocked other weapons (I only have 1h5m of
      play time on it), but you inspired me to give it another try.


      redditcasual
      http://www.reddit.com/r/redditcasual/comments/13fxv8/z/c73rp5l
      Submissions for new clan tag...
      over 4 years ago • +1

      RDDT was used a lot back in the Black Ops days.


      photography
      http://www.reddit.com/r/photography/comments/13fsog/z/c73qesj
      Do you travel? If so, what camera do you use/prefer?
      over 4 years ago • +1

      I usually take my Olympus EP-3 and/or my Fujifilm FinePix X100. The X100 is
      great, but it has a fixed lens, so if need something with zoom or a certain kind
      of lens, I take the EP-3.


      apple
      http://www.reddit.com/r/apple/comments/13erfl/z/c73e3re
      iMessage down?
      over 4 years ago • +3

      Reporting in from New York. I can't message another person who lives in New
      York, so it could just be regional. Who knows.


      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c72wwhw
      Can't argue with those rules..
      over 4 years ago • +16

      I'm still burned that one time I was tearing up an admin (and other people) with
      the M39, and I got kicked for "being a n00b" (yes, the guy sent me a message to tell me that). Thing was, the M39 wasn't even listed as a banned weapon in the "rules".
      """

  Scenario: Search for a specific comment with no matches
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='oogabooga' mipadi`
    Then it should pass with:
      """
      mipadi has no comments matching /oogabooga/.
      """

  Scenario: Search for a specific comment in a specific subreddit with no matches
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='oogabooga' mipadi wikipedia`
    Then it should pass with:
      """
      mipadi has no comments matching /oogabooga/ in /r/wikipedia.
      """

  Scenario: Search for a specific comment in a specific subreddit that does not exist in that subreddit but exists elsewhere
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='heisenbug' mipadi programming`
    Then it should pass with:
      """
      mipadi has no comments matching /heisenbug/ in /r/programming.
      """

  Scenario: Search for a specific comment in two subreddits with no matches
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='oogabooga' mipadi programming wikipedia`
    Then it should pass with:
      """
      mipadi has no comments matching /oogabooga/ in /r/programming or /r/wikipedia.
      """

  Scenario: Search for a specific comment in three subreddits with no matches
    Given the Reddit service returns comments for the user "mipadi"
    And time is frozen at Jun 24, 2015 11:05 AM
    When I run `usaidwat log --grep='oogabooga' mipadi programming wikipedia AskReddit`
    Then it should pass with:
      """
      mipadi has no comments matching /oogabooga/ in /r/programming, /r/wikipedia, or /r/askreddit.
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
      Do colleges actually teach students how to think critically? Or even to think/question at all?
      over 2 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do
      teach you to think critically, especially in humanities courses and seminars.
      Maybe it's just because I went to a small, private liberal arts college rather
      than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alabama. Where are you from, and who are your jokes geared toward?
      over 2 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me. Rather than pull me over, the officer simply mouthed "SLOW DOWN" and drove away. Reddit, when has the law made you crap your pants and then immediately made you day?
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
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alabama. Where are you from, and who are your jokes geared toward?
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
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alabama. Where are you from, and who are your jokes geared toward?
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
      Do colleges actually teach students how to think critically? Or even to think/question at all?
      over 2 years ago • +1

      I think it depends on where you go and what you study, but yes, I think they do
      teach you to think critically, especially in humanities courses and seminars.
      Maybe it's just because I went to a small, private liberal arts college rather
      than a huge school, but critical thinking was definitely a part of my education.


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3
      I'm from Tennessee and most of our jokes are geared toward Mississippi and Alabama. Where are you from, and who are your jokes geared toward?
      over 2 years ago • +1

      You're from New Jersey? Which exit?


      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo
      Today I was going 80mph in a 55 when an unmarked police car pulled up next to me. Rather than pull me over, the officer simply mouthed "SLOW DOWN" and drove away. Reddit, when has the law made you crap your pants and then immediately made you day?
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

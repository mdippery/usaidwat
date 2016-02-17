Feature: Show posts

  As a Redditor
  I want to quickly be able to list another Redditor's posts
  In order to see what they like to talk about

  Scenario: List posts
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts log mipadi`
    Then it should pass with:
      """
      short
      https://www.reddit.com/r/short/comments/3pj7rx
      Science Says Being Short Makes You Depressed
      about 4 weeks ago
      http://www.vice.com/read/it-sucks-to-be-a-short-guy-511


      Games
      https://www.reddit.com/r/Games/comments/3ovldc
      The Xbox One Is Garbage And The Future Is Bullshit
      about 1 month ago
      http://adequateman.deadspin.com/the-xbox-one-is-garbage-and-the-future-is-bullshit-1736054579


      technology
      https://www.reddit.com/r/technology/comments/3o0vrh
      Mozilla lays out a proposed set of rules for content blockers
      about 1 month ago
      https://blog.mozilla.org/blog/2015/10/07/proposed-principles-for-content-blocking/


      apple
      https://www.reddit.com/r/apple/comments/3o0vp9
      Mozilla lays out a set of proposed rules for content blocking
      about 1 month ago
      https://blog.mozilla.org/blog/2015/10/07/proposed-principles-for-content-blocking/


      vim
      https://www.reddit.com/r/vim/comments/3m83kp
      Vim setup for Markdown
      about 2 months ago
      http://www.swamphogg.com/2015/vim-setup/


      django
      https://www.reddit.com/r/django/comments/35rzlx
      Deploy Django projects using git push
      about 6 months ago
      http://blog.mathieu-leplatre.info/deploy-django-projects-using-git-push.html


      webdev
      https://www.reddit.com/r/webdev/comments/35rtkx
      The Future of Web Design is Hidden in the History of Architecture
      about 6 months ago
      https://medium.com/@sall/the-future-of-web-design-is-hidden-in-the-history-of-architecture-1cc93ea854d0


      swift
      https://www.reddit.com/r/swift/comments/33kjrn
      Does Swift make native app development easier?
      about 7 months ago
      http://monkey-robot.com/2015/04/swift-makes-programming-easy/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2022%20Apr%202015


      webdev
      https://www.reddit.com/r/webdev/comments/32y92q
      Microservices in Clojure
      about 7 months ago
      https://speakerdeck.com/kachayev/microservices-in-clojure


      movies
      https://www.reddit.com/r/movies/comments/2vt5h0
      Interstellar's true black hole would have been too confusing for audiences
      about 9 months ago
      http://www.newscientist.com/article/dn26966-interstellars-true-black-hole-too-confusing.html#.VN3dJ_msXPo


      webdev
      https://www.reddit.com/r/webdev/comments/2vo5zs
      Major security alert as 40,000 MongoDB databases left unsecured on the internet
      about 9 months ago
      http://news.hitb.org/content/major-security-alert-40000-mongodb-databases-left-unsecured-internet


      vim
      https://www.reddit.com/r/vim/comments/2tvq8u
      Why does my shell prompt disappear when I install and use vim 7.4 (on CentOS 6)?
      about 10 months ago
      http://stackoverflow.com/q/28179589/28804


      swift
      https://www.reddit.com/r/swift/comments/2t55vj
      Swift for CLI tools
      about 10 months ago
      https://speakerdeck.com/supermarin/swift-for-cli-tools


      Games
      https://www.reddit.com/r/Games/comments/2expgr
      Chief Executive of Rovio, Maker of Angry Birds Game, to Step Down
      about a year ago
      http://www.nytimes.com/2014/08/30/technology/mikael-hed-chief-executive-of-angry-birds-maker-to-step-down.html


      webdev
      https://www.reddit.com/r/webdev/comments/2ejsyv
      You have ruined HTML
      about a year ago
      http://blog.dantup.com/2014/08/you-have-ruined-html/


      swift
      https://www.reddit.com/r/swift/comments/2au1ki
      A few thoughts on Swift
      about a year ago
      http://monkey-robot.com/2014/07/thoughts-on-swift/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2015%20July%202014


      webdev
      https://www.reddit.com/r/webdev/comments/29og3m
      Sick of Ruby, dynamic typing, side effects, and basically object-oriented progra
      about a year ago
      https://blog.abevoelker.com/sick-of-ruby-dynamic-typing-side-effects-object-oriented-programming/


      webdev
      https://www.reddit.com/r/webdev/comments/28ziwz
      Vim for people who think things like Vim are weird and hard
      about a year ago
      http://csswizardry.com/2014/06/vim-for-people-who-think-things-like-vim-are-weird-and-hard/


      webdev
      https://www.reddit.com/r/webdev/comments/27h6za
      The emperor’s new clothes were built with Node.js
      about a year ago
      http://notes.ericjiang.com/posts/751


      webdev
      https://www.reddit.com/r/webdev/comments/26hm0m
      Clojure, or how to put the spark back into your relationship with programming
      about a year ago
      http://monkey-robot.com/2014/05/clojure-a-retrospective/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2025%20May%202014


      Clojure
      https://www.reddit.com/r/Clojure/comments/26hlxb
      Clojure: A Retrospective
      about a year ago
      http://monkey-robot.com/2014/05/clojure-a-retrospective/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2025%20May%202014


      programming
      https://www.reddit.com/r/programming/comments/26hlvt
      Fresh perspectives: Learning new languages after you know (quite) a few
      about a year ago
      http://monkey-robot.com/2014/05/clojure-a-retrospective/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2025%20May%202014


      webdev
      https://www.reddit.com/r/webdev/comments/26e9x6
      I created a tool for sampling Reddit users' karma (link and comment)
      about a year ago


      programming
      https://www.reddit.com/r/programming/comments/26562t
      Erlang and code style: Musings on mostly defensive programming styles
      about a year ago
      https://medium.com/p/b5936dceb5e4


      webdev
      https://www.reddit.com/r/webdev/comments/25p2d8
      Facebook: MVC Does Not Scale, Use Flux Instead
      about a year ago
      http://www.infoq.com/news/2014/05/facebook-mvc-flux
      """

  Scenario: List posts when user has no submissions
    Given the Reddit service returns posts for the user "blank"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts log blank`
    Then it should pass with:
      """
      blank has no posts.
      """

  Scenario: Filter posts by subreddit
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts log mipadi webdev`
    Then it should pass with:
      """
      webdev
      https://www.reddit.com/r/webdev/comments/35rtkx
      The Future of Web Design is Hidden in the History of Architecture
      about 6 months ago
      https://medium.com/@sall/the-future-of-web-design-is-hidden-in-the-history-of-architecture-1cc93ea854d0


      webdev
      https://www.reddit.com/r/webdev/comments/32y92q
      Microservices in Clojure
      about 7 months ago
      https://speakerdeck.com/kachayev/microservices-in-clojure


      webdev
      https://www.reddit.com/r/webdev/comments/2vo5zs
      Major security alert as 40,000 MongoDB databases left unsecured on the internet
      about 9 months ago
      http://news.hitb.org/content/major-security-alert-40000-mongodb-databases-left-unsecured-internet


      webdev
      https://www.reddit.com/r/webdev/comments/2ejsyv
      You have ruined HTML
      about a year ago
      http://blog.dantup.com/2014/08/you-have-ruined-html/


      webdev
      https://www.reddit.com/r/webdev/comments/29og3m
      Sick of Ruby, dynamic typing, side effects, and basically object-oriented progra
      about a year ago
      https://blog.abevoelker.com/sick-of-ruby-dynamic-typing-side-effects-object-oriented-programming/


      webdev
      https://www.reddit.com/r/webdev/comments/28ziwz
      Vim for people who think things like Vim are weird and hard
      about a year ago
      http://csswizardry.com/2014/06/vim-for-people-who-think-things-like-vim-are-weird-and-hard/


      webdev
      https://www.reddit.com/r/webdev/comments/27h6za
      The emperor’s new clothes were built with Node.js
      about a year ago
      http://notes.ericjiang.com/posts/751


      webdev
      https://www.reddit.com/r/webdev/comments/26hm0m
      Clojure, or how to put the spark back into your relationship with programming
      about a year ago
      http://monkey-robot.com/2014/05/clojure-a-retrospective/?utm_source=reddit&amp;utm_medium=social&amp;utm_campaign=Post%3A%2025%20May%202014


      webdev
      https://www.reddit.com/r/webdev/comments/26e9x6
      I created a tool for sampling Reddit users' karma (link and comment)
      about a year ago


      webdev
      https://www.reddit.com/r/webdev/comments/25p2d8
      Facebook: MVC Does Not Scale, Use Flux Instead
      about a year ago
      http://www.infoq.com/news/2014/05/facebook-mvc-flux
      """

  Scenario: Filter posts by subreddit when user has no submissions to that subreddit
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts log mipadi nsfw`
    Then it should pass with:
      """
      No posts by mipadi for nsfw.
      """

  Scenario: Tally posts
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally mipadi`
    Then it should pass with:
      """
      apple          1
      Clojure        1
      django         1
      Games          2
      movies         1
      programming    2
      short          1
      swift          3
      technology     1
      vim            2
      webdev        10
      """

  Scenario: Sort posts
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally -c mipadi`
    Then it should pass with:
      """
      webdev        10
      swift          3
      Games          2
      programming    2
      vim            2
      apple          1
      Clojure        1
      django         1
      movies         1
      short          1
      technology     1
      """

  Scenario: Tally posts when user has no submissions
    Given the Reddit service returns posts for the user "blank"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally blank`
    Then it should pass with:
      """
      blank has no posts.
      """

  Scenario: Sort posts when user has no submissions
    Given the Reddit service returns posts for the user "blank"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally -c blank`
    Then it should pass with:
      """
      blank has no posts.
      """

  Scenario: Tally posts when user does not exist
    Given the Reddit service does not have a user "testuser"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: Sort posts when user does not exist
    Given the Reddit service does not have a user "testuser"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally -c testuser`
    Then it should fail with:
      """
      No such user: testuser
      """

  Scenario: Pass no arguments when listing posts
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts log`
    Then the exit status should not be 0
    And the stderr should contain exactly:
      """
      You must specify a username
      """

  Scenario: Pass no arguments when tallying
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts tally`
    Then the exit status should not be 0
    And the stderr should contain exactly:
      """
      You must specify a username
      """

  Scenario: Pass no arguments to command
    Given the Reddit service returns posts for the user "mipadi"
    And time is frozen at Nov 19, 2015 11:22 AM
    When I run `usaidwat posts`
    Then the exit status should not be 0
    And the stderr should contain exactly:
      """
      Do you want to tally or log posts?
      """

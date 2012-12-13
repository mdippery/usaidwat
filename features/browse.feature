Feature: Browse comments

  As a Redditor
  I want to quickly be able to list another Redditor's comments
  In order to see what they like to talk about
  
  Background: Reddit service
    Given the Reddit service returns comments for the user "mipadi"
  
  Scenario: List all comments
    When I run `usaidwat mipadi`
    Then it should pass with:
      """
      wikipedia
      http://www.reddit.com/r/wikipedia/comments/142t4w/z/c79peed

      Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).
      --------------------------------------------------------------------------------
      nyc
      http://www.reddit.com/r/nyc/comments/141zqc/z/c79dxg6

      It has a fare when the lights are *off.*
      --------------------------------------------------------------------------------
      worldnews
      http://www.reddit.com/r/worldnews/comments/140mra/z/c797jq4

      The Judgment of Solomon Accords.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3

      You're from New Jersey? Which exit?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo

      You didn't slow down for very long though, did you?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141qy0/z/c795lp7

      One of the biggest benefits of college is being exposed to new ideas, things you may not have even known existed, and also be forced to confront ideas and people that don't necessarily agree with your world view. I'm not sure that learning everything online would fulfill that role; it seems that online, people tend to stick to areas that agree with their pre-existing ideas (c.f. Reddit).
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zb9q

      I just got rid of the ones "in the cloud". I don't want to lose the play counts on the old (protected) files, and I don't use the iTunes Match service anyway.
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78zas6

      Let's just say I'm writing checks my body can't cash.
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78qp8s

      Is there anything wrong with just deleting them? I get a warning about their being deleted from iCloud, but I don't really care because these duplicates tend to mess with syncing on my iPhone anyway. (They're tracks I downloaded from iTMS as much as 8 years ago, and in some cases I've changed the ID3 tags which seems to confuse iTunes to no end. Or maybe it's because they're the old protected AAC files, I dunno.)

      *Edit:* Ah yes, it appears to happen for protected AAC files.
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/1405el/z/c78p6wa

      Oh cool, it even [duplicated my songs](http://i.imgur.com/8BSE9.png)—for free!
      --------------------------------------------------------------------------------
      Games
      http://www.reddit.com/r/Games/comments/13xc2o/z/c784qj8

      That's exactly how I feel. There are times when I have a ton of fun playing BF3…but it always feels like it has so much more potential to be an awesome game.

      And that feeling comes even when the game isn't completely fucking frustrating because some admin is kicking you for using some arbitrary weapon he doesn't like, or switching you to the losing team because he doesn't like getting his ass kicked. Or when the game is simply crashing.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13xodm/z/c783yyz

      Give him poor (but honest) ratings and feedback on the professor/course questionnaire at the end of the semester.
      --------------------------------------------------------------------------------
      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77stm8

      I went to a public school.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13wa70/z/c77qbxx

      Grandma's Boy.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13us1s/z/c77qba0

      Fucking expensive, and too close to New Jersey.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13vcwr/z/c77pum0

      It's like sex, only better.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13w4de/z/c77p9ls

      Individual PC makers could pick which browser they installed by default.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13w4de/z/c77p96d

      No, but the problem wasn't *just* that Microsoft was bundling IE.
      --------------------------------------------------------------------------------
      django
      http://www.reddit.com/r/django/comments/13p9ez/z/c77n56i

      I have a lot of experience working with Satchmo. I don't recommend it. It's over-engineered, hard to adapt to your own needs, and, while buggy, it's rarely updated anymore.
      --------------------------------------------------------------------------------
      books
      http://www.reddit.com/r/books/comments/13vijv/z/c77n2hg

      Yeah, I'm disappointed that some people only enjoyed two books. I didn't like all of the stuff I read in high school, but I got to read great things like *Animal Farm*, *1984*, *Night*, *Raisin in the Sun*, *The Glass Menagerie*, Shakespeare, King Arthur, *A Doll's House*, *Death of a Salesman*, and probably more.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13ug2x/z/c77msa1

      A conductor just collects your tickets.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13v695/z/c77kxy5

      To an extent. There's some animosity towards Turkish people, for example; they're roughly the equivalent of Mexicans in the US, in the "dey took our jerbs!" sense.
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/13vgrv/z/c77ksqn

      I foresee this being on the "Things That Didn't Get More Than 2 Upvotes in /r/technology" list.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13v09c/z/c77kq1t

      That's fine if it's your style (although personally, I think it's much better and less awkward to establish *before* the date whether it is, in fact, a date or not—which doesn't mean you have to say, "Hey, let's go on a date," but just make it clear that it's not simply a friendly outing). *But* what everyone is saying, and I concur, is that *she* may not have thought of it as a date, so when you see her, you should probably just be casual about it: "Hey, it's too bad you didn't make it out last night" or something like that.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13vl2h/z/c77jwnr

      It *is* pretty awesome if you can afford it. ;)
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c77jtox

      I am aware of that. I think that only underscores my point.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c77jjo6

      Well, yes; I'm just pointing out that OS X led to a resurgence in interest and usage of Objective-C, years before the iPhone.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13stwz/z/c777kzs

      Facebook doesn't own the copyright; you just grant them a license to use anything you upload, subject to certain terms. (Specifically, you grant them a "non-exclusive, transferable, sub-licensable, royalty-free, worldwide license to use any IP content that you post on or in connection with Facebook.")
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c776z4r

      OS X wasn't out yet in 1999, so most Objective-C programmers would've been from the NeXTSTEP days.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c772epw

      Objective-C's clunky import system is due to its need to be backwards-compatible with C.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c772dux

      Anyone who wrote software for OS X (or NeXTSTEP, even) had used Objective-C before the iPhone. ;)
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13t868/z/c7729jt

      u mad bro?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13t4pu/z/c771rvn

      Well, perhaps to spell "fiancée" correctly, so people don't think you're engaged to a dude.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13se9h/z/c771r15

      One of my direct ancestors was a Union cavalry lieutenant in the Civil War. He fought at Gettysburg, and his name is on the Pennsylvania Monument there.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13tdm6/z/c771m2w

      Why are so many Redditors incapable of using a toilet?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13tiur/z/c7719ad

      I think women have much *more* genuine friendships than men. Men don't seem to share as much about themselves, and really *talk*, as women do. Male relationships seem to be more about giving each other shit and doing activities than actually being *close* (at least, in my experience).
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13rnu0/z/c77071r

      Proggit: Where knowledge is made up and the karma points don't matter!
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13rnu0/z/c7706ho

      I took the wink to mean that the comment was tongue-in-cheek. (The site's owners may have asked for a comment from Matz himself, and that's what he gave as a joke.)
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c76ih0a

      Nope. The chain of succession only goes through the Vice-President, the Speaker of the House, the President *pro tempore* of the Senate (which is basically the Vice-President of the Senate, as the Vice-President is the President of the Senate), and then the Cabinet members. Anything after that is undefined (although it's highly unlikely that all of those people would be killed at the same time).
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13pp8j/z/c76gi00

      Exactly. You can make a "tabs for indentation, spaces for alignment" rule, but some dingback invariably screws it up (uses tabs for both or something like that), which inevitably makes the alignment/indentation wrong for *everyone but him*. (This is especially true on open source projects, where it's hard to tell Random J. Contributor to uses "tabs for indentation, spaces for alignment"). Using spaces for everything is just easier, and it's not really a that big of a deal if indents aren't in your *preferred* size. (Prefer 8-space tabs to 4-space tabs? Too bad, you can live with 4-space tabs?)
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13pp8j/z/c76gg04

      It is pretty unreadable, but that's not the X.Org coding style. X.Org would do:

          static int
          nameofthefunction(int arg1,
                            int arg2,
                            int arg3);
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13oyev/z/c75wtky

      There was a guy in New York several years ago that went around pushing people onto the subway tracks. Occasionally it happens when people get into fights, too.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c75voxk

      Governors and mayors aren't part of the federal government.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c75hikb

      Plus the entire cabinet, and the Vice-President.
      --------------------------------------------------------------------------------
      worldnews
      http://www.reddit.com/r/worldnews/comments/13mdw2/z/c758qos

      Since when did Wired start publishing PR pieces for the Israeli military?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13jnc2/z/c74reac

      I worked as the opinions editor of my college newspaper. The other editor was a girl named Hallie. I spent an entire semester pronouncing it "hey-lee". Second semester, the photo editor is talking to me and uses the name "hal-lee". I correct him, and we get into an argument about the pronunciation of the name, so when she comes in later, I ask her if it's pronounced "hey-lee" or "hal-lee".

      "Hal-lee," she says.

      "What? Why did you let me call you 'hey-lee' for the entire semester?"

      "I thought it was funny."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13k4mg/z/c74rci8

      Who says math illiteracy *is* okay? I think most people are able to do arithmetic; probably more people are "math illiterate" than illiterate, but still, it's drilled in to us that at least being able to add, subtract, multiply, and divide is important.

      As for more advanced math… Well, being able to read and write doesn't mean you're reading classic literature and writing fine poetry; you're just expected to communicate at a basic level.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13khux/z/c74r0sh

      American Spirits, cyan box. Occasionally Djarum Blacks, if I'm in an area that sells them.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13i9pk/z/c74e76h

      Like many things in life, it depends—mostly on your own personal goals and principles.

      I'll speak anecdotally for a second. One of my hobbies is photography. Photography is an expensive hobby (it *can* be done cheaply, but if you really get into it, it gets pretty pricey). But I enjoy it, and it adds a lot to my life. I also like playing video games, which, again, is a hobby that has the potential to suck up a lot of money.

      Now, my job. Most of the time, it's pretty boring, not challenging, not that fulfilling, and not the most exciting thing I could be doing. *But* I also like the people I work with, the pay is great, and I rarely work more than 45 hours a week.

      The last two points are important: I wouldn't say I'm doing what I *love*, but it's not torture, *and* it affords me both the time and money to pursue my (somewhat expensive) interests outside of work.

      I could get a job making more money…but then I might have to work more hours (sapping up time to do what I *really* want to do), or perhaps work for people I really don't like, or some other negative.

      Conversely, I could maybe swap money for doing something I love…but living paycheck to paycheck kind of sucks, too.

      Ideally, you'll find something you both love *and* can make a lot of money from, but that's uncommon and something to be cherished; barring that, I think it's good to find something you *like* (or at least tolerate), that pays well enough and affords you enough time to do the things you *love*.

      ---

      As an aside, I think it's great to have hobbies separate from your career, that are to be nothing but hobbies. As an example, I used to love writing. I wrote all the time, but mostly for myself (I occasionally shared pieces with other people and I had a blog, but I wasn't serious about disseminating my work). At one point, I got tired of my career and thought maybe I should pursue writing…and then writing became not fun, because I was writing to build a portfolio and get attention—now it was something I felt I *had* to do, rather than something I *wanted* to do. Once I dropped that pursue, writing suddenly became enjoyable again.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74dhmb

      I think everyone should see a therapist—not necessarily every week, but at least a few times a year, like going to the dentist. I think almost everyone has some sort of messed up thing that affects their life in some way.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74df44

      That's the rub, right? The issue isn't that the concepts behind Facebook, Twitter, or hell, even Reddit, are complicated—it's in *scaling* those concepts that the problems arise.

      Any decent programmer could replicate Facebook…for a few dozen or even hundred users, but not for a *billion*.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74ddra

      &gt; I'm fairly certain that if Twitter for Dogs was a good idea, someone (probably Twitter) would have already done it.

      Ha! When people pitch me an idea such as, "It's like Facebook…but better," I always think, "Great. You know that Facebook is already working on 'Facebook but better', right?"
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74dd3f

      I've sometimes wondered about the feasibility of a dating service that ties into Facebook. I mean, people hate that a lot of dating service users are liars, right? So tie it into Facebook so you can see who a person really is (to the extent that Facebook shows who a person really is, of course).

      Of course, people don't want a dating service where everyone is truthful; they want a dating service where *everyone else but them* is truthful.
      --------------------------------------------------------------------------------
      personalfinance
      http://www.reddit.com/r/personalfinance/comments/13iea3/z/c74b9j1

      It's not just money for a piece of paper. If you're serious about writing, studying it puts you in contact with serious writers, lets you focus on your craft, and provides valuable networking opportunities. *And* a lot of MFA programs are funded.

      It's not necessarily the most pragmatic option (especially not now), and sure, you can write without it, but it's about far more than the degree itself.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13i0x5/z/c74a07y

      Well, if you don't want to put up with dipshits, the military is probably the perfect option for you.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gogj/z/c749ypy

      "Going Mach five." Used in the same sense as "It's going well."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13igfy/z/c749d4h

      I think Noam Chomsky put it best:

      "When Israel, in the occupied territories now, claim that they have to defend themselves, they are defending themselves in the sense that any military occupier has to defend itself against the population that they’re crushing."
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c740nlq

      Not different at all. Implying that they didn't bother to ask anyone is the consequence of being ignorant about the situation.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73zda5

      Neither. It's not uncommon, though, for the promotional material and even the speaker lineup for programming conventions to be aimed at heterosexual white males. I don't think that the organizers are actually racist or sexist or homophobic; rather, I think they're in a field were most people *are* straight white males, and fail to realize that not everyone is like them.

      [This article](http://devblog.avdi.org/2012/11/19/on-britruby/) has a provocative analysis. The key point (and obviously I agree with the blogger) is this:

      &gt; I fully believe them when they say that they set out to create a diverse conference. However, I think some implicit bias crept into their selection process.
      &gt;
      &gt; …
      &gt;
      &gt; I’m not accusing the BritRuby organizers of being racist, sexist, or misogynistic. And I don’t think anyone else involved in this conversation is accusing them of those things either, despite misguided claims to the contrary. But I don’t think it’s farfetched to suggest that in their process for coming up with names to invite, their brain VMs might have been over-optimized for the common case: white dudes.
      --------------------------------------------------------------------------------
      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c73vgqr

      I haven't used the AK-74M since I unlocked other weapons (I only have 1h5m of play time on it), but you inspired me to give it another try.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73ubdt

      I can't wait to start crashing tiny planes!
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73u2bl

      You think that, until someone buys you an ice cream maker…
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73u1rn

      I agree. I'm really difficult to shop for, I admit, because typical gifts are pretty much right out:

      * I have a tiny apartment in New York, so anything that merely takes up space but doesn't provide any utility is right out, because I don't have room for it.
      * I'm picky about clothes, and I'm a small guy so you're not going to find anything in my size unless you shop at the stores I already shop at and buy from.
      * My hobbies are either expensive (photography, video gaming to an extent) or require no materials (writing). Oh, and I already have at least a dozen unused journals lying around, so stop buying me those! They were a great idea at one time but I don't need anymore!

      So things that get used up are great. Buy me "expensive" coffee or tea? Thank you very much. Get me a gift card to 5 Guys? Good deal (and thanks, bro!)

      Or books. I'll always make room for those.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73tpb5

      Whoa, your post just made me think. When I was a kid, I really wanted an RC plane, but I never had the money. Now I'm an adult with a job—why have I not bought an RC plane yet?!
      --------------------------------------------------------------------------------
      redditcasual
      http://www.reddit.com/r/redditcasual/comments/13fxv8/z/c73rp5l

      RDDT was used a lot back in the Black Ops days.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f4tu/z/c73r5l1

      Python is a little bit like a Reese's Peanut Butter Cup: there's no *right way* to package Python code.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f8y8/z/c73r0ok

      I get at least one email per week, sometimes from a rep at the company, and sometimes just from a random recruiter. I'm not even on LinkedIn—these are from people who happen to find me on Stack Overflow or GitHub. During some periods, I even get 2-4 emails per week. (I've actually stopped responding to them, because it's become a bit burdensome to write back.)
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73qhxi

      Welcome to the wonderful world of Python drama!
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/13f783/z/c73qhq1

      &gt; Turns out, a lot of the prominent Rubyists are white guys and all of the ones who said they'd like to come were, indeed, white guys.

      I do have to wonder if they even bothered to ask anyone who wasn't white and male.
      --------------------------------------------------------------------------------
      photography
      http://www.reddit.com/r/photography/comments/13fsog/z/c73qesj

      I usually take my Olympus EP-3 and/or my Fujifilm FinePix X100. The X100 is great, but it has a fixed lens, so if need something with zoom or a certain kind of lens, I take the EP-3.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fikh/z/c73q6su

      I think it's fine to go to school to study something you're passionate about, but if that passion isn't something likely to turn into a career, it's good to double-major in something more practical, too.

      The thing is, music is so time consuming that double-majoring might not be realistic.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fwz2/z/c73pz72

      I've never a met a person who has seen *Before Sunrise* and didn't like it, but I think that movie is a piece of shit.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fag8/z/c73pwqt

      Using "it's" instead of "its". It's so common that I can barely stand to read things on the Internet anymore.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g1ex/z/c73pvjp

      I live in New York, and this happens to me all the time. I've had people ask if I was Pakistani, Afghani, Israeli, Jewish, Russian, French, South American, "some kind of Mexican" (my personal favorite), and a host of others.

      No one has ever guessed my actual ethnic background: Irish (but my family's been in America since before the US was a country).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8gl/z/c73pr0y

      It only works for the other ones if you believe that each 007 had an identical life, or that each one adopts the exact same identity, since there are connections that run throughout (Bond being an orphan and having been married, for example).

      The Daniel Craig movies are a reboot of the series with no connection to prior movies.
      --------------------------------------------------------------------------------
      apple
      http://www.reddit.com/r/apple/comments/13erfl/z/c73e3re

      Reporting in from New York. I can't message another person who lives in New York, so it could just be regional. Who knows.
      --------------------------------------------------------------------------------
      battlefield3
      http://www.reddit.com/r/battlefield3/comments/13d64e/z/c72wwhw

      I'm still burned that one time I was tearing up an admin (and other people) with the M39, and I got kicked for "being a n00b" (yes, the guy sent me a message to tell me that). Thing was, the M39 wasn't even listed as a banned weapon in the "rules".
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13bins/z/c72mykp

      The day after I graduated from high school. I was 18.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13acgn/z/c72cz38

      I love these threads. There's something amusing about a bunch of guys who mostly wear cargo shorts criticizing the fashion choices of others.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/139hem/z/c71zchz

      They look the same.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/1396n4/z/c71ymkp

      No, you're not. I have no personal experience in this sort of relationship, but I think that if merely talking to the mother about her daughter might end the relationship, it might be time to just walk away from it—seems like there could very well be problems down the road.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/138od3/z/c71xla4

      Haskell and Erlang are two languages that don't use `%` as a modulus operator (Haskell just doesn't, and in Erlang `%` is the comment sigil).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137i22/z/c71skxk

      Works fine on my Xbox.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137i22/z/c71scyk

      "I'm supposed to do a backup every day before I go home from work. The one year I forget, *this* happens."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137abi/z/c71g1qu

      I was down at the camp in Zuccotti Park numerous times, but I wasn't part of the movement.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/1372wk/z/c71g0zx

      I have a birthday.
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/136mxi/z/c71ecky

      Of course, why else would they have the function?
      --------------------------------------------------------------------------------
      programming
      http://www.reddit.com/r/programming/comments/136mxi/z/c71davt

      Or if they just lit the computer on fire manually, I suppose.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136hln/z/c71c7dj

      The concepts are largely orthogonal. You can have all of both, neither or both, or a bit of each.

      I think it's great if you can find a job you *love*, but that's really pretty rare; most people don't *love* their jobs. Barring that, find a job that doesn't suck, and pays you well enough and affords you enough free time to pursue your interests and hobbies outside of work, is something to be valued.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136ikd/z/c71c4pz

      I am single.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136v2g/z/c71c4hy

      I think there is some pressure (some areas more than others—for example, as a New Yorker, there's constant pressure to look stylish), but men definitely don't have nearly as much pressure as a women.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136ikd/z/c71c2r1

      Hey, I'm friends with a number of women I'm not interested in sleeping with.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136dba/z/c71bopv

      The sound of CTU's phones in *24*.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136mvt/z/c71bkpb

      That's not how progressive taxes work. You don't pay, e.g., 33% on the *entire* income; you pay 33% on the income above a certain rate.

      Let's say there's a really simple tax structure in which $50,000 and less is taxed at 20%, and greater than $50,000 at 35%. A person making $30,000 would pay $6000 in taxes. A person making $100,00 would pay 20% on the first $50,000 plus 35% on the next $50,000, for a total of $27,500 in taxes—*not* $35,000.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136r9c/z/c71b7sn

      I dropped out of grad school. It ended up working out well.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/134xr7/z/c71azqr

      Option+4 on a Mac.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136cro/z/c71avbb

      It's a tough call. In terms of things that have no monetary value but much sentimental value, I'd have to say my diaries. They span over twelve years, and are probably the first things I'd rescue in a fire.

      I value my laptop, although mostly because it was expensive and I need it to earn a living, so without it I wouldn't be making any money.

      In terms of things I take care of the most, I'd have to way (one of) my cameras, which I take great pains to protect at all costs.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136arz/z/c71ak6x

      Yeah, who would've thought that Redditors would yoke themselves to a company that makes products they *love* without really caring about the practices of that company?!

      It's easy to give up Papa John's pizza; not so easy to give up your Windows gaming PC, though.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136gn5/z/c71ahsw

      No; in fact, I actually find it attractive. I certainly support equal rights, and find that gender stereotypes benefit almost no one except the people who happily mold themselves to the stereotypes. And girls who are feminists tend to be more intelligent and independent, to boot.
      """
  
  Scenario: Tally comments
    When I run `usaidwat -t mipadi`
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
    Then it should pass with:
      """
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141kt9/z/c795rwz

      I think it depends on where you go and what you study, but yes, I think they do teach you to think critically, especially in humanities courses and seminars. Maybe it's just because I went to a small, private liberal arts college rather than a huge school, but critical thinking was definitely a part of my education.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140t5c/z/c795nw3

      You're from New Jersey? Which exit?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/140h3z/z/c795muo

      You didn't slow down for very long though, did you?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/141qy0/z/c795lp7

      One of the biggest benefits of college is being exposed to new ideas, things you may not have even known existed, and also be forced to confront ideas and people that don't necessarily agree with your world view. I'm not sure that learning everything online would fulfill that role; it seems that online, people tend to stick to areas that agree with their pre-existing ideas (c.f. Reddit).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13xodm/z/c783yyz

      Give him poor (but honest) ratings and feedback on the professor/course questionnaire at the end of the semester.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13wa70/z/c77qbxx

      Grandma's Boy.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13us1s/z/c77qba0

      Fucking expensive, and too close to New Jersey.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13vcwr/z/c77pum0

      It's like sex, only better.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13w4de/z/c77p9ls

      Individual PC makers could pick which browser they installed by default.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13w4de/z/c77p96d

      No, but the problem wasn't *just* that Microsoft was bundling IE.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13v695/z/c77kxy5

      To an extent. There's some animosity towards Turkish people, for example; they're roughly the equivalent of Mexicans in the US, in the "dey took our jerbs!" sense.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13v09c/z/c77kq1t

      That's fine if it's your style (although personally, I think it's much better and less awkward to establish *before* the date whether it is, in fact, a date or not—which doesn't mean you have to say, "Hey, let's go on a date," but just make it clear that it's not simply a friendly outing). *But* what everyone is saying, and I concur, is that *she* may not have thought of it as a date, so when you see her, you should probably just be casual about it: "Hey, it's too bad you didn't make it out last night" or something like that.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13vl2h/z/c77jwnr

      It *is* pretty awesome if you can afford it. ;)
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13stwz/z/c777kzs

      Facebook doesn't own the copyright; you just grant them a license to use anything you upload, subject to certain terms. (Specifically, you grant them a "non-exclusive, transferable, sub-licensable, royalty-free, worldwide license to use any IP content that you post on or in connection with Facebook.")
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13t4pu/z/c771rvn

      Well, perhaps to spell "fiancée" correctly, so people don't think you're engaged to a dude.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13se9h/z/c771r15

      One of my direct ancestors was a Union cavalry lieutenant in the Civil War. He fought at Gettysburg, and his name is on the Pennsylvania Monument there.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13tdm6/z/c771m2w

      Why are so many Redditors incapable of using a toilet?
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13tiur/z/c7719ad

      I think women have much *more* genuine friendships than men. Men don't seem to share as much about themselves, and really *talk*, as women do. Male relationships seem to be more about giving each other shit and doing activities than actually being *close* (at least, in my experience).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c76ih0a

      Nope. The chain of succession only goes through the Vice-President, the Speaker of the House, the President *pro tempore* of the Senate (which is basically the Vice-President of the Senate, as the Vice-President is the President of the Senate), and then the Cabinet members. Anything after that is undefined (although it's highly unlikely that all of those people would be killed at the same time).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13oyev/z/c75wtky

      There was a guy in New York several years ago that went around pushing people onto the subway tracks. Occasionally it happens when people get into fights, too.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c75voxk

      Governors and mayors aren't part of the federal government.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13myco/z/c75hikb

      Plus the entire cabinet, and the Vice-President.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13jnc2/z/c74reac

      I worked as the opinions editor of my college newspaper. The other editor was a girl named Hallie. I spent an entire semester pronouncing it "hey-lee". Second semester, the photo editor is talking to me and uses the name "hal-lee". I correct him, and we get into an argument about the pronunciation of the name, so when she comes in later, I ask her if it's pronounced "hey-lee" or "hal-lee".

      "Hal-lee," she says.

      "What? Why did you let me call you 'hey-lee' for the entire semester?"

      "I thought it was funny."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13k4mg/z/c74rci8

      Who says math illiteracy *is* okay? I think most people are able to do arithmetic; probably more people are "math illiterate" than illiterate, but still, it's drilled in to us that at least being able to add, subtract, multiply, and divide is important.

      As for more advanced math… Well, being able to read and write doesn't mean you're reading classic literature and writing fine poetry; you're just expected to communicate at a basic level.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13khux/z/c74r0sh

      American Spirits, cyan box. Occasionally Djarum Blacks, if I'm in an area that sells them.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13i9pk/z/c74e76h

      Like many things in life, it depends—mostly on your own personal goals and principles.

      I'll speak anecdotally for a second. One of my hobbies is photography. Photography is an expensive hobby (it *can* be done cheaply, but if you really get into it, it gets pretty pricey). But I enjoy it, and it adds a lot to my life. I also like playing video games, which, again, is a hobby that has the potential to suck up a lot of money.

      Now, my job. Most of the time, it's pretty boring, not challenging, not that fulfilling, and not the most exciting thing I could be doing. *But* I also like the people I work with, the pay is great, and I rarely work more than 45 hours a week.

      The last two points are important: I wouldn't say I'm doing what I *love*, but it's not torture, *and* it affords me both the time and money to pursue my (somewhat expensive) interests outside of work.

      I could get a job making more money…but then I might have to work more hours (sapping up time to do what I *really* want to do), or perhaps work for people I really don't like, or some other negative.

      Conversely, I could maybe swap money for doing something I love…but living paycheck to paycheck kind of sucks, too.

      Ideally, you'll find something you both love *and* can make a lot of money from, but that's uncommon and something to be cherished; barring that, I think it's good to find something you *like* (or at least tolerate), that pays well enough and affords you enough time to do the things you *love*.

      ---

      As an aside, I think it's great to have hobbies separate from your career, that are to be nothing but hobbies. As an example, I used to love writing. I wrote all the time, but mostly for myself (I occasionally shared pieces with other people and I had a blog, but I wasn't serious about disseminating my work). At one point, I got tired of my career and thought maybe I should pursue writing…and then writing became not fun, because I was writing to build a portfolio and get attention—now it was something I felt I *had* to do, rather than something I *wanted* to do. Once I dropped that pursue, writing suddenly became enjoyable again.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74dhmb

      I think everyone should see a therapist—not necessarily every week, but at least a few times a year, like going to the dentist. I think almost everyone has some sort of messed up thing that affects their life in some way.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74df44

      That's the rub, right? The issue isn't that the concepts behind Facebook, Twitter, or hell, even Reddit, are complicated—it's in *scaling* those concepts that the problems arise.

      Any decent programmer could replicate Facebook…for a few dozen or even hundred users, but not for a *billion*.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74ddra

      &gt; I'm fairly certain that if Twitter for Dogs was a good idea, someone (probably Twitter) would have already done it.

      Ha! When people pitch me an idea such as, "It's like Facebook…but better," I always think, "Great. You know that Facebook is already working on 'Facebook but better', right?"
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gwee/z/c74dd3f

      I've sometimes wondered about the feasibility of a dating service that ties into Facebook. I mean, people hate that a lot of dating service users are liars, right? So tie it into Facebook so you can see who a person really is (to the extent that Facebook shows who a person really is, of course).

      Of course, people don't want a dating service where everyone is truthful; they want a dating service where *everyone else but them* is truthful.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13i0x5/z/c74a07y

      Well, if you don't want to put up with dipshits, the military is probably the perfect option for you.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13gogj/z/c749ypy

      "Going Mach five." Used in the same sense as "It's going well."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13igfy/z/c749d4h

      I think Noam Chomsky put it best:

      "When Israel, in the occupied territories now, claim that they have to defend themselves, they are defending themselves in the sense that any military occupier has to defend itself against the population that they’re crushing."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73ubdt

      I can't wait to start crashing tiny planes!
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73u2bl

      You think that, until someone buys you an ice cream maker…
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73u1rn

      I agree. I'm really difficult to shop for, I admit, because typical gifts are pretty much right out:

      * I have a tiny apartment in New York, so anything that merely takes up space but doesn't provide any utility is right out, because I don't have room for it.
      * I'm picky about clothes, and I'm a small guy so you're not going to find anything in my size unless you shop at the stores I already shop at and buy from.
      * My hobbies are either expensive (photography, video gaming to an extent) or require no materials (writing). Oh, and I already have at least a dozen unused journals lying around, so stop buying me those! They were a great idea at one time but I don't need anymore!

      So things that get used up are great. Buy me "expensive" coffee or tea? Thank you very much. Get me a gift card to 5 Guys? Good deal (and thanks, bro!)

      Or books. I'll always make room for those.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8cv/z/c73tpb5

      Whoa, your post just made me think. When I was a kid, I really wanted an RC plane, but I never had the money. Now I'm an adult with a job—why have I not bought an RC plane yet?!
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fikh/z/c73q6su

      I think it's fine to go to school to study something you're passionate about, but if that passion isn't something likely to turn into a career, it's good to double-major in something more practical, too.

      The thing is, music is so time consuming that double-majoring might not be realistic.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fwz2/z/c73pz72

      I've never a met a person who has seen *Before Sunrise* and didn't like it, but I think that movie is a piece of shit.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13fag8/z/c73pwqt

      Using "it's" instead of "its". It's so common that I can barely stand to read things on the Internet anymore.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g1ex/z/c73pvjp

      I live in New York, and this happens to me all the time. I've had people ask if I was Pakistani, Afghani, Israeli, Jewish, Russian, French, South American, "some kind of Mexican" (my personal favorite), and a host of others.

      No one has ever guessed my actual ethnic background: Irish (but my family's been in America since before the US was a country).
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13g8gl/z/c73pr0y

      It only works for the other ones if you believe that each 007 had an identical life, or that each one adopts the exact same identity, since there are connections that run throughout (Bond being an orphan and having been married, for example).

      The Daniel Craig movies are a reboot of the series with no connection to prior movies.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13bins/z/c72mykp

      The day after I graduated from high school. I was 18.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/13acgn/z/c72cz38

      I love these threads. There's something amusing about a bunch of guys who mostly wear cargo shorts criticizing the fashion choices of others.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/139hem/z/c71zchz

      They look the same.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/1396n4/z/c71ymkp

      No, you're not. I have no personal experience in this sort of relationship, but I think that if merely talking to the mother about her daughter might end the relationship, it might be time to just walk away from it—seems like there could very well be problems down the road.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137i22/z/c71skxk

      Works fine on my Xbox.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137i22/z/c71scyk

      "I'm supposed to do a backup every day before I go home from work. The one year I forget, *this* happens."
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/137abi/z/c71g1qu

      I was down at the camp in Zuccotti Park numerous times, but I wasn't part of the movement.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/1372wk/z/c71g0zx

      I have a birthday.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136hln/z/c71c7dj

      The concepts are largely orthogonal. You can have all of both, neither or both, or a bit of each.

      I think it's great if you can find a job you *love*, but that's really pretty rare; most people don't *love* their jobs. Barring that, find a job that doesn't suck, and pays you well enough and affords you enough free time to pursue your interests and hobbies outside of work, is something to be valued.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136ikd/z/c71c4pz

      I am single.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136v2g/z/c71c4hy

      I think there is some pressure (some areas more than others—for example, as a New Yorker, there's constant pressure to look stylish), but men definitely don't have nearly as much pressure as a women.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136ikd/z/c71c2r1

      Hey, I'm friends with a number of women I'm not interested in sleeping with.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136dba/z/c71bopv

      The sound of CTU's phones in *24*.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136mvt/z/c71bkpb

      That's not how progressive taxes work. You don't pay, e.g., 33% on the *entire* income; you pay 33% on the income above a certain rate.

      Let's say there's a really simple tax structure in which $50,000 and less is taxed at 20%, and greater than $50,000 at 35%. A person making $30,000 would pay $6000 in taxes. A person making $100,00 would pay 20% on the first $50,000 plus 35% on the next $50,000, for a total of $27,500 in taxes—*not* $35,000.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136r9c/z/c71b7sn

      I dropped out of grad school. It ended up working out well.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/134xr7/z/c71azqr

      Option+4 on a Mac.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136cro/z/c71avbb

      It's a tough call. In terms of things that have no monetary value but much sentimental value, I'd have to say my diaries. They span over twelve years, and are probably the first things I'd rescue in a fire.

      I value my laptop, although mostly because it was expensive and I need it to earn a living, so without it I wouldn't be making any money.

      In terms of things I take care of the most, I'd have to way (one of) my cameras, which I take great pains to protect at all costs.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136arz/z/c71ak6x

      Yeah, who would've thought that Redditors would yoke themselves to a company that makes products they *love* without really caring about the practices of that company?!

      It's easy to give up Papa John's pizza; not so easy to give up your Windows gaming PC, though.
      --------------------------------------------------------------------------------
      AskReddit
      http://www.reddit.com/r/AskReddit/comments/136gn5/z/c71ahsw

      No; in fact, I actually find it attractive. I certainly support equal rights, and find that gender stereotypes benefit almost no one except the people who happily mold themselves to the stereotypes. And girls who are feminists tend to be more intelligent and independent, to boot.
      """
  
  Scenario: List comments for a subreddit with no comments
    When I run `usaidwat mipadi nsfw`
    Then it should pass with:
      """
      No comments by mipadi for nsfw.
      """
  
  Scenario: Tally comments with subreddit
    When I run `usaidwat -t mipadi AskReddit`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """
  
  Scenario: Pass no arguments
    When I run `usaidwat`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """
  
  Scenario: Pass no arguments when tallying
    When I run `usaidwat -t`
    Then it should fail with:
      """
      Usage: usaidwat [-t] <user> [<subreddit>]
      """

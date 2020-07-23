{+ resources/syntax/general.cmd +}

{+ resources/syntax/cynics-730.cmd +}

%%
  %title A cynic's 7.30 (and other programs)
  %date-created 2019-08-30
  %date-modified 2020-05-21
  \resources:rendering
  %css a~~
    .air-date {
      font-weight: bold;
    }
    li > a {
      display: block;
    }
    .marker {
      margin-top: 1em;
      font-size: small;
    }
    .host.marker {
      text-align: right;
      margin-bottom: 2em;
    }
    .guest.marker {
      text-align: left;
    }
    blockquote > p {
      margin: 0.1em 0 0.3em;
    }
    img.host {
      margin-bottom: 1.5em;
    }
  ~~
%%


[[====
* \header-link:home
* \header-link:top
* \header-link:cite
====]]


# %title #


[||||
||||]

----
Originally the plan was to make comic strips
with proper speech and thought bubbles,
but I don't think I can pull that off with just HTML and CSS.
So if you see [:{highlighted and curly-bracketed text in [Comic Neue]}:],
it's supposed to be in a thought bubble.
----

@@[Comic Neue]
  http://comicneue.com/
@@

||||{.important .statement}
You may not care about politics, but politics cares about you.
And by that I mean: politics is out to screw you.
||||


<## Air date [. .] ##>
{%
  \[ [.]
  (?P<content> [\S]*? )
  [.] \]
%
  <span class="air-date">\g<content></span>
%}


##{#2020} 2020 ##

----
Brought to you in the safety of Western Australia.
----


""""{.interview}

![WA Premier Mark McGowan] [Mark McGowan]

----{.h}
Don't come. We don't want you.
----
||||{.host .marker}
---Mark McGowan [(29~March~2020)] [don't come]
||||

![WA Health Minister Roger Cook] [Roger Cook]

----{.g}
If someone wants to challenge that in the High Court, good luck to them.
I say, you know, fill your boots.
----
||||{.guest .marker}
---Roger Cook [(20~May~2020)] [good luck]
||||

""""

@[Mark McGowan]{.h} mark-mcgowan-2020-03-29.jpg @
@[don't come]
  https://www.abc.net.au/news/2020-03-29/\
    coronavirus-pandemic-prompts-wa-to-consider-hard-border-closure/\
    12100824
@

@[Roger Cook]{.g} roger-cook-2020-05-20.jpg @
@[good luck]
  https://www.abc.net.au/news/2020-05-20/\
    wa-escalates-coronavirus-state-border-closure-row-with-nsw/\
    12266628
@


====
* [.26~March~2020.]
  [
    Deputy Chief Medical Officer Paul Kelly \
    on the fight to contain coronavirus
  ](
    2020/sales-kelly-coronavirus
  )
  
  (or, Professor Paul Kelly speaking politician-speak)

* [.12~March~2020.]
  [
    Josh Frydenberg says the Government's surplus prediction \
    was based on 'forecasts at the time'
  ](
    2020/sales-frydenberg-surplus
  )

* [.3~March~2020.]
  [
    Scott Morrison says economic plan for coronavirus \
    to be revealed before May budget
  ](
    2020/sales-morrison-economy
  )

* [.2~March~2020.]
  [
    Energy Minister Angus Taylor discusses carbon emissions and Clover Moore
  ](
    2020/sales-taylor-emissions
  )

====


##{#2019} 2019 ##

====
* [.14~October~2019.]
  [
    Energy Minister Angus Taylor discusses Snowy Hydro 2.0
  ](
    2019/sales-taylor-snowy
  )

* [.10~September~2019.] (The Bolt Report, not 7.30)
  [
    Gladys Liu discusses membership of various Chinese Associations
  ](
    2019/bolt-liu-association
  )

* [.3~September~2019.]
  [
    Anthony Albanese discusses the NSW Labor donation scandal
  ](
    2019/sales-albanese-donation
  )

* [.28~August~2019.]
  [
    Education Minister Dan Tehan discusses NAPLAN and the latest results
  ](
    2019/sales-tehan-naplan
  )

====

\cite-this-page[][cynics-730][%title]

%footer-element

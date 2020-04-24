(+ res/general-syntax.cmd +)

%%
  %title Page not found
  %title-suffix \title-suffix
  %resources
    (+ res/main-resources.cmd +)
  %css
    strong {
      display: block;
      margin-bottom: 1em;
    }
%%


[[====
* \link:home
====]]


# 404: %title #

----
**The requested page was not found.**

Head back to the [home page], or see the [sitemap].
----

@@[home page]
  /
@@

@@[sitemap]
  https://github.com/yawnoc/yawnoc.github.io/blob/master/sitemap.txt
@@

---
Title: ./MonoTouch_Beta
layout: default
---

This is the page for the [MonoTouch]({{site.url}}/MonoTouch "wikilink") Beta program.
If you are interested in participating on the beta, you can fill out our
[<http://spreadsheets.google.com/viewform?hl=en&formkey=dHRXeFI5b1NjUWdRRkpiSmxkanh6T1E6MA>..
Beta Signup Form].

Here are some pointers to get you started:

-   [Installing MonoTouch]({{site.url}}/MonoTouch_Installation "wikilink").
-   [MonoTouch Tutorials]({{site.url}}/MonoTouch_Tutorials "wikilink").
-   [API design for MonoTouch]({{site.url}}/MonoTouch_API "wikilink").
-   [Using MonoDevelop to create a MonoTouch
    application]({{site.url}}/MonoTouch_Tutorial_MonoDevelop_HelloWorld "wikilink").

Live Support over Chat
======================

You can get live support for MonoTouch using [IRC]({{site.url}}/IRC "wikilink") at
server irc.gnome.org channel \#monotouch.

Bugs in MonoTouch
=================

You can query or report new bugs using Bugzilla, here are some links:

Release History
===============

[MonoTouch Release History]({{site.url}}/MonoTouch_ReleaseNotes "wikilink")

Caveats
=======

We consider MonoTouch feature complete, but there will be bugs lurking
in this beta release. We will be issuing new builds every few days to
correct bugs that developers will be running into, so please report
these issues to the monotouch@lists.ximian.com mailing list.

The beta does not come with a license to redistribute the code beyond
testing. For that you will need to wait for the official release in the
first two weeks of September to buy the real product version.

The .NET API
------------

MonoTouch is based on a hybrid .NET 2.0 and Silverlight 2 API profile,
this was done to help the Mono Linker remove code to make your code
smaller. If you want to use existing C\# code, you will need to compile
it from scratch using our compiler and tools to make sure that the
proper assemblies are referenced.

Limitations
-----------

Since MonoTouch is a static compiler (no JIT engine), there are some
[limitations]({{site.url}}/MonoTouch:Limitations "wikilink") that you should be aware
of before you write your code.

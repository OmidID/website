---
Title: ./Debugger
layout: default
---

Mono comes with two Mono-specific debuggers: a hard debugger and a soft
debugger, additionally, you can [use the Unix GDB debugger with
Mono]({{site.url}}/Debugging "wikilink") to debug low level problems, more
information on these debuggers is available here:

-   [Soft Debugger]({{site.url}}/Soft_Debugger "wikilink")
    -   Recommended debugger engine, requires Mono 2.6 + MonoDevelop 2.2
    -   Only debugs pure managed applications
    -   Moonlight, ASP.NET, Gtk\#, iPhone and remote debugging supported
-   [Hard Debugger]({{site.url}}/Guide:Debugger "wikilink")
    -   Works with Mono 2.4, 2.6 and requires MonoDevelop 2.2
    -   Debugs both managed and unmanaged applications
    -   Only supports GUI and Console applications from Unix
    -   Can debug ASP.NET applications while using Visual Studio
-   [Low-level debugging with GDB]({{site.url}}/Debugging "wikilink")

Both the [soft debugger]({{site.url}}/Soft_Debugger "wikilink") and the [hard
debugger]({{site.url}}/Guide:Debugger "wikilink") are supported by the MonoDevelop
IDE 2.2, but only the hard debugger has a Unix command-line interface
(**mdb**). If you are a Mono 2.6+ user, we strongly recommend the use of
the soft debugger.

MonoTools for Visual Studio 1.0 supports the Hard Debugger interface,
and MonoTools for Visual Studio 2.0 introduces support for the Soft
Debugger as well.

Bugs
====

Debugger bug tracking:

-   [http://bugzilla.ximian.com/buglist.cgi?product=Mono%3A+Debugger&amp;bug\_status=NEW&amp;bug\_status=ASSIGNED&amp;bug\_status=REOPENED&amp;order=bugs.bug\_id
    Query](http://bugzilla.ximian.com/buglist.cgi?product=Mono%3A+Debugger&amp;bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;order={{site.url}}/bugs.bug_id Query "wikilink")
    [http://bugzilla.ximian.com/enter\_bug.cgi?product=Mono%3A+Debugger
    Add](http://bugzilla.ximian.com/enter_bug.cgi?product=Mono%3A+{{site.url}}/Debugger Add "wikilink")

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

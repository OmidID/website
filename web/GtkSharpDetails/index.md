---
Title: ./GtkSharpDetails
layout: default
---

Gtk\# 2.0 has been released.

For a list of the new features see [Whats new on Gtk\#
2](GtkSharpNewInVersion2{{site.url}}/x "wikilink") page, for a list of upcoming
features see [GtkSharpPlan]({{site.url}}/GtkSharpPlan "wikilink").

Introduction
------------

![iFolder, a [GTK\#]({{site.url}}/GtkSharp "wikilink")
application](http://localhost:4000/files/IFolder Linux.png "fig:iFolder, a GTK# application")
Gtk\#, a [GUI Toolkit]({{site.url}}/Gui_Toolkits "wikilink"), is a set of .NET
bindings for the [gtk+](http://www.gtk.org/) toolkit and assorted
[GNOME](http://www.gnome.org/) libraries. This library allows you to
build fully native graphical Gnome application using Mono. GTK\# is an
event-driven system like any other modern windowing library. Every
widget in an application has handler methods that get called when
particular events happen.

Applications built using Gtk\# will run on many platforms including
Linux, Windows and MacOS X. Gtk is the native toolkit for the Linux
desktop running GNOME, so applications will look and function best on
here. The Mono packages for Windows include Gtk, Gtk\# and the native
theme to make your applications look like native Windows applications.
At this point, running Gtk\# applications on MacOS requires the user to
run the X11 server.

You can use [Glade](http://glade.gnome.org/) along with the Glade\#
bindings to easily design GUI applications. A new GUI designer called
[Stetic]({{site.url}}/Stetic "wikilink") is being built which will be integrated with
the MonoDevelop IDE.

In addition to support the standard Gtk/Gnome stack of development
tools, the gtk-dotnet.dll assembly provides a bridge to consume
functionality available on the .NET stack, at this point this includes
the functionality to use System.Drawing to draw on a widget.

See the sample in gtk-sharp/samples/DrawingSample.cs for details.

Availability
------------

Gtk\# is available for both Unix and Windows.

-   For Unix, go [Downloads]({{site.url}}/Downloads "wikilink").
-   For Windows go
    [here](http://forge.novell.com/modules/xfmod/project/?gtks-inst4win).

Tutorials
---------

Other Gtk\# Tutorials
---------------------

-   Video demonstrating how to create a "Hello World" application using
    Gtk\# and glade

:   <http://nat.org/demos/gtksharp.html>

-   Creating your first "hello world" Gtk\# application using
    MonoDevelop

:   <http://www.monodevelop.com/tutorials/helloworld.aspx>

-   An old collection of documentation for Gtk\#, it would be great if
    someone could go through this and insert it all into the wiki

:   <http://www.gotmono.com/docs/gnome/bindings/gtk-sharp/gtk-sharp.html>

-   How to build a Gtk\# application in Windows using glade and Visual
    Studio.Net 2003

:   <http://www.mfconsulting.com/tutorial/newgladeapp/>

User Testimonials
-----------------

User testimonials indicate that Gtk\# provides developers with great
productivity for building graphical applications especially when
compared to GTK+ or Java Swing : <i>"Gtk\# and Mono have proven to be an
outstanding combination for delivering rich client applications to the
Linux desktop...Gtk\# and Mono's tight integration with the GNOME/Ximian
desktop enables us to deliver desktop plugins written entirely in
managed code. Today, this level of integration is not possible on
Windows with .NET and Windows Forms." </i> says Brady Anderson from the
[iFolder](http://www.ifolder.com) project.

Additional Widgets
------------------

The following is a list of additional widgets (known as "controls" in
Windows) that people have written to extend Gtk\#:

-   [NPlot 0.9.8.5 for
    Gtk\#](http://primates.ximian.com/~miguel/tmp/NPlot-Gtk-0.9.8.5.tar.gz)
    - A Free Graph / Chart Library for .NET (Original version:
    [here](http://netcontrols.org/nplot/)).
-   [DiaCanvas\#](http://diacanvas.sourceforge.net/csharp.php) - Create
    and display diagrams and flowcharts
-   [GtkGL\#](http://www.olympum.com/~bruno/gtkgl-sharp.html) - OpenGL
    and Gtk\# integration. Not maintained.
-   [GtkGLAreaSharp]({{site.url}}/GtkGLAreaSharp "wikilink") - OpenGL widget, based
    on the [GtkGLArea]({{site.url}}/GtkGLArea "wikilink") widget. Currently
    maintained by <User:CJCollier>

If you know of anything else that should be added to this page, let
someone in \#mono know.

Gtk\#'s Components
------------------

Versions & Status
-----------------

You might want to
[subscribe](http://lists.ximian.com/mailman/listinfo/gtk-sharp-list)to
gtk-sharp-list@ximian.com for status updates and general discussion.

The [Gtk\# project](http://gtk-sharp.sourceforge.net) is closely
associated with the Mono project.  Development is proceeding in the
[Mono SVN]({{site.url}}/SVN Write Access "wikilink") repository.  The SVN Repository
can be browsed [on the web.](http://anonsvn.mono-project.com/)

-   <b>Gtk\# 2.4</b> This is the current versions of Gtk\# and they bind
    Gtk+ 2.4 and the GNOME 2.10 platform.

-   <b>Gtk\# 1.0.x</b>: this is the old version of Gtk\# and it binds
    the GNOME 2.2 platform.
    -   SVN branch name:
        [source/branches/gtk-sharp-1-0-branch/gtk-sharp](http://anonsvn.mono-project.com/viewvc/branches/gtk-sharp-1-0-branch/gtk-sharp/)

For more details about the versions and future plans see:
[GtkSharpPlan]({{site.url}}/GtkSharpPlan "wikilink").

Development is occuring on svn trunk at:
[source/trunk/gtk-sharp](http://anonsvn.mono-project.com/viewvc/trunk/gtk-sharp/)

Migrating from 1.x to 2.x
-------------------------

See our page on [upgrading your Gtk\#
application]({{site.url}}/GtkSharpUpgrade "wikilink")

Future Directions
-----------------

We are keeping track of various ideas for Gtk\# on the
[GtkSharpIdeas]({{site.url}}/GtkSharpIdeas "wikilink") page

A place to track how [Gtk+ can be improved on
Windows](ImprovingGtkWin32{{site.url}}/ "wikilink").

Additional Resources
--------------------

For specific examples on GTK widgets, and other Gtk related topics,
click on the GtkSharp category at the bottom of this page.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:GtkSharp>

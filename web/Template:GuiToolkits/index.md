---
Title: ./Template:GuiToolkits
layout: default
---

[Gtk\#]({{site.url}}/GtkSharp "wikilink")
----------------------------

![[GTK\#]({{site.url}}/GtkSharp "wikilink") action with
iFolder](http://localhost:4000/files/IFolder Linux.png "fig:GTK# action with iFolder")
Hompepage: [<http://gtk-sharp.sf.net>](http://gtk-sharp.sf.net)

Wiki: [GtkSharp]({{site.url}}/GtkSharp "wikilink")

This toolkit is a .NET binding for the Gtk+ toolkit. It is in active
development, and there are various applications in the Mono world that
use it (Monodoc, Monocov, Mono's Debugger and various smaller
applications, a more complete list is available on the Gtk\# Wiki.
Platforms: Unix, Windows, GPE, MacOS X (using the X server).

Pros:

-   Good support for accessibility through its Gtk+'s heritage.
-   Layout engine ideal for handling internationalized environments, and
    adapts to font-size without breaking applications.
-   Applications integrate with the Gnome Desktop.
-   API is familiar to Gtk+ developers.
-   Large Gtk+ community.
-   A Win32 port is available, with native look on Windows XP.
-   The API is fairly stable at this point, and syntactic sugar is being
    added to improve it.
-   Unicode support is exceptional.

Cons:

-   Gtk+ apps run like foreign applications on MacOS X.
-   Incomplete documentation.

### Complementary Libraries

The following are some libraries that might be useful while developing
Gtk\# based applications or Gnome applications:

[Windows.Forms]({{site.url}}/WinForms "wikilink")
------------------------------------

![[MWF]({{site.url}}/WinForms "wikilink")'s color dialog
box](http://localhost:4000/files/Colordialog.png "MWF's color dialog box")

Wiki: [WinForms]({{site.url}}/WinForms "wikilink")

This is part of the standard Mono distribution.

This is a work-in-progress effort to implement the Microsoft
System.Windows.Forms API. The API is not complete enough for many tasks,
so developers (in particular third-party developers that provide custom
controls) resort to use the underlying Win32 subsystem on Windows to
provide features which are not exposed by Windows.Forms.

In some cases it is necessary to provide support for the Wndproc method
and the various messages associated with it, and support extra
functionality available in Win32 through P/Invoke, as well as exposing
and sharing various kinds of handles (fonts, drawing contexts, drawing
surfaces, windows).

Up until recently, this was achived using a Windows emulation layer
using Wine. This method was horrible to maintain as well as having many
other issues. The new implimentation included in Mono is what we referer
to as the new Managed.Windows.Forms. This is a fully managed version of
the System.Windows.Forms toolkit provided under the Microsoft's .NET
framework. This means that everything is handled in a managed layer,
from drawing the buttons and controls, to interfacing with font
libraries on the system. This means it should be nearly as portable as
mono itself.

There are two levels of conformance in this API: The full Windows.Forms
from the .NET Framework 1.0 and 1.1, and the subset exposed by the
Compact Framework.

Pros:

-   Extensive documentation exists for it (books, tutorials, online
    documents).

Cons:

-   Bad layout mechanisms: font size changes, and internationalization
    require manual relayout most of the time.
-   All the Windows.Forms efforts are under heavy development.

MonObjc
-------

Homepage: [<http://www.monobjc.net>](http://www.monobjc.net)

Native MacOS X toolkit.

Pros:

-   Native look and feel on MacOS X
-   Extensive API and core documentation
-   Samples
-   Active, vibrant community.

Cons:

-   Not portable outside of MacOS X

Cocoa\#
-------

Homepage: [CocoaSharp]({{site.url}}/CocoaSharp "wikilink")

Native MacOSX toolkit.

Pros:

-   Native look and feel on MacOS X
-   Substrate is well documented, this API lacks documentations.

Cons:

-   Not portable outside of MacOS X

Clutter
-------

C\# bindings for the [Clutter](http://clutter-project.org/) toolkit, a
library for creating lfast, visually rich graphical user interfaces now
has Mono bindings. They are available
[here](http://git.clutter-project.org/bindings/clutter-sharp/).

Vanilla DotNet
--------------

[Vanilla.NET](http://code.google.com/p/vanilla-dotnet/) is a
cross-platform graphical user interface toolkit, application framework
and desktop environment based on Cairo and the .NET framework. It is
written primarily in Boo, however code contributions will be accepted in
other languages (e.g. C\#). Vanilla.NET is still in development and not
yet ready for production use.

wxNet
-----

![wx\#
Sample](http://localhost:4000/files/Linux-05.png "fig:wx# Sample")
Homepage:
[<http://wxnet.sourceforge.net/>](http://wxnet.sourceforge.net/{{site.url}}/ "wikilink")

wxNet is a .NET binding for the wxWindows cross-platform toolkit.

Pros:

-   Native look and feel on each platform.
-   Substrate (wxWindows) is well documented, .NET binding lacks
    documentation.

Cons:

-   Binding to non-supported extra widgets is hard.
-   Custom-authored widgets look and feel is not preserved across
    platforms.
-   Common denominator subset API problem.

Dead efforts
------------

There are a couple of [Dead Toolkits]({{site.url}}/Dead Toolkits "wikilink") that
have been developed in the past.

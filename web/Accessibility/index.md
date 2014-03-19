---
Title: ./Accessibility
layout: default
---

<div style="background: #cccccc; padding: 8px; margin: 2em 4px 4px 4px; text-align: center;">
The latest version of Mono Accessibility is 2.1, released on August 24,
2010. [Get more info about this
release.](Accessibility:_Release_Notes_2.1{{site.url}}/ "wikilink")

</div>
Mono Accessibility
==================

The Mono Accessibility project enables many Windows applications to be
fully accessible on Linux.

Applications based upon System.Windows.Forms can take advantage of this
with no extra code, and enjoy the same level of Accessibility provided
by Windows on any system Mono supports.

This is accomplished through two efforts -- First, implement the managed
[UI Automation]({{site.url}}/UI Automation "wikilink") framework targeted towards
Mono's [System.Windows.Forms]({{site.url}}/Winforms "wikilink") project and second,
implement a [bridge]({{site.url}}/Accessibility:_UiaAtkBridge "wikilink") between our
UI Automation implementation and
[ATK](http://www.linuxfoundation.org/en/Accessibility/ATK), the dominant
Accessibility technology on Linux.

Project Goals
-------------

-   Make [System.Windows.Forms]({{site.url}}/WinForms "wikilink") applications
    accessible via ATK
-   Make [Silverlight](http://silverlight.net/) applications (using
    [Moonlight]({{site.url}}/Moonlight "wikilink")) accessible via ATK
-   Allow [UI Automation]({{site.url}}/UI_Automation "wikilink") based Accessibility
    Technologies to read Linux applications built on at-spi

How do I get it?
----------------

Packages are provided for various Linux distributions, or you can [build
from source]({{site.url}}/Accessibility:_Installing_From_Source "wikilink").

A summary of past releases are available on our
[Releases]({{site.url}}/Accessibility:_Releases "wikilink") page.

Participating
-------------

The Mono Accessibility team is always looking for people to assist us
writing code, documentation or finding and filing bugs. If you're
interested, join our [mailing
list](http://forge.novell.com/mailman/listinfo/mono-a11y), or hop in to
our active IRC channel, [\#mono-a11y](irc://irc.gimp.org/mono-a11y) at
irc.gimp.org.

Development
-----------

### High Level Overview

-   [Architecture]({{site.url}}/Accessibility:_Architecture "wikilink") of UI
    Automation on Linux
-   [Project Roadmap]({{site.url}}/Accessibility:_Roadmap "wikilink") (High Level
    View)
-   [Development Schedule]({{site.url}}/Accessibility:_Project_Schedule "wikilink")
    (Detailed View)
-   [Phase II Work
    Breakdown]({{site.url}}/Accessibility:_Phase_II_Work_Breakdown "wikilink")
-   Members of the Novell [UIA Team]({{site.url}}/Accessibility:_Team "wikilink")

### Functional Specifications

-   [Provider]({{site.url}}/Accessibility:_Provider_Functional_Specification "wikilink")
-   [Bridge]({{site.url}}/Accessibility:_Bridge_Functional_Specification "wikilink")
-   [Notes]({{site.url}}/Accessibility:_Specification_Notes "wikilink") on the UI
    Automation specification
-   [Similarities and
    Differences]({{site.url}}/Accessibility:_Similarities_and_Differences "wikilink")

For Team Members
----------------

### General

-   [Development with Scrum]({{site.url}}/Accessibility:_Scrum "wikilink")
-   [Getting Started With
    Development]({{site.url}}/Accessibility:_Getting_Started_With_Development "wikilink")

### Developers

-   [ Moonlight Main Page]({{site.url}}/Accessibility:_Moonlight "wikilink")
-   Provider:
    ([Architecture]({{site.url}}/Accessibility:_Winforms_Implementation "wikilink"),
    [Implementation Notes]({{site.url}}/Accessibility:_Implementation "wikilink"))

### Quality Assurance

-   [<https://bugzilla.novell.com/buglist.cgi?query_format=advanced&short_desc_type=allwordssubstr&short_desc>=&long\_desc\_type=fulltext&long\_desc=&classification=Mono&product=UI+Automation&bug\_file\_loc\_type=allwordssubstr&bug\_file\_loc=&status\_whiteboard\_type=allwordssubstr&status\_whiteboard=&keywords\_type=anywords&keywords=&deadlinefrom=&deadlineto=&bug\_status=NEW&bug\_status=ASSIGNED&bug\_status=NEEDINFO&bug\_status=REOPENED&emailassigned\_to1=1&emailtype1=substring&email1=&emailassigned\_to2=1&emailreporter2=1&emailqa\_contact2=1&emailcc2=1&emailtype2=substring&email2=&bugidtype=include&bug\_id=&votes=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&order=Reuse+same+sort+as+last+time&field0-0-0=noop&type0-0-0=noop&value0-0-0=
    All Open UIAutomation Bugs]
-   [Development
    Progress]({{site.url}}/Accessibility:_Development_Progress "wikilink")
    (Enhancement Bugs by Control)

-   [Product Test Plan]({{site.url}}/Accessibility:_Test_Plan "wikilink")
-   [Test
    Progress]({{site.url}}/Accessibility:_Test_Plan_WinForms_Controls "wikilink")
-   [Test Coding
    Standard]({{site.url}}/Accessibility:_Test_Coding_Standard "wikilink")
-   [Test Log]({{site.url}}/Accessibility:_Test_Log "wikilink")
-   [Test Summary]({{site.url}}/Accessibility:_Test_Summary "wikilink")
-   [Bug Specification]({{site.url}}/Accessibility:_Bug_Specification "wikilink")
-   [Testing Howto]({{site.url}}/Accessibility:_Testing_Howto "wikilink")
-   [Strongwind Basics
    Tutorial]({{site.url}}/Accessibility:_Strongwind_Basics "wikilink")

### Build

-   [Product Build Plan]({{site.url}}/Accessibility:_Build_Plan "wikilink")

Related Material
----------------

### Mono Winforms

-   [WinForms](http://github.com/mono/winforms) code in Mono's mcs
    project (ViewVC)
-   [UIAutomationWinforms](http://github.com/mono/uia2atk) project for
    winforms providers (ViewVC)

### Other Organizations

There is a lot of work being done in the area of accessibility and we
encourage and participate in as much of that work as possible. The
following is a list of organizations you should be aware of if you are
interested in contributing to accessibility on Linux.

#### Linux Foundation

-   [Accessibility Working
    Group](http://www.linux-foundation.org/en/Accessibility)
    -   [Accessibility](https://lists.linux-foundation.org/mailman/listinfo/accessibility)
        mailing list server
    -   [\#a11y](irc://irc.linux-foundation.org/a11y) on
        irc.linux-foundation.org
-   [ATK/AT-SPI](http://www.linux-foundation.org/en/Accessibility/ATK/AT-SPI)
    Special Interest Group
    -   [ATK/AT-SPI](https://lists.linux-foundation.org/mailman/listinfo/accessibility-atspi)
        mailing list server

#### GNOME

-   [GNOME Accessibility Project](http://live.gnome.org/GAP) with links
    to documentation etc.
-   [GNOME
    Accessibility-devel](http://mail.gnome.org/mailman/listinfo/gnome-accessibility-devel)
    list - Technical discussions and patches for at-spi, gail, and ATs
-   [GNOME
    Accessibility](http://mail.gnome.org/mailman/listinfo/gnome-accessibility-list)
    list - Accessibility development discussion
-   [\#a11y](irc://irc.gimp.org/a11y) on irc.gimp.org
-   [Python Powered
    Accessibility](http://live.gnome.org/Accessibility/PythonPoweredAccessibility)
-   [GNOME Accessibility
    QA](http://developer.gnome.org/projects/gap/testing/index.html)
-   [GNOME Accessibility slide
    intro](http://developer.gnome.org/projects/gap/presentations/GUAD3C/keynote/start.html)

#### Others

-   [Accessibility Interoperability
    Alliance](http://accessinteropalliance.org) (AIA) - The body
    maintaining the UIA specification
-   [openSUSE Accessibility](http://en.opensuse.org/Accessibility)

Project Origins
---------------

On November 8, 2007 Novell
[announced](http://www.novell.com/news/press/microsoft-and-novell-celebrate-year-of-interoperability-expand-collaboration-agreement)
a collaborative effort with Microsoft to make this happen.

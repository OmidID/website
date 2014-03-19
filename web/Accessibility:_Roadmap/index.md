---
Title: ./Accessibility:_Roadmap
layout: default
---

Introduction
------------

This page contains a high level view of the UI Automation accessibility
project. If you are looking for a detailed view of the project schedule,
you can view the [project
schedule]({{site.url}}/Accessibility:_Project_Schedule "wikilink") page.

The big picture of the [roadmap]({{site.url}}/Accessibility:_Roadmap "wikilink") can
be broken down into two phases with target dates as follows:

-   Phase 1 - Q1 2009 - UIA Provider and WinForms integration
    -   The UIA Provider interfaces will be implemented to support
        Windows Forms on Mono.
    -   The ATK/UIA bridge will be completed.
    -   Windows Forms applications running on Linux (in Mono) will be
        accessible using available Linux ATs.
-   Phase 2 - Q4 2009 - UIA Client and Moonlight integration
    -   The UIA Client will be implemented using AT-SPI as the IPC.
    -   The UIA Provider interfaces will be implemented to support
        Moonlight.
    -   The AT-SPI/UIA bridge will be completed and UIA based ATs will
        be able to provide support for all ATK enabled apps.
    -   Moonlight based applications will be accessible using available
        Linux ATs as well as UIA based ATs.

Current release
---------------

### [Release 1.0 - March 17th 2009](Accessibility:_Release_Notes_1.0{{site.url}}/ "wikilink")

100% of the System.Windows.Forms controls supported.

Upcoming releases
-----------------

### Release 1.1 - Mid-late April 2009

Bugfix follow-up to 1.0.

Past releases
-------------

### [Release 0.9.1 - December 6th 2008](Accessibility:_Release_Notes_0.9.1{{site.url}}/ "wikilink")

Bugfix release for 0.9.

### [Release 0.9 - November 26th 2008](Accessibility:_Release_Notes_0.9{{site.url}}/ "wikilink")

Initial preview release, not all controls covered.

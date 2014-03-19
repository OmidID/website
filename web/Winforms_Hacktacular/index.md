---
Title: ./Winforms_Hacktacular
layout: default
---

Novell's Winforms team will be meeting in Boston Oct 22nd - 26th.

Goals for Boston Meeting
------------------------

### Mono 2.0

-   Tentative plan seems to be Mono 2.0 at the end of the year-ish,
    however Winforms will not be considered "complete" at this time.
-   Winforms in first Mono 2.0 release will be a "2.0 preview" like we
    did in Mono 1.2.
-   Some future Mono 2.0 release will advertise Winforms 2.0 as
    "complete".

So we need to figure up:

-   What we want done for the preview (year-end).
-   What we must have done to be "complete" (first half 2008).
-   When we think we will be "complete" (first half 2008).

### Winforms 2.0

-   Ideally, I would like us to be 2.0 API complete for the preview.
    This is a great milestone to advertise, and is going to ensure
    everyone's app at least compiles, so they can start porting and
    reporting tons of bugs.
-   Note that some features will be documented as Not Supported, but the
    API will still be there as stubs to allow compiling and running. (We
    will produce a big document of what isn't supported yet by class.)
-   This is kinda what's left:
    <http://www.mono-project.com/Winforms_2.0>
-   We have mainly WebControl left, and then some random methods here
    and there. (To be API complete, not for it to all work 100%)
-   Andriea needs to provide estimates and a road map as to how
    WebControl work is going. If completeness is going to take too long,
    then we need to look at MoMA and pick out the most important stuff
    that needs to work, and stub the rest.

### Bugs

-   We have to do some agressive triaging to determine:
    -   Bugs that must be fixed by preview/complete.
    -   Bugs that we want fixed by preview/complete.
    -   Bugs that probably stand no chance of being fixed by complete.
-   If we think we can be API complete by the preview, then our
    estimates on the remaining bugs will lead to our estimated completed
    date.
-   Note that the preview will probably cause an avalanche of new bugs.

### Specific Topics

#### Measurement Discussion: Is Bigger Better?

I think starting over with Pango is going to waste too much time, and
will still leave us with the same inconsistencies between Lin/Win that
we have now. It is probably better to try to patch up libgdiplus. But
this is certainly open for discussion, particularly by people with more
experience at it than me. :)

#### WebControl

As mentioned above, this is about half of our currently unimplemented
2.0 API. We need to figure up the effort required, and if we need to cut
obscure API features based on MoMA reports.

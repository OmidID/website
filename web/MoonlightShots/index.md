---
Title: ./MoonlightShots
layout: default
---

Screencasts:

-   [screencast](http://www.youtube.com/watch?v=qRSO7p0HAIw) showing the
    Surface Silverlight application running, with a few variations.
-   [Desklets using
    Moonlight](http://www.youtube.com/watch?v=IbMyPG4IKo8): this is part
    of Novell's HackWeek: a project to create desklets using Moonlight
    on the Linux desktop.

Jackson shares with us Scribbler:

![Scribbler](http://localhost:4000/files/Scribbler.png "Scribbler")

With the 1.0 RC and 1.1 refreshes, Microsoft updated some of their
existing demos:

![A slightly modified version of the Chess demo running on moonlight.
August 6th,
2007](http://localhost:4000/files/Chess-demo.png "A slightly modified version of the Chess demo running on moonlight. August 6th, 2007")

This is the Chess demo running on Moonlight. The .NET AI version and
Human version are working.

![Current state of Silverlight Airlines, Auguest 3rd,
2007](http://localhost:4000/files/Airlines-current-demo.png "Current state of Silverlight Airlines, Auguest 3rd, 2007")

![Current state of Silverlight Pad, August 3rd,
2007](http://localhost:4000/files/Silverlight-pad.png "Current state of Silverlight Pad, August 3rd, 2007")

We now have most of the visual elements of the Silverlight Airlines demo
working.

![Silverlight Airlines demo, loading the Xaml map, June 20th,
2007](http://localhost:4000/files/Silverlight-airlines-demo.png "Silverlight Airlines demo, loading the Xaml map, June 20th, 2007")

Jackson work on the Silverlight Airlines demo now shows various
components:

![Silverlight Airlines demo, loading the Xaml map, June 20th,
2007](http://localhost:4000/files/Airlines-demo.png "Silverlight Airlines demo, loading the Xaml map, June 20th, 2007")

Chris Toshok's modified version of Surface that loads the Mono logo from
a Path/Data components, and runs a live Silverlight widget:

![A Modified Surface page, June 19th,
2007](http://localhost:4000/files/Surfacemodified.png "A Modified Surface page, June 19th, 2007")

Jackson and Sebastien got Paths working, this is from Sam Ruby's [SVG to
Silverlight
page](http://intertwingly.net/stories/2007/05/06/?icon=caution). This in
particular shows a sample that renders on Silverlight but fails with
SVG:

![June 18th,
2007](http://localhost:4000/files/Intertw1.png "fig:June 18th, 2007")
![Showing Moonlight in a browser; June 18th,
2007](http://localhost:4000/files/Intertw1.png "fig:Showing Moonlight in a browser; June 18th, 2007")

Sebastien has been working on getting the [Surface
Silverlight](http://delay.members.winisp.net/SilverlightSurface/)
demonstration to work with our implementation. Here you can see it in
our Gtk\# shell:

![June 17th,
2007](http://localhost:4000/files/SurfaceJun17.png "June 17th, 2007")

Chris Toshok has been running parts of Dr Popper in Moonlight. ![June
21st,
2007](http://localhost:4000/files/Drpopper2.png "fig:June 21st, 2007")

Chris Toshok got the downloader class to work, this is the standard
demo.cpp:

![June 14th,
2007](http://localhost:4000/files/Demo-screenshot.png "June 14th, 2007")

Moonlight running Tattoo sample:

![Jun 20th,
2007](http://localhost:4000/files/Tattoo.jpg "Jun 20th, 2007")

The Mono Monkey as a xaml file rendered in the browser. The monkey was
converted from our SVG monkey file, and is stored using Path Markup
Syntax.

![Jun 21st,
2007](http://localhost:4000/files/Test-monkey.png "Jun 21st, 2007")

MoonLight plugin showing smile xaml sample:

![Jun 9th,
2007](http://localhost:4000/files/Moonsmile.jpg "Jun 9th, 2007")

Firefox with MoonLight plugin running [Binary Clock SilverLight
application](http://explosivedog.com/silverlight/binaryclock/):

![May 22nd,
2007](http://localhost:4000/files/Binaryclock.jpg "May 22nd, 2007")

This shows two videos playing, and they are being scaled and rotated
(together with a rectangle that has radiusx/radiusy set and has a
transparent filling). At this time animation is done with the
Storyboard, with a couple of DoubleAnimations on a Timeline:

![June 7th,
2007](http://localhost:4000/files/Screenshot9.png "June 7th, 2007")

This one shows using a video as a stroke pattern, the video is animated,
and one of the squares is actually rotating around in the screen (the
one tilted):

![June 21st,
2007](http://localhost:4000/files/Path-parsing-progression.png "fig:June 21st, 2007")
A progression of screenshots taken while developing the path markup
parsing code. The end result is the bozo.xaml image from Sam Rubys SVG
Workbench.

![June 4th,
2007](http://localhost:4000/files/Screenshot-lt-demo.png "June 4th, 2007")

Screenshot of the XAML parser, now pulling colors out of XAML files and
showing off it's rebellious side.

![June 4th,
2007](http://localhost:4000/files/Xaml-demo-2.png "June 4th, 2007")

Very first screenshot of the XAML parser parsing and rendering a line
and a rectangle.

![June 4th,
2007](http://localhost:4000/files/Xaml-demo-1.png "June 4th, 2007")

This was the first screenshot, video is rotated, but as you can see the
video was not being decoded properly (libswscale renders to a different
format than Cairo expected), the image is rotating:

![May 22nd,
2007](http://localhost:4000/files/Screenshot3.png "May 22nd, 2007")

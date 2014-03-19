---
Title: ./StudentProjects
layout: default
---

<div style="margin-left: 0; padding: 5px; background-color: #C6D8ED; border: 1px solid #5084C5; border-left-width: 10px; margin-top: 7px; margin-bottom: 20px; width:680px;">
This is the Mono Project's project ideas page. For general information
and rules about participating in [Google Summer of Code
(GSoC)](http://code.google.com/soc/) for the Mono Project, please see
our [overview page]({{site.url}}/Gsoc "wikilink").

</div>
This page lists some ideas for Mono GSoC projects that students can
apply for. Additionally, we encourage students to submit their own
interesting Mono-related project proposals. In past years, roughly 20%
of the accepted proposals were original ideas from students instead of
from our suggestions. You can submit more than one proposal, so you can
submit your own ideas as well as apply for one from this list - but only
one can be chosen, of course!

You can use the following links to jump to sections that you're
interested in:

<div style="width: 700px">
<div style="padding: 5px; background-color: #E5ECF3; border: 1px solid #67A7E3;-moz-border-radius: 5px; margin-bottom: 5px">
<div style="font-size: 12pt; font-weight: bold;">
[Other Ideas](#{{site.url}}/Other_Ideas "wikilink")

</div>
Suggest your own ideas for a project

</div>
<div style="padding: 5px; background-color: #E5ECF3; border: 1px solid #67A7E3;-moz-border-radius: 5px; margin-bottom: 5px">
<div style="font-size: 12pt; font-weight: bold;\">
[Compilers and Tools](#{{site.url}}/Compilers_and_Tools "wikilink")

</div>
Work on Mono's tools and compilers

</div>
<div style="padding: 5px; background-color: #E5ECF3; border: 1px solid #67A7E3;-moz-border-radius: 5px; margin-bottom: 5px">
<div style="font-size: 12pt; font-weight: bold;\">
[MonoDevelop / Xamarin Studio
IDE](#MonoDevelop_.2{{site.url}}/F_Xamarin_Studio_IDE "wikilink")

</div>
Help developers build applications by improving the cross-platform
MonoDevelop / Xamarin Studio IDE

</div>
<div style="padding: 5px; background-color: #E5ECF3; border: 1px solid #67A7E3;-moz-border-radius: 5px; margin-bottom: 5px">
<div style="font-size: 12pt; font-weight: bold;">
[Contacting the Mono Team](#{{site.url}}/Contacting_the_Mono_Team "wikilink")

</div>
How to get in touch with us and ask questions

</div>
</div>
Other Ideas
===========

If a project is not listed here, but you think you have a great idea,
feel free to [contact the Mono team, mentors and org
admins](#{{site.url}}/Contacting_the_Mono_Team "wikilink") to discuss or suggest your
own project ideas.

Over the past years we have picked projects that were not listed here
because they were great ideas, and we had students that were passionate
about those projects. In the end, most of these projects were a success.

Do not be afraid to pick up a project that would be interesting and also
help the Mono universe.

You can find some additional ideas on the [MonkeySquare ideas
page](http://monkeysquare.org/gsoc/projects), and on the [Gnome ideas
page](https://live.gnome.org/SummerOfCode2013/Ideas) (Mono-based
projects in Gnome: Banshee, Blam, Tasque, Tomboy, GBrainy, Mistelix,
F-Spot, ChronoJump, SparkleShare, LongoMatch).

Compilers and Tools
===================

C\# Compiler switch statement enhancements
------------------------------------------

**Complexity:** Medium

**Area:** C\#

Implement perfect hashing and other optimizations for C\# switch
statement. The task is to come up with a heuristic backed up by some
benchmarks for each implementation and implement it.

**Deliverable:** A set of patches which generally improve switch
statement performance including tests for any special cases.

**Mentors:** Marek Safar, Miguel de Icaza

MonoDevelop / Xamarin Studio IDE
================================

Make ASP.NET Awesome in Xamarin Studio
--------------------------------------

**Complexity:** Easy

**Area:** C\#, ASP.NET

Xamarin Studio ASP.NET support is still maintained but has not been very
actively developed in some time. There's lots of room for polishing and
updating it and adding minor but useful features - for example, ASP.NET
MVC4+5 templates, support for VS2013 projects, deploying to remote
servers, being able to choose which web browser to launch when
running/debugging, C\# tooltips and navigation in Razor files, etc.
There's a lot of flexibility which features you want to work on, you can
choose from the above examples and/or propose your own.

**Deliverables:** Polish ASP.NET addin, implement some number of minor
features.

**Mentors:** Michael Hutchinson

Source Analysis and Refactoring
-------------------------------

**Complexity:** Medium

**Area:** Parsers, C\#

The IDE supports source analysis using NRefactory to analyze source
code, indicate potential problems or improvements to the user as "code
issues", and perform "code actions" and "quick fixes" to transform code
automatically. There are almost unlimited possibilities what can be done
to analyze or restructure source code. The system is very flexible, and
we already support a large number of actions and code analysis rules.
But there's plenty of room to add more to help people write good code.
If you like source code analysis or refactoring, it's a great chance to
work in this area. You should look at other similar tools and the
existing rules in MonoDevelop, and propose a set of new and useful code
actions and/or code issues.

**Deliverables:** Useful code actions, code issues, and/or refactorings.

**Mentors:** Michael Hutchinson, Mike Krüger

CSS Support
-----------

**Complexity:** Medium

**Area:** C\#, CSS

Full CSS support would be very useful for developers writing web apps
and embedding HTML pages in desktop and mobile apps. This includes code
completion, code folding, syntax highlighting, document outline, etc. It
should work in standalone CSS files and inline in HTML, CSHTML and ASPX
files. CSS is relatively simple, so there would be potential to
investigate more interesting and advanced features such as support for
browser profiles, checking for common errors, and pads for interactive
editing of styles. A student last year made some substantial progress on
this but it was not integrated - your work should continue from this.

**Deliverables:** CSS editing support in standalone files and inline in
HTML/CSHTML files.

**Mentors:** Michael Hutchinson

Javascript Support
------------------

**Complexity:** Hard

**Area:** C\#, Javascript

Full Javascript support would be very useful for developers writing web
apps and embedding HTML pages in desktop and mobile apps. This includes
code completion, code folding, syntax highlighting, document outline,
etc. It should work in standalone JS files and inline in HTML, CSHTML
and ASPX files. The code completion should be capable of handling common
JS frameworks such as JQuery. There are several open-source managed
JS/AS parsers that could perhaps be used.

**Deliverables:** JS editing support in standalone files and inline in
HTML/CSHTML files.

**Mentors:** Michael Hutchinson

TypeScript Support
------------------

**Complexity:** Medium

**Area:** C\#, Javascript

Bring to Xamarin Studio support for the TypeScript language, similar to
what the SharpDevelop team did:

<http://community.sharpdevelop.net/blogs/mattward/archive/2013/04/24/TypeScriptSupportInSharpDevelop.aspx>

**Deliverables:** Ported version of the SharpDevelop adding, featuring:
TypeScript compilation on save or build, Code completion, Find
references, Rename refactoring, Typescript syntax hightlighting

**Mentors:** Miguel de Icaza, (Matt Ward, Michael Hutchinson, Atsushi
Eno)

Improve C/C++ Binding
---------------------

**Complexity:** Hard

**Area:** C\#, C, C++

The C/C++ binding is an under-maintained area of Xamarin Studio. The
first part of this project would be to generally polish it and fix bugs,
perhaps adding support for the clang and mingw32 compilers. The second
part would be to replace the ctags based code completion with libclang,
and generally improve code completion and code navigation.

**Deliverables:** Negotiable, but should substantially improve C/C++
code completion.

**Mentors:** Michael Hutchinson, Jeffrey Stedfast

Improve C/C++ build support in XBuild
-------------------------------------

**Complexity:** Medium

**Area:** C\#, C, C++

The C/C++ build support in xbuild was much improved in GSoC 2011 but
still needs some work to better integrate other compilers than MSVC. The
first part of this project would be to generally polish it and fix bugs,
and add support for the Clang and GCC compilers. This involves adding a
mapping from the VS-compatible parameters to the respective command line
options on those compilers. The second part would be to improve the C++
binding in MonoDevelop (see entry above) to use this and be able to
compile and load and save MSBuild C++ projects from the IDE in Windows
and OSX/Linux. This is important as MonoDevelop is migrating to MSBuild,
and the C/C++ project type will be dropped unless it is ported to
MSBuild.

**Deliverables:** Negotiable, but should substantially improve C/C++
build support.

**Mentors:** Michael Hutchinson, Atsushi Eno

Windows .NET 64-bit debugging
-----------------------------

**Complexity:** Hard

**Area:** C\#, Win32, Debugging

Add support for 64-bit app to the MS .NET debugger runtime on Windows.

**Deliverables:** Reliable debugging for the 64-bit MS .NET runtime .

**Mentors:** Michael Hutchinson

Debugger Visualizers
--------------------

**Complexity:** Easy

**Area:** C\#, Debugging

There is plenty of room to improve the debugging experience with
visualizer pop-ups that provide more useful ways to inspect common kinds
of data - for example, collection visualizers that allow searching for
items in the collection, XML/JSON visualizers that provide a structured,
searchable tree view of the document, and so-on. Your proposal should
include a list of visualizers that you propose to implement, and
describe why they are useful.

**Deliverables:** A set of useful debugger visualizers.

**Mentors:** Michael Hutchinson, Jeffrey Stedfast

Revamped Syntax Highlighting System
-----------------------------------

**Complexity:** Medium/Hard

**Area:** Parsers, Text Editor

The syntax highlighting in MonoDevelop is done by defining a grammar as
xml file to colorize tokens. Some highlightings are extended with hand
written code. The highlighting system can be made faster (maybe with an
on the fly compiler approach), more extensible (atm it's difficult to
write semantic highlightings) and more scaleable . You will first need
to understand how our highlighting files are defined and how the
semantic highlighting currently works. After that a new implementation
approach needs to be implemented. One of our current drawbacks are that
regular expressions could be integrated better - for example span
begin/end constructs aren't atm regular. In fact everything should be
based on regular expressions. Esp. important is to have a system that
allows to plug in semantic highlightings and highlightings should be
embeddable. (Semantic highlighting works inside of asp.net files for
example)

**Deliverables:** An extensible syntax highlighting system that reads
our xml files or a similar format. It should be scalable even for large
files (lazy analysis) and much faster than the current implementation
(speed tests included).

**Mentors:** Mike Krüger

Color Scheme Editor
-------------------

**Complexity:** Easy/Medium

**Area:** Text Editor

The current color style editor is hard to use and is missing some
features. It would be nice to have a color style editor that works like
<http://studiostyl.es/schemes/create>. Furthermore it would be nice to
have an editor mode where you can just adjust some colors and other
colors are chosen using an algorithm providing good contrasts. The
implementation should be done using xwt - a great cross platform
development library.

**Deliverables:** an awesome color scheme editor

**Mentors:** Mike Krüger

Xwt Forms Designer
------------------

**Complexity:** Medium

**Area:** Xwt

Xwt is a cross platform GUI toolkit. It works on Windows, Mac and Linux
using the native GUI widgets like SWT for Java does. The biggest
drawback at the moment is the lack of a working forms designer. The
forms designer should be implemented as a Xamarin Studio plugin allowing
designing Xwt dialogs and controls like the current gtk forms designer
does.

**Deliverables:** A Xwt forms designer

**Mentors:** Mike Krüger

Push-less X86 backend
---------------------

**Complexity:** Medium

**Area:** Runtime

The x86 backend uses push/pop instructions. This produced code that is
less efficient and harder to be dealt with internally.

**Deliverables:** A x86 backend that uses fixed size frames and mov
instead.

**Mentors:** Rodrigo Kumpera, Zoltan Varga

Contacting the Mono Team
========================

If you have questions or suggestions that you want to make in real-time
and talk to a member of the team, please join us on IRC on the server
"irc.gnome.org" in channel "\#monosoc", "\#monodev" or the "\#mono"
channel. Various mentors and students from past years are usually there
and can answer some quick questions about the program and about Mono.

The mailing lists are a very important communication channel, students
should use them to get more information and feedback about ideas and
proposals. Community engagement is essential for a successful summer of
code, so get involved!

For any questions you may have about the program itself and to talk to
the Mono GSoC admin, you can use <soc@xamarin.com>.

Mailing Lists
-------------

[<http://lists.ximian.com/mailman/listinfo/mono-devel-list>](http://lists.ximian.com/mailman/listinfo/mono-devel-list)
A mailing list dedicated to discussions about developing Mono itself,
such as development of the runtime, class libraries, and related Mono
projects.

[<http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list>](http://lists.ximian.com/mailman/listinfo/monodevelop-devel-list)
Discussion on the development/implementation of MonoDevelop.

A complete breakdown of all Mono mailing lists is available at [Mailing
Lists]({{site.url}}/Mailing_Lists "wikilink").

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
[Category:Mono Framework]({{site.url}}/Category:Mono Framework "wikilink")
[Category:Summer of Code]({{site.url}}/Category:Summer of Code "wikilink")

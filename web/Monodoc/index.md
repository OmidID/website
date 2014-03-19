---
Title: ./Monodoc
layout: default
---

Monodoc is a set of libraries and applications for viewing and editing
Mono class library documentation. Monodoc is part of the [Mono
Documentation Project]({{site.url}}/Documentation "wikilink").

Viewing The Documentation
=========================

The Gtk\# Documentation Browser
-------------------------------

The doc browser is part of the [mono-tools](mono-{{site.url}}/tools "wikilink")
package, avaliable from the [Downloads]({{site.url}}/Downloads "wikilink") page.

Once installed, you can launch it from the "Programing" section of the
Applications menu, as shown in the image below, or by typing *monodoc*
in a terminal window.

![](http://localhost:4000/files/Gnome menu-monodoc-1.png "http://localhost:4000/files/Gnome menu-monodoc-1.png")

The browser lets you navigate through different types of documentation
installed on your system. Usually, it shows the documentation of:

-   Core Framework API
-   Mono libraries
-   Novell libraries
-   C\# Language Specification
-   Compiler error reference

Depending on the libraries installed on your system it can show
additionally:

-   Gnome libraries
-   Mozilla library
-   Monkeyguide (Mono guide)

Of course, more documentation sources can be added from installed
libraries or from your own generated documentation as explained in
[Generating Documentation]({{site.url}}/Generating Documentation "wikilink"). Also,
from inside the browser, you can [
contribute]({{site.url}}/Monodoc_Contributing "wikilink") to the documentation of the
Mono project.

Online Documentation
--------------------

You can view the complete documentation library online (only API
documentation) at <http://www.go-mono.com/docs/>.

Mod (Command-Line Documentation Viewer)
---------------------------------------

To browse API documentation from a shell terminal, you can use the
\`mod' command. Use it to lookup types, or see the members of a type.
You get the same information as the Monodoc graphical application, but
displayed in a text-only web browser.

To get all the types in a namespace:

<bash> mod N:System mod N:Gtk </bash>

To see the members of a type, run mod like:

<bash> mod T:System.Collections.ArrayList </bash>

You can restrict the output to just members by adding `/M`:

<bash> mod T:System.Collections.ArrayList/M </bash>

You can also use C, P, F, and E for constructors, properties, fields,
and events.

To get one method, copy-and-paste the URL from the output in the above:
<bash> mod 'M:System.Collections.ArrayList.ToArray(System.Type)' </bash>

Creating Documentation, Contributing
====================================

-   For information on how to document your own class libraries using
    monodoc, see [Generating
    Documentation]({{site.url}}/Generating Documentation "wikilink").
-   If you would like to contribute to the mono class library
    documentation (and we would love it if you did!), see [Monodoc
    Contributing]({{site.url}}/Monodoc Contributing "wikilink").

My Documentation in Monodoc
===========================

See the [assembler]({{site.url}}/assembler "wikilink") page for a description how to
add your documentation to monodoc permanently.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
[Category:Mono Framework]({{site.url}}/Category:Mono Framework "wikilink")
<Category:Documentation>

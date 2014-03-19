---
Title: ./GtkGLAreaSharp:0.0.17
layout: default
---

This release substantially updates the example build system, using
Include.am files to organize library, target generation, dependencies,
etc.

This release follows closely on the release of
[Prebuild]({{site.url}}/Prebuild "wikilink")'s greatly updated [GNU
Autotools]({{site.url}}/GNU Autotools "wikilink") target and the subsequent
[Tao]({{site.url}}/Tao "wikilink") packages. v0.0.17 makes use of the .pc files
created by the new Tao package and will build only the library (and not
the examples) if Tao is not found on the build system.

The object selection example is now functioning correctly as well.

More details than you can shake a stick at reside in the
[ChangeLog](http://anonsvn.mono-project.com/source/trunk/gtkglarea-sharp/ChangeLog)
file.
---
Title: ./Release_Notes_Mono_2.10.9
layout: default
---

Mono 2.10.9 is a minor update to [Mono
2.10](Release Notes Mono 2.10{{site.url}}/ "wikilink"), [Mono
2.10.1](Release Notes Mono 2.10.1{{site.url}}/ "wikilink"), [Mono
2.10.2](Release Notes Mono 2.10.2{{site.url}}/ "wikilink"), [Mono
2.10.3](Release Notes Mono 2.10.3{{site.url}}/ "wikilink"),
[2.10.4](Release Notes Mono 2.10.4{{site.url}}/ "wikilink"),
[2.10.5](Release Notes Mono 2.10.5{{site.url}}/ "wikilink"),
[2.10.6](Release Notes Mono 2.10.6{{site.url}}/ "wikilink"), and
[2.10.7](Release Notes Mono 2.10.7{{site.url}}/ "wikilink").

Mono 2.10.9 on OSX contains an updated Gtk+ version with many fixes to
the UI stack which improve the usability of MonoDevelop and other Gtk+
apps.

Mono 2.10.9 is a Mac-only update.

MacOS Updates
=============

This release bundles the new version of Gtk+ 2 that has been fine tuned
for MacOS X and fixes hundreds of problems that have been reported by
users of MonoDevelop on Mac. In addition, it adds support for Lion's
Smooth Scrolling.

Changes
=======

-   Fix a libgdiplus issue that had forced linking against Apple's X11
    stack for text rendering.
-   Fix issue where a native crash causes MonoDevelop to hang and
    neither Force Quit nor kill -9 would terminate it (Xamarin \#2548).
-   Fix sgen failing with Assertion at sgen-gc.c:2506, condition
    \`mono\_sgen\_need\_bridge\_processing ()' not met.

See the [Mono 2.10.7 release
notes](Release Notes Mono 2.10.7{{site.url}}/ "wikilink") for a full list of Mono
changes since the last stable release.

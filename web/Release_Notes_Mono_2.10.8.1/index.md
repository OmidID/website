---
Title: ./Release_Notes_Mono_2.10.8.1
layout: default
---

Beta
====

Mono is a portable and open source implementation of the .NET framework
for Unix, Windows, MacOS and other operating systems.

Mono 2.10.8.1 is a beta release and update to the Mono 2.10.7 Beta,
which was used mostly as a vehicle to test the upcoming Gtk+ stack on
MacOS X. Mono 2.10.8.1 fixes stability and packaging issues with 2.10.7
and was released as a beta for MacOS X on December 19, 2011.

If you want a stable release, use Mono [Release Notes Mono
2.10.8](Release Notes Mono 2.10.8{{site.url}}/ "wikilink").

Mono 2.10.8.1 is a minor update to [Mono
2.10](Release Notes Mono 2.10{{site.url}}/ "wikilink"), [Mono
2.10.1](Release Notes Mono 2.10.1{{site.url}}/ "wikilink"), [Mono
2.10.2](Release Notes Mono 2.10.2{{site.url}}/ "wikilink"), [Mono
2.10.3](Release Notes Mono 2.10.3{{site.url}}/ "wikilink"),
[2.10.4](Release Notes Mono 2.10.4{{site.url}}/ "wikilink"),
[2.10.5](Release Notes Mono 2.10.5{{site.url}}/ "wikilink"),
[2.10.6](Release Notes Mono 2.10.6{{site.url}}/ "wikilink"), and
[2.10.7](Release Notes Mono 2.10.7{{site.url}}/ "wikilink").

Differences Between Stable and Beta
===================================

The difference between the Stable release (2.10.8) and the Beta
(2.10.8.1) is that the Beta ships with an updated Gtk+ stack that has
been developed with Lanedo to bring many bug fixes to Gtk+ on MacOS X.

The 2.10.8.1 release is a MacOS-only release.

MacOS Updates
=============

This release bundles the new version of Gtk+ 2 that has been fine tuned
for MacOS X and fixes hundreds of problems that have been reported by
users of MonoDevelop on Mac. In addition, it adds support for Lion's
Smooth Scrolling.

Changes
=======

-   Revert Pango to 1.28.4 to resolve a crash when opening the
    MonoDevelop about box on Snow Leopard.
-   Fix a libgdiplus issue that had forced linking against Apple's X11
    stack for text rendering.
-   Fix issue where a native crash causes MonoDevelop to hang and
    neither Force Quit nor kill -9 would terminate it (Xamarin \#2548).
-   Fix sgen failing with Assertion at sgen-gc.c:2506, condition
    \`mono\_sgen\_need\_bridge\_processing ()' not met.

See the [Mono 2.10.7 release
notes](Release Notes Mono 2.10.7{{site.url}}/ "wikilink") for a full list of Mono
changes since the last stable release.

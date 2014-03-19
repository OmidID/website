---
Title: ./BuildSystem
layout: default
---

A system to automate some of our building, packaging, and testing is
being worked on by Ben and Wade. This is in progress documentation of
what the system contains.

The first part of the system is the one which builds rpms. It is a set
of scripts which knows how to ssh into chroot jails, checkout from svn,
execute make dist, and then build rpms. There is documenation at
[BuildSystem/PackagingScripts](BuildSystem/{{site.url}}/PackagingScripts "wikilink").

The output from the first system can be rsync'd to go-mono.com

The second part is a buildbot-like system that will do automated
building and testing. The system is being written in python, and is
designed by Wade. Docs are at
[BuildSystem/MonoBuild](BuildSystem/{{site.url}}/MonoBuild "wikilink")

Packagers and developers may find it helpful to look at the packaging
scripts and sources for
[ThirdPartyPackages]({{site.url}}/ThirdPartyPackages "wikilink").

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

---
Title: ./MonoTouch_Installation
layout: default
---

[MonoTouch]({{site.url}}/MonoTouch "wikilink") is an SDK for developing applications
for the iPhone using Mono. In addition to the Unix SDK, we are also
releasing an optional alpha release of MonoDevelop 2.2 that contains
support for iPhone application development.

Our [MonoTouch\_Beta]({{site.url}}/MonoTouch_Beta "wikilink") page contains other
useful information for developers getting started with MonoTouch on the
iPhone Beta program, and instructions for signing up for the beta
program.

**<span style="color:#ff0000">The SDK can only be downloaded if you have
received a beta invitation. Invitations are going out in waves to people
who have filled out the
[<http://spreadsheets.google.com/viewform?hl=en&formkey=dHRXeFI5b1NjUWdRRkpiSmxkanh6T1E6MA>..
beta signup form].</span>**

Basic Requirements
==================

To try out MonoTouch, you will need to have Apple's iPhone SDK 3.0 or
higher, available from [Apple's iPhone Dev
Center](http://developer.apple.com/iphone/).

With the iPhone SDK you will be able to write applications and test them
on the iPhone simulator. Additionally, if you want to deploy the
resulting applications on the device for AppStore, Ad-Hoc or Enterprise
distribution you will need to be part of the [iPhone developer
program](http://developer.apple.com/iphone/program/).

Make sure that you can launch the iPhone simulator before continuing to
the next step.

Mono Installation
=================

Download and install the latest version of Mono 2.4 for OSX from [the
Mono downloads page](http://www.go-mono.com/mono-downloads).

MonoTouch SDK Installation
==========================

'''Do not bother performing this step until you have Mono 2.4 from the
previous step done. If you do not install Mono 2.4, your install will
not work. '''

Download and install the [MonoTouch
DMG](http://www.go-mono.com/monotouch-download/monotouch-0.9.10-20090913-0.pkg)
file. This will give you access to the command line tools to develop
applications with MonoTouch. The
[tutorials]({{site.url}}/MonoTouch_Tutorials "wikilink") on this site will guide you
through the steps of getting your sample applications running from the
command line.

MonoDevelop Installation
========================

To get you up and running in the shortest amount of time, you will want
to install MonoDevelop on your system. Keep in mind that MonoDevelop for
OSX is a preview of the upcoming MonoDevelop 2.2 and has a few rendering
glitches.

To get MonoDevelop 2.2 up and running, you need:

-   The MonoTouch-enabled version of [MonoDevelop 2.2 Alpha for
    OSX](http://go-mono.com/archive/MonoDevelop-MonoTouch-Preview-20090904-0.dmg).

Downloads
=========

-   [MonoTouch
    Installer](http://www.go-mono.com/monotouch-download/monotouch-0.9.10-20090913-0.pkg)
-   [MonoTouch-enabled MonoDevelop 2.2 Alpha
    Installer](http://go-mono.com/archive/MonoDevelop-MonoTouch-Preview-20090904-0.dmg).

[Release History]({{site.url}}/MonoTouch_ReleaseNotes "wikilink")

Documentation
=============

In addition to the tutorials on this site, our web site at
[www.go-mono.com/docs](http://www.go-mono.com/docs) contains the API
documentation for the libraries shipped with MonoTouch. Look for the
MonoTouch namespace.

The API design for the CIL/Objective-C binding is covered in our
[MonoTouch\_API]({{site.url}}/MonoTouch_API "wikilink") document.

Samples
=======

---
Title: ./InfrastructureProjects
layout: default
---

These are some infrastructure projects that we should look at
implementing

Status Pages
============

We currently track the status of Mono vs various APIs in the [class
status](http://mono.ximian.com/class-status/) page, we should augment
this to cover:

-   Olive class libraries (they are generated, but are still inside
    Novell's firewall. We be posted publicly soon)
-   Silverlight APIs (not ready to do yet).

Packaging and Q&A
=================

We should package libraries, components and applications so we can more
easily QA the Mono runtime, verify that there are no regressions, reduce
the duplicated effort in the team to test software, provide software in
an easy way for people to demo and try out and to function as a
reference of how applications are ported from Windows to Linux using
Mono.

We should use the openSUSE build system, as this would allow us to
support multiple platforms in the future as well. (We may want to
establish a packaging naming standard, similar to how the
perl/python/etc as well as debian cil packages are named).

Starting with one or two platforms for now is fine, we do not need to
build on every platform, I rather have us jump-start the effort and get
a lot of software only on openSUSE and later add more platforms (SLED,
RHEL, etc).

In addition to the Gtk\#-based applications that we have (and I believe
we package most of this), I can think of the following classes of
applications that we should package:

### Windows and MacOS packaging

We need to sort out the distribution for Windows.

Distribution of Gtk+ and Gtk\# for MacOS X.

Plans on how to [split the MacOS installer]({{site.url}}/MacOSPackaging "wikilink")
into Runtime and SDK

### Ongoing Maintenance of third party components

We currently ship a few packages, and we should make the re-packaging a
standard part of our process, subscribing to the various groups that we
need to:

Our own Technologies:

-   We need to ship the [HeapShot]({{site.url}}/HeapShot "wikilink") profiler.

WinForms Apps:

-   [KeePass Password Safe](http://keepass.info/)
-   [NClass UML Editor](http://nclass.sourceforge.net/index.html)

Libraries:

-   [DB\_Linq](http://code.google.com/p/dblinq2007/) LINQ support for
    various databases.
-   [Tao Framework](http://sourceforge.net/projects/taoframework/)
    (Bindings to OpenGL and the other 3D libraries)
-   [NDesk's Dbus Sharp](http://www.ndesk.org/DBusSharp)
-   gnome-keyring-sharp
-   Mono Fuse
-   MySQL connector (as they seem to not be packaging it anymore)
-   [DotNetOpenID library](http://code.google.com/p/dotnetopenid/)
-   [Math.NET library](http://mathnet.opensourcedotnet.info)

Web Libraries:

-   [Gaia Widgets](http://ajaxwidgets.com/) for ASP.NET now that they
    fully support Mono.
-   [ExtJsExtenderControl](http://www.codeplex.com/ExtJsExtenderControl)
-   [ASP.NET Ajax Control
    toolkit](http://www.asp.net/ajax/ajaxcontroltoolkit/samples/): This
    is an open source library from Microsoft that we should be bundling.
-   [ProMesh](http://www.codeplex.com/ProMesh)

Applications:

-   [Winforms Samples](http://www.mono-project.com/Winforms_Samples)
-   Nant
-   **done:** nunit
-   IKVM (0.34 is the latest, SLED ships 0.28)
-   **done:** opentf (aka tf4mono)
-   [Desktop Flickr Organizer](http://code.google.com/p/dfo/)
-   Gnome-Do Plugins
-   [Galaxium Messenger](http://code.google.com/p/galaxium/)

Web Applications:

-   **done:** ASP.NET starter kits
-   Google Data Libraries.
-   **done:** mojoPortal
-   [BlogEngine.NET](http://www.dotnetblogengine.net/) a blog engine
    that supports Mono out of the box.

Desktop Applications:

-   [Paint.Net for Mono](http://code.google.com/p/paint-mono/) (the port
    is incomplete)

Compilers:

-   Boo (wade packages this already)
-   IronPython Community Edition (wade packages this already)

Extensions:

-   [Gimp\#](http://gimp-sharp.cvs.sourceforge.net/)

Tools:

-   [Smokey](https://home.comcast.net/~jesse98/public/Smokey/)

Some other suggestions that some people mentioned:

-   NCover
-   NProf
-   log4net
-   NHibernate
-   Phalanger
-   CruiseControl.NET

In addition to plainly shipping these, we should add pkg-config files
where we need to, and fix the build and installation processes where we
have to. Ideally we should send those fixes upstream.

Open to discussion: should we upgrade our NUnit?

### Including in the Mono Group other Packages

We now have a collection of ASP.NET applications packaged, we should get
these on the openSUSE build system. Contact Marek for the source rpms.

### Mono Group on openSUSE system

We will need to add other folks from the team (Marek, Miguel) to the
group, so we can add new packages here.

### Windows-Forms sample applications.

We currently have done some ports of some apps that we found a long time
ago in the CodeProject, these live in the

`svn+ssh://YOURLOGIN@mono-cvs.ximian.com/extras/trunk/wf-apps`

module. We typically kept track of the "original" and the modified
version. We can use this to create a diff, the only trick here will be
to track the original zip or tarfile.

### Binary applications.

There are some packages like Reflector and a handful of games that only
come as binaries. Reflector is kind of useless as it insists on getting
updates every once in a while, and the updating feature does not work on
Linux.

### Desktop Applications Considerations

Both the wf-apps and the binary-only winforms apps work, but are not
available in an easy-to-use way for the majority of users.

We should:

-   Deploy these following our Application Deployment Guidelines:
    \$prefix/lib/APP/ contains exe and dlls, \$prefix/bin/APP is a shell
    script that calls Mono with the app from \$prefix/lib/APP/APP.exe
-   Distribute .desktop files, so the app shows in the proper menus.
-   Some apps that we have hang (or used to hang, we should make sure
    that we do not distribute those, or that we fix the bugs in them).

### ASP.NET based applications

Marek has now packaged a handful of ASP.NET applications, talk to Marek
about getting these on openSUSE Build system.

There are packages for web applications like MediaWiki, we could do this
for the various ASP.NET opensource applications out there, and even for
the various starter kits on <http://www.asp.net> (those that have a
suitable license)

We should look into policies in terms of activating the app after
installation (is it activated or not?), but in addition, lets:

-   Ensure that we ship with AppArmor profiles, so the applications run
    **and** are secure even in the presence of application holes.

### Third-Party Components and Libraries

Up until now we have limited our packaging efforts of third party stuff
to things that we absolutely need, but we have not really packaged third
party libraries or components that would benefit Mono users.

The /Software and /Libraries page contain a lot of interesting stuff
that we should probably test, package and distribute.

For example, the Google Data libraries are over there, the Tao
libraries, ZeroC's ICE, etc.

### Increase our porting efforts

Once we are done with the packaging of the stuff that we have, we should
revisit what is new on the CodeProject, on Google and other sites and
see what is worth adding to our QA queue.

### Provide an Available Mono Software Catalog

The build service does not provide any user friendly way to browse
packages, you have to know what you are looking for and use the search
functionality. We need a catalog page that links to each package's
1-Click Install page. Also, make sure the link is to an OBS page that
does not require a OBS account. This doesn't have to be fancy, just a
list of links on a wiki page would be a great start.

Popular Libraries and Components
--------------------------------

Some extra libraries to package:

-   Tao libraries.
-   Google Data Libraries.

Hosting Services
================

Maintainer: Thomas Wiest.

Our new machines outside of the firewall will be the host to the
following services, each on a separated host:

-   Source code
-   Bugzilla (Completed)
-   ASP.NET Application Server
-   Windows Host that runs our test suite against MS .Net
-   Buildbot host

Main Source Code Instance
-------------------------

One instance will only host the source files and packages, and will only
offer those through http or ftp, the idea here is to mitigate risks in
case of a break-in. We should run AppArmor on this instance to further
limit what could be done in case of a break-in.

Secondary Source Code Instance
------------------------------

This should be a separate host to offer source code that third-party
projects want to upload and release. We would give contributors a way of
uploading and maintaining their packages on this system.

Windows Host that runs our test suite against MS .Net
-----------------------------------------------------

This should run our test suites against MS .Net 1.1 and 2.0 and report
to the monobuild web page the results.

Bugzilla Host
-------------

We have migrated our existing <http://bugzilla.ximian.com> installation
to <http://bugzilla.novell.com>.

ASP.NET Application Server
--------------------------

Here we will be able to run our ASP.NET applications, like the ones that
Marek wants to write to organize our software collections and maybe run
some instances of popular ASP.NET software.

Buildbot Host
-------------

This will be the instance where we run Wade's continuous build system.

As for the disk space on each instance, I do not think that we need much
space on the ASP.NET instance for now, and Bugzilla we can probably
measure as you attempt the migration.

Documentation
=============

Maintainer: none right now.

Tasks
-----

There are various documentation related projects that we need to do:

-   Incorporate the new API updates from the ECMA 335 specification into
    our old import, so we can get all the docs for all the new generics
    and reflection APIs introduced.
-   Ensure that Monodoc renders all new APIs with the "Available since
    2.0" labels where this matters.
-   Run Monodoc's update feature for the 2.0 profiles that are completed
    (System.XML, ASP.NET).
-   Generate Monodoc stubs for Windows.Forms 1.1 and 2.0

Ongoing Maintenance
-------------------

When the hosts move, move the /docs server to the ASP.NET server, and
start the process of maintaining docs from RPMs instead of having
documents manually uploaded in an as-needed/as-remembered basis.

---
Title: ./Guidelines:Application_Deployment
layout: default
---

These guidelines are designed to help you plan the layout for your
application or libraries and will ensure that your software is shipped
in a form that is consistent with other Mono-based software projects and
components.

This document also discusses how to distribute libraries whose APIs are
not frozen: how to distribute and consume them.

Application Layout
==================

This section covers some guidelines on application deployment. They are
not hard rules, but useful conventions that have grown out of various
Mono applications.

Assumptions
-----------

You will be distributing your software in binary or source code form to
others, and the software will be installed in a specific prefix or a
user-defined prefix. Applications typically scatter a number of files
relative to this prefix. For example, if the prefix is /usr, packages
tend to store their programs in /usr/bin, their libraries in /usr/lib,
their data files in /usr/etc and so on.

The prefix is sometimes changed, for example some systems use
/usr/local, or /opt/SOMETHING as a prefix for an application. For the
rest of this discussion we will refer to the prefix path with the word
PREFIX.

We will refer to your application as "APPLICATION" in the following
discussion.

Background
----------

Mono applications have at least one executable (they typically end with
the extension .exe) and possibly other components like:

-   managed libraries (\*.dll)
-   images, bitmaps (\*.png, \*.jpg, \*.xpm, \*.gif, etc)
-   some data files (\*.xml)
-   asp.net files (\*.aspx, \*.ashx, etc.)
-   html web pages (\*.html)

Typically all these files have been scattered in multiple locations
relative to the prefix. Although this has been historically encouraged
on Unix systems (in particular for system tools) this recommendation is
problematic for systems where the software must be easily relocated.

Some developers can embed some of these data files and resources inside
their executable or library by using the -resource: command line option
of the compiler.

Layout Recommendation
---------------------

PREFIX/bin

-   Should contain a script to call your application, typically it
    contains two lines.

PREFIX/lib/APPLICATION

-   A directory that holds your main executable, libraries and any extra
    data files.

The script in PREFIX/bin typically contains the following two lines:

<bash>

` #!/bin/sh`\
` exec /usr/bin/mono PREFIX/lib/APPLICATION/app.exe "$@"`

</bash>

This has a number of advantages:

-   You do not polute the system bin directory with .exe files (which
    can not be executed directly anyways)
-   Your application is neatly organized in a single directory.
-   It makes it simpler to write relocatable applications.
-   To relocate you just update the script at install time.

Although Linux supports a mechanism to load .NET programs directly, the
problem is that this solution is not portable to other Unix systems
(BSD, Solaris, MacOS).

Also, by doing this you can ship any third-party libraries that you need
and put those into PREFIX/lib/APPLICATION as Mono will automatically
lookup for needed libraries in the same directory as the directory
containing the main executable.

This last point is very important: it allows developers to use a
snapshot of a library that they have QAed against, or using a specific
version that they need without imposing these requirements on the system
or in the Mono installation.

If your application also contains shared libraries that you are going to
P/Invoke from DllImport, you might want to add to the above script the
following two lines:

<bash>

` export DYLD_LIBRARY_PATH=PREFIX/lib/APPLICATION:$DYLD_LIBRARY_PATH`\
` export LD_LIBRARY_PATH=PREFIX/lib/APPLICATION:$LD_LIBRARY_PATH`

</bash>

This will ensure that your shared libraries are loaded from your
installation directory and that there is no need to pollute the
PREFIX/lib directory.

Relocation
----------

As you might have noticed the only place with the above setup that
hardcodes the PREFIX to the application in the source is the script.
None of the libraries or executables located in PREFIX/lib/APPLICATION
have to hardcode the values.

To make your software relocatable, the two-line script can be generated
by your installation setup at installation time to point to the location
where your program was installed without making any changes to your
program.

Your C\# should reference its data files using the following code
snippet:

<div class="csharp">
    <pre><code>
        string base_directory = System.AppDomain.CurrentDomain.BaseDirectory;
    </code></pre>

</div>
Then you can do things like:

<div class="csharp">
    <pre><code>
       string splash_file = Path.Combine (base_directory, "splash.jpg");
    </code></pre>

</div>
When to use the GAC
-------------------

The [Global Assembly Cache]({{site.url}}/Assemblies and the GAC "wikilink") or "GAC"
for short is a location where assemblies can be installed for
system-wide use. To install assemblies in the GAC it is necessary to
give them a version and to sign them to create a "strong name", a name
that can not be faked.

This requirement is designed to ensure that the application is linked on
the developer machine against a library that will be the same one
available on the user's system, for example to avoid two libraries
having the same name and version still providing different features
(consider two companies creating a "Chat" library: one for using the IRC
protocol and one for using the AOL protocol: they provide different
APIs, but they have the same weak name; Strong naming avoids this
scenario).

But developers that install libraries into the GAC must be aware that
putting something on the GAC is a commitment to API stability. It is a
commitment that should not be taken lightly. If you are to change the
API in a backwards-incompatible way, you should change the version of
the library to ensure that old applications continue to work. When the
library changes its version, then two copies of the library must be
distributed: one for the old applications that might depend on the old
API and the new version of the library.

If your project is not ready to commit to API compatibility and the
extra work associated with it, its best to keep these assemblies out of
the GAC and encourage end users to distribute a particular snapshot
alongside their applications.

This is where the PREFIX/lib/APPLICATION directory comes into play. This
for example would allow developers to deploy applications that use for
example an under-development binding for OpenGL or the iPod for example
without forcing the developers of the bindings to stabilize their API
and maintain multiple versions of the library to allow old applications
to run.

The subject of installing assemblies into the GAC is handled in more
detail in the article [Assemblies and the
GAC]({{site.url}}/Assemblies and the GAC "wikilink").

Auto-tools
==========

Autoconf and automake are two popular tools used in Unix to cope with
the configuration of software in a particular platform and creating
standard makefiles. This section covers how to setup a Mono project to
use the autoconf and automake tools.

You can browse the source code online for a sample "skeleton"
application, the sample shows:

-   How to detect the Mono C\# compiler.
-   How to test for the presence of a library (Gtk\# in this case).
-   How to build C\# code using autoconf/automake.
-   How to embed a sample resource file into the executable.
-   How the executables are stored in the PREFIX/lib/APPNAME
-   How a script that is installed in bin is installed
-   How to embed the version from your configure.in program into the
    AssemblyInfo.cs file that is compiled.

The source code is available from our SVN repository as the module
"monoskel", you can browse the source code
[here](http://anonsvn.mono-project.com/viewvc/trunk/monoskel). You may
also want to explore the
"[monoskel-lib](http://anonsvn.mono-project.com/viewvc/trunk/monoskel-lib)"
module, which is an example of deploying an [unstable
library](Guidelines:Application_Deployment#{{site.url}}/Libraries_with_Unstable_APIs "wikilink")
(**Note**: If you are planning to create and deploy a GAPI wrapped
library, see [this section](GAPI#{{site.url}}/Putting_it_all_together "wikilink") of
the [GAPI]({{site.url}}/GAPI "wikilink") page for an automake example that is better
suited to this purpose). monoskell will need monoskel-lib installed in
order to configure and build properly. A tarball ready for distribution
can be created by running:

<bash>

` $ ./autogen.sh`

</bash>

On a checked out copy of the source.

The tarball can be found here:
[<http://www.go-mono.com/archive/monoskel-0.1.tar.gz>](http://www.go-mono.com/archive/monoskel-0.1.tar.gz)

The contents of the tarball are:

    monoskel-0.1/
    monoskel-0.1/src/
    monoskel-0.1/src/AssemblyInfo.cs.in
    monoskel-0.1/src/Makefile.am
    monoskel-0.1/src/Makefile.in
    monoskel-0.1/src/main.cs
    monoskel-0.1/README
    monoskel-0.1/configure.in
    monoskel-0.1/aclocal.m4
    monoskel-0.1/Makefile.am
    monoskel-0.1/Makefile.in
    monoskel-0.1/configure
    monoskel-0.1/AUTHORS
    monoskel-0.1/COPYING
    monoskel-0.1/ChangeLog
    monoskel-0.1/INSTALL
    monoskel-0.1/NEWS
    monoskel-0.1/config.guess
    monoskel-0.1/config.sub
    monoskel-0.1/install-sh
    monoskel-0.1/missing
    monoskel-0.1/script.in
    monoskel-0.1/man/
    monoskel-0.1/man/Makefile.am
    monoskel-0.1/man/Makefile.in
    monoskel-0.1/man/monoskel.1
    monoskel-0.1/resources/
    monoskel-0.1/resources/Makefile.am
    monoskel-0.1/resources/Makefile.in
    monoskel-0.1/resources/dummy.txt

The following files play important roles:

### autogen.sh

This file is a shell script that is used to create and run the configure
script, which will generate all the output files we need. Don't run
anything yet.

### Makefile.am

In this file, we tell automake which subdirectories to process. They
will be processed in the same order as they appear in the SUBDIRS
variable.

### configure.in

This is the main file that autoconf looks for.

The first line in this file (AC\_INIT) initializes autoconf. The
argument in parenthesis must be an existing file in the project.

In AM\_INIT\_AUTOMAKE, we initialize automake, providing the project
name and version. AM\_MAINTAINER\_MODE will allow us to run configure
with the --enable-maintainer-mode option. This is useful while you're
modifying any Makefile.am or configure.in, as it will rebuild every
Makefile without the need of running autogen.sh.

After that, we check for pkg-config and a C\# compiler. If they are not
available, configure will error out. We also provide the variables
PKG\_CONFIG and INSTALL containing the paths of the respective programs,
which we will use later.

Then we use the PKG\_CHECK\_MODULES macro to check for Gtk\# (at least
version 0.18). We get in GTKSHARP\_LIBS the command line options that we
need to pass to the C\# compiler to use Gtk\#.

Similarly PKG\_CHECK\_MODULES is used to ensure that superstring-sharp
is installed (check out and install the monoskel-lib module from Mono
SVN), and we tell configure to substitute the library link option for
the compiler to link against superstring-sharp.

Finally, we tell configure to substitute the variable MCS with the path
to the executable we found before and provide the list of files that
will be generated.

### man/Makefile.am

Here we use man\_MANS to tell automake to install the manual page. We
also put that manual page in EXTRA\_DIST so that the file is included in
source tarballs

### resources/Makefile.am

This directory contains resources that are embedded into the executable.

This dummy.txt file here will not be installed, but it has to be
included in the EXTRA\_DIST target so that its distributed with the
resulting tarball.

### src/AssemblyInfo.cs.in

This file is a template in which configure will perform substitutions.
We use it to get the VERSION variable replaced by the version we
provided in AM\_INIT\_AUTOMAKE, which will be 0.0.1 for the first time.
src/Makefile.am

### src/Makefile.am

And last, but not least, here's the file that tells how to build the
executable and where to install it.

monoskeldir tells that we will install 'monoskel.exe' in the package
directory (pkglibdir).

monoskel\_SCRIPTS lists all the executables that will be built (in this
case, only one: monoskel.exe)

In EXTRA\_DIST we put the same files as we have initially, i.e., main.cs
and AssemblyInfo.cs.in. CLEANFILES tells the files that will be removed
when you run 'make clean'.

And then we setup the variables that will generate the command line to
run when compiling the source files.

Lastly, since we wish to link against and use an [unstable
library](Guidelines:Application_Deployment#{{site.url}}/Libraries_with_Unstable_APIs "wikilink")
(one that is not installed in the GAC), we need to copy the unstable
assembly that we link against (SUPERSTRINGSHARP\_LIBS) to the directory
where our program will be installed. This is done by asking pkg-config
for the Libraries variable, which should be set to a space-delimited
string of assemblies to copy. The install-data-hook rule contains the
short script to do this, and uses the aforementioned INSTALL and
PKG\_CONFIG variables set in configure.in.

Now it's time to run some commands and enjoy. The first one you need to
run is:

./autogen.sh --prefix=/usr/local --enable-maintainer-mode

Then try make, make clean, make install, make uninstall, make dist, make
distcheck.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:Articles>

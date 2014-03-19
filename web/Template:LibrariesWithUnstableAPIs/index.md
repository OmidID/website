---
Title: ./Template:LibrariesWithUnstableAPIs
layout: default
---

Libraries with Unstable APIs
============================

Sometimes developers might want to distribute a library to other
developers but they might not have a library that is API stable or has
not matured enough over time to guarantee the backwards-compatibility of
their libraries or they are not willing to maintain multiple packages of
the various versions for users.

This is a very common scenario and most libraries will go through this
phase before they are considered for installation on the GAC.

The problem that arises is how to allow third party developers to
consume this library with minimal effort.

To solve this problem, we recommend that:

-   The library developer ships a properly configured pkg-config file.
-   The library consumers include an "update-libraries" target on their
    Makefile that will import the latest version of a library from a
    system directory into their application source code distribution.
-   The library consumers ship this library as part of their package.
-   The consumer follow the [Guidelines for Application
    Deployment]({{site.url}}/Guidelines:Application_Deployment "wikilink")

Here is how this works, the library developer installs a pkg-config file
like this:

<bash> \$ cat Thing.pc prefix=/usr assemblies\_dir=\${prefix}/lib/thing
Libraries=\${assemblies\_dir}/Thing.dll
\${assemblies\_dir}/ThingCore.dll

Name: Thing Description: The Thing Library Version: 0.5 Libs:
-r:Thing.dll -r:ThingCore.dll

</bash>

The important parts are "Libraries" a new variable that lists the full
path to all of the assemblies that make up the "Thing" package, and the
"Libs" line.

The "Libraries" line is used by the consumer like this, as part of their
"update-libraries" makefile target:

<bash> update-libraries:

``        cp `pkg-config --variable=Libraries Thing` . ``\
`       pkg-config --libs Thing > thing.flags`

</bash>

The Libs line is used like this in your Makefile:

<bash> Demo.exe: Demo.cs thing.flags

``       mcs -out:$@ Demo.cs `cat thing.flags` ``

</bash>

The libraries will be copied from the system installation directory into
your application directory, and the --libs line will link to the local
libraries, not libraries installed into the GAC.

This means that developers that consume unstable API libraries do not
have to worry about their schedule being the same as the schedule for
API stability on the libraries they consume as they will always have a
private copy at development time and at runtime, and they choose when
they upgrade to a new version of the library.

If the developer had been using the GAC for an unstable library, he
would force the end-user deploying his application to always track the
dependency of the latest library his application is consuming, risking
missing packages for versions that are no longer distributed for
example.

Note: a production-ready, detailed example of this can be found in the
[Autotools](Guidelines:Application_Deployment#Auto-{{site.url}}/tools "wikilink")
section, and can be seen by checking out and exploring the source code
in the monoskel and monoskel-lib modules from Mono SVN.

Comparing this to other models
------------------------------

### How is this better than using the GAC?

This model requires a minimal amount of work on various parts.

The library developer benefits in these ways:

-   It releases the library developer from the requirement to keep the
    API backwards compatible.
-   The library developer does not have to ship old and new versions of
    his library.
-   The library developer can update, change, refactor his code with
    freedom without worrying about breaking third party applications.

The distribution packager:

-   The packager does not have to solve naming conflicts, parallel
    installation and multiple versions shipping on the same OS.

The library consumer:

-   The library consumer does not have to add requirements for a
    specific version of a library.
-   The library consumer does not have to add checks for a specific
    version of a library.
-   The library consumer decides when to upgrade the library at his own
    pace.
-   The library consumer can properly test and QA his product with the
    library without having to retest with different versions.

The end user:

-   Does not have to hunt down multiple versions of the library.
-   Applications that consume under-development libraries will not break
    when he upgrades his system.
-   He can upgrade software at his own pace without being forced to
    upgrade all software at once that depends on an unstable library.

This puts the burden of fetching and distributing the correct library on
the hands of the software developer consuming the library, the advantage
is that there are no external requirements and the dependencies for
deployment are minimized.

### How is this better than the "egg" model?

The "egg" model is a model used in Gnome, where a source code repository
of useful routines is kept. The routines and libraries live in this
"egg" module until they graduate and can live in an API stable library.
Developers copy/paste this code from "egg" into their applications and
distribute the result.

The problem is that developers must integrate the configuration system
and bring the source code into their projects to effectively use the
routines. They also must do their own source code importing which is
more complex than just copying the binary library.

Small Libraries
===============

Small libraries that can be made available as source code and that
application developers are expected to integrate into their applications
should ship a pkg-config file that contains the line:

`Sources: File1.cs File.cs`

And developers would copy those files in their project makefiles, like
this:

<div class="csharp">
    <pre><code>
    File1.cs File2.cs: 
           cp `pkg-config --variable=Sources package` .
    </code></pre>

</div>
And distribute the results.

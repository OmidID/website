---
Title: ./Mono:Versioning
layout: default
---

Mono's version numbering policy follows the Gnome and the Linux Kernel
versioning policies. Mono *does not* follow or mimic .NET versioning in
any way.

See also:
<http://lists.ximian.com/archives/public/mono-list/2005-March/026427.html>

Mono's Version Policy Explained
-------------------------------

For an X.Y.Z tuple:

-   *X* is the major version mumber
-   *Y* is the minor version number
-   *Z* is a revision number

The major version number is used to indicate which ABI/API version Mono
uses. When it changes, there is *no gaurantee* that existing code will
continue to work (though the utmost effort will be made to maintain
compatibility). The major version changes infrequently.

The Minor version number consists of two sets: even numbers (stable
releases) and odd numbers (development releases). The only improvements
that stable releases receive are bug fixes; all new feature work is done
in development releases. Features *may* be backported from a development
release to a stable release, if appropriate. Stable releases are API and
ABI stable, and can be expected to have minimal changes.

Development releases *may* break ABI/API compatibility, especially if
the stable release they lead up to will change the Major version number.
In particular, development releases are likely to add new API, and the
use of new API can change between development releases. When a
development release is converted into a stable release, we will maintain
the API/ABI, and the new stable release should be fully compatible with
the previous stable series having the same major number.

Revision numbers signify the release of a Major/Minor pair. Within a
stable series, ABI/API compatibility should not be broken when the
revision changes.

### Examples

Mono 1.0.6 is the 7th stable release of the 1.0 series (version 1.0.0
... 1.0.6 is 7 releases).

Mono 1.1.6 is the 7th development release of the 1.1 development series.
When finished, it will result in the Mono 1.2 stable series. Mono 1.1.x
is the current development tree. Mono 1.2 will be backward compatible
with Mono 1.0 (old apps should continue to run), but will not be forward
compatible with 1.0 (apps using 1.2-specific functionality won't work
under 1.0).

After Mono 1.2 is released, a Mono 1.3 development branch will be
started. The 1.3.x series will lead up to the future Mono 2.0 release.

.NET Versioning
---------------

Microsoft .NET's version policy is similar to Mono's, in that a major
version number change indicates an API/ABI break. That's where the
simularities stop. .NET does not have a stable/development split; .NET
1.0 and 1.1 were both stable releases.

Furthermore, there is no mapping between Mono's version numbers and
.NET's version numbers. Mono 1.0 implemented *parts* of the .NET 1.0/1.1
API; in particular, it lacked System.Windows.Forms support. Mono 1.1
(the current *development* branch) also implements parts of the .NET
1.0/1.1 API; in particular, it will support System.Windows.Forms. Mono
1.1 also implements parts of the .NET 2.0 API. Other parts of the .NET
API are not implemented at all, such as System.EnterpriseServices.

Framework Versioning
--------------------

For compatibility reasons, Mono's
[System.Environment.Version](http:/monodoc/P:System.Environment.Version)
property returns the version of the .NET profile that Mono targets,
*not* the version of Mono that is being used. This should be the same
version number that .NET would return. As such, it will return 2.0.X.Y
when running under the 2.0 profile, even though it's running under Mono
1.1. :-)

Application Versioning
----------------------

\`mono --version\` and \`mcs --version\` return the version of the Mono
distribution.

Assembly References
-------------------

#### If I use mcs to compile a simple program and then use mono to run it, which version of the assemblies will it use (e.g. which System.Windows.Forms.dll) ?

It will use the version that is sym-linked in
<i>preflix</i>/lib/mono/1.0/System.Windows.Forms.dll, which will be the
1.0 version of System.Windows.Forms.dll.

If you used gmcs instead, you'd get the 2.0 version of
System.Windows.Forms.dll, since gmcs targets the 2.0 profile.

SVN Installation
----------------

#### If I use svn update to get the latest code and then run make and make install in the mono directory how does it decide which version it is making and where to place the assembly?

Mono will <b>always</b> place a copy into the
\$prefix/lib/mono/gac/ASSEMBLY/1.0.5000... directory. So you'll
overwrite the previous version of System.dll et. al.

If you configured your mono checkout with --with-preview=yes, make
install will <b>also</b> place a copy into
\$prefix/lib/mono/gac/ASSEMBLY/2.0.3600..., overwriting whatever file
was previously there.

In other words, you can only ever have two versions of any Mono
assemblies, both of which will be overwritten by Mono during make
install. Which means that Mono isn't parallel-installable with itself
(you have to choose a different prefix if you want a different version
of Mono).

(Note that the 1.0 library and the 2.0 library will differ; during
\`make\` these libraries are built once for each profile, setting
various \#defines for each profile. The versioned assemblies are placed
into mcs/class/lib/PROFILE, and it's the PROFILE/ASSEMBLY file which is
placed into \$prefix/lib/mono/gac/ASSEMBLY/VERSION...)

Why is this the case? Because Mono doesn't choose the version number for
those assemblies, Microsoft does, and for compatibility we need to
choose the same version numbers so that when Mono compiles a program
.NET will be able to load the correct assemblies when running under
.NET. Compatibility trumps all.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:Articles>

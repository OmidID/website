---
Title: ./BuildSystem$PackagingScripts
layout: default
---

The core of the build system is the packaging scripts. These live in
`release/packaging`.

Configuration files
===================

There are a few sets of config files for this setup:

release/packaging/defs
----------------------

These define specific products. This is the current set of rpms we
build, so you might have a stable and an unstable version, etc.

Example:

<bash> BUILD\_HOSTS=(

`       redhat-9-i386`\
`       sles-9-x86_64`

)

USE\_HOSTS=(

`   fedora-3-i386`\
`   nld-9-i586`\
`   nld-9-x86_64`\
`   redhat-9-i386`\
`   rhel-3-i386`\
`   rhel-4-i386`\
`   sles-9-i586`\
`   sles-9-x86_64`\
`   suse-92-i586`\
`   suse-93-i586`\
`   suse-93-x86_64`

)

get\_destroot () {

`   DEST_ROOT=$ARCH`

}

HEAD\_PATH="trunk"
RELEASE\_PATH="tags/mono-[version]({{site.url}}/version "wikilink")"

get\_tarball () {

`   msvn_tar $1`

} </bash>

A breakdown of the file:

`BUILD_HOSTS` : machines on which the package gets built and rpms get created\
`USE_HOSTS` : all distros that will *use* the package -- might be different than `BUILD_HOSTS` if packages are shared\
`get_destroot` : the prefix where the packages go. This is how we find out how to share packages. For all distros in `USE_HOSTS` exactly one distro in `BUILD_HOSTS` must have the same `get_destroot`\
`HEAD_PATH, RELEASE_PATH` : custom variables for our tarball creation method\
`get_tarball` : the method we use to get tarballs

release/packaging/conf
----------------------

These are little configurations for each of our jails

release/conf
------------

These contain build-buddy .conf files.

Scripts
=======

Various scripts exist to run builds:

mktarball
---------

makes a tarball. Run like
`mktarball <target jail> <package> <version|snap> [svn rev]`

-   Ex: `mktarball suse-93-i586 gtk-sharp 1.1.7`
-   Ex: `mktarball suse-93-i586 xsp snap 44717`

build
-----

Builds something run like
`build <target jail> <package> <version> [<rev>]`

-   Ex: `build suse-92-i386 mono-1.1 1.1.7`

Steps to Build Everything
=========================

TODO

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

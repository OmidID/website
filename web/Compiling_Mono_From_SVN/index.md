---
Title: ./Compiling_Mono_From_SVN
layout: default
---

Compiling from SVN is obsolete
==============================

Since the current mono version is beeing developed on github, the
instructions here are obsolete. Check the [compiling Mono from
Git]({{site.url}}/Compiling_Mono_From_Git "wikilink") page instead.

For full details about checking out your source code, see: [SVN Write
Access]({{site.url}}/SVN "wikilink") and the [Anonymous SVN
access]({{site.url}}/AnonSVN "wikilink") pages).

### Checking out for the first time

If you are checking out Mono from SVN for the first time, you can use
anonymous access:

      $ svn co http://anonsvn.mono-project.com/source/trunk/mono
      $ svn co http://anonsvn.mono-project.com/source/trunk/mcs
      $ svn co http://anonsvn.mono-project.com/source/trunk/libgdiplus

If you have an account on the main Subversion repository, use the
following command:

     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/mcs
     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/mono
     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/trunk/libgdiplus

### Updating an existing checkout

     $ (cd mono; svn update) 
     $ (cd mcs; svn update) 
     $ (cd libgdiplus; svn update)

### Building the source

Then, go into the mono directory, and configure:

<bash>

` $ cd mono`\
` $ ./autogen.sh --prefix=/usr/local`\
` $ make`\
` $ make install`

</bash>

By running autogen.sh from the mono tree, it will automatically go into
the mcs/ tree and build the binaries there, so you don't have to run it
in both mono and mcs trees.

This assumes that you have a working mono installation, and that there's
a C\# compiler named 'mcs', and a corresponding IL runtime called
'mono'.

In order to use mcs and mono binaries during the build process which do
not reside in your PATH, you can set two make variables, EXTERNAL\_MCS
and EXTERNAL\_RUNTIME:

<bash> make EXTERNAL\_MCS=/foo/bar/mcs
EXTERNAL\_RUNTIME=/somewhere/else/mono </bash>

If you do not currently have mono installed, build and install mono from
a recently released tarball.

The file
[mono/README](http://anonsvn.mono-project.com/viewvc/trunk/mono/README)
contains more information about ways to compile Mono from the
repository, consult it if you need more details.

Also to get the latest changes in System.Drawing.dll and
System.Windows.Forms.dll you also need configure, build and install
libgdiplus.

      $ cd libgdiplus
      $ ./autogen.sh --prefix=/usr/local
      $ make
      $ make install

If you use a different prefix then you may need to adjust your
LD\_LIBRARY\_PATH environment variable to ensure libgdiplus.so can be
loaded.

      export LD_LIBRARY_PATH=/your/own/prefix:$LD_LIBRARY_PATH

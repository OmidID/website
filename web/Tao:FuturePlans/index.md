---
Title: ./Tao:FuturePlans
layout: default
---

Set of things I'd like to do in the (very) near future:

#### Simplify build system

Right now Tao has a number of build systems, including a NAnt-based one,
a set of Visual Studio projects, and DNPB (dot net prebuild) files. NAnt
is pretty painful on mono, especially on a development install, as it's
large and has many dependencies. I'd like to move to only two maintained
build methods going forward:

​1. Simple cross-platform Makefile system

This should support all the configurations that the current NAnt-system
supports, but be easier to maintain. Support for mono on OS X should
also be added to Tao. This will most likely depend on GNU make, though
it may be possible to make the same files work with NMAKE.

​2. VS.NET Solution/Projects

#### Single Tao.OpenGl DLL on all platforms

Building Tao.OpenGl fully right now depends on the ILMerge tool, which
is a Windows-only binary tool. We should be able to replace both the
stub generator and ILMerge with
[<http://www.plas.fit.qut.edu.au/perwapi/Default.aspx>]({{site.url}}/PERWAPI "wikilink").
There are still some calling convention issues in some of the bindings
that will make it difficult to ship a single binary for all platforms,
but we should be able to identify these and provide a set of reccomended
libraries to use that don't have any calling convention issues, making
it possible to ship a single app that uses Tao that would run on all
platforms.

#### Single Tao.Sdl DLL on all platforms

Building Tao.Sdl relies on ILDasm and ILAsm tolls which are Windows-only
tools. These tools are used to correct some calling convention issues.

#### MacOS X support

Make sure that the MacOS X support is correct, and that the assembly
.config files reference the correct .dylib bits on OSX.

#### OpenGL documentation

Need to get inline documentation for OpenGL functions in, based on the
OpenGL man pages.

#### Extension support in OpenAL

OpenAL uses an extension mechanism similar to OpenGL's
(alGetProcAddress)... we need to add support for some of the more common
extensions (EAX) in the same way that we handle OpenGL extensions.

---
Title: ./Release_Notes_Mono_2.2
layout: default
---

Mono 2.0 is a portable and open source implementation of the .NET
framework for Unix, Windows, MacOS and other operating systems.

Major Highlights
================

Changes since Mono 2.0
======================

This documents the changes since [Mono
2.0](Release Notes Mono 2.0{{site.url}}/ "wikilink")

Runtime
-------

### Performance

The code generation engine has been replaced from tree-based
representation that we used for 1.0.x, 1.2.x, 1.9 and 2.0 releases to a
representation that is better suited for advanced optimizations, the
[Linear IL]({{site.url}}/Linear IL "wikilink") engine.

The new engine already outperforms the old engine in many
computationally intensive tasks.

Generic sharing is now turned on in all cases. You can control the
sharing setup using the MONO\_GENERIC\_SHARING environment variable.

Generic sharing is now supported on ARM.

### Ahead of Time Compilation

Support for [Full Ahead of Time Compilation]({{site.url}}/AOT "wikilink"), generic
sharing, and static linking is now available.

### Monitoring

Support for monitoring the runtime internals is now available through a
new PerformanceCounters implementation.

A new GUI tool \`mperfmon' is available to allow developers and
administrators to monitor the system performance.

### Attach Functionality

It is now possible to load code externally into a Mono process to debug
or augment code live.

A new assembly: Mono.Management wraps this functionality.

### SIMD support in Mono

Support for SIMD instructions has been added to the Mono JIT. See [this
page](http://tirania.org/blog/archive/2008/Nov-03.html) for more
information about the SIMD support.

The [Documentation for this
library](http://go-mono.com/docs/monodoc.ashx?tlink=0@N%3aMono.Simd)
includes the API-level description of the new data types introduced in
this new release.

The performance benefits of using these SIMD-aware vector types is
anywhere between 1.5x to 10x depending on the use cases.

C\# Language
------------

### Compiler Service

A new Mono.CSharp.Evaluator class and library is available to allow
developers to embed the C\# compiler into their own applications. This
provides C\# in a Compiler-Service modality that developers can use to
extend their applications.

This can be used to load scripts written in C\# dynamically, but
executing at the same speed as C\# compiled pages or to add dynamic
features to your application or even adding a console to debug your
application on a live deployment.

### Interactive Shell

A new interactive shell for C\# is available, the command is called
"csharp", more details are available on the csharp manual page and on
the [CsharpRepl]({{site.url}}/CsharpRepl "wikilink") page.

The C\# shell currently requires Mono for any C\# 2.0 and 3.0 support.
Version 1.0 will also run on the .NET Framework.

The shell has support for attaching to existing processes, so it is
possible to use the csharp shell to debug live applications.

A GUI version of the shell, `gsharp` is also included in the mono-tools
package.

### Optimizations

Our compiler will now replace any references to the empty string with a
reference to the String.Empty field (more efficient).

### Other Changes

The C\# compiler now defaults to warning level 4 (the previous default
was level 3).

Compiler parsing errors detection and parser error recovery has been
improved which should lead to much cleaner syntax error reporting.

Regular Expressions
-------------------

The regex interpreter used by the System.Text.RegularExpressions package
has been rewritten to be more efficient.

Additionally, a regex-to-CIL compiler has been implemented which
provides dramatically better performance at the cost of increased setup
time, this compiler is activated when RegexOptions.Compiled is passed to
the Regex class constructors. The old interpreter is still available,
and can be used by defining the MONO\_OLD\_RX env variable.

In previous versions, Mono always interpreted regular expressions.

ASP.NET
-------

New Routing handler in ASP.NET 3.5 SP1 has been implemented. This
includes ASP.NET Abstractions layer and will be used for ASP.NET MVC.

Winforms
--------

Nearly 200 reported bugs have been fixed since the 2.0 release.

Calling Application.EnableVisualStyles () will now use native rendering
on Windows.

Tools
-----

### Gendarme

Our [static code analyzer]({{site.url}}/Gendarme "wikilink") has been updated with
new filtering options (severity, confidence, number of defects), 32 new
rules (total 183) and many enhancements and fixes to existing rules.
Full release notes are available on
[here](http://anonsvn.mono-project.com/source/trunk/mono-tools/gendarme/NEWS).

Smaller Changes
---------------

### Mono on Windows

The Mono Windows installer has been updated to include GTK\# 2.12.7.

### Build

It is now possible to cross-compile Mono for Windows using Linux and
MinGW. Details are available on the [Compiling
Mono](Compiling_Mono#Cross-{{site.url}}/compiling_on_Linux_using_MinGW "wikilink")
page.

### Console Implementation

Various upgrades to the Console implementation, it will now respond
appropriately to changes on terminal sizes.

Source Code Snippets
--------------------

Some libraries are too small to qualify for an assembly and are more
conveniently used in source code form. With Mono 2.2 we debut code
snippets, these are used by copying the code into your application. For
example, to use Mono.Options parsing library, you would do:

<bash> cp \`pkg-config --variable=Sources mono-options\` . </bash>

Mono.Options and Mono.DataConvert are now available in this form.

### Mono.Options

Jonathan Pryor's Mono.Options library is now included as a Source Code
Snippet that you can integrate into your application.

### Mono.Terminal.Editor

This is a command line editor that replaces Console.ReadLine() for
interactive applications. It provides editing in the command line and
support for history

### Mono.DataConvert

The [Mono DataConvert]({{site.url}}/Mono DataConvert "wikilink") library provides
encoding and decoding of bytes, words, strings and other data types to
and from various CPU endianness.

Documentation
-------------

The monodoc module is no longer distributed, instead the documentation
has been merged directly into Mono (Jonathan)

Installing Mono 2.2
===================

**Binary Packages and Source Code Downloads:**

`Source code and pre-compiled packages for Linux, Solaris, `\
`MacOS X and Windows is available from our web site from `\
`the `[`Downloads`]({{site.url}}/Downloads "wikilink")` section.`

**Quick source code installation:**

`If we have no packages for your platform, installing from `\
`source code is very simple.   `

Compile libgdiplus to support System.Drawing:

<bash>

`   $ tar xzf libgdiplus-2.2.tar.gz`\
`   $ cd libgdiplus-2.2`\
`   $ ./configure`\
`   $ make`\
`   $ make install`

</bash>

Then compile Mono itself:

<bash>

`   $ tar xzf mono-2.2.tar.gz`\
`   $ cd mono-2.2`\
`   $ ./configure`\
`   $ make`\
`   $ make install`

</bash>

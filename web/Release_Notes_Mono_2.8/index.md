---
Title: ./Release_Notes_Mono_2.8
layout: default
---

Mono 2.8 is a portable and open source implementation of the .NET
framework for Unix, Windows, MacOS and other operating systems.

Important Information About Mono 2.8
====================================

Mono's Long Term Supported release continues to be Mono 2.6, the next
long-term support release will be Mono 3.0.

Mono 2.8 ships the latest and greatest and updates and they have not
received as much testing as they should. Users seeking absolute
stability should stay on Mono 2.6. Users switching to Mono 2.8, should
expect a faster bug turn around time, but they should also plan on
upgrading to the upcoming 2.xx series as we fix bugs in our stack.

Major Highlights
================

-   [C\# 4.0]({{site.url}}/CSharp "wikilink")
-   Defaults to the 4.0 profile.
-   New Garbage Collection engine
-   New Frameworks:
    -   Parallel Framework
    -   System.XAML
-   Threadpool exception behavior has changed to match .NET 2.0
    -   potentially a breaking change for a lot of Mono-only software
    -   See information below in the "Runtime" section.
-   New Microsoft open sourced frameworks bundled:
    -   System.Dynamic
    -   Managed Extensibility Framework
    -   ASP.NET MVC 2
    -   System.Data.Services.Client (OData client framework)
-   Performance
    -   Large performance improvements
    -   LLVM support has graduated to stable
        -   Use mono-llvm command to run your server loads with the LLVM
            backend
-   Preview of the [Generational Garbage
    Collector]({{site.url}}/Generational_GC "wikilink")
-   Version 2.0 of the [embedding
    API](Embedding_Mono#Updates_for_Mono_version_2.8.2{{site.url}}/B "wikilink")
-   WCF Routing
-   .NET 4.0's CodeContracts
-   Removed the 1.1 profile and various deprecated libraries.
-   OpenBSD support integrated
-   ASP.NET 4.0
-   Mono no longer depends on GLIB

Changes since Mono 2.6
======================

This documents the changes since [Mono
2.6](Release Notes Mono 2.6{{site.url}}/ "wikilink").

New Garbage Collector
---------------------

Mono now comes with a new garbage collector:
[SGen]({{site.url}}/Compacting_GC "wikilink"), a generational, copying, heap precise,
stack conservative garbage collector. This collector is able to repack
the contents of memory and helps reduce heap fragmentation by moving
data around when possible.

Our friends at [Sones](http://developers.sones.de) have a [blog entry
benchmarking the Boehm GC vs the new
GC](http://developers.sones.de/?p=829) while inserting 200,000 objects
into their database:

![](http://localhost:4000/files/Monovsmonosgen thumb.png "http://localhost:4000/files/Monovsmonosgen thumb.png")

The blue line is the time it takes for the new GC to fulfill the
request, the red line is the old GC. They have also done some more
benchmarks which you can like their [Sones GraphDB on Mono's SGen vs
.NET](http://developers.sones.de/2010/09/09/benchmarking-the-sones-graphdb-on-mono-sgen-and-net/).
It shows that Mono has considerably improved, and that we still have
work to do in some areas.

Mono has historically used Hans Boehm's conservative Garbage Collector,
a fantastic garbage collector. As Mono evolved, we wanted to bring some
extra features like generational garbage collection that were not
possible with Boehm.

To use the new garbage collector, you just need to invoke Mono with the
--gc=sgen command line option, or set the MONO\_ENV\_OPTIONS environment
variable to contain "--gc=sgen" option. By default Mono continues to use
the Boehm collector.

### Platforms

The SGen garbage collector is supported on ARM, x86, x86-64 and the
s390x platforms.

### Configuration

At runtime you can configure the GC parameters using the
MONO\_GC\_PARAMS environment variable. This variable accepts the
following comma-separated list. You can control the collector to use,
the size of the major heap as well as the nursery and the writer barrier
to use.

These are the options:

-   **major=COLLECTOR**, the collector is one of:
    -   **marksweep** standard mark and sweep
    -   **marksweep-par** parallel mark and sweep (for use in multi-core
        systems)
    -   **marksweep-fixed** mark and sweep, with a fixed heap size
    -   **marksweep-fixed-par** parallel mark and sweep with a fixed
        heap size
    -   **copying** 2 semi-space copying collector
-   **major-heap-size=SIZE** the size of the major heap (not including
    the large object space) for the fixed-heap Mark and Sweep collector
    (i.e. \`marksweep-fixed' and \`marksweep-fixed-par'). The size is in
    bytes, with optional suffixes \`k', \`m' and \`g' to specify kilo-,
    mega- and gigabytes, respectively. The default is 512 megabytes.
-   **nursery-size=SIZE** This sets the size of the nursery. The size is
    specified in bytes and must be a power of two. The suffixes \`k',
    \`m' and \`g' can be used to specify kilo-, mega- and gigabytes,
    respectively.
-   **wbarrier=WBARRIER**, the write barrier is one of:
    -   **cardtable** cardtable based write barrier
    -   **remset** remembered set based write barrier.

The default collector is **marksweep** which means that Mono
automatically grows the heap as it needs more memory. In certain
environments, you can limit the size of the heap that your program will
use, and this will give Mono a slight performance boost by using any of
the "fixed" variations. To use a fixed heap, you must also specify the
**major-heap-size** variable.

The default write barrier is **cardtable** for marksweep and **remset**
for other major collectors. The cardtable wbarrier is significantly
faster but has the drawback that if too many objects are pinned too much
time will be spend scanning objects during minor collections. Under some
cases it might still be preferable to use remsets. To know that, run
your program with --stats and look for "Minor scan pinned" and "Minor GC
time in msec", if the first is close to, or bigger than, 50% of the
second it might be worth trying run with remsets and see if performance
improves.

Another advantage of **cardtable** is that is has a much more
predictable and usually smaller memory footprint than remset.

For debugging, you can use the **MONO\_GC\_DEBUG** environment variable.
See the mono(1) man page for details on the possible options.

New Libraries
-------------

### Microsoft MS-PL or Apache Licensed Libraries

Mono 2.8 includes various new libraries from Microsoft that have been
released under the MS-PL or Apache2 open source licenses, and these
include:

-   [ASP.NET MVC2](http://www.asp.net/mvc)
-   [Managed Extensibility Framework (MEF)](http://mef.codeplex.com)
-   [System.Data.Services.Client](http://tirania.org/blog/archive/2010/Mar-22.html)
    (OData)
-   [Dynamic Language Runtime](http://dlr.codeplex.com)

### Numerics

System.Numerics provides a BigInteger implementation as well as the new
Complex number data type.

### .NET 4.0 API Update

Memory Mapped files.

System SSL Certificates
-----------------------

On MacOS X and iPhoneOS Mono will now fallback to the system certificate
store to validate server certificates removing the need for the end user
to import the Mozilla certificates.

Linux, Windows and other users still need to use "mozroots --import
--sync" to import the certificates.

License Manager
---------------

Now Mono supports the LC command and the associated support libraries
for managing licenses.

LINQ to SQL
-----------

4.0 APIs
--------

The Managed Extensibility Framework (MEF) and the Microsoft Dynamic
Language Runtime (DLR) two components of .NET 4.0 that Microsoft has
open sourced are now part of Mono.

Additionally, many of the .NET 4.0 APIs have been implemented in
mscorlib.

ParallelFx
----------

### PLinq

PLinq is now part of Mono although it should still be considered preview
code. You are welcome to report any bug you can find to help improve it.

### Framework improvements

#### General

-   API has been updated and is now tracking .NET 4 final release.
-   Most wait operations in the framework have been revamped and
    shouldn't result in 100% CPU time effect anymore during long wait
    period.

#### System.Threading.Tasks

-   Continuation scheduling fixes
-   Deadlock fixing

#### System.Threading

-   ThreadLocal has been updated and is able to detect invalid usage
    pattern
-   SpinLock is now using the fairer and lighter ticket lock algorithm
-   Barrier is now fully thread-safe and post phase action are
    guaranteed to execute

#### System.Collections.Concurrent

-   ConcurrentDictionary is now lockless making all the types in the
    namespace fully lock-free
-   ConcurrentBag is faster and use less memory particularly when lots
    of different thread access it.

CodeContracts
-------------

We are introducing a partial implementation of [Code
Contracts](http://msdn.microsoft.com/en-us/devlabs/dd491992.aspx) a
system designed to improve code quality by adding support for
pre-conditions, post-conditions and object invariants in your code. This
implements a .NET version of the defensive programming methodologies
that were heralded by Bertrand Meyer and his Eiffel programming
language.

**In Mono only pre-conditions are supported, using the
Contract.Requires() method.**

This was developed by Chris Bacon as part of the 2010 Google Summer or
Code.

From Microsoft's web site on CodeContracts:

> Code Contracts provide a language-agnostic way to express coding
> assumptions in .NET programs. The contracts take the form of
> pre-conditions, post-conditions, and object invariants. Contracts act
> as checked documentation of your external and internal APIs. The
> contracts are used to improve testing via runtime checking, enable
> static contract verification, and documentation generation. Code
> Contracts bring the advantages of design-by-contract programming to
> all .NET programming languages.

On Mono you use the **ccrewrite** tool to rewrite your binaries to
include the full checks. To make use of the tool, you need to make sure
that you build your programs with the CONTRACTS\_FULL compiler define
set (otherwise the compiler would remove any calls to the Contracts
API).

Dynamic Language Runtime
------------------------

We now distribute Microsoft's open source [Dynamic Language
Runtime](http://dlr.codeplex.com). This is the underlying foundation for
dynamic languages like IronPython, IronRuby, [RemObjects's
JavaScript](http://www.remobjects.com/script.aspx) or IronJS.

System.IO.Packaging
-------------------

WinForms
--------

ASP.NET 4.0
-----------

The following features of the ASP.NET 4.0 are implemented:

-   [Extensible Output
    Caching](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429240)
-   [Permanently Redirecting a
    Page](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429242)
-   [Shrinking Session
    State](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429243)
-   [Expanding the Range of Allowable
    URLs](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429244)
-   [Extensible Request
    Validation](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429245)
-   [Object Caching and Object Caching
    Extensibility](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429246)
-   [Extensible HTML, URL, and HTTP Header
    Encoding](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429247)
-   [Setting Meta Tags with the Page.MetaKeywords and
    Page.MetaDescription
    Properties](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429257)
-   [Enabling View State for Individual
    Controls](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429258)
-   [Routing in ASP.NET
    4](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429260)
-   [Html Encoded Code
    Expressions](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429265)
-   [CSS
    Improvements](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429267)
-   [Hiding div Elements Around Hidden
    Fields](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429268)
-   [Rendering an Outer Table for Templated
    Controls](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429269)
-   [CheckBoxList and RadioButtonList Control
    Enhancements](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429271)
-   [Wizard and CreateUserWizard
    Controls](http://www.asp.net/LEARN/whitepapers/aspnet4#0.2__Toc253429273)

Other changes:

-   A lot of 1.1 code was removed from System.Web.
-   System.Web.Routing namespace is now part of the System.Web assembly
-   System.Web.Abstractions namespace is now part of the System.Web
    assembly
-   Pre-application start methods are supported
-   Membership and Role providers now live in a separate assembly,
    System.Web.ApplicationServices
-   Caching subsystem improvements - timer code was rewritten, only one
    timer is used for all entries and a priority queue is employed to
    expire entries in the correct order

System.Runtime.Caching
----------------------

This is a new class roughly modeled after the ASP.NET caching subsystem
but extensible and usable outside ASP.NET applications. Implementation
lives in the System.Runtime.Caching assembly.

System.ComponentModel.DataAnnotations
-------------------------------------

Several attributes were implemented to correctly support ASP.NET MVC2.

C\# Language
------------

Mono now implements the C\# 4.0 language.

XBuild
------

XBuild can now build Silverlight projects. It can also build projects
targeting .net 3.5/4.0 (VS2008/VS2010). ToolsVersion to be used can be
forced via the command line argument "/tv:", eg. "/tv:4.0" .

MSBuild extensions (tasks+targets) can now be installed in arbitrary
directories. Extensions loaded from \$(MSBuildExtensionsPath) can now be
in the default location (\$prefix/lib/mono/xbuild) or
\~/.config/xbuild/tasks. Or any arbitrary path(s) can be used for
searching the extensions by setting the environment variable named
\$MSBuildExtensionsPath. See the man page for more details.

Lots of bug fixes and improvements like improved dependency resolution.

Runtime
-------

### ThreadPool behavior

This will potentially break existing applications.

Up until Mono 2.6, the behavior of exceptions thrown from a thread pool
thread were the ones from .NET 1.0. Threadpool threads are used when you
call the ThreadPool.QueueUserWorkItem () method, or when you use the
asynchronous .BeginXXX methods on a delegate object.

This behavior silently ignored any uncaught exceptions thrown from a
thread in the thread pool. This happened regardless of which profile you
were developing for 1.0 or 2.0.

With Mono 2.8 we now have the same behavior as .NET 2.0-4.0 and uncaught
exceptions from the thread pool will terminate the process. If you have
code that depends on the old behavior you can still configure this using
the .config file, in the **\<runtime\>** section:

<div class="xml">
    <pre><code>
    <legacyUnhandledExceptionPolicy enabled="1"/>
    </code></pre>

</div>
For more information about this change, see Microsoft's [Exceptions in
Managed Threads](http://msdn.microsoft.com/en-us/library/ms228965.aspx)
document.

Ideally, you will handle all exceptions at the toplevel on threadpool
threads.

### MONO\_ENV\_OPTIONS

The <b>mono</b> command will now evaluate the contents of the
MONO\_ENV\_OPTIONS environment variable and use those as if they were
command line options that were specified to the Mono runtime on the
command line.

You can use this to pass global settings to all of your Mono processes.

You can use this for example to enable the new garbage collector by
default:

<bash>

`$ export MONO_ENV_OPTIONS="--gc=sgen"`

</bash>

Or you could use this to make Mono always use LLVM for compilation:

<bash>

`$ export MONO_ENV_OPTIONS="--llvm"`

</bash>

### API/ABI change for embedding.

With Mono 2.8 we made changes to our embedding API, removing internal
methods from the public API and replacing the use of glib types with
integer data types from stdint.h.

We also deprecated some methods that were limited and were not supposed
to be used externally.

#### Deprecated, Removed or Modified parts of the Embedding API

verify.h no longer features mono\_image\_verify\_tables. It didn't call
into the new metadata verifier and provided incomplete functionality.

### Exception Tracing

The --trace option on the runtime allows a new prefix "E:NAME" to trace
the given exception name and to report where the exception was being
thrown. This is useful to trace all of the exceptions being thrown by
your program.

You can also use --trace=E:all which will report on all exceptions.

For example, let us look at the compiler: <bash> \$ gmcs.exe mono\$ gmcs
missing.cs error CS2001: Source file \`missing.cs' could not be found
Compilation failed: 1 error(s), 0 warnings </bash>

And now with tracing enabled, we do it setting the MONO\_ENV\_OPTIONS
variable:

<bash> mono\$ MONO\_ENV\_OPTIONS=--trace=E:all gmcs
missing.cs[0xb75136f0:] EXCEPTION handling:
System.IO.FileNotFoundException: Could not find file "missing.cs".

"<unnamed thread>" tid=0x0xb75136f0 this=0x0x53f18 thread handle 0x403
state : not waiting owns ()

` at System.IO.FileStream..ctor (string,System.IO.FileMode,System.IO.FileAccess,System.IO.FileShare,int,bool,System.IO.FileOptions) <0x00619>`\
` at System.IO.FileStream..ctor (string,System.IO.FileMode,System.IO.FileAccess,System.IO.FileShare) <0x00022>`\
` at (wrapper remoting-invoke-with-check) System.IO.FileStream..ctor (string,System.IO.FileMode,System.IO.FileAccess,System.IO.FileShare) <0x0004f>`\
` at System.IO.File.OpenRead (string) <0x0002c>`\
` at Mono.CSharp.Driver.Parse (Mono.CSharp.CompilationUnit) <0x00016>`\
` at Mono.CSharp.Driver.Parse () <0x00068>`\
` at Mono.CSharp.Driver.Compile () <0x00098>`\
` at Mono.CSharp.Driver.Main (string[]) <0x000a2>`\
` at (wrapper runtime-invoke) `<Module>`.runtime_invoke_int_object (object,intptr,intptr,intptr) <0x00033>`

error CS2001: Source file \`missing.cs' could not be found Compilation
failed: 1 error(s), 0 warnings </bash>

### IOMAP reporting utility

Mono includes a [ profiler
module](IOMap#{{site.url}}/IOMAP_reporting_utility "wikilink") to report IOMAP
actions and help developers find places in code where file I/O requiring
file name mapping is performed.

### S390x Port

The S390x port now supports Mono's interface method tables (IMT) which
reduces the memory usage consumed by generics.

It also supports the new [SGen garbage
collector]({{site.url}}/Compacting GC "wikilink").

### Unsafe Runtime Execution

Mono performs arrays bounds checking when an array element is accessed.
This prevents a whole class of bugs. For example, the following code
will throw an IndexOutOfRangeException:

<div class="csharp">
    <pre><code>
    var d = new int [10];
    for (int i = 0; i < 20; i++)
        d [i] = 1;
    </code></pre>

</div>
To support the above scenario the JIT adds a check to the d [i] array
access to ensure that i is withing the array boundaries. Sometimes the
JIT compiler is able to infer that the bounds check can be eliminated,
removing dead code from the execution.

But sometimes the JIT is not able to infer this so the checks must
remain in place.

For certain class of high performance computing loads, where the code
has been carefully tested and it is known to never generate an index out
of range exception, you can tell the Mono runtime to disable the
generation of that code by using the optimization flag "unsafe", you use
it like this:

<bash> mono -O=unsafe program.exe </bash>

Before you use this option, you should ensure that your program never
gets one of these exceptions:

<bash> mono --trace=E:System.IndexOutOfRangeException </bash>

And you should never use this option when running server code, or any
code that might be exposed to untrusted data or untrusted user input.

### Improved Support for obfuscated assemblies

Mono's runtime engine has been updated to handle blocks with dead code
that contains invalid IL. In the past Mono would report the code as
invalid IL, now it is able to skip over that code and compile your code.

In general, you should test every bit of code that has been obfuscated
and not ship any software without it.

Obfuscators typically depend on mangling assemblies in ways that have
historically worked under some conditions under the Microsoft's JIT
engine. We are not planning on implementing every corner case that
Obfuscators depend on, and we do not really have any plans on supporting
more advanced techniques. If your obfuscated software breaks with Mono,
do not even bother filing a bug, it will be closed right away as a
wont-fix bug.

### Multiple Profiler Support

Mono's runtime is able to load more than one profiler now, allowing
users to combine profilers.

To use this feature all you have to do is pass the --profile option
multiple times.

### Shared handles are disabled by default

Mono historically has supported sharing various kinds of handles across
processes. These include process handles, thread handles, named mutexes,
named semaphores and named semaphores.

This is a windows feature that has to be emulated on Linux systems using
a shared memory segment.

The code to support this was problematic, since it required cooperation
between all running mono processes through shared memory/files, leading
to many problems/bugs.

Because of this, shared handles are now disabled by default. They can be
enabled by setting the MONO\_ENABLE\_SHM enviroment variable.

### Mono.Simd

Vector4f now contains a hardware accelerated multiplication by a scalar
value:

<div class="csharp">
    <pre><code>
    public struct Vector4F {
        [Acceleration (AccelMode.SSE1)]
        public static Vector4f operator * (float scalar, Vector4f v);

        [Acceleration (AccelMode.SSE1)]
        public static Vector4f operator * (Vector4f v, float scalar)
    }
    </code></pre>

</div>
### Full AOT support for x86

Mono's Full AOT engine has been extended to x86, this allows developers
that target Full AOT systems (PowerPC and ARM mostly) to test their
software on x86 before deploying to the PS3 or iPhone devices.

Additionally this is being used by Unity for special static builds of
Unity executables.

### LLVM Support

Huge improvements were made to the LLVM support in the runtime:

-   The LLVM backend is now considered production quality.
-   There is a Mono branch of LLVM at github, which contains various
    changes to increase the integration between llvm and mono. This is
    the recommended version of LLVM which should be used, altough LLVM
    2.6/2.8 should work too. When using this LLVM version, the LLVM
    backend can compile more than 99% of mscorlib methods.
-   It is possible to configure the runtime to load the LLVM backend
    dynamically from a shared library, so the memory overhead of LLVM is
    only incurred if needed.

JIT compilation with LLVM is still very slow, which means that it is not
suitable as a replacement for the default JIT, but it is very useful for
server loads, compute intensive applications and other scenarios where
execution speed is more important than startup time.

You can use the --llvm and --nollvm flags to control which JIT engine
Mono will use at runtime. Or you can set these on the MONO\_ENV\_OPTIONS
environment variable.

Configuring+Running with LLVM is described at:
<http://www.mono-project.com/Mono_LLVM>

### Assembly binding redirection is supported

.NET supports redirecting assembly references from one version to
another. This support is now present in Mono as well. It is supported
for both stand-alone and web applications:

<div class="xml">
    <pre><code>
    <configuration>
       <runtime>
          <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
             <dependentAssembly>
                <assemblyIdentity name="myAssembly"
                                  publicKeyToken="32ab4ba45e0a69a1"
                                  culture="neutral" />
                <bindingRedirect oldVersion="1.0.0.0"
                                 newVersion="2.0.0.0"/>
             </dependentAssembly>
          </assemblyBinding>
       </runtime>
    </configuration>
    </code></pre>

</div>
### Dropped glib Dependency

Mono no longer requires the glib library to be available on your system.

This reduces the number of dependencies for Mono, makes it simpler to
port to new architectures and reduced the footprint of embedded
deployments.

Mono now ships with a minimalistic version of glib called "eglib" which
stands for "embedded glib" and is MIT X11 licensed. This was already the
default for the iPhone and PS3 ports and is now the new default for all
ports.

Removed Libraries and Commands
==============================

With Mono 2.8 we are removing libraries that have been deprecated for a
long time. The code is being kept on our anonymous repository for anyone
that wants to get a copy of the source code and binaries from Mono 2.6
will continue to run with Mono 2.8, we are just not going to distribute
it ourselves anymore.

The following libraries that have been deprecated for a while are no
longer part of Mono:

Libraries
---------

### Removed .NET 1.1 Profile

With this release of Mono we have dropped the support of all the 1.1
assemblies. Most users had migrated to the 2.0 profile at this point.

Note that, like on .NET, if you attempt to run a 1.1 assembly, it will
automatically be run on the 2.0 profile. There are some slight
differences, but the differences were mostly in the kind of exceptions
that you got when feeding invalid data to the class libraries
(ArgumentException instead of a NullReference exception for example).

When you run a 1.1 application you will get this warning: <bash> \$ mono
hello.exe WARNING: The runtime version supported by this application is
unavailable. Using default runtime: v2.0.50727 Hello, World. </bash>

You do not need to change your assemblies or update any config files to
have your 1.1 applications run on the 2.0 runtime. If you want to
eliminate the warning on execution, you can add a .config file that
explicitly lists that the application has been tested with the 2.0
runtime.

To do this, create a file with the extension .config, in this case it
would be hello.exe.config and add this:

<div class="xml">
    <pre><code>
    <configuration>
      <startup>
        <supportedRuntime version="v2.0.50727" /> 
      </startup>
    </configuration> 
    </code></pre>

</div>
### Removed Library: ByteFX.Data

This library has not been maintained since 2004. We kept it in Mono for
a long time because this was an LGPL driver to access MySQL, but the
driver is too buggy and most developers have switched to MySQL's .NET
data provider anyways.

### Removed Library: Mono.Data

This was a multiplexing library that became redundant with .NET 2.0's
System.Data provider factory.

### Removed Libraries: Microsoft.JScript and Microsoft.Vsa

Our JScript engine has not been updated for years, and very few users
even tried it or used it in its current incarnation as it was never
fully compliant with Javascript.

Today there are three solid DLR-based Javascript engines that run on
Mono that are more complete, faster and versatile.

### Removed Library: FirebirdSql.Data.Firebird

The upsteram maintainers have not updated the Firebird provider for
years while shipping newer and more feature rich versions of this
provider. If developers need this library, they should obtain this from
the upstream developers.

### Removed Library: Mono.Data.TdsClient

This provider for older Sybase ASE and Microsoft SQL Server databases \<
version 7.0 is barely used.

### Removed Library: Mono.Data.SybaseClient

Removed due to lack of users.

### Removed Library: Mono.Data.SqliteClient

Mono has shipped with two Sqlite bindings for quite some time. This is
the original binding that has been deprecated for a long time now and we
are now removing it from the distribution.

Most users had moved already to the newer Mono.Data.Sqlite binding
(based on System.Data.SQLite from the SQLite.NET team).

Removed Commands
----------------

### Removed Command: mjs

This was the frontend to the Microsoft.JScript.dll library that was
deprecated.

### Removed Command: prj2make

This has been replaced by xbuild (our MSBuild implementation) or
MonoDevelop's "mdtool build" command.

### Removed Command: cilc

This tool wrote C bindings for CIL APIs, but it never quite worked, but
we kept it on the tree over the years because a couple of users used it
for the small subset that worked.

This tool belongs in a separate package and needs to be maintained
elsewhere.

Installing Mono 2.8
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

`   $ tar xzf libgdiplus-2.8.tar.gz`\
`   $ cd libgdiplus-2.8`\
`   $ ./configure`\
`   $ make`\
`   $ make install`

</bash>

Then compile Mono itself:

<bash>

`   $ tar xzf mono-2.8.tar.gz`\
`   $ cd mono-2.8`\
`   $ ./configure`\
`   $ make`\
`   $ make install`

</bash>

---
Title: ./Mono:Runtime
layout: default
---

The Mono runtime
----------------

The Mono runtime implements the [ECMA Common Language
Infrastructure](http://www.ecma-international.org/publications/standards/Ecma-335.htm)
(CLI). The Mono runtime implements this virtual machine. If you are
interested in the technical aspects of the Mono runtime check the [
Runtime Documentation]({{site.url}}/Mono:Runtime:Documentation "wikilink"). The
runtime offers the following services:

-   Code Execution
    -   Code loading
    -   Support for dynamically generating code
    -   [On-the-fly marshalling to invoke native
        methods.]({{site.url}}/Interop_with_Native_Libraries "wikilink")
    -   [COM Interoperability]({{site.url}}/COM Interop "wikilink")
-   Garbage Collection, using one of:
    -   [Precise SGen Garbage Collector]({{site.url}}/Generational GC "wikilink")
    -   Conservative Boehm Garbage Collector
-   Code Generation
    -   Just-in-Time compilation, partial and full [Ahead-of-Time
        modes]({{site.url}}/AOT "wikilink")
    -   Backend engines:
        -   Mono's own engine
        -   [LLVM optimizing compiler backend
            engine]({{site.url}}/Mono LLVM "wikilink")
    -   [First-class SIMD datatypes
        (Mono.Simd)](http://go-mono.com/docs/index.aspx?link=N%3aMono.Simd)
-   Exception Handling
    -   Software-triggered exceptions
    -   Hardware-triggered exceptions like Floating point exceotions,
        null reference exceptions
-   Operating system interface
    -   File system IO
    -   Networking IO
    -   Access to operating system properties and features
    -   On Unix systems, [Mono.Posix
        APIs](http://go-mono.com/docs/index.aspx?link=N%3aMono.Posix)
-   Program isolation using Application Domains (AppDomain)
-   Thread management:
    -   Threadpool for user code
    -   Threadpool for networked IO
    -   Asynchronous method invocation
-   Console access
-   Security System
    -   [CoreCLR/Transparent Security Sandbox]({{site.url}}/CoreClrHowTo "wikilink")

The Mono runtime can be used as a stand-alone process, or it can be
[embedded into applications]({{site.url}}/Embedding Mono "wikilink")

Embedding the Mono runtime allows applications to be extended in C\#
while reusing all of the existing C and C++ code. For more details, see
the [Embedding Mono]({{site.url}}/Embedding Mono "wikilink") page and the [Scripting
With Mono]({{site.url}}/Scripting With Mono "wikilink") page.

Supported Platforms
-------------------

Compilation Engine
------------------

Paolo Molaro did a presentation on the current JIT engine and the new
JIT engine. You can find his slides
[here](http://primates.ximian.com/~lupus/slides/jit).

We have re-written our JIT compiler. We wanted to support a number of
features that were missing: Ahead of Time compilation, simplify porting
and have a solid foundation for compiler optimizations.

### Ahead-of-time compilation

The idea is to allow developers to pre-compile their code to native code
to reduce startup time, and the working set that is used at runtime in
the just-in-time compiler.

Although in Mono this has not been a visible problem, we wanted to
pro-actively address this problem.

When an assembly (a Mono/.NET executable) is installed in the system, it
is then be possible to pre-compile the code, and have the JIT compiler
tune the generated code to the particular CPU on which the software is
installed.

This is done in the Microsoft.NET world with a tool called ngen.exe.

The code produced by Mono's ahead-of-time compiler is Position
Independent Code (PIC) which tends to be a bit slower than regular JITed
code, but what you loose in performance with PIC you gain by being able
to use all the available optimizations.

To compile your assemblies with this, just run this command:

     $ mono -O=all --aot program.exe

The above command will turn on all optimizations (`-O=all`) and then
instructs Mono to compile the code to native code.

Additionally, if you want to do full static builds (and be able to run
without the JIT engine), you can use:

     $ mono -O=all --aot --full-aot program.exe

Then you can configure your Mono runtime with --enable-minimal to remove
the JIT engine. This is useful on systems that do not support
Just-in-Time compilation at the kernel level.

Some features like Reflection.Emit and other forms of dynamic code
generation are not support in this scenario.

Notice that for Mono 2.0 generics are not supported when doing full-AOT.

Some optimizations are being planned:
[OptimizingAOT]({{site.url}}/OptimizingAOT "wikilink")

### Bundles

Mono also offers bundles. Bundles merge your application, the libraries
it uses and the Mono runtime into a single executable image. You can
think of bundles as "statically linking mono" into your application.

To do this, you use the "mkbundle" command (see the man page distributed
with Mono for more details).

For example, to create a fully static and bundled version of Mono for
"hello world", you would:

<bash> bash\$ mcs hello.cs bash\$ mkbundle --static hello.exe -o hello

`OS is: Linux`\
`Note that statically linking the LGPL Mono runtime has more licensing restrictions than dynamically linking.`\
`See `[`http://www.mono-project.com/Licensing`](http://www.mono-project.com/Licensing)` for details on licensing.`\
`Sources: 1 Auto-dependencies: False`\
`  embedding: /tmp/hello.exe`\
`Compiling:`\
`as -o temp.o temp.s`\
`` cc -o helol -Wall `pkg-config --cflags mono` temp.c  `pkg-config --libs-only-L mono` -Wl,-Bstatic -lmono -Wl,-Bdynamic `pkg-config --libs-only-l mono | sed -e "s/\-lmono //"` temp.o ``\
`Done`

bash\$ </bash>

Of course, you can also just embed the libraries, without the actual
Mono runtime, by removing the --static flag.

A downside of the --static flag is that it will trigger the LGPL license
requirement in the runtime. If you are planning on using this feature as
an obfuscation technique you must obtain a commercial license of Mono;
otherwise you should distribute all the components that are necessary to
comply with the LGPL with bundles.

[Mono Tools for Visual Studio Ultimate
Edition](http://www.go-mono.com/store/#Mono_Tools_Ultimate) includes a
commercial license to redistribute Mono under non-LGPL terms on Windows,
Linux, and Mac OS X PCs for products with volumes under 100,000 and
revenues under \$2M annually. For other licensing options, [contact
us]({{site.url}}/Contact "wikilink").

### Platform for Code Optimizations

Beyond the use of the Mono VM as Just-in-Time compiler, we need to make
Mono code generation as efficient as possible.

The design called for a good architecture that would enable various
levels of optimizations: some optimizations are better performed on
high-level intermediate representations, some on medium-level and some
at low-level representations.

Also it should be possible to conditionally turn these on or off. Some
optimizations are too expensive to be used in just-in-time compilation
scenarios, but these expensive optimizations can be turned on for
ahead-of-time compilations or when using profile-guided optimizations on
a subset of the executed methods.

### Simplify Porting

We wanted to reduce the effort required to port the Mono code generator
to new architectures.

For Mono to gain wide adoption in the UNIX world, it is necessary that
the JIT engine works in most of today's commercial hardware platforms.

The new Mono engine now supports both 32 and 64 bit systems and various
architectures (See [Supported
Platforms]({{site.url}}/Supported Platforms "wikilink")).

### Profiling and Code Coverage

Mono provides a number of profiling tools and code coverage tools.

See the [Performance Tips]({{site.url}}/Performance Tips "wikilink") page for details
on using the profiler, and the [Code Coverage]({{site.url}}/Code Coverage "wikilink")
page for information on how to use the code coverage functionality with
your application and your test suites.

### DTrace

Mono's [support for DTrace]({{site.url}}/DTrace "wikilink") is available on Solaris
and MacOS X.

Versioning
----------

Mono supports a Global Assembly Cache or GAC. The GAC is used to share
libraries between different applications, to keep multiple versions of
the same library installed at once and to avoid conflicts over the names
of the libraries and they also play an important role in trust and
security.

See the [Assemblies\_and\_the\_GAC]({{site.url}}/Assemblies_and_the_GAC "wikilink")
document for more details.

Garbage Collection
------------------

Mono today uses Boehm's GC as its Garbage Collection engine. We are also
working on a precise and compacting GC engine specific to Mono.

The GC interface is being isolated to allow for more than one GC engine
to be used or for the GC to be tuned for specific tasks.

### Mono's use of Boehm GC

We are using the Boehm conservative GC in precise mode.

There are a few areas that the GC scans for pointers to managed objects:

1.  The heap (where other managed objects are allocated)
2.  thread stacks and registers
3.  static data area
4.  data structures allocated by the runtime

​(1) is currently handled in mostly precise mode: almost always the GC
will only consider memory words that contain only references to the
heap, so there is very little chance of pointer misidentification and
hence memory retention as a result. The new GC requires a fully precise
mode here, so it will improve things marginally. The details about
mostly precise have to do with large objects with sparse bitmaps of
references and the handling of multiple appdomains safely.

​(2) is always scanned conservatively. This will be true for the new GC,
too, at least for the first versions, where I'll have my own share of
fun at tracking the bugs that a moving generational GC will expose.
Later we'll conservatively scan only the unmanaged part of the stacks.

​(3) We already optimized this both with Boehm and the current GC to
work in precise mode.

​(4) I already optimized this to work in mostly precise mode (ie some
data structures are dealt with precisely, others not yet). I'll need to
do more work in this area, especially for the new GC, where having
pinned objects can be a significant source of pain.

### References

-   Garbage collection list and FAQ:
    [<http://www.iecc.com/gclist/>](http://www.iecc.com/gclist/)

-   [GC points in a Threaded
    Environment](http://research.sun.com/techrep/1998/abstract-70.html)

-   "A Generational Mostly-concurrent Garbage Collector":

-   [A Generational Mostly-concurrent Garbage
    Collector](http://research.sun.com/techrep/2000/abstract-88.html)

-   Details on The Microsoft .NET Garbage Collection Implementation:

[<http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI.asp>](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI.asp)

[<http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI2.asp>](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmag00/html/GCI2.asp)

IO and threading
----------------

The ECMA runtime and the .NET runtime assume an IO model and a threading
model that is very similar to the Win32 API.

Dick Porter has developed WAPI: the Mono abstraction layer that allows
our runtime to execute code that depend on this behaviour, this is
called the \`io-layer' in the Mono source code distribution.

This io-layer offers services like named mutexes that can be shared
across multiple processes.

To achieve this, the io-layer uses a shared file mapping across multiple
Mono processes to track the state that must be shared across Mono
applications in the \~/.wapi directory.

Useful links
------------

See our [Papers]({{site.url}}/Papers "wikilink") section for various articles
describing virtual machines and JIT compilers.

Porting
-------

See the [Porting]({{site.url}}/Porting "wikilink") page for more details on porting
Mono to a new platform.

Projects Under Development
--------------------------

There are a number of projects being developed in branches or on
separate trees for the runtime, these are:

-   [Runtime Projects]({{site.url}}/Runtime Projects "wikilink"): General Runtime
    Projects.
-   [Runtime Requests]({{site.url}}/RuntimeRequests "wikilink"): Ideas of things that
    we could use to improve Mono's runtime.
-   [Compacting GC]({{site.url}}/Compacting GC "wikilink"): A generational,
    compacting GC for Mono.
-   [JIT Regalloc]({{site.url}}/JIT Regalloc "wikilink"): A new register allocation
    framework.
-   [Mono\_Runtime\_API\_Changes]({{site.url}}/Mono_Runtime_API_Changes "wikilink"):
    Changes that will be introduced in Mono 2.8.

Completed projects:

-   [Continuations]({{site.url}}/Continuations "wikilink"): Support for co-routines
    and continuations in Mono.
-   [SafeHandles]({{site.url}}/SafeHandles "wikilink"): Support for 2.0 SafeHandles.
-   [Linear]({{site.url}}/Linear IL "wikilink"): An update to the JIT's internal
    representation (IR).

COM and XPCOM
-------------

Mono's COM support can be used to interop with system COM components in
Windows and in Linux (if you use a COM implementation). Additionally,
Mono's COM support can be used to access software based on Mozilla's
XPCOM.

For details on the progress, see the [COM
Interop]({{site.url}}/COM Interop "wikilink") page.

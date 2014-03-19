---
Title: ./faq.old
layout: default
---

Frequently Asked Questions
==========================

-   \>  Basics

-   \>  The Novell Role in the Mono project

-   \>  Mono and GNOME

-   \>  Building GUI applications with Mono

-   \>  Mono and Microsoft

-   \>  Mono platforms

-   \>  Compatibility

-   \>  Mono and the Portable.NET Project

-   \>  Web Services

-   \>  Mono and ASP.NET

-   \>  Mono and ADO.NET

-   \>  MonoDoc

-   \>  Development Tools and Issues

-   \>  Mono and Java

-   \>  Extending Mono

-   \>  Portability

-   \>  Reusing Existing Code

-   \>  Mono and GCC

-   \>  Performance

-   \>  Licensing

-   \>  Patents

-   \>  Miscellaneous Questions

-   \>  Obfuscation

-   \>  Mono Common Problems

A [Spanish
translation](http://www.monohispano.org/tutoriales/mono-puf//) is also
available (it is outdated though)

Basics
------

#### What is Mono exactly?

The Mono Project is an open development initiative sponsored by Ximian
that is working to develop an open source, UNIX version of the Microsoft
.NET development platform. Its objective is to enable UNIX developers to
build and deploy cross-platform .NET Applications. The project will
implement various technologies developed by Microsoft that have now been
submitted to the ECMA for standardization.

The Mono project has also sparked a lot of interest in developing
C\#-based components, libraries and frameworks. Today Mono is not
limited to implement the .NET Framework, but also contains other
components. Some of the components of the Mono platform were developed
by the Mono team, and some others we have incorporated from other open
source efforts, the most important ones:

-   [Remoting.CORBA](http://remoting-corba.sourceforge.net/): A CORBA
    implementation for Mono.

-   Ginzu: An implementation on top of Remoting for the
    [ICE](http://www.zeroc.com) stack

-   [Gtk\#](http://gtk-sharp.sf.net): Bindings for the popular Gtk+ GUI
    toolkit for UNIX and Windows systems. Other bindings are available:
    Diacanvas-Sharp and MrProject.

-   [\#ZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/Default.aspx):
    A library to manipulate various kinds of compressed files and
    archives (Zip and tar).

-   GlGen (available from the Mono CVS): Bindings for OpenGL.

-   Mono.LDAP: LDAP access for .NET apps.

-   Mono.Data: We ship support for Postgress, MySql, Sybase, DB2,
    SqlLite, Tds (SQL server protocol) and Oracle databases.

-   Mono.Cairo: Bindings for the [Cairo](http://www.cairographics.org)
    rendering engine (Our System.Drawing is implemented on top of this).

-   Mono.Posix: Bindings for building POSIX applications using C\#.

-   Mono.Http: Support for creating custom, embedded HTTP servers and
    common HTTP handlers for your applications.

#### What is the difference between Mono and the .NET Initiative?

The ".NET Initiative" is a somewhat nebulous company-wide effort by
Microsoft, one part of which is a cross-platform development framework.
Mono is an implementation of the development framework, but not an
implementation of anything else related to the .NET Initiative, such as
Passport or software-as-a-service.

#### What technologies are included in Mono?

Mono contains a number of components useful for building new software:

-   A Common Language Infrastructure (CLI) virtual machine that contains
    a class loader, Just-in-time compiler, and a garbage collecting
    runtime.

-   A class library that can work with any language which works on the
    CLR. Both .NET compatible class libraries as well as Mono-provided
    class libraries are included.

-   A compiler for the C\# language. In the future we might work on
    other compilers that target the Common Language Runtime.

Windows has compilers that target the virtual machine from [a number of
languages:](http://msdn.microsoft.com/net/thirdparty/default.asp#lang)
Managed C++, Java Script, Eiffel, Component Pascal, APL, Cobol, Perl,
Python, Scheme, Smalltalk, Standard ML, Haskell, Mercury and Oberon.

The CLR and the Common Type System (CTS) enables applications and
libraries to be written in a collection of different languages that
target the byte code

This means for example that if you define a class to do algebraic
manipulation in C\#, that class can be reused from any other language
that supports the CLI. You could create a class in C\#, subclass it in
C++ and instantiate it in an Eiffel program.

A single object system, threading system, class libraries, and garbage
collection system can be shared across all these languages.

#### Where can I find the specification for these technologies?

You can find the information here:

C\#
[<http://www.ecma.ch/ecma1/STAND/ecma-334.htm>](http://www.ecma.ch/ecma1/STAND/ecma-334.htm)

CLI
[<http://www.ecma.ch/ecma1/STAND/ecma-335.htm>](http://www.ecma.ch/ecma1/STAND/ecma-335.htm)

#### Will you implement the .NET Framework SDK class libraries?

Yes, we will be implementing the APIs of the .NET Framework SDK class
libraries.

#### Will you offer an ECMA-compliant set of class libraries?

Eventually we will. Our current focus is on inter-operating with the
Microsoft SDK, but we will also offer an ECMA compliant subset of the
libraries.

#### What does the name "Mono" mean?

Mono is the word for 'monkey' in Spanish. We like monkeys.

#### Does Mono work today?

The execution engine works on various platforms, we support Just-in-Time
and Ahead-of-Time compilations on Intel x86 machines (and soon PowerPC).

The class libraries are mature enough to run various real applications:
our C\# compiler, ASP.NET, and Gtk\#-based applications.

#### When will you ship Mono?

Please see the [Mono Roadmap]({{site.url}}/Mono Roadmap "wikilink") for more details
on the release plans.

#### How can I contribute?

Check the [contributing]({{site.url}}/ "wikilink") section.

#### Aren't you just copying someone else's work?

We are interested in providing the best tools for programmers to develop
applications for Free Operating Systems. We also want to help provide
the interoperability that will allow those systems to fit in with other
standards.

For more background, read the [Mono Project white
paper](http://www.go-mono.com/rationale.html). the project.

#### Miguel said once that Mono was being implemented in COBOL. Is that true?

.

No. It was a joke.

The Novell Role in the Mono Project
-----------------------------------

#### Why is Novell working on .NET?

Novell is interested in providing the best tools for programmers to
develop applications for Free Operating Systems.

For more information, read the project
[rationale]({{site.url}}/Mono Rationale "wikilink") page.

#### Will Novell be able to take on a project of this size?

Of course not. Novell is a supporter of the Mono project, but the only
way to implement something of this size is for the entire free software
community to get involved. Visit the [contributing]({{site.url}}/ "wikilink") page if
you'd like to help out.

#### What pieces is Novell working on?

We will devote most of our resources to work on the pieces which are on
the critical path to release a development and execution environment.
Once the project is at a stage where it is useful in the real world, it
will achieve a critical mass of developers to improve it further.

#### Will Novell offer Mono commercially?

When Mono is ready to be shipped Ximian will offer a commercial support
and services for Mono. Mono components are also available to be licensed
commercially. For licensing details, contact <mono-licensing@ximian.com>

#### Does Novell provide consulting services around Mono?

Yes, Novell does provide consulting services around Mono to make it
suitable to your needs. Porting the runtime engine, customizing it,
working on specific classes or tuning the code for your particular
needs.

Please contact <mono-licensing@ximian.com> for consulting services
information.

#### Will you wait until Mono is finished?

Mono will ship on various stages as they mature. Some people require
only a subset of the technologies, those will ship first, see the [Mono
Roadmap]({{site.url}}/Mono Roadmap "wikilink") for details

Mono and GNOME
--------------

#### How is Mono related to GNOME?

In a number of ways. This project was born out of the need of providing
improved tools for the GNOME community, and will use existing components
that have been developed for GNOME when they are available. For example,
we plan to use Gtk+ and Libart to implement Winforms and the Drawing2D
API and are considering GObject support.

Mono team members work actively on the [Gtk\#](http://gtk-sharp.sf.net)
project: a binding of the GNOME class libraries for .NET and Mono.

#### Has the GNOME Foundation or the GNOME team adopted Mono?

Mono is too new to be adopted by those groups. We hope that the tools
that we will provide will be adopted by free software programmers
including the GNOME Foundation members and the GNOME project generally.

#### Should GNOME programmers switch over to Mono now?

It is still far to early for discussions of "switching over." No pieces
of Mono will be ready within the next six months, and a complete
implementation is roughly one year away.

We encourage GNOME developers to continue using the existing tools,
libraries and components. Improvements made to GNOME will have an impact
on Mono, as they would be the "back-end" for various classes.

#### Will Mono include compatibility with Bonobo components? What is the relationship between Mono and Bonobo?

Yes, we will provide a set of classes for implementing and using Bonobo
components from within Mono. Mono should allow you to write Bonobo
components more easily, just like .NET on Windows allows you to export
.NET components to COM.

#### Does Mono depend on GNOME?

No, Mono does not depend on GNOME. We use a few packages produced by the
GNOME team like the 'glib' library, we also use other third-party open
source libraries like Cairo and ICU.

#### But will I be able to build GNOME applications?

Yes, we will enable people to write GNOME applications using Mono.

#### Do you have C\# bindings for GNOME?

.

Yes, the [Gtk\# project](http://gtk-sharp.sf.net) provides bindings for
Gtk+, Gdk, Atk, libgnome, libgnomecanvas, and libgnomeui. Other
libraries under the GNOME framework will be added on an as-needed (and
as-requested) basis.

GUI applications
----------------

#### Will Mono enable GUI applications to be authored?

Yes, you will be able to build GUI applications. Indeed, that is our
main focus. Today you can use Gtk\# or \#WT to develop GUI applications,
and support for Windows.Forms is underway.

#### What is the difference between Gtk\# and System.Windows.Forms?

Gtk\# is a set of bindings for the Gtk+ toolkit for C\# (and other
CIL-enabled languages), it integrates natively with the Gnome desktop.
System.Windows.Forms is an API defined by Microsoft to build GUI
applications.

#### What are you using to implement Windows.Forms?

See the <a
href="../contributing/winforms.html">WinForms page</a>

#### Why not implement System.Windows.Forms on top of Gtk\# or Qt\#?

Compatibility.

Although it is possible to run simple Windows.Forms applications with
the Gtk\#-based backend of Windows.Forms, it is very unlikely that the
implementation will ever implement everything needed for full
compatibility with Windows.Forms.

The reason is that Windows.Forms is not a complete toolkit, and to work
around this problem some of the underlying Win32 foundation is exposed
to the programmer in the form of exposing the Windows message handler
(WndProc). Any control can override this method. Also developers often
P/Invoke into Win32 to get to functionality that was not wrapped.

To achieve full compatibility, we would have to emulate this, and it
would take too long.

For more details see the [winforms page]({{site.url}}/Windows Forms "wikilink")

#### Wine applications do not look like native applications, what are you going to do about this?

We have already a few patches into our version of Windows.Forms that
makes Wine use the colors and font settings from your desktop, improving
the integration a lot. In the future, we will continue to improve this
interoperability scenario.

#### Will I be able to run my smart clients on systems powered by Mono?

As long as your applications are 100% .NET and do not make use of
P/Invoke to call Win32 functions, your smart client applications will
run on Mono platforms.

#### Where can I learn more about Gtk\#?

The following [link](http://gtk-sharp.sourceforge.net) sends you to the
page of the project.

#### What can I do with Gtk\#?

.

Gtk\# is becoming very usable and you can create applications and
applets like those you see in a GNOME desktop environment. It's easy to
install so it's worth a try.

#### How can I compile my HelloWorld.cs which uses Gtk\#?

.

Try: mcs -r:gtk-sharp HelloWorld.cs

#### Is there any way how to connect DataAdapter to some Gtk\# controls?

There is a sample file called 'DbClient' in gtk-sharp/samples that you
might to look at. It is a sample program in Gtk\# that
adds/updates/deletes information on a Postgress database. When we have
the new table/tree widgets, I am sure someone would write an adapter for
System.Data (in Gtk2 the tree/list widgets are written using a
view/model, so you only need to write a model that maps to the
database). You can have a look at gtk-sharp/sample/DbClient, where there
is a Gtk\# application that uses System.Data. It does not use
DataAdapter, but DataReader though.

#### Do you have an estimate for when Windows.Forms will be released?

The plan currently is aimed at Q4/2004.

#### Do you have a comparission chart about the various toolkit offerings?

A document explaining this is available at:
[<http://primates.ximian.com/~miguel/toolkits.html>](http://primates.ximian.com/~miguel/toolkits.html).

Mono and Microsoft
------------------

#### Is Microsoft helping Ximian with this project?

There is no high level communication between Ximian and Microsoft at
this point, but engineers who work on .NET or the ECMA groups have been
very friendly, and very nice to answer our questions, or clarify part of
the specification for us.

Microsoft is interested in other implementations of .NET and are willing
to help make the ECMA spec more accurate for this purpose.

Ximian was also invited to participate in the ECMA committee meetings
for C\# and the CLI.

#### Are Microsoft or Corel paying Ximian to do this?

No.

#### Do you fear that Microsoft will change the spec and render Mono useless?

No. Microsoft proved with the CLI and the C\# language that it was
possible to create a powerful foundation for many languages to
inter-operate. We will always have that.

Even if changes happened in the platform which were undocumented, the
existing platform would a value on its own.

#### Are you writing Mono from the ECMA specs?

Yes, we are writing them from the ECMA specs and the published materials
in print about .NET.

#### If my applications use Mono, will I have to pay a service fee?

No. Mono is not related to Microsoft's initiative of
software-as-a-service.

#### Is the Mono Project is related to the Microsoft Hailstorm effort? Is Ximian endorsing Hailstorm?

No. The Mono Project is focused on providing a compatible set of tools
for the Microsoft .NET development platform. It does not address,
require, or otherwise endorse the MS Passport-based Hailstorm single
sign-on system that is part of Windows XP and other services.

#### Will Mono or .NET applications depend on Microsoft Passport?

No. MS Passport is unrelated to running .NET compatible applications
produced with the Mono tools. The only thing you will need is a
just-in-time compiler (JIT).

#### If Microsoft will release a port of their .NET platform under the 'Shared Source' license, why should I bother with anything else?

The Shared Source implementation will be expensive and its uses will be
tightly restricted, especially for commercial use. We are working
towards an implementation that will grant a number of important rights
to recipients: use for any purpose, redistribution, modification, and
redistribution of modifications.

This is what we call [Free
Software](http://www.gnu.org/philosophy/free-sw.html)

#### Is Mono a free implementation of Passport?

No. Mono is just a runtime, a compiler and a set of class libraries.

#### Will the System.Web.Security.PassportIdentity class mean that my software will depend on Passport?

No. Applications may use that API to contact a Passport site, but are
not required to do so.

As long as your application does not use Passport, you will not need
Passport.

#### Will Mono running on Linux make Passport available for Linux?

No. However, the Passport toolkit for Linux-based web servers is
available from Microsoft.

#### Will Mono allow me to run Microsoft Office on Linux?

No, it will not. Microsoft Office is a Windows application. To learn
more about running Windows applications on Intel UNIX systems refer to
[the Wine Project](http://www.winehq.com).

#### Can mono run the WebMatrix?

No. That requires System.Windows.Forms support which is not currently
implemented.

#### Does mono have something like Passport? Will mono have a server side Passport/Similar framework for XSP as well as client classes?

Not yet, but the client side API for authentication is not the problem.
We will likely have a lot of other authentication APIs, like the Liberty
Alliance APIs. The problem is people on the web provider end that might
use this for authentication.

Mono Platforms
--------------

#### What operating systems does Mono run on?

Mono is known to run on Linux, UNIX and Windows systems.

#### Can I run Mono applications without using 'mono program.exe'?

Yes, this is possible on Linux systems, to do this, use something like:


    if [ ! -e /proc/sys/fs/binfmt_misc/register ]; then
    /sbin/modprobe binfmt_misc
    mount -t binfmt_misc none /proc/sys/fs/binfmt_misc
    fi
    if [ -e /proc/sys/fs/binfmt_misc/register ]; then
    echo ':CLR:M::MZ::/usr/bin/mono:' > /proc/sys/fs/binfmt_misc/register
    else
    echo "No binfmt_misc support"
    exit 1
    fi

#### What architectures does Mono support?

Mono today ships with a Just-in-Time compiler for x86, PowerPC and
SPARC-based systems. It is tested regularly on Linux, FreeBSD and
Windows (with the XP/NT core).

There is also an interpreter, which is slower that runs on the s390,
SPARC, HPPA, StrongARM and PowerPC architectures.

#### Can Mono run on Windows 9x, or ME editions?

Mono requires Unicode versions of Win32 APIs to run, and only a handful
of

-   W functions is supported under Win9x.

There is Microsoft Layer for Unicode that provides implementation of
these APIs on 9x systems.

Unfortunately it uses linker trick for delayed load that is not
supported by ld, so some sort of adapter is necessary. You will need
MSLU and one of the following libs to link Mono to unicows.dll
[<http://mono.eurosoft.od.ua/files/unimono.zip>](http://mono.eurosoft.od.ua/files/unimono.zip)
or alternatively search the net for "libunicows".

No changes to Mono source code required, the only thing is to make sure
that linker will resolve imports to adapter library instead of Win32
libs. This is achieved by inserting -lunimono before -lkerner32/user32
in the linker's specs file.

#### Why support Windows, when you can run the real thing?

There are various reasons:

-   About half the contributors to Mono are Windows developers. They
    have many different for contributing to the effort, and we find it
    very important to let those developers run the runtime on Windows
    without forcing them to use a new operating system.

-   Supporting Windows helps us identify the portable portions of Mono
    from the non-portable versions of it, helping Mono become more
    portable in the future.

-   Mono does not heavily modify the windows registry, update system
    DLLs, install DLLs to the Windows/System32 path. Another words, I
    knew Mono would not cause any legacy enterprise applications to stop
    working - and it hasn't. However, our CIO er is againt it because of
    the changes that would be made to Windows 2000, such as, affecting
    security.

Compatibility
-------------

#### Can Mono run applications developed with the Microsoft.NET framework?

Yes, Mono can run applications developed with the Microsoft .NET
Framework on UNIX. There are a few caveats to keep in mind: Mono has not
been completed yet, so a few API calls might be missing; And in some
cases the Mono behavior

-   might
-   be incorrect.

#### Will missing API entry points be implemented?

Yes, the goal of Mono is to implement precisely the .NET Framework API
(as well as compile-time selectable subsets, for those interested in a
lighter version of Mono).

#### If the behavior of an API call is different, will you fix it?

Yes, we will. But we will need your assistance for this. If you find a
bug in the Mono implementation, please fill a bug report in
[<http://bugzilla.ximian.com>](http://bugzilla.ximian.com). Do not
assume we know about the problem, we might not, and using the bug
tracking system helps us organize the development process.

#### Can I develop my applications on Windows, and deploy on a supported Mono platform (like Linux)?

Yes, you can.

As of today, Mono is not 100% finished, so it is sometimes useful to
compile the code with Mono, to find out if your application depends on
unimplemented functionality.

#### Will applications run out the box with Mono?

Sometimes they will. But sometimes a .NET application might invoke Win32
API calls, or assume certain patterns that are not correct for
cross-platform applications.

#### What is a 100% .NET application?

A '100% .NET application' is one that only uses the APIs defined under
the System namespace and does not use P/Invoke. These applications would
in theory run unmodified on Windows, Linux, HP-UX, Solaris, MacOS X and
others.

Note that this requirement also holds for all assemblies used by the
application. If one of them is Windows-specific, then the entire program
is not a 100% .NET application.

Furthermore, a 100% .NET application must not contain non-standard data
streams in the assembly. For example, Visual Studio .NET will insert a
`#-` stream into assemblies built under the "Debug" target. This stream
contains debugging information for use by Visual Studio .NET; however,
this stream can not be interpreted by Mono (unless you're willing to
donate support).

Thus, it is recommended that all Visual Studio .NET-compiled code be
compiled under the Release target before it is executed under Mono.

#### Can I execute my Visual Studio .NET program (Visual Basic .NET, Visual C\#, Managed Extensions for C++, etc.) under Mono?

Yes, with some reservations.

The .NET program must either be a 100% .NET application, or (somehow)
have all dependent assemblies available on all desired platforms. (How
to do so is outside the bounds of this FAQ.)

Mono must also have an implementation for the .NET assemblies used. For
example the System.EnterpriseServices namespace is part of .NET, but it
has not been implemented in Mono. Thus, any applications using this
namespace will not run under Mono.

With regards to languages, C\# applications tend to be most portable.

Visual Basic .NET applications are portable, but Mono's
Microsoft.VisualBasic.dll implementation is incomplete. It is
recommended to either avoid using this assembly in your own code, only
use the portions that Mono has implemented, or to help implement the
missing features. Additionally, you can set 'Option Strict On', which
eliminates the implicit calls to the unimplemented
Microsoft.VisualBasic.CompilerServices.ObjectType class. (Thanks to
JÃƒÂ¶rg Rosenkranz.)

Managed Extensions for C++ is least likely to operate under Mono. Mono
does not support mixed mode assemblies (that is, assemblies containing
both managed and unmanaged code, which Managed C++ can produce). You
need a fully-managed assembly to run under Mono, and getting the Visual
C++ .NET compiler to generate such an executable can be difficult. You
need to use only the .NET-framework assemblies, not the C libraries (you
can't use <b>printf</b>(3) for example.), and you need to use the linker
options `/nodefaultlib /entry:main mscoree.lib` in addition to the
`/clr` compiler flag. You can still use certain compiler intrinsic
functions (such as <b>memcpy</b>(3)) and the STL. You should also see
[Converting Managed Extensions for C++ Projects from Mixed Mode to Pure
Intermediate
Language](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vcmex/html/vcgrfconvertingmanagedextensionsforcprojectsfrommixed-modetopureil.asp)
at MSDN. Finally, you can use PEVERIFY.EXE from the .NET SDK to
determine if the assembly is fully managed.

Thanks to Serge Chaban for the linker flags to use.

Mono and Portable.NET
---------------------

#### What are the differences between Mono and Portable.NET?

Most of Mono is being written using C\#, with only a few parts written
in C (The JIT engine, the runtime, the interfaces to the garbage
collection system).

It is easier to describe what is unique about Mono:

-   An advanced native-code compilation engine: Both just-in-time
    compilation (JIT) and pre-compilation of CIL bytecodes into native
    code are supported.

-   A foundation for code optimization: The new code generator in Mono
    builds on the experience of our first JIT engine, and enables us to
    implement various advanced compiler optimization tricks. With an
    SSA-framework, plenty of new optimizations are possible.

The current list of optimizations are: Peephole postpass, Branch
optimizations, Inline method calls, Constant folding, Constant
propagation, Copy propagation, Dead code elimination, Linear scan global
reg allocation, Conditional moves, Emit per-domain code, Instruction
scheduling, Intrinsic method implementations, Tail recursion and tail
calls, Loop related optimizations, Fast x86 FP compares, Leaf procedures
optimizations

-   A self-hosting C\# compiler written in C\#, which is clean, easy to
    maintain.

-   Focus on the .NET Framework: we are tracking down the .NET Framework
    API definition, as we believe it is the API people will be most
    familiar with.

-   A multi-platform runtime engine: both a JIT engine and an
    interpreter exist. The JIT engine runs currently on x86, PowerPC and
    Sparc systems, while the interpreter works on x86, SPARC, StrongARM,
    s390 and PowerPC systems.

The JIT engine is being ported to PowerPC, s390, SPARC and amd64 systems
as of this time.

-   Supports Linux, BSD, MacOS, Windows and Solaris at this point.

-   The JIT engine is written using a portable instruction selector
    which not only generates good code but is also the foundation to
    re-target the JIT engine to other systems.

-   Full support for remoting in the runtime.

-   The C\# compiler, the JIT engine and the class libraries are mature
    enough that the whole system has been self-hosting since April 2002.
    This means that we develop Mono completely with itself at this
    point.

By forcing ourselves to use our own code to develop our tools, we bug
fix problems rapidly, and the system is overall more robust and tested
than if we did not.

-   Our class libraries are licensed under the terms of the MIT X11
    license which is a very liberal license as opposed to the GNU GPL
    with exceptions, this means that Mono can be used in places where
    the GPL with exceptions is not permissible.

-   Mono has a complete Web Services stack: we implement ASP.NET web
    servers and web clients as well as implementing the Remoting-based
    SOAP infrastructure.

-   Remoting implementation: Mono has a complete remoting infrastructure
    that is used in our own codebase to provide added functionality and
    performance to our ASP.NET engine and more.

-   Mono has a complete [C\# 1.0]({{site.url}}/C Sharp "wikilink") implementation and
    has been stress tested a lot more than Portable.NET's compiler.

-   Mono's C\# compiler has strong error handling and has closer
    adherence to the specification.

-   Mono's C\# compiler is written in C\# which is easier for new
    developers to come in and improve, fix and tune. The Mono C\#
    compiler in C\# is faster than their C-based compiler.

-   Preview of C\# 2.0: a work in progress for a 2.0 implementation of
    our compiler is available (iterators, generics and anonymous methods
    are available in our "preview" compiler).

-   Mono has a complete Reflection and Reflection.Emit: these are
    important for advanced applications, compilers and dynamic code
    generation.

-   Mono has a [complete managed XML stack]({{site.url}}/ "wikilink"): XML, XPath,
    XML Serializer, XML Schema handling are fully functional, feature
    complete and tuned for performance.

-   Mono has a [complete cryptography stack]({{site.url}}/ "wikilink"): we implement
    the 1.0 and 1.1 APIs as well as using our fully managed stack to
    implement the SSL/TLS transports.

-   [Extensive database support]({{site.url}}/ADO.NET "wikilink"): Mono ships with
    database provides for [Firebird]({{site.url}}/Firebird Interbase "wikilink"),
    [IBM DB2](IBM DB2{{site.url}}/ "wikilink"), [Oracle]({{site.url}}/Oracle "wikilink"),
    [Sybase]({{site.url}}/Sybase "wikilink"), Microsoft [SQL
    Server]({{site.url}}/TDS Generic "wikilink"), [SQL Lite]({{site.url}}/SQL Lite "wikilink"),
    [MySQL]({{site.url}}/MySQL "wikilink"), ="postgresql"\>PostgresSQL</A>, [Ole
    DB]({{site.url}}/OLE DB "wikilink") and [ODBC]({{site.url}}/ODBC "wikilink").

-   Mono includes full LDAP support.

-   We have a great community of developers, without which Mono would
    not be possible.

In general, Mono is more mature and complete since it has been used to
develop itself, which is a big motivator for stability and correctness,
while Portable.NET remains pretty much an untested platform.

#### I hear Mono keeps changing the P/Invoke API, why?

We are just fixing our implementation to be compatible with the
Microsoft implementation. In other words, the Mono P/Invoke API is more
complete when compared to the Portable.NET version, hence various pieces
of software that depend on this extended functionality fail to work
properly with Portable.NET.

Web Services
------------

#### How is Mono related to Web Services?

Mono is only related to Web Services in that it will implement the same
set of classes that have been authored in the .NET Framework to simplify
and streamline the process of building Web Services.

But most importantly, Mono is an Open Source implementation of the .NET
Framework.

#### Can I author Web Services with Mono?

You will be able to write Web Services on .NET that run on Mono and
vice-versa.

#### If Mono implements the SDK classes, will I be able to write and execute .NET Web Services with it?

Yes. When the project is finished, you will be able to use the same
technologies that are available through the .NET Framework SDK on
Windows to write Web Services.

#### What about Soup? Can I use Soup without Mono?

Soup is a library for GNOME applications to create SOAP servers and SOAP
clients, and can be used without Mono. You can browse the source code
for soup using [GNOME's Bonsai](http://cvs.gnome.org/bonsai/).

#### Can I use CORBA?

Yes. The CLI contains enough information about a class that exposing it
to other RPC systems (like CORBA) is really simple, and does not even
require support from an object.

[Remoting.CORBA](http://remoting-corba.sourceforge.net/) is a CORBA
implementation that is gaining momentum.

Building an implementation of the Bonobo interfaces once this is ready
should be relatively simple.

#### Can I serialize my objects to other things other than XML?

Yes, although the serializing tools have not yet been planned, and you
would probably have to implement them yourself.

#### Will Mono use ORBit?

There are a few advantages in using ORBit, like reusing existing code
and leveraging all the work done on it. Michael Meeks has posted a few
[reasons](http://lists.ximian.com/archives/public/mono-list/2002-September/008592.html),
as well as some
[ideas](http://lists.ximian.com/archives/public/mono-list/2002-September/008657.html)
that could be used to reuse ORBit.

Most users are likely to choose a native .NET solution, like
[Remoting.CORBA](http://cvs.gnome.org/bonsai)

MonoDoc
-------

#### What is MonoDoc?

MonoDoc is a graphical documentation browser for the Mono class
libraries. Currently, monodoc consists of a Gtk\# application and is in
heavy development.

Development Tools and Issues
----------------------------

ion 74:</b> I am having trouble compiling a new version of Mono from
CVS, it complains about my runtime being out of sync.

To upgrade your class libraries and compiler, see the INSTALL.txt in the
MCS directory.

The single biggest source of confusion seems to be the "Your runtime is
out of sync" messages. Realize that this is

-   normal
-   while BUILDING. Think about it: you're building a new class library
    with the old runtime. If the new class library references a function
    that the old runtime knows nothing about, the runtime system issues
    this warning.

Basically what needs to happen is for a new mono runtime to be compiled,
then the corlib class library be compiled, and once this is done,
install the new runtime, followed by corlib.

Once this is done, you can continue building your entire environment.

For instance you just need to: 1.- Upgrade your Mono runtime (you might
better do it with the mono-build.sh script available
![here](http://localhost:4000/files/Mono-build.sh "fig:here")). 2.- Get
the latest mono-lite tarball from the daily snapshots
[page](http://www.go-mono.com/daily/), unzip and untar and copy all the
dll files to your install path lib directory (typically pointed by the
\$MONO\_PATH variable). Copy all the exe files to the install path bin
directory. 3.- Then checkout or update your mcs CVS copy. Then follow
the steps described in mcs/INSTALL.txt.

#### Will it be possible to use the CLI features without using byte codes or the JIT?

Yes. The CLI engine will be made available as a shared library. The
garbage collection engine, the threading abstraction, the object system,
the dynamic type code system and the JIT are available for C developers
to integrate with their applications if they wish to do so.

#### Will you have new development tools?

With any luck, Free Software enthusiasts will contribute tools to
improve the developer environment. These tools could be developed
initially using the Microsoft implementation of the CLI and then
executed later with Mono.

We are recommending people to use and contribute to existing projects
like SharpDevelop, Anjuta and Eclipse.

#### What kind of rules make the Common Intermediate Language useful for JITers?

The main rule is that the stack in the CLI is not a general purpose
stack. You are not allowed to use it for other purposes than computing
values and passing arguments to functions or return values.

At any given call or return instruction, the types on the stack have to
be the same independently of the flow of execution of your code.

#### Is it true that the CIL is ideal for JITing and not efficient for interpreters?

The CIL is better suited to be JITed than JVM byte codes, but you can
interpret them as trivially as you can interpret JVM byte codes.

#### Isn't it a little bit confusing to have the name of "XSP" (the same as in the Apache Project) for the ASP.NET support in Mono?

.

In Mono, xsp is just the name of the C\# code generator for ASP.NET
pages. In the Apache Project, it is a term for the "eXtensible Server
Pages" technology so as they are very different things, they don't
conflict.

#### Is there any plan to develop an aspx server for Mono?

.

The XSP reference server is available and you can also use mod\_mono
with Apache.

#### Is there any way I can develop the class libraries using Linux yet?

Yes. Mono has been self hosting since May 2002.

#### Is there any way I can install a known working copy of mono in /usr, and an experimental copy somewhere else, and have both copies use their own libraries?

`(I'm still not very good at library paths in Linux)`

Yes. Just use two installation prefixes.

#### How should I write tests or a tests suite?

If you do a test suite for C\#, you might want to keep it independent of
the Mono C\# compiler, so that other compiler implementations can later
use it.

#### Would it be too terrible to have another corlib signed as mscorlib?

We rename corlib to mscorlib also when saving the PE files, in fact, the
runtime can execute program created by mono just fine.

#### Is it possible to build a C\# file to some sort of intermediate format which can linked into a final module, like the traditional .c -\> .o -\> .so path?

You can use:

mcs /target:library file1.cs, mcs /target:library file2.cs, mcs
/target:exe file1.dll file2.dll /out:mybin.exe

#### Is there any plans for implementing remoting in the near future?

The remoting infrastructure is in place. We have implementations of the
TcpChannel, HttpChannel and the Soap and Binary Formatters. They are
compatible with .NET.

However, some classes from the library may have a different binary
representation, because they may have a different internal data
structure, so for example you won't be able to exchange a Hastable
object between Mono and MS.NET. It should not be a problem if you are
using primitive types, arrays or your own classes. In any case, could
you post a test case?

#### My C code uses the \_\_stdcall which is not availble on Linux, how can I make the code portable Windows/UNIX across platforms?

Replace the \_\_stdcall attribute with the STDCALL macro, and include
this in your C code for newer gcc versions:


    #ifndef STDCALL
    #define STDCALL __attribute__((stdcall))
    #endif

#### I want to be able to execute Mono binaries, without having to use the "mono" command. How can I do this?

From Carlos PerellÃƒÂ³:

<i>I think that the best solution is the binfmt feature with the wrapper
that exists with Debian packages at:

[<http://www.debianplanet.org/mono/dists/unstable/main/source/admin/>](http://www.debianplanet.org/mono/dists/unstable/main/source/admin/)

If you want use it with Big endian machines, you should apply a patch
([<http://carlos.pemas.net/debian/mono/binfmt-detector-cli.c.diff>](http://carlos.pemas.net/debian/mono/binfmt-detector-cli.c.diff))

It works really good and lets you use wine also, it reads the .exe file
headers and check if it's a .net executable.

This way you just execute: ./my-cool-mono-application.exe and it works
without the need of any wrapper.</i>

#### I see funny characters when I run programs, what is the problem?

(From Peter Williams and Gonzalo Paniagua):

This is Red Hat 9 (probably) using UTF8 on its console; the bytes are
the UTF8 endianness markers. You can do:


    LC_ALL=C mono myexe.exe

And they wont show up.

Alternatively, you can do:


    $ echo -e "\033%G"

to enable UTF-8 on the console.

Mono and ASP.NET
----------------

#### Does Mono support ASP.NET?

Yes.

Mono supports ASP.NET, we have shown an unmodified IBuySpy installation
running on Mono as well as various other programs. You can try it
yourself downloading the XSP server.

#### Do I need install cygwin to work on ASP.NET in mono or Linux is enough since it is self host right now?

Linux is enough.

#### How can I run ASP.NET-based applications with Mono?

You need the Mono runtime and a hosting web server. Currently we
distribute a small web server called 'xsp' which is used to debug
applications, or you can choose to use Daniel's Apache 2 module.

#### Any plan to make ASP.NET in mono works with Apache in Linux?

.

Daniel has authored an Apache2 Module for Mono that hosts the ASP.NET
runtime and is available here:
[<http://apacheworld.org/modmono/>](http://apacheworld.org/modmono/)

#### Will you support Apache 1?

Modules developed for Apache 2 are not compatible with Apache 1.3 Daniel
plans to support Apache 1.3 in the future but the current focus is on
Apache 2, because of the better support for threading and Windows.

#### Can I run Apache 1 and Apache 2 on the same machine?

You can always keep a copy of Apache 2 running in parallel with your
Apache 1.3 (either different port or using a reverse proxy).

You can also bind the two servers to different IP addresses on the same
physical machine.

Mono and ADO.NET
----------------

#### What is the status of ADO.NET support?. Could I start migrating applications from MS.NET to Mono?

You could start right now using the ADO.NET support in mono, of course,
if you want to help filling the missing gaps while you develop your app
:-) Well, what I mean is that we're not that far to having full ADO.NET
support in Mono, and we've got a lot of working things, so if we could
get more help, we'd finish it really soon :-)

#### In developing the data architecture for the application are there and objects I should stay away from in order to insure the smoothest possible transition (minimum code rewrite) to Mono's ADO.NET implementation?

`(For example, strongly typed datasets versus untyped datasets, etc...)`

We are implementing all the classes in Microsoft .NET's System.Data, so
you can be sure that things will work the same in Mono as with the
Microsoft implementation.

==== Does Mono can to connect to Sybase by using Mono.Data.

-   ? ====

Yes. use Mono.Data.SybaseClient. First of all you have to create a
SybaseConnection, and then, from it, use it as any other
IDbConnection-based class.

Mono and Java
-------------

#### Why don't you use Java?

`After all, there are many languages that target the Java VM.`

You can get very good tools for doing Java development on free systems
right now. [Red Hat](http://www.redhat.com) has contributed a
[GCC](http://gcc.gnu.org) [front-end for Java](http://gcc.gnu.org/java/)
that can take Java sources or Java byte codes and generate native
executables; [Transvirtual](http://www.google.com/search?q=transvirtual)
implemented [Kaffe](http://www.kaffe.org) a JIT engine for Java; Intel
also has a Java VM called [ORP](http://www.intel.com/research/mrl/orp/).

The JVM is not designed to be a general purpose virtual machine. The
Common Intermediate Language (CIL), on the other hand, is designed to be
a target for a wide variety of programming languages, and has a set of
rules designed to be optimal for JITers.

#### Could Java target the CLI?

Yes, Java could target the CLI, Microsoft's J\# compiler does that.

The [IKVM](http://weblog.ikvm.net/) project builds a Java runtime that
works on top of .NET and on top of Mono. IKVM is essentially a JIT
compiler that translates from JVM bytecodes into CIL instructions, and
then lets the native JIT engine take over.

#### Is it possible to write a JVM byte code to CIL converter?

Yes, this is what [IKVM](http://weblog.ikvm.net) does.

#### Could mono become a hybrid CIL/java platform?

This can be obtained easily with IKVM.

#### Do you plan to implement a Javascript compiler?

Yes. The beginnings of the JScript compiler can be found on CVS. Cesar
coordinates this effort.

#### Can Mono or .NET share system classes (loaded from mscore.dll and other libs) or will it behave like Sun's Java VM?

What you can do with mono is to load different applications in their own
application domain: this is a feature of the CLR that allows sandboxing
applications inside a single process space. This is usualy exploited to
compartmentalize different parts of the same app, but it can also be
effectively used to reduce the startup and memory overhead. Using
different appdomains the runtime representation of types and methods is
shared across applications.

Extending Mono
--------------

#### Would you allow other classes other than those in the specification?

Yes. The Microsoft class collection is very big, but it is by no means
complete. It would be nice to have a port of 'Camel' (the Mail API used
by Evolution inspired by Java Mail) for Mono applications.

You might also want to look into implementing CORBA for Mono. Not only
because it would be useful, but because it sounds like a fun thing to
do, given the fact that the CLI is such a type rich system.

For more information on extending Mono, see our
[ideas]({{site.url}}/Ideas "wikilink") page.

#### Do you plan to Embrace and Extend .NET?

Embracing a good technology is good. Extending technologies in
incompatible ways is bad for the users, so we do not plan on making
incompatible changes to the technologies.

If you have innovative ideas, and want to create new classes, we
encourage you to make those classes operate correctly well in both Mono
and .NET.

Today Mono ships with a number of extra libraries that were developed
either by members of the Mono community, or other groups.

In some cases, we have found the bits from Microsoft to be incomplete,
but we avoid breaking the API, instead we expose the missing
functionality in new assemblies (See Mono.Security and System.Security).

#### Is there any way I can develop the class libraries using Linux yet?

Yes. Mono has been selfhosting since March 2002.

#### Is there any way I can install a known working copy of mono in /usr, and an experimental copy somewhere else, and have both copies use their own libraries?

`(I'm still not very good at library paths in Linux)`

Yes. Just use two installation prefixes.

Portability
-----------

#### Will Mono only work on Linux?

Currently, we are doing our work on Linux-based systems and Windows. We
do not expect many Linux-isms in the code, so it should be easy to port
Mono to other UNIX variants.

#### What about Mono on non Linux-based systems?

Our main intention at Ximian is to be able to develop GNOME applications
with Mono, but if you are interested in providing a port of the Winforms
classes to other platforms (frame buffer or MacOS X for example), we
would gladly integrate them, as long they are under an open source
license.

ion 111:</b> What operating systems/CPUs do you support

Mono currently runs on Linux, Windows, Solaris, FreeBSD, HP-UX and MacOS
X.

There is a JIT engine available for x86 processors that can generate
code and optimizations tailored for a particular CPU.

Interpreters exist for the SPARC v8, SPARC v9, Itanium, HP-PA, PowerPC
and StrongARM CPUs.

#### Does Mono run on Windows?

Yes. You can get pre-compiled binaries from
[<http://www.mono-project.com/downloads/index.html>]({{site.url}}/Downloads "wikilink")

#### Does Mono run on Linux?

Yes. You can get pre-compiled binaries from
[<http://www.mono-project.com/downloads/index.html>]({{site.url}}/Downloads "wikilink")

#### Will I require Cygwin to run mono?

No. Cygwin is only required to build Mono.

#### Will Mono depend on GNOME?

It will depend only if you are using a particular assembly (for example,
for doing GUI applications). If you are just interested in Mono for
implementing a 'Hello World Enterprise P2P Web Service', you will not
need any GNOME components.

#### Do you plan to port Rhino to C\#?

.

Eto Demerzal has started a Rhino port to C\#.

#### Has anyone succeeded in building a Mac version of the C\# environment. If so can you explain how?

Yes, Mono works on Linux/PPC and MacOS X (10.2 and 10.3)

Reusing Existing Code
---------------------

#### What projects will you reuse or build upon?

We want to get Mono in the hands of programmers soon. We are interested
in reusing existing open source software.

#### Will I be able to use Microsoft SQL Server 2000 or will I need to switch to a specific Open Source Database. Will I need to recode?

There is no need to rewrite your code as long as you keep using
Microsoft SQL Server. If you want to use an open source database, you
might need to make changes to your code.

#### What do I need to watch out for when programming in VB.NET so that I'm sure to be able to run those apps on Linux?

Not making any P/Invoke or DLL calls should and not using anything in
the Microsoft.

-   namespaces should suffice. Also do not use any Methods/Classes
    marked as "This type/method supports the .NET Framework
    infrastructure and is not intended to be used directly from your
    code." even if you know what these classes/methods do.

#### Will built-in reporting be supported for crystal reports?

`This is a heavily used part of our system.`

Crystal Reports are propriety. Someone may try to emulate the behavior,
but no-one has yet volunteered.

#### Who about writing to the registry? As I understand it, Linux does not have a counterpart to the registry. Should I avoid relying on that feature?

Try to avoid it. Although there would be a emulation for registry in
Mono too. GNOME does have a registry like mechanism for configuration.
But Even if gnome has a configuration system similar to the registry,
the keys will not be equal, so you will probably end up having to do
some runtime detection, and depending on this load an assembly that has
your platform-specific hacks.

#### System.Data.SqlClient with FreeTDS, will you port parts of these to C\# and use them?

This has been done.

Mono and GCC
------------

#### Are you working on a GCC front-end to C\#? A GCC back-end that will generate CIL images?

We would love to see a GCC modification that would generate CIL images,
but there is nothing at this point.

The open64 compiler effort from SGI already has modified GCC to generate
a new intermediate language instead of RTL. This could be the foundation
to generate CIL code, and to implement the upcoming Managed extensions
to C++ from ECMA.

#### What about making a front-end to GCC that takes CIL images and generates native code?

There is no active work on this area, but Mono already provides
pre-compilation services (Ahead-of-Time compilation).

#### But would this work around the GPL in the GCC compiler and allow people to work on non-free front-ends?

People can already do this by targeting the JVM byte codes (there are
about 130 compilers for various languages that target the JVM).

Performance
-----------

#### How fast will Mono be?

We can not predict the future, but a conservative estimate is that it
would be at least 'as fast as other JIT engines'.

Mono's JIT engine has been recently re-architected, and it provides many
new features, and layers suitable for optimization. It is relatively
easy to add new optimizations to Mono.

The CIL has some advantages over the Java byte code: The existance of
structs in addition to classes helps a lot the performance and minimizes
the memory footprint of applications.

Generics in the CLI world are first-class citizens, they are not just a
strong-typing addition to the language. The generic specifications are
embedded into the instruction stream, the JIT uses this information to
JIT a unique instances of a method that is optimized for the type
arguments.

The CIL is really an intermediate representation and there are a number
of restrictions on how you can emit CIL code that simplify creating
better JIT engines.

For example, on the CIL, the stack is not really an abstraction
available for the code generator to use at will. Rather, it is a way of
creating a postfix representation of the parsed tree. At any given call
point or return point, the contents of the stack are expected to contain
the same object types independently of how the instruction was reached.

Licensing
---------

#### Will I be able to write proprietary applications that run with Mono?

Yes. The licensing scheme is planned to allow proprietary developers to
write applications with Mono.

#### What license or licenses are you using for the Mono Project?

The C\# Compiler is released under the terms of the [GNU
GPL](http://www.opensource.org/licenses/gpl-license.html). The runtime
libraries are under the [GNU Library
GPL](http://www.opensource.org/licenses/lgpl-license.html). And the
class libraries are released under the terms of the [MIT
X11](http://www.opensource.org/licenses/mit-license.html) license.

The Mono runtime and the Mono C\# Compiler are also available under a
proprietary license for those who can not use the LGPL and the GPL in
their code.

For licensing details, contact <mono-licensing@ximian.com>

#### I would like to contribute code to Mono under a particular license. What licenses will you accept?

We will have to evaluate the licenses for compatibility first, but as a
general rule, we will accept the code under the same terms of the
"container" module.

Patents
-------

#### Could patents be used to completely disable Mono (either submarine patents filed now, or changes made by Microsoft specifically to create patent problems)?

First some background information.

The .NET Framework is divided in two parts: the ECMA/ISO covered
technologies and the other technologies developed on top of it like
ADO.NET, ASP.NET and Windows.Forms.

Mono implements the ECMA/ISO covered parts, as well as being a project
that aims to implement the higher level blocks like ASP.NET, ADO.NET and
Windows.Forms.

The Mono project has gone beyond both of those components and has
developed and integrated third party class libraries, the most important
being: Debugging APIs, integration with the Gnome platform
(Accessibility, Pango rendering, Gdk/Gtk, Glade, GnomeUI), Mozilla,
OpenGL, extensive database support (Microsoft only supports a couple of
providers out of the box, while Mono has support for 11 different
providers), our POSIX integration libraries and finally the embedded API
(used to add scripting to applications and host the CLI, or for example
as an embedded runtime in Apache).

The core of the .NET Framework, and what has been patented by Microsoft
falls under the ECMA/ISO submission. Jim Miller at Microsoft has made a
statement on the patents covering ISO/ECMA, (he is one of the inventors
listed in the patent):
[here](https://mailserver.di.unipi.it/pipermail/dotnet-sscli/msg00218.html).

Basically a grant is given to anyone who want to implement those
components for free and for any purpose.

The controversial elements are the ASP.NET, ADO.NET and Windows.Forms
subsets. Those are convenient for people who need full compatibility
with the Windows platform, but are not required for the open source Mono
platform, nor integration with today's Mono's rich support of Linux.

The Mono strategy for dealing with these technologies is as follows: (1)
work around the patent by using a different implementation technique
that retains the API, but changes the mechanism; if that is not
possible, we would (2) remove the pieces of code that were covered by
those patents, and also (3) find prior art that would render the patent
useless.

Not providing a patented capability would weaken the interoperability,
but it would still provide the free software / open source software
community with good development tools, which is the primary reason for
developing Mono.

The patents do not apply in countries where software patents are not
allowed.

For Linux server and desktop development, we only need the ECMA
components, and things that we have developed (like Gtk\#) or Apache
integration.

#### Is Mono only an implementation of the .NET Framework?

Mono implements both the .NET Framework, as well as plenty of class
libraries that are either UNIX specific, [Gnome](http://www.gnome.org)
specific, or that are not part of the .NET Framework but people find
useful.

The following map shows the relationship between the components:

![](http://localhost:4000/files/monocomponentsmap.png "http://localhost:4000/files/monocomponentsmap.png")

Obfuscation
-----------

#### Are there any obfuscation programs for Mono/Linux?

We are not aware of these, but some from Windows might work.

#### What could I do to avoid people decompiling my program?

You can use the bundle functionality in Mono.

This would bundle your binary inside a Mono runtime instance, so you
distribute a single executable that contains the code inside. Notice
that for this to work and be practical, you need to get a commercial
license to the Mono runtime.

The reason is that the bundle functionality is covered by the LGPL: so
you would have to distribute your assemblies separatedly to allow
developers to relink mono which would defeat the purpose of bundling for
obscuring your code.

It is not impossible to break, just like any other obfuscators.

That being said, value these days does not lie in particular tiny
routines, but lies in the large body of work, and if someone steals your
code, you are likely going to find out anyways.

#### Any other option?

You could precompile with --aot your code, then disassemble the original
.exe, and remove all the code, then re-assemble and ship both the vessel
.exe and the precompiled code.

This is not a supported configuration of Mono, and you would be on your
own in terms of dealing with bugs and problems here.

Get the companies that build the obfuscation packages to read the ECMA
spec and fix the bugs in their products that generate non-standard
binaries (or, if they expose a bug in mono, please file a report in our
bugzilla).

Pay Ximian/Novell to spend the development time needed to get mono to
support the broken binaries that some of the obfuscation packages
generate (or contribute that support).

Miscellaneous Questions
-----------------------

#### You say that the CLI allows multiple languages to execute on the same environment. Isn't this the purpose of CORBA?

The key difference between CORBA (and COM) and the CLI is that the CLI
allows "data-level interoperability" because every language/component
uses the same data layout and memory management.

This means you can operate directly upon the data types that someone
else provides, without having to go via their interfaces. It also means
you don't have to "marshal" (convert) parameters (data layouts are the
same, so you can just pass components directly) and you don't have to
worry about memory management, because all languages/components share
the same garbage collector and address space. This means much less
copying and no need for reference counting.

#### Will you support COM?

The runtime will support XPCOM on UNIX systems and COM on Windows. Most
of the code for dynamic trampolines exists already.

#### Will Ximian offer certifications on Mono or related technologies?

.

It's possible. But there is no plan about this. So the short answer is
no.

#### How can I report a bug?

The best thing is to track down the bug and provide a simple test to
reproduce the bug. You can then add the bug to our bug tracking system.
You can use our [Bug Form]({{site.url}}/Bug Reporting "wikilink") to enter bugs for
the appropriate component.

Please provide information about what version of mono you're using and
any relevant details to be able to reproduce the bug. Note that bugs
reported on the mailing-list may be easily forgotten, so it's better to
file them in the [bug tracking
system](http://bugzilla.ximian.com/enter_bug.cgi).

#### Does mcs support the same command line options as the MS C\# compiler?

The Mono C\# compiler now supports the same command line arguments as
the Microsoft C\# compiler does.

#### How about getting searchable archives on lists.ximian.com?

You can perform a search on the mono-related mailing lists
[here]({{site.url}}/Mailing Lists "wikilink").

#### When using mono from cvs or from a snapshot, I get an error message saying that Mono and the runtime are out of sync. How do I fix that?

If you use mono from cvs, you need to be prepared for changes in the
runtime internals. This means that you should keep a working setup
before blindling updating (a working setup may just be the last released
tarball or a recent binary snapshot). Usually, compiling corlib with mcs
before recompiling the C runtime does the right thing (but occasionally
you may need to do it the other way around).

#### Why are you going for a GtkHtml implementation?

GtkHTML is just a lightweight HTML rendering engine that does not
support CSS, so we need it to look decent for those of us that will be
using the documentation in our day-to-day work on Linux. The Web-based
interfaces lack the agility that you get from a native GUI tool to
browse your documentation. Probably later on, we will write scripts and
generate a full documentation set that is web-browsable, but we need a
command-line and GUI tools that we can use natively on Linux when
disconnected from the Web (and that has better interactions than a web
page).

#### Is there a command-line tool that allows me to access .NET interactively?

There are several but one that is free software and uses MCS is the one
Dennis Lu from Rice University is working on; a REPL C\# interpreter.

#### Is it possible to use Visual C++ with Mono?

.

It's possible to run VC++ generated apps under Mono, but we do not
provide a Manager C++ compiler ourselves.

#### Does Mono support generics?

.

Yes, the Mono runtime now supports the new Generics extensions, and
there is also support for generics in our new compiler: 'gmcs'.

The Mono C\# 1.0 compiler (mcs) will ship with various C\# 2.0 features,
but generics will remain on the separate compiler (gmcs) as this code is
not as tested as the main compiler.

Mono Common Problems
--------------------

If you are having problems compiling or running Mono software or if you
think that you found a bug, etc. Please visit the [Mono Common
Problems](http://monoevo.sf.net/mono-common-problems.html) document and
try there.

Credits
-------

The FAQ contains material contributed by Miguel de Icaza, Jaime
Anguiano, Lluis SÃ¡nchez.

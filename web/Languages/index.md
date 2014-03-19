---
Title: ./Languages
layout: default
---

Multiple languages can be used with the Mono platform. The Mono project
provides [C\#](http://mono-project.com/Mcs),
[Basic](http://mono-project.com/Language_BASIC), and
[Ilasm](http://mono-project.com/Dis/Assembling_CIL_Code) compilers, and
there are both open source and commercial compilers that can be used
with Mono.

It's important to note that any language that compiles to pure IL should
work under Mono. Some languages such as Microsoft's Managed C++ do not
always compile to pure IL, so they will not always work as expected,
since they are not truly platform independent.

Mono-compatible compilers
=========================

C\#
---

The main C\# compiler of the Mono Project is
[**mcs**]({{site.url}}/CSharp Compiler "wikilink"). It covers all the features in C\#
3.0 (2.6) and 4.0 (preview), including 3.0 Linq and 4.0 dynamic. As of
today, 'gmcs' is the default compiler based on 2.0 runtime profile, and
'dmcs' is for 4.0 runtime profile.

C\# is specified in the ISO/IEC 23271:2006 and ECMA 334 standards.
Microsoft has [granted access to their
patents](http://port25.technet.com/archive/2009/07/06/the-ecma-c-and-cli-standards.aspx)
under their [Community
Promise](http://www.microsoft.com/interop/cp/default.mspx).

F\#
---

[F\#](http://msdn.microsoft.com/en-us/fsharp/default.aspx) is a hybrid
language that brings flavors of functional languages and imperative
languages, developed by Microsoft. They release compiler that targets
mono in [some
releases](http://blogs.msdn.com/b/dsyme/archive/2010/04/12/f-2-0-released-as-part-of-visual-studio-2010.aspx).

Java
----

Java applications can run in Mono, see the [Java]({{site.url}}/Java "wikilink") page
for more details.

Scala
-----

Scala is a modern language primarily targeting Java, and it's ported to
.NET as [Scala.NET](http://www.scala-lang.org/node/168), which is also
[known to run on mono](http://davidsiegel.org/scala-on-mono/).

Boo
---

[Boo](http://boo.codehaus.org/Home) is a statically-typed language
supporting dynamic scripting and meta-programming capabilities
(extensible compiler, extensible syntax, macros...) with a syntax
similar to Python. For details on the particular language features see
the [Boo Language Features](http://boo.codehaus.org/Language+Features)
page.

Nemerle
-------

Nemerle is a new hybrid (functional, object-oriented and imperative)
programming language for the .NET platform. It is available from
[www.nemerle.org](http://www.nemerle.org).

Visual Basic.NET
----------------

See our [BASIC Language]({{site.url}}/Language BASIC "wikilink") page for more
details.

Python
------

There are two possible choices here: PythonNet and IronPython.

<b>PythonNet:</b> [Brian Lloyd](mailto:brian@No.Spam.zope.com) wrote a
bridge to link the Python runtime with the .NET runtime. More
information on the PS.NET project can be found
[here](http://pythonnet.sourceforge.net/). This uses the real Python
engine and provides a bridge between the Python world and the .NET world
to interoperate.

<b>IronPython:</b> is Jim Hugunin's compiler for Python, it is a
complete implementation of Python from scratch that compiles Python code
into native CIL. More information is available on [the IronPython
site](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython)

JavaScript
----------

[IronJS](http://github.com/fholm/IronJS) is a DLR-based Javascript
implementation that targets mono as well as .NET.

Historically mono used to ship 'mjs', an implementation of the
JavaScript language as part of its distribution, the main author behind
this effort is César Natarén.

For more details see [JScript]({{site.url}}/JScript "wikilink")

Oberon
------

Check out [Oberon for .NET](http://www.bluebottle.ethz.ch/oberon.net/)
project.

PHP
---

Thanks to the work of Raphael Romeikat, the encouragement of Thomas Uhl
and the funding from Google's Summer of Code 2005 a PHP compiler has
been developed, for more information see:

[PHP4Mono Project](http://php4mono.sourceforge.net/)

Object Pascal
-------------

[RemObjects](http://www.remobjects.com) ships an object pascal compiler.
Their product is supported in both .NET and Mono.

Their [Delphi Prism](http://www.codegear.com/products/delphi/prism)
compiler support Mono out of the box.

LUA
---

[Lua2Il](http://www.lua.inf.puc-rio.br/luanet/lua2il/) is a compiler
that will allow you to run your existing Lua code or reuse the existent
expertise you have on Lua in your application and run it with the Mono
JIT compiler.

Cobra
-----

[Cobra](http://cobra-language.com/) both codes fast and runs fast. It
also has language-level support for software quality.

Cobra combines productivity-boosting features that are otherwise
scattered across multiple languages.

Other languages
---------------

-   [Component Pascal](http://plas.fit.qut.edu.au/gpcp/NET.aspx)
-   [Delta Forth](http://www.dataman.ro/dforth)
-   [DotLisp](http://sourceforge.net/projects/dotlisp)
-   [\#Smalltalk](http://www.refactory.com/Software/SharpSmalltalk)

Supporting GCC languages
========================

The choosen strategy is to use the GCC4 GIMPLE backend to target CIL
bytecodes, as planned in the [GCC
CIL](Summer2006#{{site.url}}/GCC_CIL_Backend "wikilink") SOC project (or the [2005
attempt](Summer2005#{{site.url}}/GCC_CIL "wikilink")).

In 2006, the [Gcc4cil](Gcc4{{site.url}}/cil "wikilink") project was publicly
announced. For now it supports the C language but it could be extended
to support more gcc front ends.

Missing languages
=================

Here is a list of a few languages that we would like to see supported.
We will try to maintain a set of links here with technical information
for those interested in porting, implementing or adapting a compiler for
any of these languages:

C
-

### Using LCC

[LCC](http://www.cs.princeton.edu/software/lcc) 4.2 has been recently
released. This release adds support for compiling ANSI C programs to
CIL. Note that the CIL support only works on Win32 right now, but should
be easy to convert to Mono/other architectures.

LCC is not an open source compiler, but it is free as long as you do not
profit from selling it.

### Using GCC

See [Gcc4cil](Gcc4{{site.url}}/cil "wikilink").

Ruby
----

[Ruby.Net](http://rubydotnet.googlegroups.com/web/Home.htm) from
Queensland University.

The compiler can be used to statically compile a Ruby source file into a
verifiable .NET v2.0 assembly or it can be used to directly execute a
Ruby source file (compile, load and execute).

[IronRuby](http://www.wilcob.com/Wilco/IronRuby.aspx) from Wilco Bauwer,
includes an interactive Ruby Console and works with Mono.

ADA
---

A\# is an ADA compiler for the CIL platform, it can be downloaded from:
[here](http://asharp.martincarlisle.com/)

Other PHP Efforts
-----------------

[PHP for Mono](http://php4mono.sourceforge.net/) an effort that was
funded by the Google Summer of Code and continues moving forward.

#### Old PHP efforts

[Phalanger](http://www.php-compiler.net/) is a fairly complete PHP to
CLI compiler that can even integrate with VS 2003 for console PHP
applications.

There is an older effort by Sterling to allow PHP developers to use Mono
code, see this [site](http://pecl.php.net/package/mono/).

Other Languages
===============

Languages which are believed to work, but have not had a complete run of
all their regression tests:

Tachy
-----

A subset of Scheme language called
[Tachy](http://www.kenrawlings.com/pages/Tachy)

.net-language links
===================

[DotNetPowered.com](http://www.dotnetpowered.com/languages.aspx) have a
list of a lot of .net languages.

[Language
Comparison](http://bean.wikidot.com/comparecsharpironpythonboo) - A
simple comparison of some languages can be used with the Mono platform

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:Languages>

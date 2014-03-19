---
Title: ./What_is_Mono
layout: default
---

Mono is a software platform designed to allow developers to easily
create cross platform applications. It is an open source implementation
of Microsoft's .Net Framework based on the [ECMA]({{site.url}}/ECMA "wikilink")
standards for C\# and the Common Language Runtime. We feel that by
embracing a successful, standardized software platform, we can lower the
barriers to producing great applications for Linux.

The Components
--------------

There are several components that make up Mono:

**[C\# Compiler]({{site.url}}/CSharp Compiler "wikilink")** - Mono's C\# compiler is
feature complete for C\# 1.0, 2.0, 3.0, and 4.0 (ECMA). A good
description of the feature of the various versions is available on
[Wikipedia](http://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29#Versions).

**[Mono Runtime]({{site.url}}/Mono:Runtime "wikilink")** - The runtime implements the
ECMA Common Language Infrastructure (CLI). The runtime provides a
Just-in-Time (JIT) compiler, an Ahead-of-Time compiler (AOT), a library
loader, the garbage collector, a threading system and interoperability
functionality.

**Base Class Library** - The Mono platform provides a comprehensive set
of classes that provide a solid foundation to build applications on.
These classes are compatible with Microsoft's .Net Framework classes.

**Mono Class Library** - Mono also provides many classes that go above
and beyond the Base Class Library provided by Microsoft. These provide
additional functionality that are useful, especially in building Linux
applications. Some examples are classes for Gtk+, Zip files, LDAP,
OpenGL, Cairo, POSIX, etc.

The Benefits
------------

There are many benefits to choosing Mono for application development:

**Popularity** - Built on the success of .Net, there are millions of
developers that have experience building applications in C\#. There are
also tens of thousands of books, websites, tutorials, and example source
code to help with any imaginable problem.

**Higher-Level Programming** - All Mono languages benefit from many
features of the runtime, like automatic memory management, reflection,
generics, and threading. These features allow you to concentrate on
writing your application instead of writing system infrastructure code.

**Base Class Library** - Having a comprehensive class library provides
thousands of built in classes to increase productivity. Need socket code
or a hashtable? There's no need to write your own as it's built into the
platform.

**Cross Platform** - Mono is built to be cross platform. Mono runs on
[Linux]({{site.url}}/Mono:Linux "wikilink"), [Microsoft
Windows]({{site.url}}/Mono:Windows "wikilink"), [Mac OS X]({{site.url}}/Mono:OSX "wikilink"),
[BSD]({{site.url}}/Mono:BSD "wikilink"), and [Sun Solaris]({{site.url}}/Mono:Solaris "wikilink"),
[Nintendo Wii]({{site.url}}/Mono:Wii "wikilink"), [Sony PlayStation
3](Mono:PlayStation3{{site.url}}/ "wikilink"), [Apple
iPhone]({{site.url}}/Mono:Iphone "wikilink"). It also runs on
[x86](Mono:x86{{site.url}}/ "wikilink"), [x86-64](Mono:AMD64{{site.url}}/ "wikilink"),
[IA64](Mono:IA64{{site.url}}/ "wikilink"), [PowerPC]({{site.url}}/Mono:PowerPC "wikilink"), [SPARC
(32)]({{site.url}}/Mono:SPARC "wikilink"), [ARM]({{site.url}}/Mono:ARM "wikilink"),
[Alpha]({{site.url}}/Mono:Alpha "wikilink"), [s390, s390x (32 and 64
bits)](Mono:S390{{site.url}}/ "wikilink") and more. Developing your application with
Mono allows you to run on nearly any computer in existance
([details]({{site.url}}/Platforms "wikilink")).

**Common Language Runtime (CLR)** - The CLR allows you to choose the
programming language you like best to work with, and it can interoperate
with code written in any other CLR language. For example, you can write
a class in C\#, inherit from it in VB.Net, and use it in Eiffel. You can
choose to write code in Mono in a [variety of programming
languages]({{site.url}}/Languages "wikilink").

Other Uses
----------

[Scripting]({{site.url}}/Scripting With Mono "wikilink") and
[Embedding]({{site.url}}/Embedding_Mono "wikilink") - The Mono runtime can also be
used to script your applications by embedding it inside other
applications, to allow managed code and scripts to run in a native
application.

See [Embedding Mono]({{site.url}}/Embedding_Mono "wikilink") for details on how to
embed Mono.

See [Scripting With Mono]({{site.url}}/Scripting With Mono "wikilink") for strategies
on how to script your application using the Mono runtime.

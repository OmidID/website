---
Title: ./Mono_1.0
layout: default
---

The following components make up the Mono 1.0 release.

For information about the new Mono see
[Mono\_1\_1](Mono_1_1{{site.url}}/ "wikilink").

Notice that these are \*assemblies\*, they are not namespaces. Each
assembly normally contains code that spans multiple namespaces (mscorlib
contains 37 namespaces), but there are a lot of people who seem confused
about this.

Assemblies
==========

Stable Assemblies
-----------------

The following assemblies are feature complete:

            Commons.RelaxNG
            Cscompmgd
            Mono.Data
            Mono.Data.Tds
            Mono.Posix
            Mono.Security
            Mono.Security.Win32
            System.Web
            System.Configuration.Install
            System.Data
            System.Data.OracleClient
            System.DirectoryServices
            System
            System.Drawing
            System.Runtime.Remoting
            System.Security
            System.Web.Services
            System.XML

Assemblies Under Development
============================

The APIs in the following assemblies are not complete and are not
guaranteed to work:

            Accessibility
            Mono.Cairo
            Mono.CSharp.Debugger
            Mono.Data.DB2Client
            Mono.Data.SqlLite
            Mono.Data.SybaseClient
            Mono.GetOptions
            System.Web.Mobile
            System.Design
            System.Drawing.Design
            System.Windows.Forms
            Formatters.Soap
            Mono.Data.TdsClient (older Sybase and MS SQL)
            System.EnterpriseServices

Missing Assemblies
==================

    Missing:
            System.Management
            System.Messaging
            System.ServiceProcess
            System.Web.RegularExpressions

Third Party Assemblies
======================

These are third party assemblies that we ship with Mono, guarantees
about API stability are tracked by the owners of each one of these:

    Third party assemblies.
            ByteFX.Data
            Npgsql
            PEAPI
            SharpZipLib.
            
            Java integration with IKVM.NET

Languages
=========

Stable Languages
----------------

Mono 1.0 only shipped with C\# as a stable and complete language.

Unstable Languages
------------------

These languages are not complete in the Mono 1.0 release: VB.NET,
JScript.

Virtual Machine
===============

-   JIT, 32 bits: PPC, x86, SPARC

-   JIT, 32 bits, unstable: S390

-   Interpreter, 32 bits: s390, HPPA, StrongARM, SPARC v8

[Category:Mono Framework]({{site.url}}/Category:Mono Framework "wikilink")

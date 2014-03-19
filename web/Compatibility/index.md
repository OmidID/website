---
Title: ./Compatibility
layout: default
---

\_\_NOTOC\_\_

<div style="margin-left: 1.0em; padding: 10px; float: right; font-size: 100%; width: 350px; background-color:#E5ECF3; border:1px solid #67A7E3;-moz-border-radius: 5px">
<div style="float: left; margin-right: 5px; margin-top: 2px;">
![](http://localhost:4000/files/Moma48.png "http://localhost:4000/files/Moma48.png")

</div>
If you already have an application written in .Net, you can scan your
application with the [Mono Migration Analyzer (MoMA)]({{site.url}}/MoMA "wikilink")
to determine if your application uses anything not supported by Mono.

</div>
The current stable release version of Mono is **3.2.3**. The previous
stable release was **2.10.8** (released December 19th, 2011), which is
not supported anymore (because its branch doesn't receive more
backports).

The easiest way to describe what Mono currently supports is:\
**Everything in .NET 4.5** except **WPF**, **WWF**, and with **limited
WCF** and **limited ASP.NET 4.5 async stack**.

Here is a slightly more detailed view, by .NET framework version:

<table cellpadding="1" cellspacing="2" style="width: 475px; background-color: #f5f5f5; border: solid 1px #cccccc; padding: 3px; margin-bottom: 8px;">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px; font-size: 80%;">
Implemented

</td>
<td style="background-color: #FFF095; width: 8px;">
</td>
<td style="padding-left: 3px; font-size: 80%;">
Partially Implemented

</td>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px; font-size: 80%;">
Not Implemented

</td>
</tr>
</table>
.NET 4.5
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
C\# 5.0 - async support

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Async Base Class Library Upgrade

</td>
</tr>
<tr>
<td style="background-color: #FFF095; width: 8px;">
</td>
<td style="padding-left: 3px;">
MVC4 <span style="font-size: 80%"><i>- Partial, no async features
supported.</i></span>

</td>
</tr>
<tr>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.NET 4.5 Async Pipeline <span style="font-size: 80%"><i>- Needs an
parallel processing pipeline with async support, not done.</i></span>

</td>
</tr>
</table>
.NET 4.0
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
C\# 4.0

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net 4.0

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net MVC 1, MVC 2 and MVC3

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
System.Numerics

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Managed Extensibily Framework <span style="font-size: 80%"><i>- Shared
with .NET via MS-PL license</i></span>

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Dynamic Language Runtime <span style="font-size: 80%"><i>- Shared with
.NET via MS-PL license</i></span>

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Client side OData <span style="font-size:80%"><i>- Shared with .NET via
MS-PL license</i></span>

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
EntityFramework <span style="font-size: 80%"><i>- Available since Mono
2.11.3.</i></span>

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Parallel Framework and PLINQ

</td>
</tr>
<tr>
<td style="background-color: #FFF095; width: 8px;">
</td>
<td style="padding-left: 3px;">
CodeContracts <span style="font-size: 80%"><i>- API complete, partial
tooling</i></span>

</td>
</tr>
<tr>
<td style="background-color: #FFF095; width: 8px;">
</td>
<td style="padding-left: 3px;">
Server-side OData <span style="font-size: 80%"><i>- Depends on Entity
Framework.</i></span>

</td>
</tr>
</table>
.NET 3.5
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
C\# 3.0

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
System.Core

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
LINQ

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net 3.5

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net MVC

</td>
</tr>
<tr>
<td style="background-color: #a5e368; width: 8px;">
</td>
<td style="padding-left: 3px;">
LINQ to SQL <span style="font-size: 80%"><i>- Mostly done, but a few
features missing</i></span>

</td>
</tr>
</table>
.NET 3.0
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #FFF095; width: 8px;">
</td>
<td style="padding-left: 3px;">
WCF <span style="font-size: 80%"><i>- silverlight 2.0 subset
completed</i></span>

</td>
</tr>
<tr>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px;">
WPF <span style="font-size: 80%"><i>- no plans to implement</i></span>

</td>
</tr>
<tr>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px;">
WWF <span style="font-size: 80%"><i>- Will implement WWF 4 instead on
future versions of Mono.</i></span>

</td>
</tr>
</table>
.NET 2.0
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px">
C\# 2.0 (generics)

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px">
Core Libraries 2.0: mscorlib, System, System.Xml

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net 2.0 <span style="font-size: 80%"><i>- except WebParts</i></span>

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ADO.Net 2.0

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Winforms/System.Drawing 2.0 <span style="font-size: 80%"><i>- does not
support right-to-left</i></span>

</td>
</tr>
</table>
.NET 1.1
--------

<table cellpadding="1" cellspacing="2" width="100%">
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px">
C\# 1.0

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px">
Core Libraries 1.1: mscorlib, System, System.Xml

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ASP.Net 1.1

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
ADO.Net 1.1

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
Winforms/System.Drawing 1.1

</td>
</tr>
<tr>
<td style="background-color: #A5E368; width: 8px;">
</td>
<td style="padding-left: 3px;">
System.Transactions

</td>
</tr>
<tr>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px;">
System.Management <span style="font-size: 80%"><i>- does not map to
Linux</i></span>

</td>
</tr>
<tr>
<td style="background-color: #F36868; width: 8px;">
</td>
<td style="padding-left: 3px;">
System.EnterpriseServices <span style="font-size: 80%"><i>-
deprecated</i></span>

</td>
</tr>
</table>
Current Mono Master
===================

This section will be updated as major components are added to Mono after
the latest official release.

<div style="margin-left: auto; padding: 5px; margin-right: auto; background-color: #C6D8ED; border: 1px solid #5084C5; border-left-width: 10px; margin-top: 30px; margin-bottom: 20px;">
For details on individual classes and methods implemented by Mono,
please see our [class status pages](http://go-mono.com/status/). Note
that these are built from SVN versions and some methods may not be in a
released version yet.

</div>

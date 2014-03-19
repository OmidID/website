---
Title: ./Using_Databases
layout: default
---

Mono can interact with a variety of commercial and open source databases
using ADO.NET. The project's current goal for data access is to be
compatible with the APIs exposed in .NET

Mono supports the System.Data stack, an extensive set of providers as
well as [LINQ to
SQL](http://msdn.microsoft.com/en-us/library/bb386976.aspx) (largely
through the DbLinq project).

This document does not aim to be a tutorial on ADO.NET, since there are
many fine books and online resources that can help you, only a guide to
using databases with Mono.

Database Providers
==================

The following database providers are available for Mono applications:

-   [MySQL]({{site.url}}/MySQL "wikilink")
-   [ODBC]({{site.url}}/ODBC "wikilink")
-   [SQLClient]({{site.url}}/SQLClient "wikilink")
-   [Oracle]({{site.url}}/Oracle "wikilink")
-   [PostgreSQL]({{site.url}}/PostgreSQL "wikilink")
-   [Firebird and Interbase]({{site.url}}/Firebird Interbase "wikilink")
-   [IBM DB2](IBM DB2{{site.url}}/ "wikilink")
-   [OLE DB]({{site.url}}/OLE DB "wikilink")
-   [SQLite]({{site.url}}/SQLite "wikilink")
-   [Sybase]({{site.url}}/Sybase "wikilink")
-   [TDS Providers]({{site.url}}/TDS Providers "wikilink")
-   [TDS Generic]({{site.url}}/TDS Generic "wikilink")
-   [MaxDB]({{site.url}}/MaxDB "wikilink")
-   [VistaDB](http://www.vistadb.com)

Tools
=====

The following Mono tools are useful when working with ADO.NET:

-   sqlsharp.exe (SQL\#), a command line query tool included with Mono
    to enter and execute SQL statements.
-   xsd.exe , XML Schema Definition tool
    -   '''XDR to XSD '''- used to generate an XML schema from an XDR
        (XML Data Reduced schema) file. XDR was used by Microsoft prior
        to XSD becoming a W3C recommendation, and it needs to be
        supported for legacy reasons.
    -   '''XML to XSD '''- used to generate an XML schema from an XML
        file.
    -   '''XSD to DataSet '''- used to generate DataSet classes from an
        XSD schema file. The DataSet classes created can then be used
        with XML data.
    -   '''XSD to Classes '''- used to generate classes from an XSD
        schema file. The classes created can be used with
        System.XML.Serialization.XMLSerializer to read and write XML
        code that follows the schema.
    -   '''Classes to XSD '''- used to generate an XML schema from
        type(s) in a assembly file. The XML schema created by the tool
        defines the XML format used by
        System.XML.Serialization.XMLSerializer.

<Category:Monkeyguide> [Category:Developer
Resource]({{site.url}}/Category:Developer Resource "wikilink") <Category:ADO.NET>

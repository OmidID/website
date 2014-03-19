---
Title: ./Database_Access
layout: default
---

Mono has many ADO.NET Data Providers to get you connected. Find the
database you want to connect to and follow the link for instructions on
how to set it up, as well as sample code for accessing the database.

Providers for Open Source databases:

-   [PostgreSQL]({{site.url}}/PostgreSQL "wikilink"): Npgsql is a managed provider
    for PostgreSQL
-   [SQLite]({{site.url}}/SQLite "wikilink"): provider for
    [SQLite](http://www.sqlite.org) versions 2 and 3. Requires native
    sqlite library.
-   [Firebird Interbase]({{site.url}}/Firebird Interbase "wikilink"): managed
    provider for Firebird
-   [MySQL]({{site.url}}/MySQL "wikilink"): [MySQL
    Connector/Net](http://dev.mysql.com/downloads/connector/net/) is the
    recommended provider for MySQL from [MySQL](http://www.mysql.com/).
    ByteFX.Data.MySqlClient is no longer maintained.

Providers for commercial databases:

-   [Mimer SQL]({{site.url}}/Mimer SQL "wikilink") Mimer Data Provider for Mimer SQL,
    from Mimer
    [1](http://developer.mimer.com/platforms/productinfo_39.htm)
-   [ODBC]({{site.url}}/ODBC "wikilink") requires ODBC software which is available
    for Unix and Windows
-   [Oracle]({{site.url}}/Oracle "wikilink") provider for Oracle 8i, 9i, 10g, and 11g
    and requires Oracle client software
-   [Microsoft SQL Server]({{site.url}}/SQLClient "wikilink") managed provider for
    Microsoft SQL Server 7.0, 2000 and 2005 databases
-   [Sybase]({{site.url}}/Sybase "wikilink") managed provider for Sybase ASE 12.0 and
    up databases

Commercially Supported Providers:

-   [EffiProz](http://www.EffiProz.com) is an embeddable SQL database
    featuring stored procedures, compatibility with SQL CE data types.
    It written in pure C\# and distributed as a single 1.5 Mb dll. It
    support Mono, MonoTouch and MonoDroid as well as standard .NET. Some
    distinguishing features can be found
    [here](http://blog.effiproz.com/2011/04/effiproz-vs-sqlite-file-database.html).
-   [VistaDB](http://www.vistadb.com) The VistaDB embeddable and
    commercial library.
-   [OpenLink Software](http://www.openlinksw.com/) has
    High-Performance, Fully Managed .NET Data Providers for Major
    Databases which you can
    [download](http://oplweb.openlinksw.com:8080/download/).

Open Source Providers:

-   [MySQL Connector/Net from MySQL
    AB](http://dev.mysql.com/downloads/connector/net/) is the
    recommended .NET and Mono data provider for MySQL
-   [NPgsql](http://npgsql.projects.postgresql.org/) is a fully managed
    provider for PostgreSQL and is included with Mono.
-   [Firebird](http://sourceforge.net/projects/firebird/) fully managed
    provider for Firebird databases and is included with Mono.
-   [Advanced Data Provider](http://advanced-ado.sourceforge.net/) ADP,
    is a transparent factory for ADO.NET which loads providers
    dynamically.
-   [MaxDB]({{site.url}}/MaxDB "wikilink") MaxDB database.

Object Persistent Libraries and Object Databases

-   [NHibernate](http://wiki.nhibernate.org/display/NH/Home) NHibernate
    is a .NET based object persistence library for relational databases.
    NHibernate is a port of the excellent Java Hibernate relational
    persistence tool.

Commercial Object Persistent Libraries and Object Databases:

-   [db4o](http://www.mono-project.com/DB4O) is an open source object
    database for .NET and Mono, a non-intrusive persistence system that
    stores any complex object with one single line of code.
-   [siaqodb](http://siaqodb.com) is an object database for Mono, .NET
    and Silverlight.

Database Tools

-   [MonoDevelop Database](http://www.monodevelop.com/) - an Add-In to
    MonoDevelop providing a SQL Query and Database Browser tool.

Unmaintained Providers in Mono:

-   [OLE DB]({{site.url}}/OLE DB "wikilink")
-   [Ancient Microsoft SQL Server and Sybase
    databases]({{site.url}}/TDS Generic "wikilink")
-   [ByteFX.Data.MySqlClient](http://sourceforge.net/projects/mysqlnet/)
    is a MySQL Managed data provider. ByteFX.Data is no longer
    maintained, but it is included with Mono. Please use the MySQL
    Connector/Net provider from MySQL AB instead.
-   [IBM DB2 Universal Database](IBM DB2{{site.url}}/ "wikilink") provider for IBM
    DB2 requires DB2 client software

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:ADO.NET>

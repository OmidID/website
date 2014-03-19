---
Title: ./ADO.NET
layout: default
---

See our [Database\_Access]({{site.url}}/Database_Access "wikilink") page for more
details.

Status and tests for ADO.NET 2.0 are available in our
[ADOTests]({{site.url}}/ADOTests "wikilink") page.

Tools
-----

Some tools that can be used for ADO.NET and other technologies (ASP.NET,
XML, etc).

-   sqlsharp.exe
    -   SQL\# is a command line query tool included with Mono to enter
        and execute SQL statements

-   xsd.exe
    -   XML Schema Definition tool
    -   XML to XSD - used to generate an XML schema from an XML file
    -   XSD to DataSet - used to generate DataSet classes from an XSD
        schema file. The DataSet classes created can then be used with
        XML data
    -   XSD to Classes - used to generate classes from an XSD schema
        file. The classes created can be used with
        System.XML.Serialization.XMLSerializer to read and write XML
        code that follows the schema
    -   Classes to XSD - used to generate an XML schema from types in a
        assembly file. The XML schema created by the tool defines the
        XML format used by System.XML.Serialization.XMLSerializer

Generic Database access in Mono ADO.NET
---------------------------------------

An ADO.NET [Provider Factory]({{site.url}}/Provider Factory "wikilink") was created
by Brian Ritchie. The Provider Factory is a way to dynamically create
connections, commands, parameters, and data adapters based on
configuration information. This implmentation is based on the interfaces
exposed in ADO.NET provider classes.

[Another Provider Factory]({{site.url}}/BaseClass Provider Factory "wikilink")
implementation is being developed in 1.1 branch supporting Microsoft's
new API for generic database access. This is based on the common
provider base classes available in mono 1.1 development version. This
implementation is based on the released beta API's and are subject to
change. The providers that can be accessed currently are

-   System.Data.SqlClient
-   System.Data.Odbc

Database Access from ASP.NET
----------------------------

-   Take a look at xsp in cvs and look at the examples in test:
    dbpage1.aspx and dbpage2.aspx:

-   Notice that the namespace System.Data is imported via <b>import</b>

-   A NameValueCollection is gotten using
    ConfigurationSettings.AppSetings. These settings are gotten from the
    file server.exe.config which is a XML file. The XML file has a
    section appSettings. In the appSettings section, you have keys for
    DBProviderAssembly, DBConnectionType, and DBConnectionString.

-   <b>DBProviderAssembly</b> is the assembly of the ADO.NET provider.
    For example: "Npgsql"

-   <b>DBConnectionType</b> is the System.Type of the class that
    implements System.Data.IDbConnection that is found in the
    DBProviderAssembly. For example: "Npgsql.NpgsqlConnection"

-   <b>DBConnectionString</b> is the ConnectionString to set to the
    IDbConnection object to use in opening a connection to a data
    source. For Example: "server=127.0.0.1;user
    id=monotest;password=monotest; database=monotest"

-   The function GetConnectionData() gets the database provider
    assembly, connection type, and connection string parameters if they
    exist; otherwise, it uses default values. This is done during the
    loading of the web page.

-   With the connection parameters, the assembly is loaded, the
    connection type is verified that it implements IDbConnection and an
    instance of the class can be created, creates a instance of the
    class, sets the connection string, and opens the connection.

Testing
-------

-   Testing connection-oriented classes are done via the provider
    specific tests found in the mcs source at
    mcs/class/System.Data/Test. There is also a nunit based connected
    mode tests under mcs/class/System.Data/Test/ProviderTests. The
    following table shows the stand alone test files for specific
    providers. Refer [Writing Connected Mode
    Testcases]({{site.url}}/Writing Connected Mode Testcases "wikilink") also for
    testing specific Data Providers.

</br>

<table border=1>
<tr>
<td>
<b>Name</b>

</td>
<td>
<b>Assembly /</br> Namespace</b>

</td>
<td>
<b>Test</b>

</td>
</tr>
<tr>
<td>
Microsoft</br> SQL</br> Server</br>

</td>
<td>
System.Data /</br> System.Data.SqlClient

</td>
<td>
SqlTest.cs at</br> System.Data/Test

</td>
</tr>
<tr>
<td>
PostgreSQL</br> (Npgsql)

</td>
<td>
Npgsql /</br> Npgsql

</td>
<td>
-   .cs at</br> Npgsql/Test
    </td>

</tr>
<tr>
<td>
Oracle</br> (Mono)

</td>
<td>
System.Data.OracleClient /</br> System.Data.OracleClient

</td>
<td>
TestOracleClient.cs at</br> System.Data.OracleClient/Test

</td>
</tr>
<tr>
<td>
ODBC</br> (Mono)

</td>
<td>
System.Data.Odbc /</br> System.Data

</td>
<td>
OdbcTest.cs (to connect to MS SQL Server)at</br> System.Data/Test

</td>
</tr>
</table>
-   [Testing non-connection classes]({{site.url}}/Test Suite "wikilink") are done via
    mono's modified version of NUnit.

-   To run all the NUnit tests for Mono, you need the mcs source. cd to
    the root of the mcs source. To run it:

-   make test

-   If you just want to run the NUnit tests for System.Data, you would
    cd into the mcs source at class/System.Data/Test and run it:

-   make test

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:ADO.NET>

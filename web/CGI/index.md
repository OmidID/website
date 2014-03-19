---
Title: ./CGI
layout: default
---

[CGI](http://hoohoo.ncsa.illinois.edu/cgi/) is the most widely supported
web server application interface. [ASP.NET]({{site.url}}/ASP.NET "wikilink") (and
[Mono]({{site.url}}/Mono "wikilink")) has a relatively long startup time and requires
a relatively large amount of initial memory that makes it unsuitable to
be used as a CGI application in the traditional way because CGI requires
the web server to create a new application process for each request.

Both [mod\_mono]({{site.url}}/mod_mono "wikilink") and
[fastcgi-mono-server]({{site.url}}/FastCGI "wikilink") are using a persistent
separate process that is processing the requests thus eliminating the
performance impact of long startup time and reducing overall memory
requirements.

Shared hosing environments usually use [Apache](http://httpd.apache.org)
that only has support for CGI out of the box. Both mod\_mono and FastCGI
support require installing modules that can only be done by server
administrators.

[cgi-fcgi](http://www.fastcgi.com/) is a CGI to FastCGI bridge also
capable of starting a FastCGI application that has support for a wide
range of platforms. **cgi-fcgi** along with **fastcgi-mono-server**
enables **ASP.NET** on any web server that has support for CGI without
noticeable performance impact.

Installing Mono and cgi-fcgi
----------------------------

For more detailed instructions on installing Mono see our [Getting
Mono]({{site.url}}/Getting Mono "wikilink") and [Compiling
Mono]({{site.url}}/Compiling Mono "wikilink") pages. cgi-fcgi is available for
download from the [FastCGI](http://www.fastcgi.com/drupal/node/5) site
as part of the **Development Kit**.

The following sample configuration assumes installation prefixes used
here to configure cgi-fcgi and mono. If you use different prefixes you
also will have to modify the sample files: <bash> \$ tar xzf
fcgi-2.4.0.tar.gz \$ cd fcgi-2.4.0 \$ ./configure
--prefix=/home/username/fcgi \$ make \$ make install ... \$ tar xjf
mono-2.4.tar.bz2 \$ cd mono-2.4 \$ ./configure
--prefix=/home/username/mono \$ make \$ make install ... \$ tar xjf
xsp-2.4.tar.bz2 \$ cd xsp-2.4 \$ export
PATH=/home/username/mono/bin:\$PATH \$ export
PKG\_CONFIG\_PATH=/home/username/mono/lib/pkgconfig:\$PKG\_CONFIG\_PATH
\$ ./configure --prefix=/home/username/mono \$ make \$ make install
</bash> You also may compile them on a compatible development machine
using the same installation prefixes and upload the binaries to the web
server.

If you have no shell access to the web server you can use [PHP
Shell](http://phpshell.sourceforge.net/) that is a lightweight remote
shell wrapper to extract compressed files, monitor or kill your
processes or execute arbitrary commands.

Script files
------------

Handler CGI script
(<i>/home/username/public\_html/cgi-bin/mono-cgi</i>): <bash>

1.  !/home/username/fcgi/bin/cgi-fcgi -f

-connect /home/username/tmp/mono-fcgi.sock /home/username/bin/mono-fcgi
</bash> Using this configuration cgi-fcgi will create a listening socket
and pass it to a new mono-fcgi process when unable to connect to the
socket that will avoid race conditions and will result in less overhead
than using a shell script. For more information see [cgi-fcgi
documentation](http://www.fastcgi.com/devkit/doc/fcgi-devel-kit.htm#S4.2).

A separate shell script (<i>/home/username/bin/mono-fcgi</i>) is
required to start fastcgi-mono-server because cgi-fcgi has no support
for setting environment variables or passing arguments to the FastCGI
application. CGI variables also have to be removed to avoid falling back
to them: <bash>

1.  !/bin/sh

umask 0077 exec \>\>/home/username/tmp/mono-fcgi.log exec
2\>\>/home/username/tmp/mono-fcgi.err

echo \$(date +"[%F %T]") Starting fastcgi-mono-server2

cd / chmod 0700 /home/username/tmp/mono-fcgi.sock echo
\$\$\>/home/username/tmp/mono-fcgi.pid

1.  stdin is the socket handle

exec env -i \\ PATH="/home/username/mono/bin:\$PATH" \\
LD\_LIBRARY\_PATH="/home/username/mono/lib:\$LD\_LIBRARY\_PATH" \\
TMP="/home/username/tmp" \\ MONO\_SHARED\_DIR="/home/username/tmp" \\
/home/username/mono/bin/fastcgi-mono-server2 \\
/root=/home/username/public\_html
/applications=/:/home/username/public\_html </bash>

This script also logs stdout and stderr and creates a pid file.

You may want to use name based virtual hosts or define more applications
on command line. For more information see [How Applications are
Handled](FastCGI#How_Applications_are_Handled_(and_how_to_configure_them){{site.url}}/ "wikilink").

Recycling the FastCGI server
----------------------------

The FastCGI server can be recycled by removing the socket file that will
allow pending requests to be processed by the existing server process
while new requests will be routed to a new server process created by
cgi-fcgi.

The following script (<i>/home/username/bin/recycle-mono-fcgi</i>) can
be used in a cron job to recycle the FastCGI server periodically:

<bash>

1.  !/bin/sh

SOCKETFILE=/home/username/tmp/mono-fcgi.sock
PIDFILE=/home/username/tmp/mono-fcgi.pid PID=0

if [ -e \$PIDFILE ]; then

`   PID=$(cat $PIDFILE 2>/dev/null)`\
`   if [ -z "$PID" -o -z "$(ps --pid $PID -o pid=)" ]; then`\
`       PID=0`\
`   fi`

fi

if [ \$PID -ne 0 ]; then

`   # New requests will be routed to a new server process`\
`   rm -f $PIDFILE`\
`   rm -f $SOCKETFILE`\
`   # Wait for pending requests`\
`   sleep 2`\
`   kill $PID`\
`   # Wait for graceful shutdown`\
`   sleep 2`\
`   if [ -n "$(ps --pid $PID -o pid=)" ]; then`\
`       # Kill if failed to terminate`\
`       kill -9 $PID`\
`   fi`

fi </bash>

For security reasons you should execute this script using the user
account of the FastCGI server to avoid terminating processes of other
users.

ASP.NET configuration
---------------------

To improve security you should disable access to CGI script source code
(<i>/home/username/public\_html/cgi-bin/Web.config</i>):

<div class="xml">
    <pre><code>
    <configuration>
      <system.web>
        <httpHandlers>
          <add verb="*" path="mono-cgi" type="System.Web.HttpForbiddenHandler" validate="true"/>
        </httpHandlers>
      </system.web>
    </configuration>
    </code></pre>

</div>
Apache configuration
--------------------

A simple Apache configuration file
(<i>/home/username/public\_html/.htaccess</i>):

    Action mono-cgi /cgi-bin/mono-cgi
    AddHandler mono-cgi .aspx .asmx .ashx .ascx .asax .axd .config .cs

You may want to handle other extensions with ASP.NET. For more examples
on configuration see [Manual Mod\_Mono
Configuration](Mod mono#{{site.url}}/Manual_Mod_Mono_Configuration "wikilink").

To improve security you should protect ASP.NET Application Folders:

    Redirect 404 /bin
    Redirect 404 /App_Browsers
    Redirect 404 /App_Code
    Redirect 404 /App_Data
    Redirect 404 /App_GlobalResources
    Redirect 404 /App_LocalResources
    Redirect 404 /App_WebReferences

Non-existent files can also be handled with Apache 2.2:

    Action mono-cgi /cgi-bin/mono-cgi virtual
    AddHandler mono-cgi .aspx .asmx .ashx .ascx .asax .axd .config .cs

Or handle all requests with ASP.NET:

    Action mono-cgi /cgi-bin/mono-cgi
    SetHandler mono-cgi

You also will have to create a configuration file
(<i>/home/username/public\_html/cgi-bin/.htaccess</i>) to avoid server
error resulting from circular dependency:

    <Files mono-cgi>
      Options +ExecCGI
      SetHandler cgi-script
    </Files>

You also may have to use this to enable CGI script execution.

<i>Author: Kornél Pál <http://www.kornelpal.com/></i>

<Category:ASP.NET>

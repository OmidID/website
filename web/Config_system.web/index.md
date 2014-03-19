---
Title: ./Config_system.web
layout: default
---

The <system.web> section is a component of the
[configuration]({{site.url}}/Config "wikilink") of an application. Usually part of
the Web.config application that can be used to configure the various
components of the System.Web assembly.

It can appear inside a <configuration> section or inside a <location>
section. If it is found alone, it will apply to all the urls accessed by
System.Web:

<div class="xml">
    <pre><code>
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
        <system.web>
        ...............
        </system.web>
    </configuration>
    </code></pre>

</div>
More than one Web.config can exist for different parts of the
application, you can have one per directory. The load order is like
this:

-   First, global settings from machine.config are loaded
-   Second, the top-level settings from the application root are loaded,
    new settings overwrite old settings.
-   For each nested directory, the new settings are loaded for that
    particular url.

Assuming that your application toplevel virtual directory is /app, this
means that /app/index.aspx will get the settings from machine.config
plus any settings set in the /app/Web.config file; the file
/app/demo/index.aspx will get the settings from machine.config plus any
settings that might exist in /app/Web.config and then any settings that
might exist in /app/demo/Web.config.

If you want it to apply to only one set of pages, you can nest this
inside a <location> section. The following example requires that the
user is authenticated before they can access the edit.aspx file:

<div class="xml">
    <pre><code>
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
        <location path="edit.aspx">
            <system.web>
                <authorization>
                    <deny users="?" />
                </authorization>
            </system.web>
        </location>
    </configuration>
    </code></pre>

</div>
Child elements
--------------

The following child elements can be used to configure different modules
of System.Web:

-   [<authentication>]({{site.url}}/Config system.web authentication "wikilink")
-   [<authorization>]({{site.url}}/Config system.web authorization "wikilink")
-   [<customErrors>]({{site.url}}/Config system.web customErrors "wikilink")
-   [<globalization>]({{site.url}}/Config system.web globalization "wikilink")
-   [<pages>]({{site.url}}/Config system.web pages "wikilink")

Other settings
==============

When you use the Mono.Http assembly, there is a set of configuration
options that can be used. These are part of the <mono.aspnet> space, for
details see the [ ASP.NET Modules]({{site.url}}/ASP.NET_Modules "wikilink") page.

<Category:ASP.NET>

---
Title: ./Config_system.web_customErrors
layout: default
---

Use the customErrors attribute to configure how errors must be presented

An example of this [<system.web>]({{site.url}}/Config_system.web "wikilink") section
is:

<div class="xml">
    <pre><code>
    <customErrors mode="On|Off|RemoteOnly" defaultRedirect="somepage.aspx">
      <error statusCode="400" redirect="error400.aspx" />
      ...
    </customErrors>
    </code></pre>

</div>
*mode* specifies if this setting is enabled for every request (On),
enabled for remote requests only (RemoteOnly) or disabled.

The default is **RemoteOnly**

*defaultRedirect* is the redirection sent when no explicit <error>
exists for a given error status code.

<Category:ASP.NET>

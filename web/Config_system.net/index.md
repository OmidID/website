---
Title: ./Config_system.net
layout: default
---

The <system.net> child of <configuration> section in machine.config, or
the application or assembly .config file is used to configure the
System.Net namespace.

Syntax:

<div class="xml">
    <pre><code>
    <configuration>
      <system.net>
         <connectionManagement>
           ...
         </connectionManagement>
      </system.net>
    </configuration>
    </code></pre>

</div>
<connectionManagement>
----------------------

The **connectionManagement** section is used to configure the
[ServicePointManager](http:/monodoc/T:System.Net.ServicePointManager)
class, which is used by
[System.Net.WebClient](http:/monodoc/T:System.Net.WebClient) to manage
its connections.

Inside a connectionManagement section, you can have the following tags:

<div class="xml">
    <pre><code>
    <connectionManagement>
      <add name="address" maxconnection="NN"/>
    </connectionManagement>
    </code></pre>

</div>
Where the **address** is the host name, or the wildcard "\*" to apply to
all connections. And maxconnection is the maximum number of open
connections on that host.

Alternatively an application can change that setting by setting the
[DefaultConnectionLimit](http:/monodoc/P:System.Net.ServicePointManager.DefaultConnectionLimit)
value in the
[ServicePointManager](http:/monodoc/T:System.Net.ServicePointManager).

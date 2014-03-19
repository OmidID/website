---
Title: ./Config_system.web_globalization
layout: default
---

An example of this [<system.web>]({{site.url}}/Config_system.web "wikilink") section
is:

<div class="xml">
    <pre><code>
    <configuration>
            <system.web>
                <globalization
                            requestEncoding="utf-8"
                            responseEncoding="utf-8"
                            fileEncoding="iso-8859-15"
                    />
            </system.web>
    </configuration>
    </code></pre>

</div>
The <globalization> section can not have child nodes, it is only used to
configure the following settings

#### Encodings

The encoding is any encoding that can be recognized by
[System.Text.Encoding.GetEncoding()](http:/monodoc/M:System.Text.Encoding.GetEncoding(string)).
In addition to all the string recognized there, the following shortcuts
are recognized:

-   ucs-2, utf-16, utf-16le, unicode, iso-10646-ucs-2: UnicodeEncoding
    Little Endian.
-   utf-16be, unicodefffe: UnicodeEncoding Big Endian.
-   utf-8, unicode-1-1-utf-8, unicode-2-0-utf-8, x-unicode-1-1-utf-8,

x-unicode-2-0-utf-8: UTF8 Encoding.

*requestEncoding* if set, the encoding for parsing the request.

*responseEncoding* if set, the encoding used to generate the response.

*fileEncoding* if set, the encoding used by the source code.

#### Culture Configurations

*culture*: The culture used during page processing.

*uiCulture* The UI Culture used during page processing.

<Category:ASP.NET>

---
Title: ./Generating_class_status_pages
layout: default
---

As you evolve your APIs, you might want to ensure that you have not
removed accidentally public API entry points, or changed their APIs if
you want your users to experience a smooth upgrade to a new version of
your library.

To achieve this, you can use some tools that the Mono team uses
internally.

The Concept
-----------

We use a couple of tools to check API compatibility. The
<b>mono-api-info</b> tool is used to generate an XML representation of
an assembly, this is done by using reflection. The tool is run on your
original and new versions of the assemblies, and then you employ the
<b>mono-api-diff</b> tool to generate a list of differences in your
libraries.

The differences can then be rendered into an DHTML page that allows the
developers to browse the changes, or can be consumed by your own tools
to document changes or annotate your documentation.

Using our tools
---------------

If you want to use our tools to compare your own libraries you will need
to build the tools using SVN (see [AnonSVN]({{site.url}}/AnonSVN "wikilink")).

Once you check out the <i>mcs</i> module:

-   Go to <i>mcs/tools/corcompare</i> and type <i>make</i>. It will
    compile <b>mono-api-info</b> and <b>mono-api-diff</b>.
-   Running the following command will give you /tmp/yourassembly-v1.xml
    containing a list of classes, methods, etc...:

<bash> mono mono-api-info.exe /home/user/blah/yourassembly-v1.dll \>
/tmp/yourassembly-v1.xml </bash>

-   Run:

<bash> mono mono-api-info.exe /home/user/blah/yourassembly-v2.dll \>
/tmp/yourassembly-v2.xml </bash>

-   Now we want to compare the two XML files that we have and generate
    another one that will be used when creating the web page.

<bash> mono mono-api-diff.exe /tmp/yourassembly-v1.xml
/tmp/yourassembly-v2.xml \> /tmp/yourassembly-compare-v1-vs-v2.xml
</bash>

When you run <i>make</i> in <i>mcs/tools/corcompare</i>,
<b>transform.exe</b> was also compiled. This is a small program that
just applies a given XSL transformation to a XML file. In the same
directory, there's a <b>mono-api.xsl</b> containing the XSL
transformation that we use.

The command: <bash> mono transform.exe
/tmp/yourassembly-compare-v1-vs-v2.xml mono-api.xsl \>
/tmp/v1-vs-v2.html </bash> will create the HTML page in
/tmp/v1-vs-v2.html.

The images and javascript files used by the generated HTML are also in
module <i>mono</i>, directory <b>mono/web/web/deploy/cm</b>.

For these files to work, you must insert the generated HTML into a
container that pulls the scripts at startup, the "cm/cormissing.js" file
and reference the file cm/cormissing.css as well, like this:

<div class="xml">
    <pre><code>
       <head>
         <link rel="stylesheet" type="text/css" href="cm/cormissing.css"/>
         <script src="cm/cormissing.js"></script>
       </head>
    </code></pre>

</div>
[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:Articles>

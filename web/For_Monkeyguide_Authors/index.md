---
Title: ./For_Monkeyguide_Authors
layout: default
---

Source Code Examples
====================

C\#
---

Wrap source code in \<div
class="csharp"\>\<pre\>\<code\>\</code\>\</pre\>\</div\> tags, e.g.:

    <nowiki>
     <div class="csharp"><pre><pre><code>
     public static void Main()
     </code></pre>

</div>
</nowiki>

</pre>
which will produce nice colored syntax output like this:

<div class="csharp">
    <pre><code>
    public static void Main()
    </code></pre>

</div>
C
-

    <nowiki>
    <div class="c"><pre><pre><code>
    void *mono_gc_alloc_fixed      (size_t size, void *descr);
    </code></pre>

</div>
</nowiki>

</pre>
for having output like:

<div class="c">
    <pre><code>
    void *mono_gc_alloc_fixed      (size_t size, void *descr);
    </code></pre>

</div>
Bash
----

Wrap bash commands in \<bash\>\</bash\> tags, e.g.:

    <nowiki>
     <bash>
     ls -l
     </bash>
    </nowiki>

which will produce output like this:

<bash>

` ls -l`

</bash>

XML
---

    <nowiki>
    <div class="xml"><pre><pre><code>
    <tag attribute="value" />
    <tag2>Content</tag2>
    </code></pre>

</div>
</nowiki>

</pre>
will be formatted to:

<div class="xml">
    <pre><code>
    <tag attribute="value" />
    <tag2>Content</tag2>
    </code></pre>

</div>
<i>What else is supported?</i>

Linking to Monodoc
==================

To link to Monodoc class library documentation, give a link like

`[http:/monodoc/T:System.Runtime.InteropServices.DllImportAttribute DllImport]`

which will appear as
[DllImport](http:/monodoc/T:System.Runtime.InteropServices.DllImportAttribute).
Or with something like:

-   http:/monodoc/N:System.IO to link to a namespace
-   http:/monodoc/T:System.Type to link to a type
-   http:/monodoc/C:System.Text.StringBuilder(string) to link to a
    constructor
-   http:/monodoc/M:System.String.ToString() to link to a method
-   http:/monodoc/P:System.String.Length to link to a property, and
    similarly F for fields and E for events

<Category:Monkeyguide>

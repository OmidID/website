---
Title: ./Mixing_with_Other_Languages
layout: default
---

Mixing and Matching CLR Languages
=================================

-   [Using Mono with Java]({{site.url}}/Java "wikilink")
-   [Using Mono with Visual
    Basic.NET]({{site.url}}/VisualBasic.NET_support "wikilink")
-   [Using Mono with Other Languages]({{site.url}}/Languages "wikilink")

Embedding the Mono runtime in an existing native application
============================================================

![`Description`](http://localhost:4000/files/Embed small.jpg "Description")

The Mono runtime can be embedded into an existing C, C++ or Objective-C
based application. Embedding allows developers to keep their existing
investment on their current code base while extending its functionality
with CIL-based components. This is a key concept: to take advantage of
Mono, you do not need to rewrite your software from scratch: you can
keep everything you have today, and write new code in Mono, and have
both universes communicate with each other.

Embedding is also known as "hosting" to developers coming from the .NET
Framework.

Embedding is particularly useful when you have an existing application,
but you would like to extend its functionality either by reusing
third-party Mono, .NET components or Java components, or enable
developers to "script" components of your application with any of the
.NET or Java supported languages.

The embedding API of Mono requires some little knowledge about C and
C\#. You might not need to read this entire document, it depends very
much on the needs of your application.

(P/Invoke allows Mono developers to call from the managed world APIs
that are exposed by the C universe and provides various automatic
marshalling mechanisms to convert information back and forth between the
managed world and the unmanaged world. For more details on the P/Invoke
platform, you are encouraged to read the
[Interop\_with\_Native\_Libraries]({{site.url}}/Interop_with_Native_Libraries "wikilink").)

For more information, see [Scripting With
Mono]({{site.url}}/Scripting With Mono "wikilink") and [Embedding
Mono]({{site.url}}/Embedding Mono "wikilink").

<Category:Monkeyguide> [Category:Developer
Resource]({{site.url}}/Category:Developer Resource "wikilink") [Category:Mono
Framework]({{site.url}}/Category:Mono Framework "wikilink")

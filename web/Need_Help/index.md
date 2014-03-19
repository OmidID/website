---
Title: ./Need_Help
layout: default
---

\_\_NOTOC\_\_

When having a more frequent problem as listed below please click the
link to jump to the corresponding section:

1.  Dealing with [compilations issues when building
    Mono](#{{site.url}}/Issues_compiling_Mono_itself "wikilink") or
    [bugs]({{site.url}}/Bugs "wikilink") of Mono
2.  Problems when using Mono
    1.  [Can not compile my
        source](#{{site.url}}/Can_not_compile_my_source "wikilink")
    2.  [Works under .Net but not on
        Mono](#{{site.url}}/Works_under_.Net_but_not_on_Mono "wikilink")

3.  Looking for [commercial support]({{site.url}}/Support "wikilink")
4.  [Lost in the website]({{site.url}}/SiteMap "wikilink")

If your issue has not been listed please read the [Problems of a
different kind](#{{site.url}}/Problems_of_a_different_kind "wikilink")-Section.

Issues compiling Mono itself
----------------------------

Since Mono is a large piece of software you must strictly follow the
[Compiling Mono]({{site.url}}/Compiling Mono "wikilink")-Article as it contains a
good compiling-howto. Especially keep a close look at the requirements
of mono and if they are met (e.g. [libgdiplus]({{site.url}}/Libgdiplus "wikilink")).
If the problems still remain please send a mail to the
[mono-devel-list](http://lists.ximian.com/mailman/listinfo/mono-devel-list).

Can not compile my source
-------------------------

When compiling your sources please bear in mind that mono provides three
[C\#-Compilers]({{site.url}}/CSharp Compiler "wikilink"), **mcs**, **gmcs** and
**smcs**.

-   **mcs** is the standard compiler for code which is targeting the
    .Net Framework 1.1
-   **gmcs** is Mono's compiler for the the .Net Framework 2.0 and
    beyond\*\
    <small>\* gmcs does partly support [C\# 3.0 language
    features](CSharp Compiler#{{site.url}}/Under_Development_Features "wikilink")</small>
-   **smcs**: compiler to target the 2.1 runtime, to build
    [Moonlight]({{site.url}}/Moonlight "wikilink") applications.

Most help request regarding the compilation of user software can be
fixed by adding the proper references because only `mscorlib.dll` and
`System.dll` are referenced by default.

To add references to additional assemblies, the `-r:Assembly` switch can
be used: <bash>gmcs Source.cs -r:System.Drawing.dll
-r:System.Windows.Forms.dll</bash>

More help can be found in the manuals of mcs and gmcs: <bash>man
gmcs</bash>

Works under .Net but not on Mono
--------------------------------

Naturally this question is very hard to answer since it relies on the
specific application trying to run on Mono. Please read [Guide: Porting
Winforms Applications]({{site.url}}/Guide: Porting Winforms Applications "wikilink")
or [Guide: Porting ASP.NET
Applications]({{site.url}}/Guide: Porting ASP.NET Applications "wikilink") as they
provide a good overview on how to run windows applications on Mono.

Problems of a different kind
----------------------------

In general users can always turn to the [Mailing
Lists]({{site.url}}/Mailing Lists "wikilink") when having problems but for more
information on where to get Support please take also a look at the
[Support-Category]({{site.url}}/:Category:Support "wikilink").

<Category:Support>

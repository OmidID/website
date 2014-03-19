---
Title: ./AnonSVN
layout: default
---

1.  REDIRECT [SourceCodeRepository]({{site.url}}/SourceCodeRepository "wikilink")

Warning
=======

**Mono is no longer hosted on Subversion and it is now hosted at
[GitHub](http://github.com/mono) as the [Mono
Organization](http://github.com/mono). SVN access is no longer
available**

Anonymous SVN access
====================

Anonymous access to the Mono SVN is available currently from one server
(anonsvn.mono-project.com)

### Checking out the sources

To list the available modules, type:

    svn list svn://anonsvn.mono-project.com/source/trunk

To check out the sources for the first time from the repository, use
this command:

    svn co svn://anonsvn.mono-project.com/source/trunk/MODULE_NAME

To get the compiler and class libraries (mcs), the interpreter and JITer
(mono) and the Gtk\# bindings, use these commands:

    svn co svn://anonsvn.mono-project.com/source/trunk/mcs 
    svn co svn://anonsvn.mono-project.com/source/trunk/mono 
    svn co svn://anonsvn.mono-project.com/source/trunk/gtk-sharp

To get the modules from a branch, like Mono 2.6:

    svn co svn://anonsvn.mono-project.com/source/branches/mono-2-6

### Accessing the repository with http

You can also use http to access the repository, like:

    svn co http://anonsvn.mono-project.com/source/trunk/MODULE_NAME

### Updating your sources

To update your sources every day, you use this command:

    svn up mcs mono gtk-sharp

### Building Mono from source

Once you've obtained the source code for different modules of the Mono
project, you'll want to [ build Mono from
source]({{site.url}}/Compiling_Mono "wikilink")

Browsing the Sources
====================

If all you need is to browse the sources, you can go to
[<http://anonsvn.mono-project.com/>](http://anonsvn.mono-project.com/)
and use the <i>viewvc</i> interface. Sources are updated immediately
after each commit.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
[Category:Mono Framework]({{site.url}}/Category:Mono Framework "wikilink")

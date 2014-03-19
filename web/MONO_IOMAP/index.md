---
Title: ./MONO_IOMAP
layout: default
---

Introduced in Mono 1.2, MONO\_IOMAP allows Mono to ignore certain types
of file IO errors caused by applications not properly coded to deal with
differences between Windows file systems and Linux file systems.

The types of issues MONO\_IOMAP fixes are:

-   Linux file systems are case sensitive, Windows is not.
-   Linux uses '/' as the path separator, Windows uses '\\'.
-   Windows paths begin with a drive letter, Linux paths do not.

The options that can be passed to MONO\_IOMAP are:

-   case: makes all file system access case insensitive.
-   drive: strips drive name from pathnames.
-   all: enables both case and drive.

All options will trigger the directory separator mapping.

To run your application:

    $ export MONO_IOMAP=all
    $ mono myapp.exe

For ASP.NET applications hosted with mod\_mono, you can add the
following directive to your Apache configuration file:

    MonoSetEnv MONO_IOMAP=all

\

<div style="margin-left: auto; padding: 5px; margin-right: auto; background-color: #C6D8ED; border: 1px solid #5084C5; border-left-width: 10px; margin-top: 7px; margin-bottom: 20px;">
Note: MONO\_IOMAP is a shortcut to help port your application to Mono.
However, there is a performance hit that comes with using it. For the
long term, it is recommended that you change your application to be
cross platform compatible without MONO\_IOMAP. For guidance, see
<Guidelines:Application_Portability>.

</div>

---
Title: ./Article:IOChanges
layout: default
---

`This is Work in Progress`

Background
==========

During the last few months (today is 2005-04-15) Mono has been used more
and more for long-running applications on the desktop and on the server,
and the applications have also grown in size. We have isolated a few
problem areas in Mono that were preventing Mono from scaling, due to
memory issues, or introduce instabilities, or added too much pressure to
the existing framework.

We have addressed many of these issues:

io-layer
========

Mono's cross platform library for isolating operating system differences
for I/O, synchronization primitives and networking operations is called
the "io-layer", and it serves a similar purpose to Mozilla's NSPR, or
Apache's APR runtimes: they help us isolate the cross-platform details
from our runtime.

This layer does more than IO, it provides:

-   Thread management.
-   File system information (directories, files)
-   I/O for files and sockets.
-   Network functionality.
-   Process management.
-   Synchronization primitives: in-process and cross-process.
-   Handle foundation (every handle used above is managed with this).

The layer is fairly small and has less than one hundred public API entry
points. These APIs mimic the Win32 primitives which allows Mono on
Windows to use the Win32 calls, while using the emulation layer on
non-Windows platforms.

The Deceased Daemon
-------------------

**This applies to old versions of Mono (pre 1.1.13)**

To emulate some of the behavior surfaced by the .NET APIs, Mono used to
run a daemon process which would allow multiple Mono processes to get
the same behavior as the Windows equivalents, for example it was
possible for any process to Wait for their child to die.

The daemon was used to keep track of the information that was shared
across processes, but this lead to a few problems: all the information
that had to be centralized required a roundtrip to notify the daemon
which degraded performance as many operations required a round trip.

The New IO-Layer
----------------

We have redesigned our IO-Layer to remove the daemon and some of the
features associated with it. This was done for the sake of stability,
reliability and performance.

This new implementation is a daemon-less implementation which uses a
shared memory table (stored in the file \~/.wapi) to keep track of
information that must be shared across processes.

The good news is that barely anyone ever used those features; The bad
news is that this is something else to keep in mind while porting an
application from Windows to Linux.

With the new io-layer existing applications like ASP.NET went from 75
requests per second to 260 requests per second.

### The Shared Memory Table

The shared memory table is used today to store the following
information:

-   process
-   named mutex
-   named event
-   named semaphore
-   threads
-   file-share information

The biggest chunk of information is the file-share table (this is used
for permission checking and file sharing modes).

The combinations of file share modes are in mono/docs/file-share-modes

### Keeping State

The cross-process shared handles are kept now in a shared memory segment
that all Mono processes share instead of being kept in a daemon.

This means that the various Mono processes must cooperate to keep the
table up-to-date and cope with the potential of processes that might
fail abruptly (unmanaged debugging, crashes that do not clean up,
runtime assertions).

To do this, the io-layer keeps a timestap on each slot that gets
refreshed by a Mono thread every N seconds. If the handle has not been
refreshed in the proper window of usage, the handle slot is considered
unused by other processes.

What is no longer supported
---------------------------

The following features are no longer supported:

-   Waiting for a process to exit from an arbitrary process. This is now
    limited to Parent/Child relations.

ThreadPool and asynchronous socket operations
=============================================

An ongoing problem with Mono were the ThreadPool-related deadlocks (see
our [article describing the
problem]({{site.url}}/Article:ThreadPool_Deadlocks "wikilink")). Basically the
ThreadPool is a resource that is easy to starve, and which can cause
deadlocks in your applications. Mono extensive use of the ThreadPool for
internal operations made this problem more notorious, ASP.NET and
HttpWebRequest being hungry consumers.

We have redesigned the internals in the class libraries and the runtime
to address this problem not using the user ThreadPool internally. Right
now, the only noticeable consumer in the class libraries is the ASP.NET
runtime.

As a result of the changes we now have:

-   An independent thread pool for asynchronous IO operations.
-   One thread waits for events on all the sockets used in a program.
    -   This will use select/poll by default but will use linux
        <b>epoll</b>, available at least in all 2.6 kernels, if present.
        epoll performance is way better than the one we got with just
        select/poll and scales.
    -   The current infrastructure for socket asynchronous IO allows for
        better integration with native event polling APIs. <b>kqueue</b>
        support is under testing now.

If we're just receiving/sending, the actual read/write happens in a
thread from the dedicated IO threadpool as soon as the socket is ready.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

---
Title: ./Mono:Runtime:Documentation:Other
layout: default
---

Faster runtime builds
=====================

To speed up runtime builds, use one or more of the following:

-   Turn off optimization by passing CFLAGS=-O0 to configure.
-   Turn off generation of libmono by passing --disable-libraries to
    configure.
-   Build in parallel, i.e. using make -j4.

Runtime debugging methods
=========================

Debugging crashes which don't happen inside gdb, or only happen when a test program is ran in a loop
----------------------------------------------------------------------------------------------------

Set the MONO\_DEBUG env variable to 'suspend-to-sigsegv'. This causes
the runtime native SIGSEGV handler to spin in a loop, so gdb can be
attached to the running process.

Setting native breakpoints in managed methods
---------------------------------------------

Use the --break <METHOD> command line argument. The JIT will generate a
native breakpoint (INT on x86) into the prolog of the given method. Use
--break-at-bb <METHOD> <bb num> to set a breakpoint at the start of a
given basic block.

Displaying JIT debug output
---------------------------

Use the -v -v -v -v command line argument. Set the MONO\_VERBOSE\_METHOD
env variable to display output for only one method.

Displaying runtime debug output
-------------------------------

Set the MONO\_LOG\_LEVEL env variable to 'debug'. The log output is
useful for diagnosing assembly loading/AOT/pinvoke problems.

mono\_debug\_count ()
---------------------

This is useful for debugging problems where a piece of code is executed
many times, and we need to find out which run causes the runtime to
misbehave, i.e. which method is miscompiled by the JIT etc. It works by
changing <bash> do\_something () </bash> To: <bash> if
(mono\_debug\_count ()) {

` `<do something>

} </bash> mono\_debug\_count () is controlled by the COUNT env variable,
the first COUNT times it is called, it will return TRUE, after that, it
will return FALSE. This allows us to find out exactly which execution of
<do something> causes the problem by running the application while
varying the value of COUNT using a binary search.

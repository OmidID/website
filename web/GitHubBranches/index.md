---
Title: ./GitHubBranches
layout: default
---

Documentation for some developer branches on GitHub.

<https://github.com/vargaz/mono>
================================

Most of these branches are unfinished/work-in-progress.

aot-direct-icalls
-----------------

Proof of concept implementation of calling icalls directly from AOT code
in static mode.

inline-wrappers
---------------

Inline managed-to-native wrappers into their callers, to reduce icall
overhead.

llvm-varargs
------------

Change the vararg calling convention to be compatible with the platform
ABI, so vararg methods can be compiled using LLVM.

mcs-parallel-build
------------------

Building the class libs in parallel.

mk
--

automake/libtool replacement using GNU Make facilities. This has the
following advantages:

-   faster.
-   no need for the Makefile.am -\> Makefile.in -\> Makefile
    transitions, normal Makefile's can be used.
-   the configuration information is in a single conf.mk file which is
    directly editable.

normal-throw-trampolines
------------------------

Throwing exceptions using the normal mono trampolines instead of the
specialized ones currently used.

resume-unwind
-------------

Implementation of finally blocks in the style of the c++ ehabi.

soft-breakpoints
----------------

Implementation of breakpoints using trampolines instead of page faults.

thumb2
------

Thumb2 support for ARM.

unwind-info-for-epilogs
-----------------------

Emit precise unwind info for method epilogs.

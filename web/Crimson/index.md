---
Title: ./Crimson
layout: default
---

What is it ?
============

Crimson offers a superset of the cryptographic features available in the
.NET framework. For various reasons Crimson isn't distributed within
Mono. The main reasons being:

Target audience
---------------

As a superset to both .NET and Mono cryptographic features, Crimson is
useful to everyone, not just Mono users.

Support
-------

Crimson is not required inside Mono to reach feature parity with MS
implementation of the .NET framework and it's related tools. As such
supporting Crimson is not the goal of the Mono project.

Export restrictions
-------------------

Laws regarding export and, sometimes import, of cryptography are diverse
and complex. It is difficult to add/remove algorithms and keep all the
required paperwork in sync.

Goals
=====

Extend
------

Crimson can **extends** .NET cryptography by providing:

-   alternative implementations of existing cryptographic algorithms;
-   new cryptographic algorithms (e.g. algorithms unavailable in .NET);
-   new tools (e.g. benchmarking);

Simplify
--------

Crimson can **simplify** .NET cryptography by providing easier API
mapping to user, not cryptographic, tasks (e.g. Encrypting file using a
key, certificate...).

Optimize
--------

Crimson can **optimize** .NET cryptography because it let you choose the
best implementation (e.g. memory restrictions, performance, deployment)
for your project.

Availability
============

The source code for Crimson is available in [SVN]({{site.url}}/SVN "wikilink") under
the module name **crimson**.

Current state
=============

Wrappers
--------

Crimson now has wrappers for all hash algorithms part of the
**libmhash** library. Performance gains are visible when digesting large
buffers (e.g. more than 1 Mb).

Plans
=====

-   Move **Mono.Security.Win32**, which is a wrapper around CryptoAPI,
    to the Crimson project;
-   Add a wrapper assembly around **libmcrypt**;
-   Copy managed cryptographic implementations of Mono into Crimson to
    optimize them (e.g. unrolling);
-   Copy managed (and safe) cryptographic implementation of Mono into a
    Silverlight/Moonlight compatible assembly;
-   Add more general benchmarking tools

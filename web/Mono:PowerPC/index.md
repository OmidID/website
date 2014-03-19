---
Title: ./Mono:PowerPC
layout: default
---

The PowerPC port is complete (native code generator (JIT) and
interpreter).

It works on [Mac OS X]({{site.url}}/Mono:OSX "wikilink"),
[Linux/PPC]({{site.url}}/Mono:Linux "wikilink"), [Nintendo Wii]({{site.url}}/Mono:Wii "wikilink")
and [Sony PlayStation 3](Mono:PlayStation3{{site.url}}/ "wikilink").

The port owner is Paolo Molaro.

Documentation
-------------

<b>PowerPC architecture:</b>

-   [PowerPC Programming environments
    manual](http://www.freescale.com/files/product/doc/MPCFPE32B.pdf),
    ([errata](http://www.freescale.com/files/product/doc/MPCFPE32BAD.pdf)
    document).

-   [G4 (7410) User's
    manual](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UM.pdf)
    ,
    ([errata](http://www.freescale.com/files/32bit/doc/ref_manual/MPC7410UMAD.pdf)
    document).

A nice introduction to PowerPC assembly language at
[<http://www-106.ibm.com/developerworks/library/l-ppc/>](http://www-106.ibm.com/developerworks/library/l-ppc/)

<b>Calling conventions:</b>

-   Linux on PPC32 uses the [The PowerPC SystemV ABI
    specification](http://refspecs.freestandards.org/elf/elfspec_ppc.pdf).
-   On MacOS X, the conventions are documented in the [Mach-O Runtime
    Architecture](http://developer.apple.com/documentation/DeveloperTools/Conceptual/MachORuntime/MachORuntime.pdf).

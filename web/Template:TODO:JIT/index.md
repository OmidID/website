---
Title: ./Template:TODO:JIT
layout: default
---

|- |Delegate Optimization||There a number of new optimizations for
special cases of delegates, these are quite visible in IronPython 2.0
and DLR-based applications (there is a significant performance drop for
Mono while it should have been a performance
increase)||Medium||align="center"|1-2 months||See [this
bug](http://bugzilla.ximian.com/show_bug.cgi?id=81663) for details on
what we know. |- |Generics Code Cleanup||Need details from Paolo on the
work needed||Medium||align="center"|1 month||N/A |- |Performance
Reasearch||Mono is known to be not as performance as the .NET Framework,
but not enough information is available about where the actual weak
spots are. Tests like SciMark and IronPython pybench could be used to
understand our current limitations||Medium-hard||align="center"|1-3
months||N/A |- |JIT (mono/mini/)||Port the JIT to additional
architectures. Currently ports exist for x86, x86-64, ppc, sparc, mips
and s390.\
Ports to more architectures are welcome as
well.||Medium-hard||align="center"|1-3 months per arch||N/A |- |JIT
(mono/mini/)||Optimize AOT compiler output. Currently the code generated
by the AOT compiler may be significantly slower than jitted code. This
is mostly because the AOT code supports multiple application domains and
some values that are constant at JIT-time are not constant at AOT-time.
It may be needed to write a simple dynamic linker and/or binary object
writer. A possible idea for improvements is also the use of appdomain
ID-indexed tables to get at the appdomain specific data.||Medium-hard
(thesis subject)||align="center"|3-6 months||Zoltan Varga is working on
this.

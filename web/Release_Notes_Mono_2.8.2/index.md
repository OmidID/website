---
Title: ./Release_Notes_Mono_2.8.2
layout: default
---

Changes since Mono 2.8
======================

-   **[Security
    fix](http://www.mono-project.com/Vulnerabilities#XSP.2Fmod_mono_source_code_disclosure)
    for ASP.NET (XSP / mod\_mono) source code disclosure
    (CVE-2010-4225)**
-   Backport ParallelFx improvements from master (jlaval)
-   Fix state check for short-circuiting with SupportRecursion in
    ReaderWriterLockSlim \#655361 (jlaval)
-   Increment Count even on single-processor in SpinWait. Fix \#624849.
    (jlaval)
-   Update ThreadLocal to use default(T) for initialization with
    parameterless ctor. Fix \#658689. (jlaval)

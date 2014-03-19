---
Title: ./Template:TODO:Runtime
layout: default
---

|- |Runtime and JIT (mono/metadata and mono/mini/)||Implement support
for Code Access Security. Support needs to be added to the JIT and the
runtime to ensure code that executes privileged operations is permitted
to do so. The task includes loading the security information from
metadata, collecting evidence, inserting calls to the permission
objects, stack walking to collect security info.||Medium-hard (thesis
subject)||align="center"|4-5 months||Currently being worked on. See this
Bugzilla number for updates:
[52606](http://bugzilla.ximian.com/show_bug.cgi?id=52606)

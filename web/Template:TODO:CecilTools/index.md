---
Title: ./Template:TODO:CecilTools
layout: default
---

|- |Disassembler/assembler || although today we have both tools, we are
not very happy with our disassembler as it uses the Mono internal calls
which are not really designed to cope with incomplete assemblies (we
have an all-or-nothing codebase in this scenario). || Medium ||3-4
Months || jbevain is working on ildasm, still need to update the
assembler. |- |Code optimization using Cecil || this is a longer-term
project, but today compilers that target the CIL are known to generate
fairly straightforward CIL code leaving most of the work to the JIT
engine. An optimizer that could perform some tasks before the JIT
compiler hits the code would be useful.

Although our code generator is fairly good, and getting better the most
effective optimizations are never turned on for JIT-use as they are very
time consuming.

There are a couple of temporary measures that can be taken to address
this issue (ahead-of-time compilation and dynamic recompilation). Both
have small drawbacks.

A code optimizer would convert a CIL stream into a different CIL stream
that is compatible but has applied some optimizations before the JIT
sees them.

These optimizations could be a lot more complex than what the JIT
compiler can do today doing things like loop unrolling or processing a
file to automatically multithread some pieces of the program.

It is rumored that the MS C++ compiler produces better code than the C\#
compiler as it does do some IL-level loop unrolling for example. ||
Medium-Hard || 3-4 Months || Must validate claims, could reuse the
semantic information from a bug-finding tool.

---
Title: ./Guide:Debugger
layout: default
---

Introduction
============

This is a guide to the Mono Hard Debugger. Most developers will want to
use instead the [Soft Debugger]({{site.url}}/Soft_Debugger "wikilink") support in
Mono and MonoDevelop 2.2 as it supports debugging more kinds of
applications and it is in general more reliable than the hard debugger.

The principal difference between the hard debugger (MDB) and the soft
debugger is that the hard debugger can debug both managed and unmanaged
applications, while the soft debugger is limited to pure managed
applications. But the soft debugger is a more reliable debugger due to
its architecture.

It provides a reusable library that can be used to add debugger
functionality to different frontends. The debugger package includes a
console debugger named "mdb", and
[MonoDevelop](http://www.monodevelop.com) will also provide a GUI
interface for it soon.

Using the Hard Debugger with MonoDevelop
========================================

To use the Debugger with MonoDevelop, you should get at least Mono 2.4,
MonoDevelop 2.0, or preferably MonoDevelop 2.2 and the debugger
packages.

Details about the integrated debugger can be found on the [MonoDevelop
Release
Notes](http://monodevelop.com/Download/MonoDevelop_2.0_Released#Integrated_Debugger).

Using the Command Line Debugger
===============================

Preparing your Program
----------------------

To use the debugging facilities in Mono, you should compile your program
with debugging information. This is achieved by passing the `-debug`
option to the command line compiler.

`$ `**`gmcs` `-debug` `hello.cs`**

The debugger can debug both 1.x and 2.0 applications.

Debugging Symbols
-----------------

When using mcs -debug, the compiler generates a .mdb file which contains
the debug symbols that the debugger uses to map a method to a position
in a source file, and to get line numbers in stack traces.

If your program has been compiled inside Visual Studio or with csc, the
debugging symbols are stored in a .pdb file. You can use the program
pdb2mdb to convert the pdb to an mdb file that the debugger understands.

So if you have the files hello.exe and hello.pdb, you can use:

`$ `**`pdb2mdb` `hello.exe`**

To generate hello.exe.mdb.

Starting the Debugger
---------------------

Start the command line version of the debugger like this:

`$ `**`mdb` `Application.exe`**

to debug a managed application or

`$ `**`mdb` `nativeapplication`**

to debug a native application.

Alternatively, you can set the executable after starting the debugger:

` $ `**`mdb`**\
` (mdb) `**`file` `Application.exe`**\
` Executable file: Application.exe.`\
` (mdb)`

By default, the debugger will not start the application. You can either
use the <i>run</i> or <i>start</i> command:

` $ `**`mdb` `Application.exe`**\
` (mdb) `**`run`**

or you can also use the <i>-run</i> or <i>-start</i> argument on the
command line:

` $ `**`mdb` `-run` `Application.exe`**

The difference between these two commands is that <i>start</i> will
start the application and run until the first line of the application's
<i>main()</i> method while <i>run</i> won't stop in <i>main()</i>.

Command line arguments
----------------------

You can specify the command line arguments passed to the debuggee in
three ways:

​1. The "run" command:

` (mdb) `**`run` `arg1` `arg2` `...`**

​2. The "set args" command

` (mdb) `**`set` `args` `arg1` `arg2` `...`**

​3. On the command line when starting the debugger:

` $ `**`mdb` `-run` `-args` `Application.exe` `arg1` `arg2` `...`**

Commands
========

Quitting and restarting
-----------------------

To quit a debugging session, just type

`(mdb) `**`quit`**

To kill a debugging session, type

`(mdb) `**`kill`**

This will just kill program being debugged, but not the debugger. After
that, you can use <b>run</b> to restart the target:

`(mdb) `**`run`**

This'll restart your debugging session and stop at the applications's
entry point. Breakpoints are preserved across sessions.

Displaying processes and threads
--------------------------------

At the moment, the debugger can only debug one application at once - but
since we're following <i>fork()</i>'s, this application can have more
than one process.

You can find out which processes are currently being debugged with the
<b>show processes</b> (short: <b>show procs</b>) command:

`(mdb) `**`show` `procs`**\
`(*) Process #1 (13158:/work/rohan/INSTALL/lib/xsp/1.0/xsp.exe --root /work/rohan/INSTALL/lib ...)`

Each process can have one or more threads:

`(mdb) `**`show` `threads`**\
`Process #1 (13158:/work/rohan/INSTALL/lib/xsp/1.0/xsp.exe --root /work/rohan/INSTALL/lib ...):`\
`(*) Thread @1 (13158:2aaaab718f60) Stopped`\
`    Daemon thread @2 (13161:0) Running`\
`    Daemon thread @3 (13162:40224960) Running`\
`    Thread @4 (13220:40475960) Stopped`

The (\*) marks the current process / thread - this is the thread on
which all stepping commands operate (unless you override with the
<b>-thread</b> argument, see below). You can view or change the current
thread with the <b>thread</b> command:

`(mdb) `**`thread`**\
`Thread @1 (13158:2aaaab718f60) Stopped`\
`(mdb) `**`frame`**\
`#0: 0x40018b32 in Mono.XSP.Server.Main(System.String[])+0x13b2 at ./xsp/src/server.cs:476`\
` 476                            if (!nonstop) {`\
`(mdb) `**`thread` `4`**\
`Thread @4 (13220:40475960) Stopped`\
`(mdb) `**`thread`**\
`Thread @4 (13220:40475960) Stopped`\
`(mdb) `**`frame`**\
`#0: 0x40019830 in Mono.WebServer.ApplicationServer.RunServer()+0x18 at ./xsp/src/Mono.WebServer/ApplicationServer.cs:314`\
` 314                    started = true;`

All commands which access the target also take an optional
<b>-thread</b> argument to specify on which thread they should operate:

`(mdb) `**`frame`**\
`#0: 0x40018b32 in Mono.XSP.Server.Main(System.String[])+0x13b2 at ./xsp/src/server.cs:476`\
` 476                            if (!nonstop) {`\
`(mdb) `**`frame` `-thread` `4`**\
`#0: 0x40019830 in Mono.WebServer.ApplicationServer.RunServer()+0x18 at ./xsp/src/Mono.WebServer/ApplicationServer.cs:314`\
` 314                    started = true;`

If you look at the example above, you'll notice that some threads are
marked as <i>Deamon thread</i> - these are threads which are created and
used internally by the Mono runtime. The debugger doesn't prevent you
from debugging these, but you should know what you're doing.

Running and single stepping
---------------------------

The debugger has several commands to single step the target - unless you
use the <b>-thread</b> argument, they all operate on the current thread
(see [\#Displaying processes and
threads](#{{site.url}}/Displaying_processes_and_threads "wikilink") for details):

<dl>
<dt>
<b>continue</b>, <b>c</b>

</dt>
<dd>
Resume execution of the selected thread until it exists, receives a
signal or hits a breakpoint.

</dd>
<dt>
<b>background</b>, <b>bg</b>

</dt>
<dd>
Resume execution of the selected thread in the background, ie.
immediately give control back to the user, without waiting until the
target stops.

</dd>
<dt>
<b>stop</b>

<dd>
Stop execution of the selected thread by sending it a stop signal.

</dd>
<dt>
<b>step</b>, <b>s</b>

</dt>
<dd>
Step one source line.

</dd>
<dt>
<b>next</b>, <b>n</b>

</dt>
<dd>
Step one source line, but step over method calls.

</dd>
<dt>
<b>finish</b>

</dt>
<dd>
Run until the end of the current method. This command has two modes of
operation:

-   Without any arguments, step until the end of the current method.
    This only works if the current method has source code. Note that if
    the current method recursively calls itself, this will continue
    running until the last iteration has exited.
-   With the optional <b>-native</b> argument, continue stepping until
    the stack pointer reaches a value whic his higher than at the
    beginning of this operation. You can use this to finish out of a
    method without source code or to finish just the current iteration
    of a recursive method. Note that when called within a method (not at
    the start), this may stop several times.

</dd>
<dt>
<b>stepi</b>, <b>i</b>

</dt>
<dd>
Step one machine instruction.

`(mdb) `**`frame`**\
`#0: 0x401ba443 in X.Main()+0x3 at Foo.cs:218`\
`218        Simple ();`\
`(mdb) `**`stepi`**\
`Process @3 stopped at #0: 0x401ba5a0 in X.Simple() at Foo.cs:111.`\
`111    public static void Simple ()`\
`X.Simple():`\
`0x401ba5a0 push   %ebp`

This command will not enter JIT trampolines unless the <i>-native</i>
argument is given:

`(mdb) `**`frame`**\
`#0: 0x401ba443 in X.Main()+0x3 at Foo.cs:218`\
`218        Simple ();`\
`(mdb) `**`stepi` `-native`**\
`Process @3 stopped at #0: 0x0830f878.`\
`0x0830f878 push   $0x82b4398`

</dd>
<dt>
<b>nexti</b>, <b>t</b>

</dt>
<dd>
Step one machine instruction, but step over method calls.

</dd>
<dt>
<b>return</b>

</dt>
<dd>
Make the current stack frame return. This command is <i>dangerous</i>
since it just pops off the stack frame and doesn't care about return
values, <i>out</i> parameters etc.

Note than when you're inside a method which has been called by mdb (via
the <b>call</b> or <b>print</b> command, see below), <b>return</b> will
abort this invocation - in this case, <b>return</b> is safe to use.

</dl>
Of course, the debugger may stop earlier if the target receives a signal
(or exists).

Stack frames and backtraces
---------------------------

When the target stopped, you normally want to see the current stack
frame or get a backtrace:

<dl>
<dt>
<b>backtrace</b>, <b>bt</b>

</dt>
<dd>
Prints a backtrace.

`Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.`\
`113        int a = 5;`\
`(mdb) `**`bt`**\
`(*) #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113`\
`#1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219`

Takes an optional <i>-max</i> command specifying the maximum number of
frames to print:

`(mdb) `**`bt` `-max` `8`**

</dd>
<dt>
<b>frame</b>, <b>f</b>

</dt>
<dd>
Show the current stack frame or the frame specified by the optional
<i>-frame</i> argument:

`Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.`\
`113        int a = 5;`\
`(mdb) `**`frame` `-frame` `1`**\
`#1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219`\
`219        BoxedValueType ();`

</dd>
<dt>
<b>up</b>, <b>down</b>

</dt>
<dd>
Walks one frame up or down in the current backtrace. Prints the new
stack frame.

`Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.`\
`113        int a = 5;`\
`(mdb) `**`up`**\
`#1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219`\
`219        BoxedValueType ();`\
`(mdb) `**`frame`**\
`#1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219`\
`219        BoxedValueType ();`

</dd>
</dl>
Printing expressions
--------------------

To print variables or evaluate arbitrary expressions, use the
<i>print</i> command. You can also use the <i>ptype</i> command to print
the type of an expression.

<dl>
<dt>
<b>print</b>, <b>p</b>

</dt>
<dd>
Evaluate and print an expression.

`(mdb) `**`print` `a`**\
`(System.Int32) a`

</dd>
<dt>
<b>print /default</b>, <b>p /default</b>

</dt>
<dd>
Evaluate and print the context of an expression. Unlike print, this will
not show the ToString() representation of the object, but will instead
show the values in a class or struct.

`(mdb) `**`print` `/default` `a`**

</dd>
<dt>
<b>ptype</b>

</dt>
<dd>
Print the type of an expression

`(mdb) `**`ptype` `a`**\
`System.Int32`

</dd>
</dl>
See [\#Expressions](#{{site.url}}/Expressions "wikilink") for details.

Displaying expressions
----------------------

To display the value of an expressn every time the target stops (so that
you can easily see how it changes during the execution), use the
<i>display</i> command, which takes the expression as parameter.

Each display has an associated number, which can be used to refer to the
display itself when it is removed with the <i>undisplay</i> command
(which takes the display index as parameter).

It can happen that an expression cannot be evaluated in the current
stack frame or thread (maybe the variables used are out of scope). In
this case, the first time that mdb cannot evaluate the expression the
debugger prints a warning, and then the display is implicitly disabled,
so that the warning is no longer shown.

If, however, the expression becomes valid again, it is automatically
shown. This way the user can keep several displays active, and not worry
about the fact that they go out of scope, because the screen will not be
cluttered with the invalid ones.

To see all the active displays, one can use the <i>show display</i>
command. Note that this command shows <i>all</i> the displays, also the
ones that have been internally disabled.

Breakpoints
-----------

Breakpoints are inserted with the <i>break</i> command. Without
arguments, this command inserts a breakpoint at the current source line.

`Process @3 stopped at #0: 0x401b7443 in X.Main()+0x3 at Foo.cs:218.`\
`218        Simple ();`\
`(mdb) `**`b`**\
`Inserted breakpoint 1 at Foo.cs:218`

After inserting the breakpoint, the debugger tells you the breakpoint
number which can be used to enable, disable or remove the breakpoint:

`(mdb) `**`show` `breakpoints`**\
`Breakpoints:`\
` Id   Type  En  ThreadGroup  What`\
`  1  break   y       global  /work/asgard/debugger/test/Foo.cs:218`\
`(mdb) `**`disable` `1`**\
`(mdb) `**`show` `breakpoints`**\
`Breakpoints:`\
` Id   Type  En  ThreadGroup  What`\
`  1  break   n       global  /work/asgard/debugger/test/Foo.cs:218`\
`(mdb) `**`enable` `2`**\
`(mdb) `**`show` `breakpoints`**\
`Breakpoints:`\
` Id   Type  En  ThreadGroup  What`\
`  1  break   y       global  /work/asgard/debugger/test/Foo.cs:218`\
`(mdb) `**`delete` `1`**\
`(mdb) `**`show` `breakpoints`**\
`No breakpoints or catchpoints.`

However, most of the time, you don't want to insert a breakpoint at the
current location, but somewhere else. Let's have a look at the following
example:

using System;

<div class="csharp">
    <pre><code>
    class X
    {
        public static void Foo (int a)
        {
            Console.WriteLine ("Foo: {0}", a);
        }

        public static void Foo (string b)
        {
            Console.WriteLine ("Foo with a string: {0}", b);
        }

        public void Test (long a)
        {
            Console.WriteLine ("Test: {0}", a);
        }

        public static void Hello (int a)
        {
            Console.WriteLine ("Hello: {0}", a);
        }

        public static void Main ()
        {
            int a = 5;
            string hello = "Boston";
            X x = new X ();

            // You are stopped here.
            Foo (a);
            Foo (hello);
            Hello (a);
            x.Test (9);
        }
    }
    </code></pre>

</div>
The syntax to insert a breakpoint is very similar to the one to invoke a
method in the target:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at /home/martin/work/Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`b` `Hello`**\
`Inserted breakpoint 2 at X.Hello(System.Int32)`\
`(mdb) `**`b` `X.Hello`**\
`Inserted breakpoint 3 at X.Hello(System.Int32)`\
`(mdb) `**`b` `x.Test`**\
`Inserted breakpoint 4 at X.Test(System.Int64)`

Note how similar it is to invoking a method; you cannot use the method
name alone to insert a breakpoint on an instance method if you're in
static context. You can, however, use a fully qualified name to insert
the breakpoint:

`(mdb) `**`b` `Test`**\
`` ERROR: Cannot use instance member `Test' or current class in static context. ``\
`(mdb) `**`b` `X.Test`**\
`Breakpoint 1 at X.Test(System.Int64)`

Of course, this only applies if you're in static context - just like
you'd do things in C\#:

`Process @3 stopped at #0: 0x40bc082e in X.Test(System.Int64)+0xe at Test.cs:17.`\
`17         Console.WriteLine ("Test: {0}", a);`\
`(mdb) `**`b` `Test`**\
`Inserted breakpoint 2 at X.Test(System.Int64)`

If the method is ambiguous, overload resolution is performed using
types:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`b` `Foo(System.Int32)`**\
`Inserted breakpoint 2 at X.Foo(System.Int32)`\
`(mdb) `**`b` `Foo(System.String)`**\
`Inserted breakpoint 3 at X.Foo(System.String)`

If you just use a method name, the debugger presents you a list and you
can just pick a method from that list:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`b` `Foo`**\
`More than one method matches your query:`\
`1  X.Foo(System.Int32)`\
`2  X.Foo(System.String)`\
\
`(mdb) `**`b` `-id` `1`**\
`Inserted breakpoint 2 at X.Foo(System.Int32)`\
`(mdb) `**`b` `-id` `2`**\
`Inserted breakpoint 3 at X.Foo(System.String)`

You can also specify a source file and line number to insert a
breakpoint:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`list` `Hello`**\
`18 `\
`19     public static void Hello (int a)`\
`20     {`\
`21         Console.WriteLine ("Hello: {0}", a);`\
`22     }`\
`23 `\
`24     public static void Main ()`\
`25     {`\
`26         int a = 5;`\
`27         string hello = "Boston";`\
`(mdb) `**`b` `21`**\
`Inserted breakpoint 2 at /home/martin/work/Test.cs:21`\
`(mdb) `**`b` `/home/martin/work/Test.cs:26`**\
`Inserted breakpoint 3 at /home/martin/work/Test.cs:26`

Catching Exceptions
-------------------

To have the debugger stop when a particular exception is raised, you can
use the **catch** command.

The **catch** command takes an argument, the type of the exception to
catch. This will catch exceptions of that type or any derived types.

For example you can use:

<bash> (mdb) catch System.InvalidCastException </bash>

to catch exceptions of type InvalidCastException.

If you want to catch all exceptions, you can use **catch Exception**

Whenever the target stopped because of an exception, you may use **print
catch** to display the exception:

` (mdb) `<b>`run`</b>\
` Unhandled Exception: TestException: Boston`\
`   at X.Main () [0x00000] in /work/gondor/debugger/test/C.cs:18 `\
` Thread @1 caught unhandled exception at #0: 0xb7845278 in X.Main()+0x38 at`\
` /work/gondor/debugger/test/C.cs:19.`\
`   19    }`\
` (mdb) `<b>`p catch`</b>\
` (TestException) { "TestException: Boston`\
`   at X.Main () [0x00000] in /work/gondor/debugger/test/C.cs:18 " }`\
` (mdb) `<b>`ptype catch`</b>\
` class TestException : System.Exception`\
` {`\
`    string Hello;`\
`    .ctor (string);`\
` }`\
` (mdb) `<b>`p catch.Hello`</b>\
` (string) "Boston"`

Displaying a method's source code
---------------------------------

You can also view a method's source code by using the <i>list</i>
command. The syntax is identical to <i>break</i>:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`list`**\
`30         // You are stopped here.`\
`31         Foo (a);`\
`32         Foo (hello);`\
`33         Hello (a);`\
`34         x.Test (9);`\
`35     }`\
`36 }`\
`(mdb) `**`list` `Hello`**\
`18 `\
`19     public static void Hello (int a)`\
`20     {`\
`21         Console.WriteLine ("Hello: {0}", a);`\
`22     }`\
`23 `\
`24     public static void Main ()`\
`25     {`\
`26         int a = 5;`\
`27         string hello = "Boston";`

This command takes an optional <i>-lines</i> argument to specify the
number of source lines to display:

`Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.`\
`32         Foo (a);`\
`(mdb) `**`list` `-lines` `5`**\
`30         // You are stopped here.`\
`31         Foo (a);`\
`32         Foo (hello);`\
`33         Hello (a);`\
`34         x.Test (9);`

Disassembling
-------------

<dl>
<dt>
<b>dis[assemble] [-count N] [-method]</b>

</dt>
<dd>
Disassembles code at a given location

</dl>
To disassembly the current instruction or the current method, use the
<i>dis</i> command:

`(mdb) Process @3 stopped at #0: 0x401b7443 in X.Main()+0x3 at Foo.cs:218.`\
`218        Simple ();`\
`(mdb) `**`dis`**\
`0x401b7443 call   X.Simple()`\
`(mdb) `**`dis` `-method`**\
`X.Main():`\
`0x401b7440 push   %ebp`\
`0x401b7441 mov    %esp,%ebp`\
`0x401b7443 call   X.Simple()`\
`0x401b7448 call   X.BoxedValueType()`\
`0x401b744d call   X.BoxedReferenceType()`\
`0x401b7452 call   X.SimpleArray()`\
`0x401b7457 call   X.MultiValueTypeArray()`\
`0x401b745c call   X.StringArray()`\
`0x401b7461 call   X.MultiStringArray()`\
`0x401b7466 call   X.StructType()`\
`0x401b746b call   X.ClassType()`\
`0x401b7470 call   X.InheritedClassType()`\
`0x401b7475 call   X.ComplexStructType()`\
`0x401b747a call   X.FunctionStructType()`\
`0x401b747f leave  `\
`0x401b7480 ret    `

Like the <b>examine</b> command, <b>dis</b> takes an optional pointer
expression as argument (see [\#Pointer
expressions](#{{site.url}}/Pointer_expressions "wikilink") for details):

`(mdb) `**`dis` `%rip`**\
`0x400179d6      mov    %r15,%rdi`\
`(mdb) `**`dis` `0x400179d6`**\
`0x400179d6      mov    %r15,%rdi`\
`(mdb)`

Exploring the Program State
---------------------------

<dl>
<dt>
<b>show locals</b>

</dt>
<dd>
Shows the local variables active in the current scope

</dl>
`(mdb) `**`show` `locals`**\
`ok = (System.Boolean) false`\
`(mdb)`

<dl>
<dt>
<b>show params</b>

</dt>
<dd>
Shows the parameter to the current method

</dl>
`(mdb) `**`show` `params`**\
`args = (System.String[]) [  ]`\
`(mdb)`

<dl>
<dt>
<b>show location <i>variable</i></b>

</dt>
<dd>
Displays where the given local variable is stored

</dl>
`(mdb) `**`show` `location` `ok`**\
`ok is a variable of type System.Boolean stored at %ebx`

<dl>
<dt>
<b>show registers, show regs</b>

</dt>
<dd>
Shows the contents of the CPU registers

</dl>
`(mdb) `**`show` `registers`**\
`EAX=412c6308  EBX=00000000  ECX=00000000  EDX=080523b8  ESI=00021f00    EDI=0002ad50`\
`EBP=412c6240  ESP=412c6220  EIP=40ebd7ed  EFLAGS=PF ZF IF ID`\
`(mdb)`

The flags are decoded in EFLAGS

<dl>
<dt>
<b>show modules</b>

</dt>
<dd>
Shows all the loaded modules in the current program

</dl>
`(mdb) `**`show` `modules`**\
`  Id step?  sym? Name`\
`   0    y     n  /lib/libdl.so.2`\
`   1    y     n  /lib/tls/librt.so.1`\
`   2    y     y  mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`\
`   3    y     n  /opt/gnome/lib/libglib-2.0.so.0`\
`   4    y     y  /mono/lib/libmono.so.0`\
`   5    y     n  /lib/tls/libpthread.so.0`\
`   6    y     n  /opt/gnome/lib/libgmodule-2.0.so.0`\
`   7    y     n  /lib/libnsl.so.1`\
`   8    y     n  /opt/gnome/lib/libgthread-2.0.so.0`\
`   9    y     y  System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`\
`  10    y     n  /lib/tls/libc.so.6`\
`  11    y     y  /mono/lib/mono/1.0/mono-debugger-mini-wrapper`\
`  12    y     n  /lib/ld-linux.so.2`\
`  13    y     n  /lib/tls/libm.so.6`\
`  14    y     y  mcs, Version=1.1.11.0, Culture=neutral, PublicKeyToken=0907d8af90186095`\
`(mdb)`

<dl>
<dt>
<b>show sources <i>module\_id</i></b>

</dt>
<dd>
Shows the sources for a given module.

</dl>
You can use this to get a list of the source files for a given module,
for instance, with the above example, you could use:

`(mdb) `**`show` `sources` `14`**\
`Sources for module mcs, Version=1.1.11.0, Culture=neutral,  PublicKeyToken=0907d8af90186095:`\
` 142  /home/cvs/mcs/mcs/cs-parser.cs`\
` 143  /home/cvs/mcs/mcs/AssemblyInfo.cs`\
` 144  /home/cvs/mcs/mcs/anonymous.cs`\
` 145  /home/cvs/mcs/mcs/assign.cs`\
` 146  /home/cvs/mcs/mcs/attribute.cs`\
` 147  /home/cvs/mcs/mcs/driver.cs`\
` 148  /home/cvs/mcs/mcs/cs-tokenizer.cs`\
` 149  /home/cvs/mcs/mcs/cfold.cs`\
` 150  /home/cvs/mcs/mcs/class.cs`\
` ...`\
`(mdb)`

Examining Memory
----------------

<dl>
<dt>
<b>examine</b>, <b>x</b> [/[items][format][size]] expression

</dt>
<dd>
Memory dump

</dl>
The <i>examine</i> (short: <i>x</i>) command takes a pointer expression
as argument (see [\#Pointer
expressions](#{{site.url}}/Pointer_expressions "wikilink") for details). You can for
instance use a processor register, an absolute address or the address of
a variable:

`(mdb) `**`p` `%ebp`**\
`0x40bbe880`\
`(mdb) `**`x` `%ebp`**\
`0x40bbe880   88`\
`(mdb) `**`x` `/16` `%ebp`**\
`0x40bbe880   88 e8 bb 40 48 74 1b 40 - b0 e8 bb 40 a3 74 1b 40`\
`(mdb) `**`p` `%eip`**\
`0x401b7619`\
`(mdb) `**`x` `/16` `0x401b7619`**\
`0x401b7619   56 e8 b9 5c 16 c8 83 c4 - 04 ff 75 ec ff 75 e8 e8`\
`(mdb) `**`x` `/16` `&f`**\
`0x40bbe864   6e db 36 3f 07 00 00 00 - 00 00 00 00 48 74 1b 40`

When trying to take the address of a variable, keep in mind that some
variables may be stored in a processor register, so they don't have an
address:

`(mdb) `**`p` `a`**\
`5`\
`(mdb) `**`ptype` `a`**\
`System.Int32`\
`(mdb) `**`x` `&a`**\
`` Cannot take address of expression `a' ``

By default, the <i>examine</i> command prints one byte of memory in
hexadecimal.

This can be changed specifying various options in a single parameter
that must precede the expression, in gdb style:
"/[<i>items</i>][<i>format</i>][<i>size</i>]".

The <i>items</i> section is an integer specifying the number of items to
print:

`(mdb) `**`x` `/64` `%esp`**\
`0x40bbe888   b0 e8 bb 40 a3 74 1b 40 - b0 e8 bb 40 e0 d7 05 40`\
`0x40bbe898   48 db 2a 08 8b 6b 01 00 - e0 e8 bb 40 c8 d7 05 40`\
`0x40bbe8a8   d8 fe 16 08 f8 f3 19 40 - e0 e8 bb 40 84 d9 05 40`\
`0x40bbe8b8   00 00 00 00 30 e9 bb 40 - 00 00 00 00 40 74 1b 40`

If you want to see more data, just hit return:

`(mdb) `**`x` `/32` `%esp`**\
`0x40bbe888   b0 e8 bb 40 a3 74 1b 40 - b0 e8 bb 40 e0 d7 05 40`\
`0x40bbe898   48 db 2a 08 8b 6b 01 00 - e0 e8 bb 40 c8 d7 05 40`\
`(mdb) `\
`0x40bbe8a8   d8 fe 16 08 f8 f3 19 40 - e0 e8 bb 40 84 d9 05 40`\
`0x40bbe8b8   00 00 00 00 30 e9 bb 40 - 00 00 00 00 40 74 1b 40`\
`(mdb) `\
`0x40bbe8c8   20 32 13 42 98 48 30 08 - 40 74 1b 40 88 74 1b 40`\
`0x40bbe8d8   60 d6 2a 08 f8 f3 19 40 - 00 e9 bb 40 c8 97 0b 40`\
`(mdb) `\
`0x40bbe8e8   48 db 2a 08 00 00 00 00 - 30 e9 bb 40 00 00 00 00`\
`0x40bbe8f8   40 1e 1e 08 f8 f3 19 40 - 40 e9 bb 40 34 a7 0b 40`

The <i>format</i> specifier is a single character (similar to gdb):
o(octal), x(hex), d(decimal), u(unsigned decimal), t(binary), f(float),
c(ASCII char).

Also the <i>size</i> specifier is a single character (again, similar to
gdb): b(byte), h(halfword), w(word), g(giant, 8 bytes), a(address, 4 or
8 bytes).

So, to inspect a double, one would use "/fg", for a single "/fw", for an
IntPtr "/a" (the 'x' is the default), and so on...

Expressions
===========

The debugger has a built-in expression evaluator which uses a C\#-like
language. You can not only view simple expressions like examining a
variable, but also do more complex things like accessing properties,
indexers or even invoking methods in the target.

### Simple expressions

Literals work just like in C\#:

`(mdb) `**`print` `8`**\
`8`\
`(mdb) `**`print` `"Hello` `World"`**\
`"Hello World"`\
`(mdb) `**`print` `512L`**\
`512`\
`(mdb) `**`print` `3.14159`**\
`3.14159`\
`(mdb) `**`print` `8.00F`**\
`8.00`

You can also access variables from the target:

`(mdb) `**`print` `a`**\
`(System.Int32) 8`\
`(mdb) `**`print` `hello`**\
`(System.String) "Hello World"`\
`(mdb) `**`print` `y`**\
`(Y) { }`

If you're inside a non-static managed method, there's also a special
variable called <i>this</i>:

`(mdb) `**`print` `this`**\
`(X) { a = 5 }`

### Pointer expressions

Some of the commands require a pointer expression (for instance
<b>disassemble</b>, <b>examine</b>).

The most common usage for pointers is taking the address of something,
like a variable for instance. You do this with the <i>&</i> (address of)
expression.

Note that unlike in C or C\#, this expression gives you the address of
an object and not the address where a pointer to the object can be
found.

Let's assume you have a variable called <i>x</i> which is stored on the
stack at <i>%ebp-0x18</i>. If <i>x</i> is a reference type,
<i>%ebp-0x18</i> just contains a pointer to the actual object while for
value types, the object itself can be found at <i>%ebp-0x18</i>.
However, when you type <i>print &x</i> in mdb, you don't need to care
about these technical details - it'll always print the address where the
first byte of <i>x</i>'s contents can be found.

This means that you can always just <i>examine &x</i> and mdb will show
you the correct region of memory.

`(mdb) `**`print` `&a`**\
`` Cannot take address of expression `a' ``\
`(mdb) `**`print` `&hello`**\
`(void *) 0x401b7440`\
`(mdb) `**`print` `*pointer_var`**\
`(System.Int32) 5`

Note that while debugging managed code, variables of type \`object' are
also treated like pointers. Normally, you don't need to care about this
since the user interface automatically dereferences the pointer for you,
but this can become very useful if you encounter an \`object' which is
somehow corrupted: even if the debugger can't display it as a normal
managed \`object', you can still examine it as a pointer and so figure
out what when wrong.

Processor registers are also treated as pointers:

`(mdb) `**`print` `%eax`**\
`0x401b7440`\
`(mdb) `**`print` `%ebp`**\
`0x40bbe888`\
`(mdb) `**`print` `%esp`**\
`0x40bbe888`

Last, but not least, you can also use an address literal as a pointer:

`(mdb) x 0x40425010`\
`0x40425010   20 af 54 00 00 00 00 00 - 20 af 54 00 00 00 00 00`

### Invocation expressions

The debugger can also invoke methods in the target. Let's have a look at
the following example:

<div class="csharp">
    <pre><code>
    using System;

    class X
    {
        public static void Foo (int a)
        {
            Console.WriteLine ("Foo: {0}", a);
        }

        public static void Foo (string b)
        {
            Console.WriteLine ("Foo with a string: {0}", b);
        }

        public static void Hello (int a)
        {
            Console.WriteLine ("Hello: {0}", a);
        }

        public static void Main ()
        {
            int a = 5;
            string hello = "Boston";

            // You are stopped here.
            Foo (a);
            Foo (hello);
            Hello (a);
        }
    }
    </code></pre>

</div>
Now you're stopped in <i>Main</i> and want to invoke methods.

`(mdb) `**`print` `Foo` `(3)`**\
`Foo: 3`\
`` Method `Foo ()' doesn't return a value. ``\
`(mdb) `**`print` `Foo` `("Hello` `World")`**\
`Foo with a string: Hello World`\
`` Method `Foo ()' doesn't return a value. ``\
`(mdb) `**`print` `Hello` `(9)`**\
`Hello: 9`\
`` Method `Hello ()' doesn't return a value. ``\
`(mdb) `**`print` `Hello` `(a)`**\
`Hello: 9`\
`` Method `Hello ()' doesn't return a value. ``\
`(mdb) `**`print` `Foo` `(hello)`**\
`Foo with a string: Boston`\
`` Method `Foo ()' doesn't return a value. ``

Note how the debugger automatically does overload resolution when
calling <i>Foo</i>.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

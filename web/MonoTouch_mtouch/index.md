---
Title: ./MonoTouch_mtouch
layout: default
---

iPhone applications are shipped as application bundles. These are
directories with the extension `.app` that contain your code, data,
configuration files and a manifest that the iPhone uses to learn about
your application.

The process of turning a .NET executable into an application is mostly
driven by the `mtouch` command, a tool that integrates many of the steps
required to turn the application into a bundle. This tool is also used
to launch your application in the simulator and to deploy the software
to an actual iPhone or iPod Touch device.

Building
========

The `mtouch` command can compile your code in three different ways:

-   Compile for simulator testing.
-   Compile for device deployment.
-   Compile to source code, for integration with X-Code.

Building for the Simulator
--------------------------

When you get started, the most common used scenario will be for you to
try out the application in the Simulator, so you will be using the
`mtouch -sim` to compile the code into a simulator package. This is done
like this:

<bash>

`$ mtouch -sim Hello.app hello.exe`

</bash>

Building for the Device
-----------------------

To build software for the device you will build your application using
the `mtouch -dev` option, additionally you need to provide the name of
the certificate used to sign your application. The following shows how
the application is built for the device:

<bash> \$ mtouch -dev -c "iPhone Developer: Miguel de Icaza" foo.exe
</bash>

In this particular case, we are using the "iPhone Developer: Miguel de
Icaza" certificate to sign the application. This step is very important,
or the physical device will refuse to load the application.

Running your Application
========================

Launching on the Simulator
--------------------------

Launching on the simulator is very simple once you have an application
bundle:

<bash>

`$ mtouch -launchsim Hello.app`

</bash>

You will see some output like this:

<bash> Launching application Application launched PID: 98460 Press enter
to terminate the application </bash>

It is strongly recommended that you also keep a log of the standard
output and standard error files to assist in your debugging. The output
of Console.WriteLine goes to stdout, and the output from
Console.Error.WriteLine and any other runtime error messages goes to
stderr.

To do this, use the --stdout and --stderr flags:

<bash> ../../tools/mtouch/mtouch --launchsim=Hello.app --stdout=output
--stderr=error </bash>

If your application fails, you can see the fiels output and error to
diagnose the problem.

Debugging on the Simulator
--------------------------

Debugging on the simulator is currently limited to debugging at the GDB
level. This debugging is described in [Debugging with
GDB](Debugging#{{site.url}}/Debugging_with_GDB "wikilink"). This means that it is
mostly useful if you are debugging low-level operations or if you are
familiar with Mono internals, it is not a complete managed debugger.

<bash>

`$ mtouch -debugsim Hello.app`

</bash>

You will see some output like: <bash> Launching application Application
launched PID: 29558 Press enter to terminate the application </bash>

Open another terminal and launch gdb and type:

<bash> (gdb) attach 29558 \<-- PID from above Attaching to process
29558. Reading symbols for shared libraries . done 0x8fe01010 in
\_\_dyld\_\_dyld\_start () (gdb) continue </bash>

Debugging on the Device
-----------------------

Debugging on the device is currently provided thru the Xcode debugging
mechanism and uses GDB. This debugging is described in [Debugging with
GDB](Debugging#{{site.url}}/Debugging_with_GDB "wikilink"). This means that it is
mostly useful if you are debugging low-level operations or if you are
familiar with Mono internals, it is not a complete managed debugger.

<bash>

`$ mtouch -xcode Hello -res MainWindow.xib -res Icon.png hello.exe`

</bash>

This command will generate a xcodeproject in the folder "Hello"
containing the resources Icon.png and MainWindow.xib from your
hello.exe, and open the project in xcode, you can then debug on the
device via Xcode.

Deploying to a Device
---------------------

Overview

### Troubleshooting

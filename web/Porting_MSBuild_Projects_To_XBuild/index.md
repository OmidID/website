---
Title: ./Porting_MSBuild_Projects_To_XBuild
layout: default
---

This will be updated as I also figure these things out. There shouldn't
be a whole lot of "porting" required, but these tips can make it easier
to share the same project files between msbuild and xbuild.

Paths
-----

You should continue to use windows style paths in the msbuild project
files. They'll be converted, if required, by xbuild.

Casing
------

Linux has case-sensitive filenames, so, the project files should have
the correct case for file and directory names. As a temporary
workaround, you could run xbuild with the environment variable
"MONO\_IOMAP=case"

<bash>

`    $ MONO_IOMAP=case xbuild foo.sln`

</bash>

This might be problematic in some situations, like the OutputPath for a
project says "bin", but the disk has directory called "Bin", then xbuild
will use the former.

Platform specific items
-----------------------

Sometimes you'll have items that are platform specific, for example,
reference to an assembly that is available only on windows or one that
is required only on linux. In such cases, you can make those
items/properties/references conditional. Eg.:

<div class="xml">
    <pre><code>
       <Reference Include="Windows.Specific.dll" Condition=" '$(OS)' == 'Windows_NT' "/>
       <Reference Include="NonWindows.Specific.dll" Condition=" '$(OS)' != 'Windows_NT' "/>
    </code></pre>

</div>
The default environment variable 'OS' is set to "Windows\_NT" on
Win2k\*/WinXP/Vista/Windows7 . So, msbuild should work with this. xbuild
sets this to "Windows\_NT", "Unix" or "OSX" depending on the platform.

NOTE: xbuild from Mono 2.6p1 does not set this. Since, Linux and OSX
don't have a 'OS' environment variable set, it should work fine, if you
are only checking against the value 'Windows\_NT'.

Pre/PostBuildEvents
-------------------

These events contain shell commands to be run before or after a build.
These will be windows specific, so won't run on linux or mac. To solve
this, you could add more conditional Pre/PostBuildEvents, like:

<div class="xml">
    <pre><code>
       <PreBuildEvent Condition=" '$(OS)' != 'Windows_NT' ">cp foo.txt $(OutDir)/foo.txt</PreBuildEvent>
       <PreBuildEvent Condition=" '$(OS)' == 'Windows_NT' ">copy foo.txt $(OutDir)\foo.txt</PreBuildEvent>
    </code></pre>

</div>
The condition could be based on the Configuration also, for which you
will have to create a new "Linux" configuration.

Another, way of doing this could be to use the Before/AfterBuild
targets, with which you can use the built-in tasks, like "Copy",
"MakeDir" etc, so no problem with portability. Eg:

<div class="xml">
    <pre><code>
     <Target Name="BeforeBuild">
              <Copy SourceFiles="foo.txt" DestinationFolder="$(OutDir)" />
              <Exec Command="foo.exe arg1 arg2" Condition=" '$(OS)' == 'Windows_NT' " />
     </Target>
    </code></pre>

</div>
For commands that have no corresponding tasks available and you don't
want to write a custom task for them, you can use the 'Exec' task, which
invokes the specified 'Command'.

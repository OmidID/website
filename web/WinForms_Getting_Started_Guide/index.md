---
Title: ./WinForms_Getting_Started_Guide
layout: default
---

### Installation

Windows.Forms is part of a standard Mono installation. Since
Windows.Forms is under active development you might be interested in
using the latest version available from the SVN repository to test.

To use the very latest version, you have to build mcs from svn. You can
get the latest sources from one of our anonymous svn servers, for
example from: <svn://anonsvn.mono-project.com/source/trunk/mcs>.

To build Windows.Forms from source, you need:

-   The latest [Mono](http://www.go-mono.com/download.html) package.

-   The latest [libgdiplus](http://www.go-mono.com/download.html)
    library. Not needed on Windows XP since it includes gdiplus.dll and
    for Windows 2000 it can be downloaded from MSDN.

[Paul Johnson provides a nice writup on how to build from source
[here](http://www.all-the-johnsons.co.uk/mono/mono-compiling.shtml)]

### Winforms Example

As there are plenty of great articles and books on Windows Forms
programming, the topic will not be covered in-depth. The following is
just a simple Winforms program to test with.

<div class="csharp">
    <pre><code>
    using System;
    using System.Drawing;
    using System.Windows.Forms;

    public class HelloWorld : Form
    {
        static public void Main ()
        {
            Application.Run (new HelloWorld ());
        }

        public HelloWorld ()
        {
            Button b = new Button ();
            b.Text = "Click Me!";
            b.Click += new EventHandler (Button_Click);
            Controls.Add (b);
        }

        private void Button_Click (object sender, EventArgs e)
        {
            MessageBox.Show ("Button Clicked!");
        }
    }
    </code></pre>

</div>
If you save this code as hello.cs, you would compile it like this:

    mcs -pkg:dotnet hello.cs

Using mcs to compile produces a .Net 1.1 assembly. To create a .Net 2.0
assembly, use gmcs:

    gmcs -pkg:dotnet hello.cs

Either compiler will create "hello.exe", which you can run using:

    mono hello.exe

![Results running on openSUSE
10.2](http://localhost:4000/files/helloworld.png "fig:Results running on openSUSE 10.2")
And this will be the results.

<Category:WinForms>

---
Title: ./OutputFromConsoleApp
layout: default
---

Preface
=======

:   It's really useful to able to get some output from a console
    application, especially on Linux or other UNIX-like system, because
    there some really powerful command-line tools. Since I didn't find
    any information how to do this, I'm writing this MiniMini-HOWTO.
    Let's get some code and explain how it works.

Some Code
=========

<div class="csharp">
    <pre><code>
    // mcs proc.cs
    // Outputs the files in the directory where the program is located

    // defines classes which we're going to use
    using System;
    using System.Diagnostics;

    class ProcessOutput {

        static void Main () // starting point of the program
        {
            // sets up our process, the first argument is the command 
            // and the second holds the arguments passed to the command
            ProcessStartInfo ps = new ProcessStartInfo ("ls", "./");
            ps.UseShellExecute = false;

            // we need to redirect the standard output so we read it
            // internally in out program
            ps.RedirectStandardOutput = true;
            
            // starts the process
            using (Process p = Process.Start (ps)) {

                // we read the output to a string
                string output = p.StandardOutput.ReadToEnd ();

                // waits for the process to exit
                // Must come *after* StandardOutput is "empty"
                // so that we don't deadlock because the intermediate
                // kernel pipe is full.
                p.WaitForExit ();

                // finally output the string
                Console.WriteLine (output);
            }
        }
    }
    </code></pre>

</div>
A Few Words
-----------

:   There's one thing I want to bring your attention to, look at this
    call:

<div class="csharp">
    <pre><code>
    p.WaitForExit();
    </code></pre>

</div>
:   This call will cause your application to wait for the process you
    started to finish. Have in mind, that it will lock up your
    application. You can avoid this using threads, which will be a
    subject of another article.
:   Keep in mind that the process output may be quite large, so calling
    *p.StandardOutput.ReadToEnd()* is likely a bad idea. In this case
    you should use *p.StandardOutput.Read()* or
    *p.StandardOutput.ReadLine()* until you've consumed all output.

References
==========

:\*[Documentation](http:/monodoc/N:System.Diagnostics)

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

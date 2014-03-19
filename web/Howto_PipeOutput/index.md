---
Title: ./Howto_PipeOutput
layout: default
---

This How-To shows how to get the output of a child process.

<div class="csharp">
    <pre><code>
    // This sample runs grep and extracts all the lines that match
    // the line "miguel" from /etc/passwd
    using System;
    using System.Diagnostics;

    class Test
    {
             public static void Main ()
             {
                     ProcessStartInfo psi = new ProcessStartInfo ();
                     psi.FileName = "grep";
                     psi.Arguments = "miguel /etc/passwd";
                     psi.RedirectStandardOutput = true;
                     psi.UseShellExecute = false;

                     Process p =  Process.Start (psi);
                     string ret = p.StandardOutput.ReadToEnd ();
                     p.WaitForExit ();

                     Console.WriteLine (ret);
             }
    }
    \
    </code></pre>

</div>
<Category:HowTo>

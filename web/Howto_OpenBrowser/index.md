---
Title: ./Howto_OpenBrowser
layout: default
---

Any versions of Mono available since 2007 will support opening a url by
using Process.Start with a url, for example:

<div class="csharp">
    <pre><code>
    Process.Start ("http://www.google.com");
    </code></pre>

</div>
Older versions of Mono did not support this and have to manually do
this. Here is how it used to be done in the past. This copes with a few
different operating systems in \*older\* versions of Mono:

<div class="csharp">
    <pre><code>
    using System;
    using System.Diagnostics;

    public static bool OpenLink(string address) {
        try {
            int plat = (int) Environment.OSVersion.Platform;
            if ((plat != 4) && (plat != 128)) {
                // Use Microsoft's way of opening sites
                Process.Start(address);
            } else {
                // We're on Unix, try gnome-open (used by GNOME), then open
                // (used my MacOS), then Firefox or Konqueror browsers (our last
                // hope).
                string cmdline = String.Format("gnome-open {0} || open {0} || "+
                    "firefox {0} || mozilla-firefox {0} || konqueror {0}", address);
                Process proc = Process.Start (cmdline);

                // Sleep some time to wait for the shell to return in case of error
                System.Threading.Thread.Sleep(250);

                // If the exit code is zero or the process is still running then
                // appearently we have been successful.
                return (!proc.HasExited || proc.ExitCode == 0);
            }
        } catch (Exception e) {
            // We don't want any surprises
            return false;
        }
    }
    </code></pre>

</div>
If your program is meant to be run only under GNOME, you have a better
and easier solution, however. It is suficient to call Gnome.Url::Show,
as shown below:

<div class="csharp">
    <pre><code>
    using Gnome;
    ...
    public void OpenMyProgramWebsite()
    {
        Url.Show("http://websiteofmyproject/");
    }
    </code></pre>

</div>
<Category:HowTo>

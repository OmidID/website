---
Title: ./MonoMac$Documentation$Events
layout: default
---

Events
======

If you want to intercept events from UIControl, you have a range of
options: from using the C\# lambdas and delegate functions to using the
low-level Objective-C APIs.

The following shows how you would capture the TouchDown event on a
button, depending on how much control you need:

C\# Style
---------

Using the delegate syntax:

<div class="csharp">
    <pre><code>
    NSButton button = MakeTheButton ();
    button.Activated += delegate {
        Console.WriteLine ("Touched");
    };
    </code></pre>

</div>
If you like lambdas instead:

<div class="csharp">
    <pre><code>
    button.Activated += (o, e) => {
       Console.WriteLine ("Touched");
    };
    </code></pre>

</div>
If you want to have multiple buttons use the same handler to share the
same code:

<div class="csharp">
    <pre><code>
    void handler (object sender, EventArgs args)
    {
       if (sender == button1)
          Console.WriteLine ("button1");
       else
          Console.WriteLine ("some other button");
    }
     
    button1.Activated += handler;
    button2.Activated += handler;
    </code></pre>

</div>

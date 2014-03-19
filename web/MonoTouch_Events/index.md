---
Title: ./MonoTouch_Events
layout: default
---

If you want to intercept events from UIControl, you have a range of
options: from using the C\# lambdas and delegate functions to using the
low-level Objective-C APIs.

The following shows how you would capture the TouchDown event on a
button, depending on how much control you need:

C\# Style
=========

Using the delegate syntax:

<div class="csharp">
    <pre><code>
    UIButton button = MakeTheButton ();
    button.TouchDown += delegate {
        Console.WriteLine ("Touched");
    };
    </code></pre>

</div>
If you like lambdas instead:

<div class="csharp">
    <pre><code>
    button.TouchTown += () => {
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

    button1.TouchDown += handler;
    button2.TouchDown += handler;
    </code></pre>

</div>
Monitoring more than one kind of Event
======================================

The C\# events for UIControlEvent flags have a one to one mapping to
individual flags. Sometimes you might want to have the same piece of
code handle two or more events, in that case, use the
UIControl.AddTarget method:

<div class="csharp">
    <pre><code>
    button.AddTarget (handler, UIControlEvent.TouchDown | UIControl.TouchCancel);
    </code></pre>

</div>
Using the lambda syntax:

<div class="csharp">
    <pre><code>
    button.AddTarget (()=> Console.WriteLine ("An event happened"), UIControlEvent.TouchDown | UIControl.TouchCancel);
    </code></pre>

</div>
If you need to use low-level features of Objective-C, like hooking up to
a particular object instance and invoke a particular selector:

<div class="csharp">
    <pre><code>
    [Export ("MySelector")]
    void MyObjectiveCHandler ()
    {
        Console.WriteLine ("Hello!");
    }

    // In some other place:

    button.AddTarget (this, new Selector ("MySelector"), UIControlEvent.TouchDown);
    </code></pre>

</div>

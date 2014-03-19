---
Title: ./MonoTouch_Tutorial_HelloIB
layout: default
---

Creating a UI with Interface Builder
====================================

User interfaces created with Interface Builder are stored in XML in
files ending with the XIB extension. These XIB files contain a
definition of your user interface.

In Interface Builder in addition to laying out your user interface, you
can flag certain components to be accessible from your C\# code and you
can configure which events will be raised against your host while
responding to some events.

Loading Interfaces
==================

If you are using MonoDevelop, the XIB will automatically be compiled
into a binary representation with the "nib" extension. If you are
building the user interface on your own you will have to compile the
user interface using the `ibtool` command. For example:

<bash> \$ ibtool SampleController.xib --compile SampleController.nib
</bash>

The XIB files can contain:

-   ViewController definitions
-   ...

To load a component from a view controller stored in the NIB file,
declare your class in the following way:

<div class="csharp">
    <pre><code>
    [Register]
    public class SampleController : UIViewController {
        public SampleController () : base ("SampleController", null)
        {
        }
    }
    </code></pre>

</div>
The above shows how the class SampleController is initialized by calling
the base class constructor that initializes the class from the NIB file.
In this case the NIB file is the "SampleController" specified as the
first parameter to the base call, and the second argument is the
NSBundle to load this from. Null represent the current bundle.

When the view is loaded the method `ViewDidLoad` will be invoked. This
is the method where you would typically customize the controls and views
loaded from the NIB file and perhaps add new controls to your view, for
example:

<div class="csharp">
    <pre><code>
    public override ViewDidLoad ()
    {
       // Let the base class do its initialization.
       base.ViewDidLoad ();

       // Add a web control and configure it
        web = new UIWebView (webFrame) {
            BackgroundColor = UIColor.White,
            ScalesPageToFit = true,
            AutoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        };
        web.LoadStarted += delegate {
            UIApplication.SharedApplication.NetworkActivityIndicatorVisible = true;
        };
        web.LoadFinished += delegate {
            UIApplication.SharedApplication.NetworkActivityIndicatorVisible = false;
        };
        web.LoadError += (webview, args) => {
            UIApplication.SharedApplication.NetworkActivityIndicatorVisible = false;
            web.LoadHtmlString (HtmlErroString, null);
        };
        View.AddSubview (web);
    }
    </code></pre>

</div>
Naming Your Components
======================

Responding to Events
====================

If your user interface raises an event on the "First Responder", you can
catch those events by decorating your C\# method with the Export
attribute, like this:

<div class="csharp">
    <pre><code>
    [Export ("SomeEvent:")]
    public void SomeEvent (NSObject sender)
    {
    }
    </code></pre>

</div>
Important
=========

If you are going to load your application delegate from a NIB file
created by Interface Builder instead of rolling out the application
delegate yourself, you will want to make sure that you invoke
UIApplication.Main with null parameters for the application class and
delegate class.

Otherwise UIApplication will create the delegate twice: one from the NIB
request, and one from the UIApplication parameter.

</code></pre>

</pre>
</div>
What happens behind the scenes
==============================

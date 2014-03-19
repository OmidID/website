---
Title: ./MonoMac$Features
layout: default
---

Features
========

Automatic Memory Management
---------------------------

Mono comes with a garbage collector that allows developers to focus on
their software and let the runtime take care of the bookkeeping required
to release objects. This avoids common memory leaks and reduces the
amount of code that needs to be written to avoid these leaks.

Type Safety
-----------

The C\# language in combination with the ECMA runtime prevent a whole
class of errors from your application. With C\# the common errors of
reusing disposed objects accidentally, overflowing a buffer, casting an
object into the wrong type (leading to corruption), releasing the memory
twice or keeping dangling objects are a thing of the past.

C\# 3.0
-------

The C\# 3.0 language is a rich high-level language that brings many
constructs that improve programmer productivity.

In addition to traditional object oriented languages, C\# offers many
interesting new constructs: type safe generic types, automatic state
machines created with iterators, lambda functions and anonymous methods,
built-in properties and built-in event systems as well as the
System.Linq namespace that allows developers to create functional
programming constructs.

The terse syntax allows configurations of objects in one pass:

<div class="csharp">
    <pre><code>
    var slider = new UISlider (new RectangleF (174f, 12f, 120f, 7f)){
        BackgroundColor = UIColor.Clear,
        MinValue = 0f,
        MaxValue = 100f,
        Continuous = true,
        Value = 50f,
        Tag = kViewTag
    };
    slider.ValueChanged += delegate {
        Console.WriteLine ("New value {0}", slider.Value);
    };
    </code></pre>

</div>
Use Mac OS X APIs
-----------------

MonoMac binds the Objective-C APIs that developers use on the Mac into
[MonoMac/API C\# APIs](MonoMac/API C#{{site.url}}/_APIs "wikilink") that expose the
functionality and map this to any ECMA CIL powered language. Objective-C
delegates are exposed to C\# applications [MonoMac/API\#Delegates in a
number of ways](MonoMac/API#{{site.url}}/Delegates_in_a_number_of_ways "wikilink")
giving developers complete control of how to consume and integrate with
native APIs.

MonoMac provides a C\#/ECMA binding for:

1.  Addressbook and AddressbookUI
2.  AudioToolbox
3.  AVFoundation
4.  CoreAnimation/Quartz
5.  CoreGraphics/Quartz
6.  CoreLocation
7.  CoreMotion
8.  EventKit and EventKitUI
9.  ExternalAccessory
10. Foundation and CoreFoundation
11. GameKit
12. OpenGL ES 1.1 and OpenGL ES 2.0
13. QuickLook
14. MediaPlayer
15. MessageUI
16. SystemConfiguration

From the pure C\#-based event model to the native Objective-C system,
the two mechanisms are supported.

For example, to respond to events, programmers can just connect to the
events they are interested in:

<div class="csharp">
    <pre><code>
    var page = new UIPageControl (new RectangleF (120f, 14f, 178f, 20f)){
        BackgroundColor = UIColor.Gray,
        Pages = 10,
        Tag = kViewTag
    };

    page.TouchUpInside += delegate {
        Console.WriteLine ("Current page: {0}", page.CurrentPage);
    };
    </code></pre>

</div>
Access to third party iPhone/Objective-C Libraries
--------------------------------------------------

MonoMac allows you to access libraries created in the Objective-C
language for the Mac easily and to create C\#/.NET bindings to
Objective-C libraries.

This process is described in detail in our
[MonoMac/Binding\_New\_Objective-C\_Types Binding
Objective-C](MonoMac/Binding_New_Objective-C_Types Binding Objective-{{site.url}}/C "wikilink")
libraries.

MonoDevelop Integration
-----------------------

MonoMac is an SDK that can be used with your favorite editor, be it a
full integrated development environment or a simple text editor.

MonoDevelop's code completion helps you quickly explore the API as you
write your application:
<img src="http://monotouch.net/@api/deki/files/19/=Md_hw_iphone19.png" style="width: 644px; height: 267px;" alt="Md_hw_iphone19.png" class="internal default" />

Our tutorial [MonoMac/Tutorials/MonoDevelop\_HelloWorld walks you
through creating your first MonoMac
application](MonoMac/Tutorials/{{site.url}}/MonoDevelop_HelloWorld walks you through creating your first MonoMac application "wikilink").

Interface Builder Integration
-----------------------------

Both MonoDevelop and the MonoMac SDK allow you to use Interface Builder
to create and customize your UIs.

We take Interface Builder one step further than XCode does by making
MonoMac automatically bind any outlets you define on your interface and
any methods that you define in your interface to your C\# code.

You will never have to manually bind any outlets from Interface Builder
to your code as MonoMac takes care of this.

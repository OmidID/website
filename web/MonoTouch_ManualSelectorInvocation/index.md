---
Title: ./MonoTouch_ManualSelectorInvocation
layout: default
---

Objective-C Selectors
=====================

The Objective-C language is based upon **selectors**. A selector is a
message that can be sent to an object or a **class**. MonoTouch maps
instance selectors to instance methods, and class selectors to static
methods.

Unlike normal C functions (and like C++ member functions), you cannot
directly invoke a selector using [P/Invoke]({{site.url}}/Dllimport "wikilink").
(Aside: in theory you could use P/Invoke for non-virtual C++ member
functions, but you'd need to worry about per-compiler name mangling,
which is a world of pain better ignored.) Instead, selectors are sent to
an Objective-C class or instance using the [objc\_msgSend
function](http://developer.apple.com/mac/library/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/objc_msgSend).

You may find [this helpful guide on Objective-C
messaging](http://developer.apple.com/iphone/library/documentation/cocoa/conceptual/ObjCRuntimeGuide/Articles/ocrtHowMessagingWorks.html)
useful.

Example
-------

Suppose you want to invoke the
[<http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont:forWidth:lineBreakMode>:
-[NSString sizeWithFont:forWidth:lineBreakMode:]] selector. The
declaration (from Apple's documentation) is:

:   - (CGSize)sizeWithFont:(UIFont \*)font forWidth:(CGFloat)width
    lineBreakMode:(UILineBreakMode)lineBreakMode

The return type, GSize, is a
[System.Drawing.SizeF](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Drawing.SizeF)
in managed code (which is a value type).

The *font* parameter is a
[UIFont](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.UIKit.UIFont)
(and a type (indirectly) derived from
[NSObject](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.Foundation.NSObject)),
and is thus mapped to
[System.IntPtr](http://www.go-mono.com/docs/monodoc.ashx?link=T:System.IntPtr).

The width parameter, a CGFloat, is mapped to
[System.Single](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Single).

The lineBreakMode parameter, a UILineBreakMode, has already been bound
in MonoTouch as the
[UILineBreakMode](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.UIKit.UILineBreakMode)
enumeration.

Put it all together, and we want an objc\_msgSend declaration that
matches:

<div class="csharp">
    <pre><code>
    SizeF objc_msgSend(IntPtr target, IntPtr selector, IntPtr font, float width, UILineBreakMode mode);
    </code></pre>

</div>
Checking the
[<http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Messaging%2f>\*
MonoTouch.ObjCRuntime.Messaging] members, we don't see a match for this
prototype. Consequently, we will need to declare it ourself:

<div class="csharp">
    <pre><code>
    [DllImport (MonoTouch.Constants.ObjectiveCLibrary)]
    static extern SizeF cgsize_objc_msgSend_IntPtr_float_int (
        IntPtr target, IntPtr selector,
        IntPtr font,
        float width,
        UILineBreakMode mode);
    </code></pre>

</div>
Once declared, we can invoke it once we have the appropriate parameters:

<div class="csharp">
    <pre><code>
    NSString      target = ...
    Selector    selector = new Selector ("sizeWithFont:forWidth:lineBreakMode:");
    UIFont          font = ...
    float          width = ...
    UILineBreakMode mode = ...

    SizeF size = cgsize_objc_msgSend_IntPtr_float_int(
        target.Handle, selector.Handle,
        font == null ? IntPtr.Zero : font.Handle,
        width,
        mode);
    </code></pre>

</div>
Invoking a Selector
-------------------

Invoking a selector has three steps:

1.  Get the selector target.
2.  Get the selector name.
3.  Call objc\_msgSend() with the appropriate arguments.

### Selector Targets

A selector target is either an object instance or an Objective-C class.
If the target is an instance and came from a bound MonoTouch type, use
the
[MonoTouch.ObjCRuntime.INativeObject.Handle](http://www.go-mono.com/docs/monodoc.ashx?link=P%3aMonoTouch.ObjCRuntime.INativeObject.Handle)
property.

If the target is a class, use
[MonoTouch.ObjCRuntime.Class](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Class)
to get a reference to the class instance, then use the
[Class.Handle](http://www.go-mono.com/docs/monodoc.ashx?link=P%3aMonoTouch.ObjCRuntime.Class.Handle)
property.

### Selector Names

Selector names are listed within Apple's documentation. For example, the
<http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html>
UIKit NSString extension methods] include
[<http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont>:
sizeWithFont:] and
[<http://developer.apple.com/iphone/library/documentation/UIKit/Reference/NSString_UIKit_Additions/Reference/Reference.html#//apple_ref/occ/instm/NSString/sizeWithFont:forWidth:lineBreakMode>:
sizeWithFont:forWidth:lineBreakMode:]. The embedded and trailing colons
are important, and are part of the selector name.

Once you have a selector name, you can create a
[MonoTouch.ObjCRuntime.Selector](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Selector)
instance for it.

### Calling objc\_msgSend()

When invoking objc\_msgSend(), you must pass the selector target (an
instance or class handle), the selector, and any arguments required by
the selector. To do so, you use a normal P/Invoke declaration for
objc\_msgSend(). The instance and selector arguments must be
System.IntPtr, and all remaining arguments must match the type the
selector expects.

Objective-C types (e.g. NSString, NSDictionary, UIView, anything that
has NSObject as an eventual base type) are passed as System.IntPtr.

A set of pre-made objc\_msgSend() declarations can be found in
[<http://www.go-mono.com/docs/monodoc.ashx?link=T%3aMonoTouch.ObjCRuntime.Messaging%2f>\*
MonoTouch.ObjCRuntime.Messaging].

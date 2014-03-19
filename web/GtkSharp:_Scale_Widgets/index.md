---
Title: ./GtkSharp:_Scale_Widgets
layout: default
---

Scale widgets are used to allow the user to visually select and
manipulate a value within a specific range. You might want to use a
scale widget, for example, to adjust the magnification level on a zoomed
preview of a picture, or to control the brightness of a color, or to
specify the number of minutes of inactivity before a screensaver takes
over the screen.

Creating Scale Widgets
======================

As with scrollbars, there are separate widget types for
[horizontal](http:/monodoc/T:Gtk.HScale) and
[vertical](http:/monodoc/T:Gtk.VScale) scale widgets. (Most programmers
seem to favor horizontal scale widgets.) Since they work essentially the
same way, there's no need to treat them separately here. The following
functions create vertical and horizontal scale widgets, respectively:

<div class="csharp">
    <pre><code>
    VScale vscale1 = new VScale( adjustment );

    VScale vscale2 = new VScaleWithRange(double min,
                                         double max,
                                         double step );

    HScale hscale1 = new HScale( adjustment );

    HScale hscale2 = new HScaleWithRange(double min,
                                         double max,
                                         double step );
    </code></pre>

</div>
The adjustment argument can either be an
[adjustment](http:/monodoc/T:Gtk.Adjustment) object which has already
been created, or `null`, in which case, an anonymous adjustment is
created with all of its values set to 0.0 (which isn't very useful in
this case). In order to avoid confusing yourself, you probably want to
create your adjustment with a pageSize of 0.0 so that its upper value
actually corresponds to the highest value the user can select. The
WithRange constructor variants take care of creating a suitable
adjustment object. (If you're already thoroughly confused, read the
section on Adjustments again for an explanation of what exactly
adjustments do and how to create and manipulate them; also read the
[Gtk.Adjustment](http:/monodoc/T:Gtk.Adjustment) docs.)

Using Scale Widgets
===================

Scale widgets can display their current value as a number beside the
trough. The default behavior is to show the value, but you can change
this with this function:

<div class="csharp">
    <pre><code>
    vscale1.DrawValue = true_or_false;
    </code></pre>

</div>
The value displayed by a scale widget is rounded to one decimal point by
default, as is the value field in its Adjustment. You can change this
with:

<div class="csharp">
    <pre><code>
    vscale1.Digits = digits;
    </code></pre>

</div>
where digits is the number of decimal places you want. You can set
digits to anything you like, but no more than 13 decimal places will
actually be drawn on screen.

Finally, the value can be drawn in different positions relative to the
trough:

<div class="csharp">
    <pre><code>
    vscale1.ValuePos = pos;
    </code></pre>

</div>
The argument *pos* is of type
[Gtk.PositionType](http:/monodoc/T:Gtk.PositionType), which is an
enumeration of Left, Right, Top, and Bottom. If you position the value
on the "side" of the trough (e.g., on the top or bottom of a horizontal
scale widget), then it will follow the slider up and down the trough.

For a full list of the event signals that a Range widget throws, see
[Gtk.HScale](http:/monodoc/T:Gtk.HScale) and
[Gtk.VScale](http:/monodoc/T:Gtk.VScale) .

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:GtkSharp>

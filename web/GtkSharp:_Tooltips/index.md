---
Title: ./GtkSharp:_Tooltips
layout: default
---

Tooltips are the little text strings that pop up when you leave your
pointer over a button or other widget for a few seconds. They are easy
to use, so I will just explain them without giving an example. If you
want to see some code, take a look at the testgtk.cs program distributed
with Gtk\#. Widgets that do not receive events (widgets that do not have
their own window) will not work with tooltips.

The first call you will use creates a new tooltip. You only need to do
this once for a set of tooltips as the GtkTooltips object this function
returns can be used to create multiple tooltips.

<div class="csharp">
    <pre><code>
    Tooltips tooltips = new Tooltips();
    </code></pre>

</div>
Once you have created a new tooltip, and the widget you wish to use it
on, simply use this call to set it:

<div class="csharp">
    <pre><code>
    tooltip1.SetTip(widget, tooltipText, tooltipPrivate);
    </code></pre>

</div>
The first argument is the widget you wish to have this tooltip pop up
for, followed by the text you wish it to say. The last argument is a
text string that can be used as an identifier when using GtkTipsQuery to
implement context sensitive help. For now, you can set it to null.

Here's a short example:

<div class="csharp">
    <pre><code>
    Tooltips tooltips1 = new Tooltips();
    Widget button1 = new Button ("button 1");
    tooltips1.SetTip(button, "This is button 1", null);
    </code></pre>

</div>
You can use the Enable and Disable methods to turn tooltips on or off.

[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")
<Category:GtkSharp>

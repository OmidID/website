---
Title: ./Moonlight$Beta
layout: default
---

Moonlight 2.0 Beta
------------------

Moonlight 2.0 will be the new version of Novell's Silverlight-compatible
plugin, compatible with Silverlight 2.0 and allowing managed code
execution in the browser.

<div style="margin-left: auto; padding: 5px; margin-right: auto; background-color: #FFFF80; border: 1px solid #E6E600;">
<b>Beta Release Notice</b>

<div style="display: none; font-size: x-small;">
</div>
This release is feature complete, but as a beta there are various known
bugs (mostly minor) and most assuredly unknown ones as well. We still
haven't completed the security audit of the source code (mono or
moonlight), so you need to be aware that there may be issues.

As such we recommend that you should only use this plugin on trusted
sites (e.g. internal or well-known web sites) on non-production
computers. This situation will gradually evolve over the beta releases.
An up to date overview of Moonlight security features status can be
found on [Moonlight Security
Status](Moonlight/{{site.url}}/SecurityStatus "wikilink") wiki page.

</div>
### Downloading

XPI's for both 32 and 64 bit linux platforms, as well as instructions on
getting tarballs and source from SVN are available
[here](http://go-mono.com/moonlight-beta).

### Source code

You can download a tarball of the source here or you can check it out
from svn.

<bash>

`$ svn co `[`http://anonsvn.mono-project.com/source/tags/moon/1.99.1`](http://anonsvn.mono-project.com/source/tags/moon/1.99.1)

</bash>

Notice that this branch contains moonlight as well as mono, mcs, and
mono-basic, these releases are required to build this version of
Moonlight, it will **not** work with Mono 2.4.

To build the above, you should build the modules in this order:

-   mono
-   mono-basic
-   moon

Follow the instructions in our [Compiling Mono From
SVN]({{site.url}}/Compiling Mono From SVN "wikilink") page.

As always, you can get the development source from trunk:

<bash>

`$ svn co `[`svn://anonsvn.mono-project.com/source/trunk/moon`](svn://anonsvn.mono-project.com/source/trunk/moon)

</bash>

### Release Notes

#### Beta 2

Fix Highlights:

-   ComboBox fixes involving the switching between the various item
    templates
-   ContentControls will now use the ContentTemplate if ControlTemplate
    is null
-   Various TemplateBinding fixes
-   Layout fixes dealing with Grid, Shapes, and MediaElements.
-   Animations (particularly when multiple animations target the same
    DO, as happens in VisualStates)
-   TextBox event ordering/behavior
-   Text layout and word-breaking fixes
-   Font extents are now calculated using the same algorithm as
    silverlight, so text lines up even better
-   various parser fixes for interesting cases found in the wild
-   a lot of memory leak/corruption fixes
-   lots of improvements in A11y from the UIA team

#### Beta 1

This beta also contains some Silverlight 3.0 features

-   Easing functions
-   SaveFileDialog
-   MultiScaleImage 3.0 API enhancements
-   MediaStreamSource now supports PCM audio data, RGBA and YV12 video
    data.
-   WriteableBitmap is supported.

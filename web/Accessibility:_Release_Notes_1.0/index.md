---
Title: ./Accessibility:_Release_Notes_1.0
layout: default
---

Mono Accessibility 1.0 Release Notes
====================================

The Mono Accessibility project enables Windows applications to be fully
accessible on Linux.

This is our first stable release including UIA Provider and ATK support
for all of the [System.Windows.Forms]({{site.url}}/System.Windows.Forms "wikilink")
controls.

Our next phase, the 2.0 release, will encompass a UIA Client
implementation that targets both System.Windows.Forms and ATK
applications, and UIA Provider support for
[Moonlight]({{site.url}}/Moonlight "wikilink").

Codename: Leela

*Release Date: Mar 31, 2009*

Supported Controls
------------------

-   Button
-   CheckBox
-   CheckedListBox
-   ColorDialog
-   ComboBox
-   ContainerControl
-   ContextMenu
-   ContextMenuStrip
-   DataGrid
-   DataGridView
-   DateTimePicker
-   DomainUpDown
-   ErrorProvider
-   FileDialog
-   FolderBrowserDialog
-   FontDialog
-   Form
-   GroupBox
-   HelpProvider
-   Label
-   LinkLabel
-   ListBox
-   ListView
-   MainMenu
-   MaskedTextBox
-   MenuItem
-   MenuStrip
-   MessageBox
-   MonthCalendar
-   NotifyIcon
-   NumericUpDown
-   OpenFileDialog
-   Panel
-   PageSetupDialog
-   PictureBox
-   PrintDialog
-   PrintPreviewDialog
-   PrintPreviewControl
-   ProgressBar
-   PropertyGrid
-   PropertyGridInternal.PropertyGridTextBox
-   PropertyGridInternal.PropertyGridView
-   RadioButton
-   RichTextBox
-   SaveFileDialog
-   ScrollableControl
-   SplitContainer
-   Splitter
-   StatusBar
-   StatusStrip
-   TabControl
-   TabPage
-   TextBox
-   ThreadExceptionDialog
-   ToolBar
-   ToolBarButton
-   ToolStrip
-   ToolStripButton
-   ToolStripComboBox
-   ToolStripDropDownItem
-   ToolStripLabel
-   ToolStripMenuItem
-   ToolStripProgressBar
-   ToolStripSeparator
-   ToolStripSplitButton
-   ToolStripTextBox
-   ToolTip
-   TrackBar
-   TreeView
-   WebBrowser

Notes
-----

17 new features have been added and over 135 bugs have been addressed
since the 0.9.1 release. Please check out our [bug
tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation)
for the [full
list](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&chfieldfrom=2009-02-06&chfieldto=2009-03-13).

Errata
------

For the most up-to-date errata, please look at the [Mono Accessibility
bug
tracker](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation)
for [issues filed against Release
1.0](https://bugzilla.novell.com/buglist.cgi?query_format=advanced&classification=Mono&product=UI+Automation&version=Release+1.0&bug_status=NEW&bug_status=ASSIGNED&bug_status=NEEDINFO&bug_status=REOPENED).

Downloading
-----------

Mono Accessibility is available for a variety of Linux distributions,
including:

-   OpenSUSE 11.0 - [1-Click
    Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoOpenSUSE_11.0/mono-uia.ymp)
-   OpenSUSE 11.1 - [1-Click
    Install](http://download.opensuse.org/repositories/Mono:/UIA/MonoOpenSUSE_11.1/mono-uia.ymp)

If packages aren't available for your distribution, you'll probably have
to install Mono Accessibility from source. Step-by-step instructions are
[available]({{site.url}}/Accessibility:_Installing_From_Source "wikilink").

If you just want to grab a source tarball, check out the [Novell
FTP](ftp://ftp.novell.com/pub/mono/sources/) page. You will want
[mono-uia](ftp://ftp.novell.com/pub/mono/sources/mono-uia),
[uiautomationwinforms](ftp://ftp.novell.com/pub/mono/sources/uiautomationwinforms),
and [uiaatkbridge](ftp://ftp.novell.com/pub/mono/sources/uiaatkbridge).

Contributors
------------

The following people have contributed to making this release happen:

> Andrés G. Aragoneses, Brad Taylor, Brian Merrell, Calen Chen, Calvin
> Gaisford, Feng Xia Mu (Felicia), Mario Carrion, Michael Gorse, Neville
> Gao, Ray Wang, Rui Guo (Matt), Sandy Armstrong, Stephen Shaw

Reporting Bugs
--------------

If you find any issues with this release, please don't hesitate to [file
bugs](https://bugzilla.novell.com/enter_bug.cgi?product=UI%20Automation).

If you want to contribute or need specific assistance, please join our
[mailing list](http://forge.novell.com/mailman/listinfo/mono-a11y), or
drop in [\#mono-a11y](irc://irc.gimp.org/mono-a11y) on irc.gimp.org.

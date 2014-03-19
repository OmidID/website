---
Title: ./Accessibility:_Client_API_Functional_Specification
layout: default
---

UIA Client API Functional Specification
=======================================

Approach
--------

Since developers are directly unit testing the implementation of the UIA
Client API for Winforms, GTK+, and Silverlight applications, the focus
for QA will be a little different.

QA for the Client API will focus on "real world" usage of the API. A
typical company writing a user application might want to created
automated UI tests using (surprise) UI Automation. So we will pick
existing real world applications, and perform QA for those applications
by writing tests of their functionality using the UIA Client API.

For Winforms and Silverlight applications, we can write these tests
first in Windows. In a sense, these tests will represent specifications
for each application. Then, when we run the tests on Linux, we will be
verifying everything from our implementation of the UIA Client API, to
the application, to the UI framework, to Mono itself.

In the end, these tests should be very helpful to many other projects.
This could be especially important for Moonlight, which is currently in
very active development.

Of course, if we need to create sample applications to test
controls/widgets that just are not available in any practical real world
applications, that is okay.

Winforms Apps
-------------

This is a basic mapping between winforms controls and UIA ControlTypes,
pattern support, etc:
<http://monouia.wik.is/Provider_Functional_Specification>

We should verify that this is up-to-date, and add more detail about the
scenarios that lead to various AutomationPatterns being supported.

KeePass, Paint.NET, and NClass might be some good applications to look
at first.

Silverlight Apps
----------------

See <Accessibility:_Moonlight_Bridge_Functional_Specification> for a
mapping between Silverlight controls, ControlTypes, and supported
AutomationPatterns.

Linux Apps (via at-spi)
-----------------------

This is intended to be as close as possible to a reverse of the
<Accessibility:_Bridge_Functional_Specification>. However, there is not
a one-to-one mapping between at-spi roles and UIA control types. It is
possible that, as we write real world application tests, we will find
ways that this mapping could be improved, so this specification is a
work in progress.

Note that for Linux apps, we should still take the approach of writing
QA tests for real world applications. GTK\#-based applications might
even welcome such tests upstream, so starting with applications like
Banshee, Tomboy, and F-Spot might be the best approach.

-   Role: AccelLabel
    -   Control type: Text
-   Role: Alert
    -   Control type: Window
-   Role: Animation
    -   Control type: Image
    -   Patterns: Image
-   Role: Arrow
    -   Control type: Custom?
-   Role: Calendar
    -   Control type: Calendar
-   Role: Canvas
    -   Control type: Custom?
-   Role: CheckBox
    -   Control type: CheckBox
    -   Patterns: Toggle
-   Role: CheckMenuItem
    -   Control type: MenuItem
    -   Patterns: Toggle
-   Role: ColorChooser
    -   Control type: Window
-   Role: ColumnHeader
    -   Control type: Text
-   Role: ComboBox
    -   Control type: ComboBox
    -   Patterns: Selection
-   Role: DateEditor
    -   Control type: Custom?
-   Role: DesktopIcon
    -   Control type: Custom?
-   Role: DesktopFrame
    -   Control type: Frame
-   Role: Dial
    -   Control type: Slider
    -   Patterns: RangeValue
-   Role: Dialog
    -   Control type: Window
-   Role: DirectoryPane
    -   Control type: List?
-   Role: DrawingArea
    -   Control type: Dialog
-   Role: FileChooser
    -   Control type: Custom?
-   Role: Filler
    -   Control type: Group (TODO: Should this be Panel?)
-   Role: FocusTraversable
    -   Control type: Custom?
-   Role: FontChooser
    -   Control type: Custom?
-   Role: Frame
    -   Control type: Window
-   Role: GlassPane
    -   Control type: Pane
-   Role: HtmlContainer
    -   Control type: Custom?
-   Role: Icon
    -   Control type: Image
    -   Patterns: Image
-   Role: Image
    -   Control type: Image
    -   Patterns: Image
-   Role: InternalFrame
    -   Control type: Window
-   Role: Label
    -   Control type: Text
-   Role: LayeredPane
    -   Control type: Pane
-   Role: List
    -   Control type: List
    -   Patterns: Selection
-   Role: ListItem
    -   Control type: ListItem
    -   Patterns: SelectionItem
-   Role: Menu
    -   Control type: menu
-   Role: MenuBar
    -   Control type: MenuBar
-   Role: MenuItem
    -   Control type: MenuItem
    -   Patterns: Invoke
-   Role: OptionPane
    -   Control type: Custom?
-   Role: PageTab
    -   Control type: TabItem
    -   Patterns: SelectionItem
-   Role: PageTabList
    -   Control type: Tab
    -   Patterns: Selection
-   Role: Panel
    -   Control type: Pane
-   Role: PasswordText
    -   Control type: Edit
    -   Properties: IsPassword == true
-   Role: PopupMenu
    -   Control type: Custom?
-   Role: ProgressBar
    -   Control type: ProgressBar
-   Role: PushButton
    -   Control type: Button
    -   Patterns: Invoke
-   Role: RadioButton
    -   Control type: RadioButton
    -   Patterns: Selection, SelectionItem
-   Role: RadioMenuItem
    -   Control type: Custom?
-   Role: RootPane
    -   Control type: Custom?
-   Role: RowHeader
    -   Control type: Custom?
-   Role: ScrollBar
    -   Control type: ScrollBar
    -   Patterns: RangeValue
    -   Children: Up button, down button
-   Role: ScrollPane
    -   Control type: Custom?
-   Role: Separator
    -   Control type: Separator
-   Role: Slider
    -   Patterns: RangeValue
    -   Control type: Slider
-   Role: SpinButton
    -   Control type: SpinButton

xx

-   -   Control type: Slider

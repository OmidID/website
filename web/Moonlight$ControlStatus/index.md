---
Title: ./Moonlight$ControlStatus
layout: default
---

Controls in System.Windows.dll
------------------------------

### Containers

-   Border (System.Windows.Controls) (**100% done**)
-   Canvas (System.Windows.Controls) (**100% done**)
-   Panel (System.Windows.Controls) (**100% done**)

-   Grid (**80% done**)
    -   Grid (System.Windows.Controls)
    -   ColumnDefinition (System.Windows.Controls)
    -   ColumnDefinitionCollection (System.Windows.Controls)
    -   RowDefinition (System.Windows.Controls)
    -   RowDefinitionCollection (System.Windows.Controls)

-   StackPanel (System.Windows.Controls) (**100% done**)

-   Popup (System.Windows.Controls.Primitives) (**90% done**)

-   Tooltips (**\~0% done**, we have beta1 source code, which needs a
    lot of work)
    -   depends on Popup (System.Windows.Controls.Primitives)
    -   ToolTip (System.Windows.Controls)
    -   ToolTipService (System.Windows.Controls))

### Buttons

-   Button (System.Windows.Controls) (**100% done**, included in SL2 RTM
    source drop)

-   RadioButton (System.Windows.Controls) (**100% done**, included in
    SL2 RTM source drop)

-   CheckBox (System.Windows.Controls) (**100% done**, included in SL2
    RTM source drop)

-   ButtonBase (System.Windows.Controls.Primitives) (**100% done**,
    included in SL2 RTM source drop)

-   RepeatButton (System.Windows.Controls.Primitives) (**100% done**,
    included in SL2 RTM source drop)

-   ToggleButton (System.Windows.Controls.Primitives) (**100% done**,
    included in SL2 RTM source drop)

### Dialogs

-   OpenFileDialog (System.Windows.Controls) (**100% done**)

-   SaveFileDialog (System.Windows.Controls) (**0% done**, SL3 control,
    easy enough to implement)

### Lists, listboxes, comboboxes, etc

-   Selector (System.Windows.Controls.Primitives) (**100% done**)

-   ItemsControl (System.Windows.Controls) (**\~50% done**)
-   ItemsPresenter (System.Windows.Controls) (**\~50% done**)
-   ItemsPanelTemplate (System.Windows.Controls) (**\~50% done**)
-   ItemCollection (System.Windows.Controls) (**\~90% done**)

-   ListBox (System.Windows.Controls) (**\~25% done**)
-   ListBoxItem (System.Windows.Controls) (**\~25% done**)

-   ComboBox (**\~10% done**)
    -   depends on Popup (System.Windows.Controls.Primitives)
    -   ComboBox (System.Windows.Controls)
    -   ComboBoxItem (System.Windows.Controls)

### Scrolling

-   ScrollViewer (System.Windows.Controls) (**80% done**, needs
    converting/porting from the Beta1 drop)

-   ScrollContentPresenter (System.Windows.Controls) (**80% done**,
    needs converting/porting from the Beta1 drop)

-   ScrollBar (System.Windows.Controls.Primitives) (**100% done**,
    included in SL2 RTM source drop)

-   Thumb (**100% done**, included in SL2 RTM source drop)

### Slider and ProgressBar

-   Slider (System.Windows.Controls)
    -   included in SL2 RTM source drop
-   ProgressBar (System.Windows.Controls)
    -   included in SL2 RTM source drop
-   RangeBase (System.Windows.Controls.Primitives)
    -   included in SL2 RTM source drop

### Text

-   blocking on ScrollViewer

-   TextBlock (System.Windows.Controls) (**90% done**)

-   TextBox (System.Windows.Controls) (**90% done**)

-   PasswordBox (System.Windows.Controls) (**90% done**)

### Control

-   Control (System.Windows.Controls) (**100% done**)

-   ControlTemplate (System.Windows.Controls) (**100% done**)

-   UserControl (System.Windows.Controls) (**100% done**)

### ContentControl

-   ContentControl (System.Windows.Controls) (**100% done**)

-   ContentPresenter (System.Windows.Controls) (**100% done**)

### DeepZoom

-   MultiScaleImage (System.Windows.Controls) (**90% done**)

### Ink

-   InkPresenter (System.Windows.Controls)
    -   done

### Media

-   MediaElement (System.Windows.Controls)
    -   done

-   Image (System.Windows.Controls)
    -   done

### Misc

-   HyperlinkButton (System.Windows.Controls) (**80% done**, beta1 code
    needs porting/cleaning up)

Controls in System.Windows.Controls.dll
---------------------------------------

### Calendar

-   (**100% done**, included in the SL2 RTM source drop)

### DatePicker

-   (**100% done**, included in the SL2 RTM source drop)

### TabControl

-   (**100% done**, included in the SL2 RTM source drop)

Controls in System.Windows.Controls.Data.dll
--------------------------------------------

### DataGrid

-   (**100% done**, included in the SL2 RTM source drop)

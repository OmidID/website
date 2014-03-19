---
Title: ./Accessibility:_Test_Coding_Standard
layout: default
---

Scope
-----

A Coding Standard for QA's efforts in coding test related scripts. This
plan abides by [Python Coding Standards (PEP
8)](http://www.python.org/dev/peps/pep-0008/).

References
----------

[Product Test Case Plan]({{site.url}}/Accessibility:_Test_Plan "wikilink")\
[Product Test Case
Specification]({{site.url}}/Accessibility:_Test_Case_Specification "wikilink")\
[Product Test Log]({{site.url}}/Accessibility:_Test_Log "wikilink")\
[Product Test Summary]({{site.url}}/Accessibility:_Test_Summary "wikilink")\
[Product Bug
Specification]({{site.url}}/Accessibility:_Bug_Specification "wikilink")\
[Test Coding Standard]({{site.url}}/Accessibility:_Test_Coding_Standard "wikilink")
(current page)\
[Product Home]({{site.url}}/Accessibility "wikilink")\

Standard For Files Name
-----------------------

### Files Name For Application Sample Scripts

Application sample scripts for winforms controls should be stored in
"uia2atk/test/samples" directory.

An application sample script file is suffixed as .py. and file name
should include the name of Winforms Controls you have implemented. The
full name of an application sample script should be like this: *the name
of Winforms controls you have implemented* + .py. for example, if we
create a script for "Button" winforms control, the name of the
application sample script is **button.py**.

Sometimes in one application sample script will include more than two
winforms controls. In this situation, for example, if we create a script
for "Button" and "Label" and "TextBox" control, the name of the
application sample script is **button\_label\_textbox.py**.

The maximum length of one application sample script name should contain
at most three winforms controls. If one application script have more
than three winforms controls, for example, we create a script for
"Button", "Label", "TextBox", "Form", "CheckBox", we should copy this
script to another script (those two scripts will display the same, but
names are distinguishable), the first script name should be
**button\_label\_textbox.py**, the second script name should be
**form\_checkbox.py**.

Notice: the file name should be all lowercase with underscores, and do
not use acronyms.

### Files Name For Test Scripts

Test scripts for application samples should be stored in the
uia2atk/test/testers directory. Each test script should test each
control listed in the application sample filename. For example, the test
script for the sample application "button\_label\_textbox.py" should
test the accessibility of Button, Label, and TextBox. Each test script
should include:

1.  one base test script that explains to
    [strongwind](http://www.medsphere.org/projects/strongwind/) how to
    test a that application.
2.  an "\_\_init\_\_.py" explains to strongwind where the winforms
    application is.
3.  an "<controls>frame.py" script that explains what winforms controls
    exist in the sample script.

The full name of base test script should be like this: *the name of
Winforms controls you have implemented* + \_basic\_ops.py. The name of
test directory should be like this: *the name of Winforms controls you
have implemented*. *<controls>\_frame.py* file name should be like this:
*the name of Winforms controls you have implemented* + "frame". so for
example, if we create a test script for "Button" winforms control, this
"Button" test script will include a base test script which name is
**button\_basic\_ops.py** and a test directory named **button**. There
would be two files in this directory. **\_\_init\_\_.py** and
**buttonframe.py**.

Notice: the file names should be all lowercase with underscores, and do
not use acronyms.

### Files Name For Test Harness

Test harness scripts should be stored in the "uia2atk/test/drivers"
directory.

The test harness scripts consist of:

1.  **machine.py**:
    1.  **machines\_dict**: A Python dictionary of remote machines that
        should be tested with their respective IP addresses and host
        names. The host names do not need to resolve; the IPs are always
        used when connecting to the test machines.
    2.  **LOG\_DIR**: The location where test logs should be stored on
        the remote machine.
    3.  **TEST\_DIR**: The location where the test scripts (listed in
        testers\_list.py) can be found on the remote machine.
    4.  **USERNAME**: A valid username on the remote machine. This
        username is used to ssh to the remote machines.

2.  **tests.py**: A list of finished test scripts that should be run on
    the test machines. Adding a test (from uia2atk/test/testers)
    effectively adds it to the test suite.
3.  **local\_run.py**: Run the test suite on the local machine.
4.  **remote\_run.py**: Run the test suite on the remote machines
    specified in machine\_list.py.

### Files Name For Test Logs

Style sheets and images are stored in "uia2atk/test/resources"
directory. These should not be modified unless QA decides to change the
appearance of the log reports.

By default, Strongwind stores its logs in /tmp/strongwind. The files
from the "resources" directory can then be copied into the
/tmp/strongwind directory to make the logs more viewable.

However, when running using the test harness drivers local\_run.py or
remote\_run.py script, custom test logs are created and stylized.

-   *local\_run.py*: Stylized log reports are stored in
    uia2atk/test/logs on the local machine.
-   *remote\_run.py*: Stylized log reports are stored in LOG\_DIR, which
    is specified in machines.py.

### Files/Directories Name For Test Related

All files names and directories names should be lowercase. Multiple
words should be separated with underscores, but things like control
names (e.g, printpreviewcontrol) should not be separated. The goal is
that users can easily understand what files/directories do based on
their names and which directory they are in.

Standard For Scripts Coding
---------------------------

### Form

Each script in the "uia2atk/test" directory should contain *interpreter
line*, authors, create date, description.

-   The *interpreter line* should be the first line of the script. It
    makes scripts directly executable. For example "\#!/usr/bin/env
    python" is used for Python scripts and "\#!/usr/bin/env ipy" is used
    for IronPython scripts.
-   The authors are "\# written by: NAME + space + EMAIL".
-   The create date is "\# date: mm/dd/Year".
-   The description should describe what each script does.

Here are some examples:

    #!/usr/bin/env ipy

    ##############################################################################

    # Written by:  Calen Chen <cachen@novell.com>

    # Date:        03/11/2008

    # Description: This is a test application sample for winforms control:

    #               Button

    #               Label

    ##############################################################################

    #!/usr/bin/env python

    ##############################################################################

    # Written by:  Brian G. Merrell <bgmerrell@novell.com>

    # Date:        03/23/2008

    # Description: Test accessibility of checkbutton widget

    #              Use the checkbuttonframe.py wrapper script

    #              Test the sample/checkbutton.py script

    #############################################################################

### Python Style Guidelines Overview

For detailed style guidelines see the [Style Guide for Python
Code](http://www.python.org/dev/peps/pep-0008/).

IronPython introduces additional dynamics, but Python style should
always trump .NET style in IronPython scripts when possible.

#### Naming Conventions

-   Class names: CamelCaseLikeThis.
-   Class and instance variables: class\_variable.
-   Function names: some\_function.
-   Local variables: local\_variable.
-   Global variables: g\_module\_variable
-   Constants: ALL\_CAPS

For example:

    g_foo_bar = 13

    class FooBar:
        PI = 3.14
        foo_bar = 2.71
        self.foo_bar = 1.41

        def foo_bar(function_argument ):
            foo_bar = 0

#### Code Layout

-   Indentation: Use 4 spaces (not tabs) per indentation level. For
    existing scripts, use whatever indentation method the script you are
    working on is using.
-   Tab or Spaces: Use <Spaces> instead of <Tab>.
-   Line length: Limit all lines to a maximum of 79 characters.
-   Blank line: Use blank line to separate each section of related
    functions.
-   Each class, function and method should give explanation on top of
    that.
-   Use "TODO: <description>" to describe things that still need to be
    done in the code.

Standard For Files permissions
------------------------------

Files that will be executed directly should be given the permission 755
(-rwxr-xr-x). These files include:

-   All test scripts in the "uia2atk/test/testers" directory (but not
    the files in the subdirectories).
-   All sample applications in the "uia2atk/test/samples" directory.
-   local\_run.py and remote\_run.py in the "uia2atk/test/drivers"
    directory.

All other files should have the permission 644 (-rw-r--r--).

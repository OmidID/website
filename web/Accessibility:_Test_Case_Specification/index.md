---
Title: ./Accessibility:_Test_Case_Specification
layout: default
---

<h1>
<font color=red>Currently this page does not apply. We are currently not
using manual testing, our automation scripts are our test cases. These
guidelines should be followed if manual test cases are introduced in the
future</font>

</h1>
References
----------

[Product Test Case Plan]({{site.url}}/Accessibility:_Test_Plan "wikilink")\
[Product Test Case
Specification]({{site.url}}/Accessibility:_Test_Case_Specification "wikilink")
(current page)\
[Product Test Log]({{site.url}}/Accessibility:_Test_Log "wikilink")\
[Product Test Summary]({{site.url}}/Accessibility:_Test_Summary "wikilink")\
[Product Bug
Specification]({{site.url}}/Accessibility:_Bug_Specification "wikilink")\
[Product Home]({{site.url}}/Accessibility "wikilink")\
==Test case specification==

All manual test cases must be stored on Testopia from
<http://bugzilla.novell.com>. Individual test cases cannot be found on
this page.

### Purpose

The outline below must be used for all manual test cases. When creating
or modifying a test case, please ensure that all the fields below are
present. Do not skip fields; if the field is not applicable please mark
it not applicable.

### Outline

This specification is created base on Testopia content items.

#### Summary Description

*Abstract description of what is to be tested.* this should be provided
in Testopia's "Summary" field.

#### Test case specification identifier

*Some way to uniquely identify a test case. Testopia provides this.*

#### Test items

*Items (e.g., requirement specs, design specs, code, etc.) required to
run a particular test case. This should be provided in Testopia's
"Notes" or "Attachment" feature.*

#### Input specifications

''Description of what is required (step-by-step) to execute the test
case (e.g., input files, values that must be entered into a field,
etc.). This should be provided in Testopia's "Action" field.

#### Output specifications

*Description of what the system should look like after the test case is
run. This should be provided in the Testopia's "Expected Results"
field.*

#### Environmental needs

*Description of any special environmental needs. This includes system
architectures, tools, records or files, interfaces, etc. System OS,
architecture should be provided in Testopia's "Environment" field. Other
environmental needs should be provided under "Notes" and files should be
added to "Attachments"*

#### Special procedural requirements

*Description of any special procedures or special configurations
necessary to set up and breakdown the test environment. This should be
provided in Testopia's "Setup" and "Breakdown" fields*

#### Intercase dependencies

*Dependencies or relations with other test cases. This should be
provided in Testopia's "Notes" field.*

#### Test script

'' If test case include some test scripts, scripts should be added into
Testopia's "Attachments" field and give abstract description.''

#### Chose component

*each test case should chose a component to rely on which component of
project in Testopia's "Component" field.*

Resources
---------

[Linux Accessibility
Testcases](http://developer.gnome.org/projects/gap/testing/IBM-testing-guide/)

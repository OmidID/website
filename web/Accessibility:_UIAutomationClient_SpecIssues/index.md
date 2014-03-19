---
Title: ./Accessibility:_UIAutomationClient_SpecIssues
layout: default
---

Issues with UIAutomationClient Specification
============================================

Implementation Inconsistencies
------------------------------

TODO: Turn into table, linkify, yadda yadda yadda

-   TreeWalker.Normalize - MSDN says if no match, always return
    AutomationElement.RootElement. Actual implementation returns null if
    no match.

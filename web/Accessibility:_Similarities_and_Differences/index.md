---
Title: ./Accessibility:_Similarities_and_Differences
layout: default
---

Introduction
------------

This page is meant to be used to explain differences between our
implementation and MS's. We have found some scenarios in MS
implementation showing that their implementation is incomplete or
implements something totally different:

System.Windows.Forms
--------------------

### DomainUpDown

1.  .NET: Not implemented (throws NotImplementException).
2.  Mono:
    1.  Implements List Control Type.
    2.  Children: n ListItem Control Type.

### MonthCalendar

1.  .NET: Not implemented (throws NotImplementException).
2.  Mono:
    1.  Implements Calendar Control Type.
    2.  Children: 1 Grid Control Type.

### DataGrid

1.  .NET: Implements Table Control Type.
2.  Mono:
    1.  Mimics ListView implementation when View is Details, so
        implements DataGrid Control Type.
    2.  Children: 1 Header Item with n HeaderItem Items. n DataItem with
        n XXXX Control Type.

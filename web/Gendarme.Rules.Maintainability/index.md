---
Title: ./Gendarme.Rules.Maintainability
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s maintainability rules are located in
the **Gendarme.Rules.Maintainability.dll** assembly. Latest sources are
available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Maintainability/).

Rules
=====

### AvoidAlwaysNullFieldRule

A type has a private field whose value is always null.

**Bad** example:

<div class="csharp">
    <pre><code>
    internal sealed class Bad {
        private List<int> values;
        
        public List<int> Values {
            get {
                return values;
            }
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    internal sealed class Good {
        private List<int> values = new List<int>();
        
        public List<int> Values {
            get {
                return values;
            }
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### AvoidComplexMethodsRule

This rule computes the cyclomatic complexity (CC) for every method and
reports any method with a CC over 25 (this limit is configurable). Large
CC value often indicate complex code that is hard to understand and
maintain. It's likely that breaking the method into several methods will
help readability. This rule won't report any defects on code generated
by the compiler or by tools.

**Notes**

-   This rule is available since Gendarme 2.0

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### HighThreshold

Methods with cyclomatic complexity less than this (but higher than
MediumThreshold) will be reported as high severity.

#### LowThreshold

Methods with cyclomatic complexity less than this will be reported as
low severity.

#### MediumThreshold

Methods with cyclomatic complexity less than this (but higher than
LowThreshold) will be reported as medium severity.

#### SuccessThreshold

The cyclomatic complexity at which defects begin to be reported.

### AvoidDeepInheritanceTreeRule

This rule will fire if a type has (by default) more than four base
classes defined within the assembly set being analyzed. Optionally it
will also count base classes defined outside the assembly set being
analyzed.

**Notes**

-   This rule is available since Gendarme 2.0

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### CountExternalDepth

If true the rule will count base classes defined outside the assemblies
being analyzed.

#### MaximumDepth

Classes with more base classes than this will result in a defect.

### AvoidLackOfCohesionOfMethodsRule

This rule checks every type for lack of cohesion between the fields and
the methods. Low cohesion is often a sign that a type is doing too many,
different and unrelated things. The cohesion score is given for each
defect (higher is better).

**Notes**

-   This rule is available since Gendarme 2.0

**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### LowSeverityLowerLimit

Defects with cohesion values greater than this will be reported at low
severity.

#### MediumSeverityLowerLimit

Defects with cohesion values greater than (but less than
LowSeverityLowerLimit) this will be reported at medium severity.

#### MinimumFieldCount

The minimum number of fields a class must have to be checked.

#### MinimumMethodCount

The minimum number of methods a class must have to be checked.

#### SuccessLowerLimit

Cohesion values lower than this will result in a defect.

### AvoidUnnecessarySpecializationRule

This rule checks methods for over specialized parameters - i.e.
parameter types that are unnecessarily specialized with respect to what
the method needs to perform its job. This often impairs the reusability
of the method. If a problem is found the rule will suggest the most
general type, or interface, required for the method to work.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class DefaultEqualityComparer : IEqualityComparer {
        public int GetHashCode (object obj)
        {
            return o.GetHashCode ();
        }
    }

    public int Bad (DefaultEqualityComparer ec, object o)
    {
        return ec.GetHashCode (o);
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class DefaultEqualityComparer : IEqualityComparer {
        public int GetHashCode (object obj)
        {
            return o.GetHashCode ();
        }
    }

    public int Good (IEqualityComparer ec, object o)
    {
        return ec.GetHashCode (o);
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ConsiderUsingStopwatchRule

This rule checks methods for cases where a
**System.Diagnostics.Stopwatch** could be used instead of using
**System.DateTime** to compute the time required for an action.
Stopwatch is preferred because it better expresses the intent of the
code and because (on some platforms at least) StopWatch is accurate to
roughly the microsecond whereas DateTime.Now is only accurate to 16
milliseconds or so. This rule only applies to assemblies compiled with
the .NET framework version 2.0 (or later).

**Bad** example:

<div class="csharp">
    <pre><code>
    public TimeSpan DoLongOperation ()
    {
        DateTime start = DateTime.Now;
        DownloadNewOpenSuseDvdIso ();
        return DateTime.Now - start;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public TimeSpan DoLongOperation ()
    {
        Stopwatch watch = Stopwatch.StartNew ();
        DownloadNewOpenSuseDvdIso ();
        return watch.Elapsed;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### PreferStringIsNullOrEmptyRule

This rule checks methods for cases where **String.IsNullOrEmpty** could
be used instead of doing separate null and length checks. This does not
affect execution nor performance (much) but it does improve source code
readability. This rule only applies to assemblies compiled with .NET 2.0
(or later).

**Bad** example:

<div class="csharp">
    <pre><code>
    public bool SendMessage (string message)
    {
        if ((message == null) || (message.Length == 0)) {
            return false;
        }
        return SendMessage (Encode (message));
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public bool SendMessage (string message)
    {
        if (String.IsNullOrEmpty (message)) {
            return false;
        }
        return SendMessage (Encode (message));
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

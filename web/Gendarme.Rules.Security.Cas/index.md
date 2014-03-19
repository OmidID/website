---
Title: ./Gendarme.Rules.Security.Cas
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s Code Access Security (CAS) rules are
located in the **Gendarme.Rules.Security.Cas.dll** assembly. Latest
sources are available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Security.Cas/).

Rules
=====

### AddMissingTypeInheritanceDemandRule

The rule checks for types that are not **sealed** but have a
**LinkDemand**. In this case the type should also have an
**InheritanceDemand** for the same permissions. An alternative is to
seal the type.

**Bad** example:

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    public class Bad {
    }

    </code></pre>

</div>
**Good** example (InheritanceDemand):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    [SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
    public class Correct {
    }

    </code></pre>

</div>
**Good** example (sealed):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    public sealed class Correct {
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security
    and named TypeLinkDemandRule.

### DoNotExposeFieldsInSecuredTypeRule

The rule checks for types that are secured by **Demand** or
**LinkDemand**but also expose visible fields. Access to these fields is
not covered by the declarative demands, opening potential security
holes.

**Bad** example:

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    public class Bad {
    }

    </code></pre>

</div>
**Good** example (InheritanceDemand):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    [SecurityPermission (SecurityAction.InheritanceDemand, ControlThread = true)]
    public class Correct {
    }

    </code></pre>

</div>
**Good** example (sealed):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, ControlThread = true)]
    public sealed class Correct {
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security
    and named TypeExposeFieldsRule.

### DoNotExposeMethodsProtectedByLinkDemandRule

This rule checks for visible methods that are less protected (i.e. lower
security requirements) than the method they call. If the called methods
are protected by a **LinkDemand** then the caller can be used to bypass
security checks.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class BaseClass {
        [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
        public virtual void VirtualMethod ()
        {
        }
    }

    public class Class : BaseClass  {
        // bad since a caller with only ControlAppDomain will be able to call the base method
        [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
        public override void VirtualMethod ()
        {
            base.VirtualMethod ();
        }
    }

    </code></pre>

</div>
**Good** example (InheritanceDemand):

<div class="csharp">
    <pre><code>
    public class BaseClass {
        [SecurityPermission (SecurityAction.LinkDemand, ControlAppDomain = true)]
        public virtual void VirtualMethod ()
        {
        }
    }

    public class Class : BaseClass  {
        // ok since this permission cover the base class permission
        [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
        public override void VirtualMethod ()
        {
            base.VirtualMethod ();
        }
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security
    and named MethodCallWithSubsetLinkDemandRule.

### DoNotReduceTypeSecurityOnMethodsRule

This rule checks for types that have declarative security permission
which aren't a subset of the security permission of some of their
methods.

**Bad** example:

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.Assert, ControlThread = true)]
    public class NotSubset {
        [EnvironmentPermission (SecurityAction.Assert, Unrestricted = true)]
        public void Method ()
        {
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.Assert, ControlThread = true)]
    public class Subset {
        [SecurityPermission (SecurityAction.Assert, Unrestricted = true)]
        public void Method ()
        {
        }
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security
    and named TypeIsNotSubsetOfMethodSecurityRule.

### ReviewSealedTypeWithInheritanceDemandRule

This rule checks for sealed types that have **InheritanceDemand**
declarative security applied to them. Since those types cannot be
inherited from the **InheritanceDemand** will never be executed by the
runtime. Check if the permission is required and, if so, change the
**SecurityAction** to the correct one. Otherwise remove the permission.

**Bad** example:

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
    public sealed class Bad {
    }

    </code></pre>

</div>
**Good** example (non sealed):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.InheritanceDemand, Unrestricted = true)]
    public class Good {
    }

    </code></pre>

</div>
**Good** example (LinkDemand):

<div class="csharp">
    <pre><code>
    [SecurityPermission (SecurityAction.LinkDemand, Unrestricted = true)]
    public sealed class Good {
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security
    and named SealedTypeWithInheritanceDemandRule.

### ReviewSuppressUnmanagedCodeSecurityUsageRule

This rule fires if a type or method is decorated with the
**[SuppressUnmanagedCodeSecurity]**attribute. This attribute reduces the
security checks done when executing unmanaged code and its usage should
be reviewed to confirm that no exploitable security holes are present.

Example:

<div class="csharp">
    <pre><code>
    [SuppressUnmanagedCodeSecurity]
    public class Safe {
        [DllImport ("User32.dll")]
        static extern Boolean MessageBeep (UInt32 beepType);
    }

    </code></pre>

</div>
**Notes**

-   This is an Audit rule. As such it does not check for valid or
    invalid patterns but warns about a specific problem that needs to be
    reviewed by someone.

### SecureGetObjectDataOverridesRule

This rule fires if a type implements
**System.Runtime.Serialization.ISerializable**but the **GetObjectData**
method is not protected with a **Demand** or **LinkDemand** for
**SerializationFormatter**.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Bad : ISerializable {
        public override void GetObjectData (SerializationInfo info, StreamingContext context)
        {
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Good : ISerializable {
        [SecurityPermission (SecurityAction.LinkDemand, SerializationFormatter = true)]
        public override void GetObjectData (SerializationInfo info, StreamingContext context)
        {
        }
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.2 this rule was part of Gendarme.Rules.Security.

Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

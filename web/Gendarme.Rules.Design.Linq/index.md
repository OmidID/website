---
Title: ./Gendarme.Rules.Design.Linq
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s rules about LINQ-related design issues
are located in the **Gendarme.Rules.Design.Linq.dll** assembly. Latest
sources are available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Design.Linq/).

Rules
=====

### AvoidExtensionMethodOnSystemObjectRule

Extension methods should not be used to extend **System.Object**. Such
extension methods cannot be consumed by some languages, like VB.NET,
which use late-binding on **System.Object** instances.

**Bad** example:

<div class="csharp">
    <pre><code>
    public static class Extensions {
        public static string ToDebugString (this object self)
        {
            return String.Format ("'{0}', type '{1}', hashcode: {2}",
            self.ToString (), self.GetType (), self.GetHashCode ());
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public static class Extensions {
        public static string ToDebugString (this DateTime self)
        {
            return String.Format ("'{0}', type '{1}', hashcode: {2}",
            self.ToString (), self.GetType (), self.GetHashCode ());
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

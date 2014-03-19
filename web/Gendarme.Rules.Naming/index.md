---
Title: ./Gendarme.Rules.Naming
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s naming rules are located in the
**Gendarme.Rules.Naming.dll** assembly. Latest sources are available
from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Naming/).

Rules
=====

### AvoidDeepNamespaceHierarchyRule

This rule checks for deeply nested namespaces within an assembly. It
will warn if the depth is greater than four (default value) unless the
fifth (or the next) part is one of the specialized name that the
framework recommends or a name like an internal namespace (something not
meant to be seen outside the assembly).

-   **Design** : Namespace that provides design-time support for its
    base namespace.
-   **Interop** : Namespace that provides all interoperability code
    (e.g. p./invokes) for its base namespace.
-   **Permissions** : Namespace that provides all custom permissions for
    its base namespace.
-   **Internal** : Namespace that provides non visible (outside the
    assembly) helper code for its base namespace. **Impl** while allowed
    by the rule is not encouraged.

**Bad** example:

<div class="csharp">
    <pre><code>
    namespace One.Two.Three.Four.Five {
        internal class Helper {
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    namespace One.Two.Three.Four {
        internal class FiveHelper {
        }
    }

    </code></pre>

</div>
**Good** example (exception for some namespace specialization):

<div class="csharp">
    <pre><code>
    namespace One.Two.Three.Four.Internal {
        internal class Helper {
        }
    }

    </code></pre>

</div>
**Configuration**

Some elements of this rule can be customized to better fit your needs.

#### MaxDepth

The depth at which namespaces may be nested without triggering a defect.

### AvoidNonAlphanumericIdentifierRule

This rule ensures that identifiers like assembly names, namespaces,
types and members names don't have any non-alphanumerical characters
inside them. The rule will ignore interfaces used for COM
interoperability - i.e. decorated with both **[InterfaceType]** and
**[Guid]** attributes.

**Bad** example:

<div class="csharp">
    <pre><code>
    namespace New_Namespace {
        
        public class My_Custom_Class {
            
            public int My_Field;
            
            public void My_Method (string my_string)
            {
            }
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    namespace NewNamespace {
        
        public class MyCustomClass {
            
            public int MyField;
            
            public void MyMethod (string myString)
            {
            }
        }
    }

    </code></pre>

</div>
**Notes**

-   Prior to Gendarme 2.2 this rule was named
    DetectNonAlphanumericInTypeNamesRule

### AvoidRedundancyInMethodNameRule

This rule will fire if a method name embeds the type name of its first
parameter. Usually, removing that type name makes the API less verbose,
easier to learn, and more future-proof.

**Bad** example:

<div class="csharp">
    <pre><code>
    class PostOffice {
        public void SendLetter (Letter letter) {
        }
        public void SendPackage (Package package) {
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class PostOffice {
        public void Send (Letter letter) {
        }
        public void Send (Package package) {
        }
    }

    </code></pre>

</div>
**Bad** example:

<div class="csharp">
    <pre><code>
    class PostOffice {
        public static bool IsPackageValid (Package package) {
            return package.HasAddress && package.HasStamp;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class Package {
        public bool IsValid {
            get {
                return HasAddress && HasStamp;
            }
        }
    }

    </code></pre>

</div>
### AvoidRedundancyInTypeNameRule

This rule will fire if a type is prefixed with the last component of its
namespace. Using prefixes like this makes type names more verbose than
they need to be and makes them harder to use with tools like
auto-complete. Note that an exception is made if removal of the prefix
would cause an ambiguity with another type. If this is the case the rule
will not report a defect.

**Bad** example:

<div class="csharp">
    <pre><code>
    namespace Foo.Lang.Compiler {
        public class CompilerContext {
        }
    }

    </code></pre>

</div>
<div class="csharp">
    <pre><code>
    using Foo.Lang;
    ...
    Compiler.CompilerContext context = new Compiler.CompilerContext ();

    </code></pre>

</div>
<div class="csharp">
    <pre><code>
    using Foo.Lang.Compiler;
    ...
    CompilerContext context = new CompilerContext ();

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    namespace Foo.Lang.Compiler {
        public class Context {
        }
    }

    </code></pre>

</div>
<div class="csharp">
    <pre><code>
    using Foo.Lang;
    ...
    Compiler.Context context = new Compiler.Context ();

    </code></pre>

</div>
<div class="csharp">
    <pre><code>
    using Foo.Lang.Compiler;
    ...
    Context context = new Context ();

    </code></pre>

</div>
Another good example (more meaningful term in the context of the
namespace):

<div class="csharp">
    <pre><code>
    namespace Foo.Lang.Compiler {
        public class CompilationContext {
        }
    }

    </code></pre>

</div>
### AvoidTypeInterfaceInconsistencyRule

This rule will fire if an assembly has a namespace which contains an
interface IFoo and a type Foo, but the type does not implement the
interface. If an interface and a type name differ only by the **I**
prefix (of the interface) then we can logically expect the type to
implement this interface.

**Bad** example:

<div class="csharp">
    <pre><code>
    public interface IMember {
        string Name {
            get;
        }
    }

    public class Member {
        public string Name {
            get {
                return String.Empty;
            }
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public interface IMember {
        string Name {
            get;
        }
    }

    public class Member : IMember {
        public string Name {
            get {
                return String.Empty;
            }
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### DoNotPrefixEventsWithAfterOrBeforeRule

This rule ensures that event names are not prefixed with **After** or
**Before**. The .NET naming conventions recommend using a verb in the
present and in the past tense.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Bad {
        public event ResolveEventHandler BeforeResolve;
        public event ResolveEventHandler AfterResolve;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Good {
        public event ResolveEventHandler Resolving; // present
        public event ResolveEventHandler Resolved;  // past
    }

    </code></pre>

</div>
### DoNotPrefixValuesWithEnumNameRule

This rule checks for **enum** values that are prefixed with the
enumeration type name. This is typical in C/C++ application but unneeded
in .NET since the **enum** type name must be specified anyway when used.

**Bad** example:

<div class="csharp">
    <pre><code>
    public enum Answer {
        AnswerYes,
        AnswerNo,
        AnswerMaybe,
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public enum Answer {
        Yes,
        No,
        Maybe
    }

    </code></pre>

</div>
### DoNotUseReservedInEnumValueNamesRule

This rule checks for enumerations that contain values named
**reserved**. This practice, often seen in C/C++ sources, is not needed
in .NET since adding new values will not normally break binary
compatibility. However renaming a **reserved**enum value can since there
is no way to prevent people from using the old value.

**Bad** example:

<div class="csharp">
    <pre><code>
    public enum Answer {
        Yes,
        No,
        Reserved
        // ^ renaming this to 'Maybe' would be a breaking change
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public enum Answer {
        Yes,
        No
        // we can add Maybe here without causing a breaking change
        // (but note that we may break code if we change the values of
        // existing enumerations)
    }

    </code></pre>

</div>
### ParameterNamesShouldMatchOverriddenMethodRule

This rule warns if an overriden method's parameter names does not match
those of the base class or those of the implemented interface. This can
be confusing because it may not always be clear that it is an override
or implementation of an interface method. It also makes it more
difficult to use the method with languages that support named parameters
(like C\# 4.0).

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Base {
        public abstract void Write (string text);
    }

    public class SubType : Base {
        public override void Write (string output)
        {
            //...
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Base {
        public abstract void Write (string text);
    }

    class SubType : Base {
        public override void Write (string text)
        {
            //...
        }
    }

    </code></pre>

</div>
### UseCorrectCasingRule

This rule ensures that identifiers are correctly cased. In particular:

-   namespace names are PascalCased
-   type names are PascalCased
-   method names are PascalCased
-   parameter names are camelCased

**Bad** example:

<div class="csharp">
    <pre><code>
    namespace A {
        abstract public class myClass {
            abstract public int thisMethod (int ThatParameter);
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    namespace Company.Product.Technology {
        abstract public class MyClass {
            abstract public int ThisMethod (int thatParameter);
        }
    }

    </code></pre>

</div>
### UseCorrectPrefixRule

This rule ensures that types are prefixed correctly. Interfaces should
always be prefixed with a **I**, types should never be prefixed with a
**C** (reminder for MFC folks) and generic parameters should be a
single, uppercased letter or be prefixed with **T**.

**Bad** examples:

<div class="csharp">
    <pre><code>
    public interface Phone {
        // ...
    }

    public class CPhone : Phone {
        // ...
    }

    public class Call<Mechanism> {
        // ...
    }

    </code></pre>

</div>
**Good** examples:

<div class="csharp">
    <pre><code>
    public interface IPhone {
        // ...
    }

    public class Phone : IPhone {
        // ...
    }

    public class Call<TMechanism> {
        // ...
    }

    </code></pre>

</div>
### UseCorrectSuffixRule

This rule ensure that types that inherit from certain types or implement
certain interfaces have a specific suffix. It also ensures that no other
types are using those suffixes without inheriting/implementing the
types/interfaces. E.g.

-   **System.Attribute** should end with **Attribute**
-   **System.EventArgs** should end with **EventArgs**
-   **System.Exception** should end with **Exception**
-   **System.Collections.Queue** should end with **Collection** or
    **Queue**
-   **System.Collections.Stack** should end with **Collection** or
    **Stack**
-   **System.Data.DataSet** should end with **DataSet**
-   **System.Data.DataTable** should end with **DataTable** or
    **Collection**
-   **System.IO.Stream** should end with **Stream**
-   **System.Security.IPermission** should end with **Permission**
-   **System.Security.Policy.IMembershipCondition** should end with
    **Condition**
-   **System.Collections.IDictionary** or
    **System.Collections.Generic.IDictionary** should end with
    **Dictionary**
-   **System.Collections.ICollection**,
    **System.Collections.Generic.ICollection** or
    **System.Collections.IEnumerable** should end with **Collection**

**Bad** example:

<div class="csharp">
    <pre><code>
    public sealed class SpecialCode : Attribute {
        // ...
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public sealed class SpecialCodeAttribute : Attribute {
        // ...
    }

    </code></pre>

</div>
### UsePluralNameInEnumFlagsRule

This rule ensures that the name of enumerations decorated with
FlagsAttribute are in plural form.

**Bad** example:

<div class="csharp">
    <pre><code>
    [Flags]
    public enum MyCustomValue {
        Foo,
        Bar,
        AllValues = Foo | Bar
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [Flags]
    public enum MyCustomValues {
        Foo,
        Bar,
        AllValues = Foo | Bar
    }

    </code></pre>

</div>
### UsePreferredTermsRule

This rule ensures that identifiers such as assemblies, namespaces,
types, and members, use the terms suggested by the .NET framework
guidelines so that they are consistent with other class libraries.

-   **Arent** should be replaced with **AreNot**;
-   **Cancelled** should be replaced with **Canceled**;
-   **Cant** should be replaced with **Cannot**;
-   **ComPlus** should be replaced with **EnterpriseServices**;
-   **Couldnt** should be replaced with **CouldNot**;
-   **Didnt** should be replaced with **DidNot**;
-   **Doesnt** should be replaced with **DoesNot**;
-   **Dont** should be replaced with **DoNot**;
-   **Hadnt** should be replaced with **HadNot**;
-   **Hasnt** should be replaced with **HasNot**;
-   **Havent** should be replaced with **HaveNot**;
-   **Indices** should be replaced with **Indexes**;
-   **Isnt** should be replaced with **IsNot**;
-   **LogIn** should be replaced with **LogOn**;
-   **LogOut** should be replaced with **LogOff**;
-   **Shouldnt** should be replaced with **ShouldNot**;
-   **SignOn** should be replaced with **SignIn**;
-   **SignOff** should be replaced with **SignOut**;
-   **Wasnt** should be replaced with **WasNot**;
-   **Werent** should be replaced with **WereNot**;
-   **Wont** should be replaced with **WillNot**;
-   **Wouldnt** should be replaced with **WouldNot**;
-   **Writeable** should be replaced with **Writable**;

**Bad** example:

<div class="csharp">
    <pre><code>
    abstract public class ComPlusSecurity {
        abstract public void LogIn ();
        abstract public void LogOut ();
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    abstract public class EnterpriseServicesSecurity {
        abstract public void LogOn ();
        abstract public void LogOff ();
    }

    </code></pre>

</div>
### UseSingularNameInEnumsUnlessAreFlagsRule

The rule is used for ensure that the name of enumerations are in
singular form unless the enumeration is used as flags, i.e. decorated
with the **[Flags]** attribute.

**Bad** example:

<div class="csharp">
    <pre><code>
    public enum MyCustomValues {
        Foo,
        Bar
    }

    </code></pre>

</div>
**Good** example (singular):

<div class="csharp">
    <pre><code>
    public enum MyCustomValue {
        Foo,
        Bar
    }

    </code></pre>

</div>
**Good** example (flags):

<div class="csharp">
    <pre><code>
    [Flags]
    public enum MyCustomValues {
        Foo,
        Bar,
        AllValues = Foo | Bar
    }

    </code></pre>

</div>
Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

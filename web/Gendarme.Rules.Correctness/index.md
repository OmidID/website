---
Title: ./Gendarme.Rules.Correctness
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s correctness rules are located in the
**Gendarme.Rules.Correctness.dll** assembly. Latest sources are
available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Correctness/).

Rules
=====

### AttributeStringLiteralsShouldParseCorrectlyRule

As attributes are used at compile time, only constants can be passed to
constructors. This can lead to runtime errors for things like malformed
URI strings. This rule checks attributes with the following types,
represented as a string, and validates the string value:

-   Version
-   Guid
-   Uri

**Bad** example:

<div class="csharp">
    <pre><code>
    [assembly: AssemblyFileVersion ("fooo")]

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [assembly: AssemblyFileVersion ("0.0.1.*")]

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### AvoidConstructorsInStaticTypesRule

This rule checks for types that contain only static members and fires if
the type contains a visible instance constructor. This was a common
mistake in the 1.x framework because C\# adds a default, public,
constructor if no other constructors are provided. Code using the
framework 2.0 (and later) should change this type, if possible, into a
static type.

**Bad** example:

<div class="csharp">
    <pre><code>
    // it is possible to instantiate this class since the
    // C# compiler adds a default, public, constructor
    public class Class {
        public static void Method ()
        {
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Class {
        // this class cannot be instantiated
        private Class ()
        {
        }
        
        public static void Method ()
        {
        }
    }

    </code></pre>

</div>
### AvoidFloatingPointEqualityRule

In general floating point numbers cannot be usefully compared using the
equality and inequality operators. This is because floating point
numbers are inexact and most floating point operations introduce errors
which can accumulate if multiple operations are performed. This rule
will fire if [in]equality comparisons are used with **Single** or
**Double** types. In general such comparisons should be done with some
sort of epsilon test instead of a simple compare (see the code below).
For more information:

-   [Floating Point Comparison (General
    Problem)](http://www.cygnus-software.com/papers/comparingfloats/comparingfloats.htm)
-   [Another article about floating point comparison (more .NET
    adapted)](http://www.yoda.arachsys.com/csharp/floatingpoint.html)

**Bad** example:

<div class="csharp">
    <pre><code>
    // This may or may not work as expected. In particular, if the values are from
    // high precision real world measurements or different algorithmic sources then
    // it's likely that they will have small errors and an exact inequality test will not
    // work as expected.
    public static bool NearlyEqual (double [] lhs, double [] rhs)
    {
        if (ReferenceEquals (lhs, rhs)) {
            return true;
        }
        if (lhs.Length != rhs.Length) {
            return false;
        }
        for (int i = 0; i < lhs.Length; ++i) {
            if (lhs [i] != rhs [i]) {
                return false;
            }
        }
        return true;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    // This will normally work fine. However it will not work with infinity (because
    // infinity - infinity is a NAN). It's also difficult to use if the values may
    // have very large or very small magnitudes (because the epsilon value must
    // be scaled accordingly).
    public static bool NearlyEqual (double [] lhs, double [] rhs, double epsilon)
    {
        if (ReferenceEquals (lhs, rhs)) {
            return true;
        }
        if (lhs.Length != rhs.Length) {
            return false;
        }
        for (int i = 0; i < lhs.Length; ++i) {
            if (Math.Abs (lhs [i] - rhs [i]) > epsilon) {
                return false;
            }
        }
        return true;
    }

    </code></pre>

</div>
**Notes**

-   Prior to Gendarme 2.2 this rule was named FloatComparisonRule.

### BadRecursiveInvocationRule

This rule checks for a few common scenarios where a method may be
infinitely recursive. For example, getter properties which call
themselves or methods with no conditional code which call themselves
(instead of the base method).

**Bad** example:

<div class="csharp">
    <pre><code>
    string CurrentDirectory {
        get {
            return CurrentDirectory;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    string CurrentDirectory {
        get {
            return base.CurrentDirectory;
        }
    }

    </code></pre>

</div>
### CallingEqualsWithNullArgRule

This rule checks for methods that call **Equals** with a **null** actual
parameter. Such calls should always return **false**.

**Bad** example:

<div class="csharp">
    <pre><code>
    public void MakeStuff ()
    {
        MyClass myClassInstance = new MyClass ();
        MyClass otherClassInstance = null;
        Console.WriteLine (myClassInstance.Equals (otherClassInstance));
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public void MakeStuff ()
    {
        MyClass myClassInstance = new MyClass ();
        MyClass otherClassInstance = new MyClass ();
        Console.WriteLine (myClassInstance.Equals (otherClassInstance));
    }

    </code></pre>

</div>
### CheckParametersNullityInVisibleMethodsRule

This rule checks if all nullable parameters of visible methods are
compared with **null** before they get used. This reduce the likelyhood
of the runtime throwing a **NullReferenceException**.

**Bad** example:

<div class="csharp">
    <pre><code>
    [DllImport ("message")]
    internal static extern byte [] Parse (string s, int length);

    public bool TryParse (string s, out Message m)
    {
        // is 's' is null then 's.Length' will throw a NullReferenceException
        // which a TryParse method should never do
        byte [] data = Parse (s, s.Length);
        if (data == null) {
            m = null;
            return false;
        }
        m = new Message (data);
        return true;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [DllImport ("message")]
    internal static extern byte [] Parse (string s, int length);

    public bool TryParse (string s, out Message m)
    {
        if (s == null) {
            m = null;
            return false;
        }
        byte [] data = Parse (s, s.Length);
        if (data == null) {
            m = null;
            return false;
        }
        m = new Message (data);
        return true;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### DisposableFieldsShouldBeDisposedRule

The rule inspects all fields for disposable types and, if
**System.IDisposable** is implemented, checks that the type's
**Dispose** method does indeed call **Dispose** on all disposable
fields.

**Bad** example:

<div class="csharp">
    <pre><code>
    class DoesNotDisposeMember : IDisposable {
        byte[] buffer;
        IDisposable field;
        
        public void Dispose ()
        {
            buffer = null;
            // field is not disposed
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class DisposePattern : IDisposable {
        byte[] buffer;
        IDisposable field;
        bool disposed;
        
        public void Dispose ()
        {
            Dispose (true);
        }
        
        private void Dispose (bool disposing)
        {
            if (!disposed) {
                if (disposing) {
                    field.Dispose ();
                }
                buffer = null;
                disposed = true;
            }
        }
    }

    </code></pre>

</div>
### DoNotCompareWithNaNRule

As defined in IEEE 754 it's impossible to compare any floating-point
value, even another **NaN**, with **NaN**. Such comparison will always
return **false**(more information on
[wikipedia](http://en.wikipedia.org/wiki/NaN)). The framework provides
methods, **Single.IsNaN** and **Double.IsNaN**, to check for **NaN**
values.

**Bad** example:

<div class="csharp">
    <pre><code>
    double d = ComplexCalculation ();
    if (d == Double.NaN) {
        // this will never be reached, even if d is NaN
        Console.WriteLine ("No solution exists!");
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    double d = ComplexCalculation ();
    if (Double.IsNaN (d)) {
        Console.WriteLine ("No solution exists!");
    }

    </code></pre>

</div>
### DoNotRecurseInEqualityRule

An operator== or operator!= method is calling itself recursively. This
is usually caused by neglecting to cast an argument to System.Object
before comparing it to null.

**Bad** example:

<div class="csharp">
    <pre><code>
    public static bool operator== (Customer lhs, Customer rhs)
    {
        if (object.ReferenceEquals (lhs, rhs)) {
            return true;
        }
        if (lhs == null || rhs == null) {
            return false;
        }
        return lhs.name == rhs.name && lhs.address == rhs.address;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public static bool operator== (Customer lhs, Customer rhs)
    {
        if (object.ReferenceEquals (lhs, rhs)) {
            return true;
        }
        if ((object) lhs == null || (object) rhs == null) {
            return false;
        }
        return lhs.name == rhs.name && lhs.address == rhs.address;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### DoNotRoundIntegersRule

This rule check for attempts to call **Round**, **Ceiling**, **Floor**
or **Truncate** on an integral type. This often indicate a typo in the
source code (e.g. wrong variable) or an unnecessary operation.

**Bad** example:

<div class="csharp">
    <pre><code>
    public decimal Compute (int x)
    {
        return Math.Truncate ((decimal) x);
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public decimal Compute (int x)
    {
        return (decimal) x;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### EnsureLocalDisposalRule

This rule checks that disposable locals are always disposed of before
the method returns. Use a 'using' statement (or a try/finally block) to
guarantee local disposal even in the event an unhandled exception
occurs.

**Bad** example (non-guaranteed disposal):

<div class="csharp">
    <pre><code>
    void DecodeFile (string file)
    {
        var stream = new StreamReader (file);
        DecodeHeader (stream);
        if (!DecodedHeader.HasContent) {
            return;
        }
        DecodeContent (stream);
        stream.Dispose ();
    }

    </code></pre>

</div>
**Good** example (non-guaranteed disposal):

<div class="csharp">
    <pre><code>
    void DecodeFile (string file)
    {
        using (var stream = new StreamReader (file)) {
            DecodeHeader (stream);
            if (!DecodedHeader.HasContent) {
                return;
            }
            DecodeContent (stream);
        }
    }

    </code></pre>

</div>
**Bad** example (not disposed of / not locally disposed of):

<div class="csharp">
    <pre><code>
    void DecodeFile (string file)
    {
        var stream = new StreamReader (file);
        Decode (stream);
    }

    void Decode (Stream stream)
    {
        /*code to decode the stream*/
        stream.Dispose ();
    }

    </code></pre>

</div>
**Good** example (not disposed of / not locally disposed of):

<div class="csharp">
    <pre><code>
    void DecodeFile (string file)
    {
        using (var stream = new StreamReader (file)) {
            Decode (stream);
        }
    }

    void Decode (Stream stream)
    {
        /*code to decode the stream*/
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### FinalizersShouldCallBaseClassFinalizerRule

This rule is used to warn the developer that a finalizer does not call
the base class finalizer. In C\#, this is enforced by compiler but some
.NET languages (like IL) may allow such behavior.

**Bad** example (IL):

<div class="csharp">
    <pre><code>
    .assembly extern mscorlib
    {
        .ver 1:0:5000:0
        .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )
    }
    .class public auto ansi beforefieldinit BadFinalizer extends [mscorlib]System.Object
    {
        .method family virtual hidebysig instance void Finalize() cil managed
        {
            // no base call so rule will fire here
        }
    }

    </code></pre>

</div>
**Good** example (C\#):

<div class="csharp">
    <pre><code>
    public class GoodFinalizer {
        ~GoodFinalizer ()
        {
            // C# compiler will insert base.Finalize () call here
            // so any compiler-generated code will be valid
        }
    }

    </code></pre>

</div>
### MethodCanBeMadeStaticRule

This rule checks for methods that do not require anything from the
current instance. Those methods can be converted into static methods,
which helps a bit with performance (the hidden **this** parameter can be
omitted), and clarifies the API.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Bad {
        private int x, y, z;
        
        bool Valid (int value)
        {
            // no instance members are used
            return (value > 0);
        }
        
        public int X {
            get {
                return x;
            }
            set {
                if (!Valid (value)) {
                    throw ArgumentException ("X");
                }
                x = value;
            }
        }
        
        // same for Y and Z
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Good {
        private int x, y, z;
        
        static bool Valid (int value)
        {
            return (value > 0);
        }
        
        // same X (and Y and Z) as before
    }

    </code></pre>

</div>
### ProvideCorrectArgumentsToFormattingMethodsRule

This rule checks that the format string used with **String.Format**
matches the other parameters used with the method.

**Bad** examples:

<div class="csharp">
    <pre><code>
    string s1 = String.Format ("There is nothing to format here!");
    // no argument to back {0}
    string s2 = String.Format ("Hello {0}!");

    </code></pre>

</div>
**Good** examples:

<div class="csharp">
    <pre><code>
    string s1 = "There is nothing to format here!";
    string s2 = String.Format ("Hello {0}!", name);

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### ProvideCorrectRegexPatternRule

This rule verifies that valid regular expression strings are used as
arguments.

**Bad** example:

<div class="csharp">
    <pre><code>
    //Invalid end of pattern
    Regex re = new Regex ("^\\");

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    Regex re = new Regex (@"^\\");

    </code></pre>

</div>
**Bad** example:

<div class="csharp">
    <pre><code>
    //Unterminated [] set
    Regex re = new Regex ("([a-z)*");

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    Regex re = new Regex ("([a-z])*");

    </code></pre>

</div>
**Bad** example:

<div class="csharp">
    <pre><code>
    //Reference to undefined group number 2
    return Regex.IsMatch (code, @"(\w)-\2");

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    return Regex.IsMatch (code, @"(\w)-\1");

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### ProvideValidXmlStringRule

This rule verifies that valid XML string arguments are passed as
arguments.

**Bad** example (using LoadXml):

<div class="csharp">
    <pre><code>
    XmlDocument doc = new XmlDocument ();
    doc.LoadXml ("<book>");

    </code></pre>

</div>
**Good** example (using LoadXml):

<div class="csharp">
    <pre><code>
    XmlDocument doc = new XmlDocument ();
    doc.LoadXml ("<book />");

    </code></pre>

</div>
**Bad** example (using InnerXml):

<div class="csharp">
    <pre><code>
    bookElement.InnerXml = "<author>Robert J. Sawyer</authr>";

    </code></pre>

</div>
**Good** example (using InnerXml):

<div class="csharp">
    <pre><code>
    bookElement.InnerXml = "<author>Robert J. Sawyer</author>";

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### ProvideValidXPathExpressionRule

This rule verifies that valid XPath expression strings are passed as
arguments.

**Bad** example (node selection):

<div class="csharp">
    <pre><code>
    XmlNodeList nodes = document.SelectNodes ("/book[@npages == 100]/@title");

    </code></pre>

</div>
**Good** example (node selection):

<div class="csharp">
    <pre><code>
    XmlNodeList nodes = document.SelectNodes ("/book[@npages = 100]/@title");

    </code></pre>

</div>
**Bad** example (expression compilation):

<div class="csharp">
    <pre><code>
    var xpath = XPathExpression.Compile ("/book[@npages == 100]/@title");

    </code></pre>

</div>
**Good** example (expression compilation):

<div class="csharp">
    <pre><code>
    var xpath = XPathExpression.Compile ("/book[@npages = 100]/@title");

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### ReviewCastOnIntegerDivisionRule

This rule checks for integral divisions where the result is cast to a
floating point type. It's usually best to instead cast an operand to the
floating point type so that the result is not truncated.

**Bad** example:

<div class="csharp">
    <pre><code>
    public double Bad (int a, int b)
    {
        // integers are divided, then the result is casted into a double
        // i.e. Bad (5, 2) == 2.0d
        return a / b;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public double Good (int a, int b)
    {
        // a double is divided by an integer, which result in a double result
        // i.e. Good (5, 2) == 2.5d
        return (double) a / b;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### ReviewCastOnIntegerMultiplicationRule

This rule checks for integral multiply operations where the result is
cast to a larger integral type. It's safer instead to cast an operand to
the larger type to minimize the chance of overflow.

**Bad** example:

<div class="csharp">
    <pre><code>
    public long Bad (int a, int b)
    {
        // e.g. Bad (Int32.MaxInt, Int32.MaxInt) == 1
        return a * b;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public long Good (int a, int b)
    {
        // e.g. Good (Int32.MaxInt, Int32.MaxInt) == 4611686014132420609
        return (long) a * b;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### ReviewDoubleAssignmentRule

This rule checks for variables or fields that are assigned multiple
times using the same value. This won't change the value of the variable
(or fields) but should be reviewed since it could be a typo that hides a
real issue in the code.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Bad {
        private int x, y;
        
        public Bad (int value)
        {
            // x is assigned twice, but y is not assigned
            x = x = value;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Good {
        private int x, y;
        
        public Good (int value)
        {
            // x = y = value; was the original meaning but since it's confusing...
            x = value;
            y = value;
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ReviewInconsistentIdentityRule

This rule checks to see if a type manages its identity in a consistent
way. It checks:

-   Equals methods, relational operators and **CompareTo** must either
    use the same set of fields and properties or call a helper method.
-   **GetHashCode** must use the same or a subset of the fields used by
    the equality methods or call a helper method.
-   **Clone** must use the same or a superset of the fields used by the
    equality methods or call a helper method.

**Notes**

-   This rule is available since Gendarme 2.4

### ReviewSelfAssignmentRule

This rule checks for variables or fields that are assigned to
themselves. This won't change the value of the variable (or fields) but
should be reviewed since it could be a typo that hides a real issue in
the code.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Bad {
        private int value;
        
        public Bad (int value)
        {
            // argument is assigned to itself, this.value is unchanged
            value = value;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class Good {
        private int value;
        
        public Good (int value)
        {
            this.value = value;
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ReviewUselessControlFlowRule

This rule checks for empty blocks that produce useless control flow
inside IL. This usually occurs when a block is left incomplete or when a
typo is made.

**Bad** example (empty):

<div class="csharp">
    <pre><code>
    if (x == 0) {
        // TODO - ever seen such a thing ? ;-)
    }

    </code></pre>

</div>
**Bad** example (typo):

<div class="csharp">
    <pre><code>
    if (x == 0); {
        Console.WriteLine ("always printed");
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    if (x == 0) {
        Console.WriteLine ("printed only if x == 0");
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ReviewUseOfInt64BitsToDoubleRule

This rule checks for invalid integer to double conversion using the,
confusingly named, **BitConverter.Int64BitsToDouble** method. This
method converts the actual bits, i.e. not the value, into a **Double**.
The rule will warn when anything other than an **Int64** is being used
as a parameter to this method.

**Bad** example:

<div class="csharp">
    <pre><code>
    public double GetRadians (int degrees)
    {
        return BitConverter.Int64BitsToDouble (degrees) * Math.PI / 180.0d;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public double GetRadians (int degree)
    {
        return degrees * Math.PI / 180.0d;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ReviewUseOfModuloOneOnIntegersRule

This rule checks for a modulo one (1) operation on an integral type.
This is most likely a typo since the result is always 0. This usually
happen when someone confuses a bitwise operation with a remainder.

**Bad** example:

<div class="csharp">
    <pre><code>
    public bool IsOdd (int i)
    {
        return ((i % 1) == 1);
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public bool IsOdd (int i)
    {
        return ((i % 2) != 0); // or ((x & 1) == 1)
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### UseValueInPropertySetterRule

This rule ensures all setter properties uses the value argument passed
to the property.

**Bad** example:

<div class="csharp">
    <pre><code>
    public bool Active {
        get {
            return active;
        }
        // this can take a long time to figure out if the default value for active
        // is false (since most people will use the property to set it to true)
        set {
            active = true;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public bool Active {
        get {
            return active;
        }
        set {
            active = value;
        }
    }

    </code></pre>

</div>
Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

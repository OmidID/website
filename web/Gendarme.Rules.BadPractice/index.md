---
Title: ./Gendarme.Rules.BadPractice
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s rules that check for bad practices are
located in the **Gendarme.Rules.BadPractice.dll** assembly. Latest
sources are available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.BadPractice/).

Rules
=====

### AvoidAssemblyVersionMismatchRule

This rule checks that the **[AssemblyVersion]** matches the
**[AssemblyFileVersion]** when both are present inside an assembly.
Having different version numbers in both attributes can be confusing
once the application is deployed.

**Bad** example:

<div class="csharp">
    <pre><code>
    [assembly: AssemblyVersion ("2.2.0.0")]
    [assembly: AssemblyFileVersion ("1.0.0.0")]

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [assembly: AssemblyVersion ("2.2.0.0")]
    [assembly: AssemblyFileVersion ("2.2.0.0")]

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### AvoidCallingProblematicMethodsRule

This rule warns about methods that calls into potentially dangerous API
of the .NET framework. If possible try to avoid the API (there are
generally safer ways to do the same) or at least make sure your code can
be safely called from others.

-   **System.GC::Collect()**
-   **System.Threading.Thread::Suspend()** and **Resume()**
-   **System.Runtime.InteropServices.SafeHandle::DangerousGetHandle()**
-   **System.Reflection.Assembly::LoadFrom()**, **LoadFile()** and
    **LoadWithPartialName()**
-   **System.Type::InvokeMember()** when used with
    **BindingFlags.NonPublic**

**Bad** example:

<div class="csharp">
    <pre><code>
    public void Load (string filename)
    {
        Assembly a = Assembly.LoadFile (filename);
        // ...
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public void Load (string filename)
    {
        AssemblyName aname = AssemblyName.GetAssemblyName (filename);
        // ensure it's the assembly you expect (e.g. public key, version...)
        Assembly a = Assembly.Load (aname);
        // ...
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### AvoidVisibleConstantFieldRule

This rule looks for constant fields which are visible outside the
current assembly. Such fields, if used outside the assemblies, will have
their value (not the field reference) copied into the other assembly.
Changing the field's value requires that all assemblies which use the
field to be recompiled. Declaring the field as **static readonly**, on
the other hand, allows the value to be changed without requiring that
client assemblies be recompiled.

**Bad** example:

<div class="csharp">
    <pre><code>
    // if this fields is used inside another assembly then
    // the integer 42, not the field, will be baked into it
    public const int MagicNumber = 42;

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    // if this field is used inside another assembly then
    // that assembly will reference the field instead of
    // embedding the value
    static public readonly int MagicNumber = 42;

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### CheckNewExceptionWithoutThrowingRule

This rule checks for exception objects which are created but not thrown,
not returned, and not passed to another method as an argument.

**Bad** example:

<div class="csharp">
    <pre><code>
    void MissingThrow (object arg)
    {
        if (arg == null) {
            new ArgumentNullException ("arg");
        }
        DoWork (arg);
    }

    </code></pre>

</div>
**Good** examples:

<div class="csharp">
    <pre><code>
    void Throw (object arg)
    {
        if (arg == null) {
            throw new ArgumentNullException ("arg");
        }
        DoWork (arg);
    }

    Exception CreateException ()
    {
        return new Exception ();
    }

    </code></pre>

</div>
### CheckNewThreadWithoutStartRule

This rule checks for threads which are created but not started, or
returned or passed to another method as an argument.

**Bad** example:

<div class="csharp">
    <pre><code>
    void UnusedThread ()
    {
        Thread thread = new Thread (threadStart);
        thread.Name = "Thread 1";
    }

    </code></pre>

</div>
**Good** examples:

<div class="csharp">
    <pre><code>
    void Start ()
    {
        Thread thread = new Thread (threadStart);
        thread.Name = "Thread 1";
        thread.Start ();
    }

    Thread InitializeThread ()
    {
        Thread thread = new Thread (threadStart);
        thread.Name = "Thread 1";
        return thread;
    }

    </code></pre>

</div>
### CloneMethodShouldNotReturnNullRule

This rule checks for **Clone()** methods which return **null**.

**Bad** example:

<div class="csharp">
    <pre><code>
    public class MyClass : ICloneable {
        public object Clone ()
        {
            MyClass myClass = new MyClass ();
            // set some internals
            return null;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class MyClass : ICloneable {
        public object Clone ()
        {
            MyClass myClass = new MyClass ();
            // set some internals
            return myClass;
        }
    }

    </code></pre>

</div>
### ConstructorShouldNotCallVirtualMethodsRule

This rule warns the developer if any virtual methods are called in the
constructor of a non-sealed type. The problem is that if a derived class
overrides the method then that method will be called before the derived
constructor has had a chance to run. This makes the code quite fragile.

**Bad** example:

<div class="csharp">
    <pre><code>
    class A {
        public A ()
        {
            this.DoSomething ();
        }
        
        protected virtual void DoSomething ()
        {
        }
    }

    class B : A {
        private int x;
        
        public B ()
        {
            x = 10;
        }
        
        protected override void DoSomething ()
        {
            Console.WriteLine (x);
        }
    }

    B b = new B (); // outputs 0 because B's constructor hasn't been called yet

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class A {
        public void Run ()
        {
            this.DoSomething ();
        }
        
        protected virtual void DoSomething ()
        {
        }
    }

    class B : A {
        private int x;
        
        public B ()
        {
            x = 10;
        }
        
        protected override void DoSomething ()
        {
            Console.WriteLine (x);
        }
    }

    B b = new B ();
    b.Run (); // outputs 10 as intended

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### DisableDebuggingCodeRule

This rule checks for non-console applications which contain calls to
**Console.WriteLine**. These are often used as debugging aids but such
code should be removed or disabled in the released version. If you don't
want to remove it altogether you can place it inside a method decorated
with **[Conditional ("DEBUG")]**, use **Debug.WriteLine**, use
**Trace.WriteLine**, or use the preprocessor. But note that TRACE is
often enabled in release builds so if you do use that you'll probably
want to use a config file to remove the default trace listener.

**Bad** example:

<div class="csharp">
    <pre><code>
    private byte[] GenerateKey ()
    {
        byte[] key = new byte[16];
        rng.GetBytes (key);
        Console.WriteLine ("debug key = {0}", BitConverter.ToString (key));
        return key;
    }

    </code></pre>

</div>
**Good** example (removed):

<div class="csharp">
    <pre><code>
    private byte[] GenerateKey ()
    {
        byte[] key = new byte[16];
        rng.GetBytes (key);
        return key;
    }

    </code></pre>

</div>
**Good** example (changed):

<div class="csharp">
    <pre><code>
    private byte[] GenerateKey ()
    {
        byte[] key = new byte[16];
        rng.GetBytes (key);
        Debug.WriteLine ("debug key = {0}", BitConverter.ToString (key));
        return key;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### DoNotForgetNotImplementedMethodsRule

This rule checks for short methods that throw a
**System.NotImplementedException** exception. It's likely a method that
has not yet been implemented and should not be forgotten by the
developer before a release.

**Bad** example:

<div class="csharp">
    <pre><code>
    private void Save ()
    {
        throw new NotImplementedException ("pending final format");
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### DoNotUseEnumIsAssignableFromRule

This rule checks for calls to **typeof (Enum).IsAssignableFrom (type)**
that can be simplified to **type.IsEnum**.

**Bad** example:

<div class="csharp">
    <pre><code>
    if (typeof (Enum).IsAssignableFrom (type))  {
        // then the type is an enum
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    if (type.IsEnum) {
        // then the type is an enum.
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### DoNotUseGetInterfaceToCheckAssignabilityRule

This rule checks for calls to **Type.GetInterface** that look like they
query if a type is supported, i.e. the result is only used to compare
against **null**. The problem is that only assembly qualified names
uniquely identify a type so if you just use the interface name or even
just the name and namespace you may get unexpected results.

**Bad** example:

<div class="csharp">
    <pre><code>
    if (type.GetInterface ("IConvertible") != null)  {
        // then the type can be assigned to IConvertible
        // but what if there is another IConvertible in there ?!?
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    if (typeof (IConvertible).IsAssignableFrom (type))  {
        // then the type can be assigned to IConvertible
        // without a doubt!
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.2

### EqualsShouldHandleNullArgRule

This rule ensures that **Equals(object)** methods return **false** when
the object parameter is **null**.

**Bad** example:

<div class="csharp">
    <pre><code>
    public bool Equals (object obj)
    {
        // this would throw a NullReferenceException instead of returning false
        return ToString ().Equals (obj.ToString ());
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public override bool Equals (object obj)
    {
        if (obj == null) {
            return false;
        }
        return ToString ().Equals (obj.ToString ());
    }

    </code></pre>

</div>
### GetEntryAssemblyMayReturnNullRule

This rule warns when an assembly without an entry point (i.e. a dll or
library) calls **Assembly.GetEntryAssembly ()**. This call is
problematic since it will always return **null** when called from
outside the root (main) application domain. This may become a problem
inside libraries that can be used, for example, inside ASP.NET
applications.

**Bad** example:

<div class="csharp">
    <pre><code>
    // this will throw a NullReferenceException from an ASP.NET page
    Response.WriteLine (Assembly.GetEntryAssembly ().CodeBase);

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class MainClass {
        static void Main ()
        {
            Console.WriteLine (Assembly.GetEntryAssembly ().CodeBase);
        }
    }

    </code></pre>

</div>
### ObsoleteMessagesShouldNotBeEmptyRule

This rule warns if any type (including classes, structs, enums,
interfaces and delegates), field, property, events, method and
constructor are decorated with an empty **[Obsolete]** attribute because
the attribute is much more helpful if it includes advice on how to deal
with the situation (e.g. the new recommended API to use).

**Bad** example:

<div class="csharp">
    <pre><code>
    [Obsolete]
    public byte[] Key {
        get {
            return (byte[]) key.Clone ();
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    [Obsolete ("Use the new GetKey() method since properties should not return arrays.")]
    public byte[] Key {
        get {
            return (byte[]) key.Clone ();
        }
    }

    </code></pre>

</div>
### OnlyUseDisposeForIDisposableTypesRule

To avoid confusing developers methods named Dispose should be reserved
for types that implement IDisposable.

**Bad** example:

<div class="csharp">
    <pre><code>
    internal sealed class Worker
    {
        // This class uses one or more temporary files to do its work.
        private List<string> files = new List<string> ();
        
        // This is confusing: developers will think they can do things
        // like use the instance with a using statement.
        public void Dispose ()
        {
            foreach (string path in files) {
                File.Delete (path);
            }
            
            files.Clear ();
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    internal sealed class Worker
    {
        // This class uses one or more temporary files to do its work.
        private List<string> files = new List<string> ();
        
        public void Reset ()
        {
            foreach (string path in files) {
                File.Delete (path);
            }
            
            files.Clear ();
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### PreferEmptyInstanceOverNullRule

This rule checks that all methods and properties which return a string,
an array, a collection, or an enumerable do not return **null**. It is
usually better to return an empty instance, as this allows the caller to
use the result without having to perform a null-check first.

**Bad** example (string):

<div class="csharp">
    <pre><code>
    public string DisplayName {
        get {
            if (IsAnonymous) {
                return null;
            }
            return name;
        }
    }

    </code></pre>

</div>
**Good** example (string):

<div class="csharp">
    <pre><code>
    public string DisplayName {
        get {
            if (IsAnonymous) {
                return string.Empty;
            }
            return name;
        }
    }

    </code></pre>

</div>
**Bad** example (array):

<div class="csharp">
    <pre><code>
    public int [] GetOffsets ()
    {
        if (!store.HasOffsets) {
            return null;
        }
        store.LoadOffsets ();
        return store.Offsets;
    }

    </code></pre>

</div>
**Good** example (array):

<div class="csharp">
    <pre><code>
    static const int [] Empty = new int [0];
    public int [] GetOffsets ()
    {
        if (!store.HasOffsets) {
            return Empty;
        }
        store.LoadOffsets ();
        return store.Offsets.ToArray ();
    }

    </code></pre>

</div>
**Bad** example (enumerable):

<div class="csharp">
    <pre><code>
    public IEnumerable<int> GetOffsets ()
    {
        if (!store.HasOffsets) {
            return null;
        }
        store.LoadOffsets ();
        return store.Offsets;
    }

    </code></pre>

</div>
**Good** example (enumerable):

<div class="csharp">
    <pre><code>
    public IEnumerable<int> GetOffsets ()
    {
        if (!store.HasOffsets) {
            yield break;
        }
        store.LoadOffsets ();
        foreach (int offset in store.Offsets) {
            yield return offset;
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.4

### PreferSafeHandleRule

In general it is best to interop with native code using
**System.Runtime.InteropServices.SafeHandle** instead of
**System.IntPtr** or **System.UIntPtr** because:

-   SafeHandles are type safe.
-   SafeHandles are guaranteed to be disposed of during exceptional
    conditions like a thread aborting unexpectedly or a stack overflow.
-   SafeHandles are not vulnerable to reycle attacks.
-   You don't need to write a finalizer which can be tricky to do
    because they execute within their own thread, may execute on
    partially constructed objects, and normally tear down the
    application if you allow an exception to escape from them.

**Bad** example:

<div class="csharp">
    <pre><code>
    using System.Runtime.InteropServices;
    using System.Security;
    using System.Security.Permissions;

    // If cleaning up the native resource in a timely manner is important you can
    // implement IDisposable.
    public sealed class Database {
        ~Database ()
        {
            // This will execute even if the ctor throws so it is important to check
            // to see if the fields are initialized.
            if (m_database != IntPtr.Zero) {
                NativeMethods.sqlite3_close (m_database);
            }
        }
        
        public Database (string path)
        {
            NativeMethods.OpenFlags flags = NativeMethods.OpenFlags.READWRITE | NativeMethods.OpenFlags.CREATE;
            int err = NativeMethods.sqlite3_open_v2 (path, out m_database, flags, IntPtr.Zero);
            // handle errors
        }
        
        // exec and query methods would go here
        
        [SuppressUnmanagedCodeSecurity]
        private static class NativeMethods {
            [Flags]
            public enum OpenFlags : int {
                READONLY = 0x00000001,
                READWRITE = 0x00000002,
                CREATE = 0x00000004,
                // ...
            }
            
            [DllImport ("sqlite3")]
            public static extern int sqlite3_close (IntPtr db);
            
            [DllImport ("sqlite3")]
            public static extern int sqlite3_open_v2 (string fileName, out IntPtr db, OpenFlags flags, IntPtr module);
        }
        
        private IntPtr m_database;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    using System.Runtime.ConstrainedExecution;
    using System.Runtime.InteropServices;
    using System.Security;
    using System.Security.Permissions;

    // If cleaning up the native resource in a timely manner is important you can
    // implement IDisposable, but you do not need to implement a finalizer because
    // SafeHandle will take care of the cleanup.
    internal sealed class Database {
        public Database (string path)
        {
            NativeMethods.OpenFlags flags = NativeMethods.OpenFlags.READWRITE | NativeMethods.OpenFlags.CREATE;
            m_database = new SqlitePtr (path, flags);
        }
        
        // exec and query methods would go here
        
        // This corresponds to a native sqlite3*.
        [SecurityPermission (SecurityAction.InheritanceDemand, UnmanagedCode = true)]
        [SecurityPermission (SecurityAction.Demand, UnmanagedCode = true)]
        private sealed class SqlitePtr : SafeHandle {
            public SqlitePtr (string path, NativeMethods.OpenFlags flags) : base (IntPtr.Zero, true)
            {
                int err = NativeMethods.sqlite3_open_v2 (path, out handle, flags, IntPtr.Zero);
                // handle errors
            }
            
            public override bool IsInvalid {
                get {
                    return (handle == IntPtr.Zero);
                }
            }
            
            // This will not be called if the handle is invalid. Note that this method should not throw.
            [ReliabilityContract (Consistency.WillNotCorruptState, Cer.MayFail)]
            protected override bool ReleaseHandle ()
            {
                NativeMethods.sqlite3_close (this);
                return true;
            }
        }
        
        [SuppressUnmanagedCodeSecurity]
        private static class NativeMethods {
            [Flags]
            public enum OpenFlags : int {
                READONLY = 0x00000001,
                READWRITE = 0x00000002,
                CREATE = 0x00000004,
                // ...
            }
            
            [DllImport ("sqlite3")]
            public static extern int sqlite3_close (SqlitePtr db);
            
            // Open must take an IntPtr but all other methods take a type safe SqlitePtr.
            [DllImport ("sqlite3")]
            public static extern int sqlite3_open_v2 (string fileName, out IntPtr db, OpenFlags flags, IntPtr module);
        }
        
        private SqlitePtr m_database;
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### ReplaceIncompleteOddnessCheckRule

This rule checks for problematic oddness checks. Often this is done by
comparing a value modulo two (% 2) with one (1). However this will not
work if the value is negative because negative one will be returned. A
better (and faster) approach is to check the least significant bit of
the integer.

**Bad** example:

<div class="csharp">
    <pre><code>
    public bool IsOdd (int x)
    {
        // (x % 2) won't work for negative numbers (it returns -1)
        return ((x % 2) == 1);
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public bool IsOdd (int x)
    {
        return ((x % 2) != 0);
    }

    </code></pre>

</div>
**Good** example (faster):

<div class="csharp">
    <pre><code>
    public bool IsOdd (int x)
    {
        return ((x & 1) == 1);
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.0

### ToStringShouldNotReturnNullRule

This rule checks for overridden **ToString()** methods which return
**null**. An appropriately descriptive string, or **string.Empty**,
should be returned instead in order to make the value more useful
(especially in debugging).

**Bad** example:

<div class="csharp">
    <pre><code>
    public override string ToString ()
    {
        return (count == 0) ? null : count.ToString ();
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public override string ToString ()
    {
        return count.ToString ();
    }

    </code></pre>

</div>
**Notes**

-   Before Gendarme 2.4 this rule was named ToStringReturnsNull.

Feedback
========

Please report any documentation errors, typos or suggestions to the
[Gendarme Google Group](http://groups.google.com/group/gendarme).
Thanks!

<Category:Gendarme>

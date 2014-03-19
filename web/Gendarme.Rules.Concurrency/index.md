---
Title: ./Gendarme.Rules.Concurrency
layout: default
---

[Gendarme]({{site.url}}/Gendarme "wikilink")'s concurrency rules are located in the
**Gendarme.Rules.Concurrency.dll** assembly. Latest sources are
available from [anonymous
SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Concurrency/).

Rules
=====

### DoNotLockOnThisOrTypesRule

This rule checks if you're using **lock** on the current instance
(**this**) or on a **Type**. This can cause problems because anyone can
acquire a lock on the instance or type. And if another thread does
acquire a lock then deadlocks become a very real possibility. The
preferred way to handle this is to create a private **System.Object**
instance field and **lock** that. This greatly reduces the scope of the
code which may acquire the lock which makes it much easier to ensure
that the locking is done correctly.

**Bad** example (this):

<div class="csharp">
    <pre><code>
    public void MethodLockingOnThis ()
    {
        lock (this) {
            producer++;
        }
    }

    </code></pre>

</div>
**Bad** example (type):

<div class="csharp">
    <pre><code>
    public void MethodLockingOnType ()
    {
        lock (this.GetType ()) {
            producer++;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class ClassWithALocker {
        object locker = new object ();
        int producer = 0;
        
        public void MethodLockingLocker ()
        {
            lock (locker) {
                producer++;
            }
        }
    }

    </code></pre>

</div>
### DoNotLockOnWeakIdentityObjectsRule

This rule ensures there are no locks on objects with weak identity. An
object with weak identity is one that can be directly accessed across
different application domains. Because these objects can be accessed by
different application domains it is very difficult to ensure that the
locking is done correctly so problems such as deadlocks are much more
likely. The following types have a weak identities:

-   **System.MarshalByRefObject**
-   **System.OutOfMemoryException**
-   **System.Reflection.MemberInfo**
-   **System.Reflection.ParameterInfo**
-   **System.ExecutionEngineException**
-   **System.StackOverflowException**
-   **System.String**
-   **System.Threading.Thread**

**Bad** example:

<div class="csharp">
    <pre><code>
    public void WeakIdLocked ()
    {
        lock ("CustomString") {
            // ...
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public void WeakIdNotLocked ()
    {
        Phone phone = new Phone ();
        lock (phone) {
            // ...
        }
    }

    </code></pre>

</div>
### DoNotUseLockedRegionOutsideMethodRule

This rule will fire if a method calls
**System.Threading.Monitor.Enter**, but not
**System.Threading.Monitor.Exit**. This is a bad idea for public methods
because the callers must (indirectly) manage a lock which they do not
own. This increases the potential for problems such as dead locks
because locking/unlocking may not be done together, the callers must do
the unlocking even in the presence of exceptions, and it may not be
completely clear that the public method is acquiring a lock without
releasing it. This is less of a problem for private methods because the
lock is managed by code that owns the lock. So, it's relatively easy to
analyze the class to ensure that the lock is locked and unlocked
correctly and that any invariants are preserved when the lock is
acquired and after it is released. However it is usually simpler and
more maintainable if methods unlock whatever they lock.

**Bad** example:

<div class="csharp">
    <pre><code>
    class BadExample {
        int producer = 0;
        object lock = new object();
        
        // This class is meant to be thread safe, but in the interests of
        // performance it requires clients to manage its lock. This allows
        // clients to grab the lock, batch up edits, and release the lock
        // when they are done. But this means that the clients must
        // now (implicitly) manage the lock which is problematic, especially
        // if this object is shared across threads.
        public void BeginEdits ()
        {
            Monitor.Enter (lock);
        }
        
        public void AddProducer ()
        {
            // Real code would either assert or throw if the lock is not held.
            producer++;
        }
        
        public void EndEdits ()
        {
            Monitor.Exit (lock);
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class GoodExample {
        int producer = 0;
        object mutex = new object();
        
        public void AddProducer ()
        {
            // We need a try block in case the assembly is compiled with
            // checked arithmetic.
            Monitor.Enter (mutex);
            try {
                producer++;
                } finally {
                    Monitor.Exit (mutex);
                }
            }
            
            public void AddProducer2 ()
            {
                // Same as the above, but with C# sugar.
                lock (mutex) {
                    producer++;
                }
            }
        }
        
    </code></pre>

</div>
### DoNotUseMethodImplOptionsSynchronizedRule

This rule fires if a method is decorated with
**[MethodImpl(MethodImplOptions.Synchronized)]**. The runtime
synchronizes those methods automatically using a **lock(this)** for
instance methods or a **lock(typeof(X))** for static methods. This can
cause problems because anyone can acquire a lock on the instance or
type. And if another thread does acquire a lock then deadlocks become a
very real possibility. The preferred way to handle this is to create a
private **System.Object** instance field and **lock** that. This greatly
reduces the scope of the code which may acquire the lock which makes it
much easier to ensure that the locking is done correctly.

**Bad** example:

<div class="csharp">
    <pre><code>
    [MethodImpl (MethodImplOptions.Synchronized)]
    public void SychronizedMethod ()
    {
        producer++;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public class ClassWithALocker {
        object locker = new object ();
        int producer = 0;
        
        public void MethodLockingLocker ()
        {
            lock (locker) {
                producer++;
            }
        }
    }

    </code></pre>

</div>
### DoNotUseThreadStaticWithInstanceFieldsRule

This rule will fire if an instance field is decorated with a
**[ThreadStatic]** attribute. This is an error because the attribute
will only work with static fields.

**Bad** example:

<div class="csharp">
    <pre><code>
    // the field isn't static so this will do nothing
    [ThreadStatic]
    private List<object> items;

    public void Add (object item)
    {
        // If the field was thread safe this would ensure that each thread had
        // its own copy of the list.
        if (items == null) {
            items = new List<object> ();
        }
        
        items.Add (item);
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    private List<object> items = new List<object> ();
    private object mutex = new object ();

    // Typically some form of locking such as the code below is used to
    // serialize access to instance fields. However you can also use
    // Threading.Thread.Thread::AllocateNamedDataSlot or AllocateDataSlot.
    public void Add (object item)
    {
        lock (mutex) {
            items.Add (item);
        }
    }

    </code></pre>

</div>
**Notes**

-   This rule is available since Gendarme 2.6

### DoubleCheckLockingRule

This rule is used to check for the double-check pattern, often used when
implementing the singleton pattern (1), and warns of potential incorrect
usage. The original CLR (1.x) could not guarantee that a double-check
would work correctly in multithreaded applications. However the
technique does work on the x86 architecture, the most common
architecture, so the problem is seldom seen (e.g. IA64). The CLR 2 and
later introduce a strong memory model (2) where a double check for a
**lock** is correct (as long as you assign to a **volatile** variable).
This rule won't report a defect for assemblies targetting the 2.0 (and
later) runtime.

-   **1. Implementing Singleton in C\#** :
    <http://msdn.microsoft.com/en-us/library/ms998558.aspx>
-   **2. Understand the Impact of Low-Lock Techniques in Multithreaded
    Apps** : <http://msdn.microsoft.com/en-ca/magazine/cc163715.aspx#S5>

**Bad** example:

<div class="csharp">
    <pre><code>
    public class Singleton {
        private static Singleton instance;
        private static object syncRoot = new object ();
        
        public static Singleton Instance {
            get {
                if (instance == null) {
                    lock (syncRoot) {
                        if (instance == null) {
                            instance = new Singleton ();
                        }
                    }
                }
                return instance;
            }
        }
    }

    </code></pre>

</div>
**Good** example (for 1.x code avoid using double check):

<div class="csharp">
    <pre><code>
    public class Singleton {
        private static Singleton instance;
        private static object syncRoot = new object ();
        
        public static Singleton Instance {
            get {
                // do not check instance before the lock
                // this will work on all CLRs but will affect
                // performance since the lock is always acquired
                lock (syncRoot) {
                    if (instance == null) {
                        instance = new Singleton ();
                    }
                }
                return instance;
            }
        }
    }

    </code></pre>

</div>
**Good** example (for 2.x and later):

<div class="csharp">
    <pre><code>
    public class Singleton {
        // by using 'volatile' the double check will work under CLR 2.x
        private static volatile Singleton instance;
        private static object syncRoot = new object ();
        
        public static Singleton Instance {
            get {
                if (instance == null) {
                    lock (syncRoot) {
                        if (instance == null) {
                            instance = new Singleton ();
                        }
                    }
                }
                return instance;
            }
        }
    }

    </code></pre>

</div>
### NonConstantStaticFieldsShouldNotBeVisibleRule

This rule warns if a non-constant public static field is found. In a
multi-threaded environment access to those fields must be synchronized.

**Bad** example:

<div class="csharp">
    <pre><code>
    class HasPublicStaticField {
        public static ComplexObject Field;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    class FieldIsReadonly {
        public readonly static ComplexObject Field = new ComplexObject();
    }

    </code></pre>

</div>
<div class="csharp">
    <pre><code>
    class UseThreadStatic {
        [ThreadStatic]
        public static ComplexObject Field;
        
        public static InitializeThread ()
        {
            if (Field == null)
            Field = new ComplexObject ();
        }
    }

    </code></pre>

</div>
### ProtectCallToEventDelegatesRule

This rule checks that event invocations are safely implemented. In
particular, the event must be copied into a local to avoid race
conditions and it must be checked for null before it is used (events
will normally be null until a delegate is added to them).

**Bad** example (no check):

<div class="csharp">
    <pre><code>
    public event EventHandler Loading;

    protected void OnLoading (EventArgs e)
    {
        // Loading field could be null, throwing a NullReferenceException
        Loading (this, e);
    }

    </code></pre>

</div>
**Bad** example (race condition):

<div class="csharp">
    <pre><code>
    public event EventHandler Loading;

    protected void OnLoading (EventArgs e)
    {
        // Loading could be non-null here
        if (Loading != null) {
            // but be null once we get here :(
            Loading (this, e);
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    public event EventHandler Loading;
    protected void OnLoading (EventArgs e)
    {
        EventHandler handler = Loading;
        // handler is either null or non-null
        if (handler != null) {
            // and won't change (i.e. safe from a NullReferenceException)
            handler (this, e);
            // however it is still possible, like the original code, that
            // the Loading method will be removed before, or during its
            // execution. Your code should be safe against such occurance.
        }
    }

    </code></pre>

</div>
### ReviewLockUsedOnlyForOperationsOnVariablesRule

This rule checks if a lock is used only to perform operations on locals
or fields. If the only purpose of that critical section is to make sure
the variables are modified atomatically then the methods provided by
System.Threading.Interlocked class will be more efficient.

**Bad** example:

<div class="csharp">
    <pre><code>
    lock (_lockObject) {
        _counter++;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    Interlocked.Increment(_counter);

    </code></pre>

</div>
**Bad** example:

<div class="csharp">
    <pre><code>
    lock (_lockObject) {
        _someSharedObject = anotherObject;
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    Interlocked.Exchange(_someSharedObject, anotherObject);

    </code></pre>

</div>
### WriteStaticFieldFromInstanceMethodRule

This rule is used to check for instance methods which write values to
static fields. This may cause problems if multiple instances of the type
exist and are used in multithreaded applications.

**Bad** example:

<div class="csharp">
    <pre><code>
    static int default_value;

    public int Value {
        get {
            if (default_value == 0) {
                default_value = -1;
            }
            return (value > default_value) ? value : 0;
        }
    }

    </code></pre>

</div>
**Good** example:

<div class="csharp">
    <pre><code>
    static int default_value = -1;

    public int Value {
        get {
            return (value > default_value) ? value : 0;
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

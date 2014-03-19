---
Title: ./WCFStatusOld
layout: default
---

This page is OLD
================

This page had not been maintained for years, and it has been obsoleted a
lot. It will be rewritten with the latest status, with updated
milestones to achieve rational milestones and need. Check the new status
at [WCF Development]({{site.url}}/WCF Development "wikilink").

We used to write WCF code in "Olive" module and hence there is a lot of
lines that mention it in the following sections. But the WCF module is
moved to mcs tree like other class libraries.

Communication Foundation
========================

Olive comprises Windows Communication Foundation (WCF) stack for
building SOA-based applications. Its development is in early stages, but
you can read [*Mono Olive: Introducing Windows Communication Foundation*
notebook](http://www.youcannoteatbits.org/Files/Documents/Mono%20Olive%20Notebook%20-%2018-09-07.pdf)
for further help on building, fundamentals and contributing (**building
steps are outdated**; please, check
[mono-olive](http://groups.google.com/group/mono-olive) for further
help).

Some of the WS-\* specifications that the Communications Foundation uses
are available [here](http://www.microsoft.com/interop/osp/default.mspx).

WCF is also used in Moonlight, but it cuts down huge parts of .NET 3.0
features and our implementation in Moonlight should be almost feature
complete.

High level status
=================

The following status is gathered based on execution of samples in
<http://msdn2.microsoft.com/en-us/library/ms756478.aspx>

The initial goals focus on basicHttpBinding, so the samples were
converted to use basicHttpBinding.

Many blocking bugs were fixed in order to achieve an initial status.

At this point almost none of the samples work out of the box.

Each non working sample was analyzed in order to understand the source
of the failure.

Features
--------

### Serialization

-   XML Serialization (XmlSerializerFormatAttribute) - supported
-   MTOM not supported
-   DataContract serialization - supported. Tested and works with some
    simple scenarios. Fails on ICalculatorService and other data
    contract types. Deserializer creates new instance using reflection
    instead of GetUninitializedObject so can't deserialize types that
    don't have default constructor.
-   NetDataContract serialization - not supported
-   Incorrect Soap version in untyped messages.
-   ServiceKnownTypes attribute is not supported.

### Service contracts

-   Problems with metadata generation.
-   Typed messages not working well.
-   MessageContract - partially supported

### Service features

-   Sessions not supported.
-   Aborting requests is not supported.
-   Asynchronous WS not supported.

### Channels

-   TCP transport not supported.
-   Reliable session not supported.
-   Security token authenticator not supported.

### Configuration

-   Behavior configuration elements not supported.
    -   TextMessageEncoding
    -   HttpTransport

### Bindings

-   wsHttpBinding not supported. The only working binding is
    basicHttpBinding.

Milestones
----------

### Milestone 1 - Basic connection establishment - achieved

-   Basic ServiceHost side logic : hacked
-   Connect via HTTP and process messages : hacked
-   Support message from/to service method invocation : hacked
-   Support client native method invocation proxy : hacked
-   Optionally configuration support : hacked

### Milestone 2 - Web Services support

The purpose of this milestone is to achieve roughly fully functional WCF
API, although many of the new WCF features will not be working. Our
hopes are that after achieving this milestone, many WCF applications
will be able to run by modifying the configuration files to remove those
unsupported features.

In order to achieve this milestone we need to support the following:

-   Binding
    -   BasicHttpBinding without security, things to take into
        considerations:
        -   ASP.NET integration - which is currently is partially
            implemented and:
            1.  Has a bug with loading configuration from web.config.
            2.  The handler is not integrated into System.Web.
        -   **Not** supporting Security which includes: HTTPS &
            AuthenticationScheme.
        -   Support Only TextMessageEncoder (Without the MTOM Encoder).
        -   Support Configuration Properties:
            1.  AllowCookies
            2.  BypassProxyOnLocal
            3.  HostNameComparisonMode
            4.  MaxBufferPoolSize
            5.  MaxBufferSize
            6.  MaxReceivedMessageSize
            7.  MessageEncoding
            8.  ProxyAddress
            9.  ReaderQuotas
            10. TextEncoding
            11. EnvelopeVersion
            12. TransferMode
            13. UseDefaultWebProxy
-   Contracts
    -   Support the MessageContract
    -   Support the DataContractSerializer.
-   Encoders
    -   Support the TextEncoder
-   Behaviors
    -   Support the MetadataBehavior
-   Client
    -   Develop the GH Proxy
-   Configuration
    -   Complete the Configuration Infrastructure (without applying the
        configuration to the runtime objects)
    -   Achive ability to configure the above supported elements through
        configuration file.

### Milestone 3 - WS-Security and all relevant stuff

-   MessageProperty support (HttpRequest-, Security- etc): partly
-   MessageBuffer implementation for its internal use: done
-   xmlenc/xmldsig support for WSS: done, based on Sys.Security.dll
-   basic X509SecurityToken based communication: done
-   basic WSSecurityTokenSerializer support: done
-   support asymmetric binding elements: done
-   support symmetric binding elements: done
-   Timestamp support: done
-   token authentication: only at recipient (though it would be enough
    so far)
-   handle supporting tokens: done
-   retrieve correct tokens and use correct parameters
-   DetectReplays support
-   key derivation support: done
-   WS-SecureConversation support: it includes
-   SecureConversationSecurityTokenParameters
-   SecurityContextSecurityToken : largely done.
-   SslSecurityTokenParameters: it includes
-   connection-based token retrieval: largely done
-   SSL token processing : largely done
-   Binary XmlDictionary reader/writer for dnse:Cookie
-   SAML implementation
-   IssuedSecurityTokenProvider : it includes
    -   analysis on its behavior: largely done
    -   WS-Trust request processing (especially at service side)
-   ServiceAuthorizationManager implementation

### Milestone 4 - Infocard implementation

-   infocard selector/manager GUI
-   System.IdentityModel.Selectors.dll to invoke infocard.exe.
-   sts.exe

### Milestone 5 - everything else

-   some of Filter and FilterTables
-   NetTcpBinding
-   NetPeerTcpBinding
-   NetNamedPipeBinding
-   P2P
-   Transactions
-   SAML support
-   XmlSerializer in Messages
-   InstanceContext
-   Duplex channels and client base.
-   Sessions
-   Behaviors : some are done
-   Extensions
-   MetadataResolver
-   Policy[Import|Export]Extension implementation

### Not on the list

-   Msmq support
-   ComContract support

Detailed Status
===============

Core Compare
------------

The class status for WCF is now included in the
<a href="http://go-mono.com/status/">class status pages</a>.

Configuration
=============

Contracts
=========

Serialization
-------------

### Data Contract

DataContract serialization - supported. Tested and works with some
simple scenarios. Fails on ICalculatorService and other data contract
types

### Message Contract

#### Typed Messages

Not working well.

### Using Streams

Service Contract
----------------

### Proxy Generator

This generator is a runtime generator for creating the proxy type. Mono
has an implementation that uses CodDom, which Mainsoft can’t use. (Their
solution is probably will be based on Java Dynamic Proxies.)

Policy & Binding
----------------

### Binding Element Types

#### Basic

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none'>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=230 valign=top style='width:172.5pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=290 valign=top style='width:217.6pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=72 valign=top style='width:.75in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
OneWayBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
A binding that supplies a one-way conversion layer

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
TransportBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
The base of <span style='font-size:8.5pt;font-family:Verdana'>all

` `</span>`of the transport binding elements provided`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
For now, only HttpTransportBindingElement is implemented,

` probably TcpTransportBindingElement is the next one. for detail see bellow on`\
` TransportBindingElements`

 

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
CompositeDuplexBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Represents the binding element that is used when the

` client must expose an endpoint for the service to send messages back to the`\
` client`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
StreamUpgradeBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Indicate that a custom stream upgrade provider should be

` used, for example when adding a compression to a text stream`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented, Abstract.

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
PrivacyNoticeBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Represents the binding element that contains the privacy

` policy for the WS-Federation binding`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
UseManagedPresentationBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
used to communicate with a CardSpace Security Token

` Service that supports the CardSpace profile of WS-Trust`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
ReliableSessionBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Supports reliable session between endpoints

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
SecurityBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
An abstract class that, when implemented, represents a

` binding element that supports channel SOAP message security`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Seems to be implemented as an abstract class

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
MessageEncodingBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
The base of all Encoding Elements such as

` ‘TextMessageEncodingElement’, used to encode and decode messages between`\
` endpoints.`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Partially implemented only to get the text encoder work.

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
PeerResolverBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Defines the abstract base class for binding elements used

` to create peer resolver objects`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
TransactionFlowBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
This element allows you to enable or disable incoming

` transaction flow in an endpoint’s binding settings, as well as to specify the`\
` desired protocol format for incoming transactions`

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Partially implemented

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=283 valign=top style='width:212.55pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
ContextBindingElement

</td>
<td width=230 valign=top style='width:172.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=290 valign=top style='width:217.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
</table>
#### TransportBindingElement

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=792
 style='width:593.65pt;border-collapse:collapse;border:none'>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=191 valign=top style='width:143.35pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=144 valign=top style='width:1.5in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=144 valign=top style='width:1.5in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
PeerTransportBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
HttpTransportBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
used to specify an HTTP transport for transmitting

` messages`

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
HttpsTransportBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
used to specify an HTTPS transport for transmitting

` messages`

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
TcpTransportBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
used to specify an TCP transport for transmitting messages

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
NamedPipeTransportBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Named Pipe transport

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not relevant

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
MsmqTransportBindingElement

MsmqIntegrationBindingElement

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Integration with ms.net message queue

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not relevant

</td>
</tr>
<tr>
<td width=312 valign=top style='width:234.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
ConnectionOrientedTransportBindingElement<span
  style='font-size:8.5pt;font-family:Verdana'> </span>

 

</td>
<td width=191 valign=top style='width:143.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Base of TcpTransportBindingElement

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented, Abstract

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
</table>
#### StreamUpgradBindingElement

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=792
 style='width:593.65pt;border-collapse:collapse;border:none'>
<tr>
<td width=279 valign=top style='width:209.15pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=237 valign=top style='width:177.5pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=144 valign=top style='width:1.5in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=132 valign=top style='width:99.0pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=279 valign=top style='width:209.15pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
SslStreamSecurityBindingElement

</td>
<td width=237 valign=top style='width:177.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
supports channel security using an SSL stream

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=132 valign=top style='width:99.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=279 valign=top style='width:209.15pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
WindowsStreamSecurityBindingElement

</td>
<td width=237 valign=top style='width:177.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented

</td>
<td width=132 valign=top style='width:99.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not relevant

</td>
</tr>
</table>
#### SecurityBindingElement

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=792
 style='width:593.65pt;border-collapse:collapse;border:none'>
<tr>
<td width=251 valign=top style='width:188.2pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=277 valign=top style='width:207.45pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=108 valign=top style='width:81.0pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=156 valign=top style='width:117.0pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=251 valign=top style='width:188.2pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
AsymmetricSecurityBindingElement

</td>
<td width=277 valign=top style='width:207.45pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Supports public key encryption

</td>
<td width=108 valign=top style='width:81.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=156 valign=top style='width:117.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=251 valign=top style='width:188.2pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
SymmetricSecurityBindingElement

</td>
<td width=277 valign=top style='width:207.45pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Supports shared key encryption

</td>
<td width=108 valign=top style='width:81.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=156 valign=top style='width:117.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=251 valign=top style='width:188.2pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
TransportSecurityBindingElement

</td>
<td width=277 valign=top style='width:207.45pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Base class of security elements

</td>
<td width=108 valign=top style='width:81.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=156 valign=top style='width:117.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
</table>
#### MessageEncodingBindingElement

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=792
 style='width:593.65pt;border-collapse:collapse;border:none'>
<tr>
<td width=278 valign=top style='width:208.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=188 valign=top style='width:141.0pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=206 valign=top style='width:154.15pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=120 valign=top style='width:1.25in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=278 valign=top style='width:208.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
BinaryMessageEncodingBindingElement

</td>
<td width=188 valign=top style='width:141.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binary format

</td>
<td width=206 valign=top style='width:154.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=120 valign=top style='width:1.25in;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=278 valign=top style='width:208.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
MtomMessageEncodingBindingElement

</td>
<td>
Binary optimized format, Microsoft specific

</td>
<td width=206 valign=top style='width:154.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Not Implemented in System.Runtime.Serialization

</td>
<td width=120 valign=top style='width:1.25in;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=278 valign=top style='width:208.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
TextMessageEncodingBindingElement

</td>
<td width=188 valign=top style='width:141.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Text format

</td>
<td width=206 valign=top style='width:154.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=120 valign=top style='width:1.25in;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=278 valign=top style='width:208.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
WebMessageEncodingBindingElement

</td>
<td width=188 valign=top style='width:141.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=206 valign=top style='width:154.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Implemented

</td>
<td width=120 valign=top style='width:1.25in;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
</table>
#### PeerResolverBindingElement

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=600
 style='width:449.65pt;border-collapse:collapse;border:none'>
<tr>
<td width=257 valign=top style='width:192.8pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
Binding Element

</td>
<td width=140 valign=top style='width:104.9pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Description

</td>
<td width=131 valign=top style='width:97.95pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Mono Status

</td>
<td width=72 valign=top style='width:.75in;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt'>
Relevant to GH

</td>
</tr>
<tr>
<td width=257 valign=top style='width:192.8pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
PeerCustomResolverBindingElement

</td>
<td width=140 valign=top style='width:104.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=131 valign=top style='width:97.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
<tr>
<td width=257 valign=top style='width:192.8pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
PnrpPeerResolverBindingElement

</td>
<td width=140 valign=top style='width:104.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=131 valign=top style='width:97.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
<td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
 

</td>
</tr>
</table>
### Binding Types

#### BasicHttpBinding

Is the only built in binding that has a reasonable status, and can be
used to host a service. This binding supports two
TransportBindingElements:

1.  HttpTransportBindingElement – This is not fully implelmented, main
    aspects are:
    1.  Stand Alone executable - On the hosting side seems to be
        implemented with a stand alone http listener, the client seems
        to be implemented via WebRequest & WebResponse.
    2.  IIS hosting - A handler for System.Web is basically implemented,
        but need to be integrated into ASP.NET, I have seen a bug right
        now that the configuration is not taken from Web.Config.

2.  HttpsTransportBindingElement – This element is not implemented due
    to missing implementation of the corresponding IChannelListener.

In addition it supports two MessageEncodingBindingElements

1.  TextMessageEncodingBindingElement – which is supported
2.  MtomMessageEncodingBindingElements – which is missing because of
    lack of encoder implementation in System.Runtime.Serialization dll.

When security is on this Binding uses the
AsymetricSecurityBindingElement using certificate validation (https).

#### WSHttpBinding

Represents an interoperable binding that supports distributed
transactions and secure, reliable sessions Note: The WSHttpBinding
implementes a number of WS-\* specifications such as:

-   WS-MetadataExchange
-   WS-RelliableMessaging
-   WS-AtomicTransactions
-   WS-Security

These specifications are also implemented and sun project name 'Tango',
and sun claims to be interoperable with .NET WCF implementation. The
existance of the stack in an open source java project may be very
helpfull for us.

**Current Status: not impelmented**

#### WebHttpBinding

expose WCF Web services through HTTP requests that use “plain old XML”
(POX) style messaging instead of SOAP-based messaging

#### NetPeerTcpBinding

A secure tcp based Binding for peer to peer network application.

#### NetTcpBinding

A Binding that uses Tcp as the transport layer This binding by default
uses the following elements:

1.  TcpTransportBindingElement
2.  BinaryMessageEncodingBindingElement
3.  SymetricSecurityBindingElement

#### WSDualHttpBinding

A WS interoperable binding that is used with duplex service contracts.

#### CustomBinding

#### MsmqBindingBase

#### NetNamedPipeBinding

Service Runtime Behavior
========================

The behaviors controlls the runtime behavior of the service. There are
some built in behaviors as detailed bellow, and the user can add custom
behavior. A behavior can be achieved either by inheriting from
IServiceBehavior interface or by applying the ServiceBehavior attribute
to a service contract. If inheriting from IServiceBehavior then applying
the behavior to the service is gained by implementing the method:

`'''void IServiceBehavior.ApplyDispatchBehavior ( ServiceDescription description,ServiceHostBase serviceHostBase)`

The ServiceBehavior Attribute contains serveral properties that referrs
to different behaviors as detailed bellow.

Transaction Behavior
--------------------

Defines the behavior of the transaction in terms of timeout, isolation
and commit policy. This behavior is reached by applying the
ServiceBehavior attribute to a service contract, and definning the
following properties:

-   TransactionTimeout
-   TransactionIsolationLevel
-   ReleaseServiceInstanceOnTransactionComplete
-   TransactionAutoCompleteOnSessionClose
-   TransactionAutoComplete

**Status: Not Implemented**

Dispatch Behavior
-----------------

Concurrency Behavior
--------------------

This behavior is applied using the ServiceBehaviorAttribute with the
ConcurrencyMode enumeration, which controls whether an instance of a
service processes messages sequentially or concurrently

-   Single: Each service instance processes one message at a time. This
    is the default concurrency mode.
-   Multiple: Each service instance processes multiple messages
    concurrently. The service implementation must be thread-safe to use
    this concurrency mode.
-   Reentrant: Each service instance processes one message at a time,
    but accepts reentrant calls. The service only accepts these calls
    when it is calling out

**Status: Not Implemented**

Error Behavior
--------------

Throttling Behavior
-------------------

Basically controls how many messages are processed. The configuration
parameters are:

-   MaxConcurrentCalls
-   MaxConnections
-   MaxInstances

**Status: Not Implemented**

Metadata Behavior
-----------------

This behavior enables/disables MetadataExchange of a service. It
achieved by an instance of 'ServiceMetadataBehavior' that is applied to
a service host.

Status: It seems to be that some work on this exist, but i can't get a
good status here. In practice I could not retrieve the metadata from a
mono based service.

Instance Behavior
-----------------

This behavior specifies how many instances of the service can be run.
This behavior is applied by the ServiceBehavior attribute. The options
are defined by the InstanceContextMode enumeration:

-   InstanceContextMode.PerSession
-   InstanceContextMode.PerCall
-   InstanceContextMode.Single

**Status: Only InstanceContextMode.Single is implemented.**

Message Inspection
------------------

Parameter Filtering
-------------------

Message Encoding
================

Binary
------

Implemented.

Text
----

Implemented

Mtom
----

Not Implemented

Web
---

Implemented

Activation and hosting
======================

EXE
---

IIS
---

[Category:Mono Framework]({{site.url}}/Category:Mono Framework "wikilink")
[Category:Developer Resource]({{site.url}}/Category:Developer Resource "wikilink")

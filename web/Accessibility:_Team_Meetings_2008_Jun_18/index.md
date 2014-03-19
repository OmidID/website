---
Title: ./Accessibility:_Team_Meetings_2008_Jun_18
layout: default
---

Meeting Log
-----------

<TABLE>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
T minus 1 minute

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
06:59

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B> </B>

</TD>
<TD VALIGN=TOP>
-!- mgorse [\~mgorse@130.57.22.201] has joined \#mono-a11y

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:00

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
-!- mode/\#mono-a11y [+o mgorse] by sandy

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
alrighty, let's get started

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
same plan as normal, but before we get started, does anyone have
anything that needs to be brought up?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:01

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I guess not, I'll ask again at the end of the review, so bring it up
then if you do

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:02

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
Let's work down through iteration five in the order that people are
listed

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
sandy: that puts you first

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
okay

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
well, I ended up making very little progress on my planned tasks

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
instead I did other things :-)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:03

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I spent a lot of time with the winforms guys getting our patch accepted
into the mcs project

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so that's done

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I set up a parallel mono environment and changed our MD
solutions/projects to have all GAC references

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so anybody builing the Uia2Atk stuff is going to need to have parallel
mono set up

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:04

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
which I guess I'll talk about later

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Also, I am working on changes to how our assemblies in Olive are
deployed, based on a conversation I had with miguel the other day

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
finally, I've been working on makefiles to help decriptor et al get
started on packages

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
UIAutomationWinforms has makefiles that I think are in good shape, with
good integration to the MD projects

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:05

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
however, I had to turn off reference synchronization, so if you're
working in that project and need to modify references, you'll have to do
it in the MD project and also in the makefiles (bummer, but it's due to
a known MD bug)

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I still need to finish the makefiles

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
next iteration...

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I plan to get all of this infrastructure stuff done and also finish the
testing and new providers I was supposed to do this iteration

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:06

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I'm not adding any new tasks, just carrying everything over that I
didn't finish

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
sandy: great, I'll have you cover the parallel mono and our assembly
deployment after we go through all of the status

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
MarioC: go

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:07

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
ok.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
In this iteration I decided to start implementing ComboBox provider, so,
basically this implementation took the three different patterns used
with this provider

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
this involved changes in our winforms architecture to support items in
Root controls

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:08

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
anyway, the implementation is almost finished, I need to test MS
behavior with our implementation and write a lot of tests.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
TextBox provider isn't yet finished. I'm missing the Scroll pattern.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:09

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
now, next iteration

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Finish Combobox, Finish TexBbox and write a wiki-page about the
winforms-architecture implementation.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:10

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
s/TexBbox/TextBox

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
MarioC: sounds good, and I still have an outstanding issue with
Microsoft about building and maintaining our hierarchy, but my main
contact is out of the office

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:11

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
Hopefully I can get a response on that soon

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
ok, i'm up

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I was on FTO last week and had a lot of catch up to do earlier this week
so I didn't make much progress on the List control

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:12

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I plan on carrying that over for this next iteration and really hound
Microsoft to get some answers with the UIA spec and how they've
implemented their stuff

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
knocte: go

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:13

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I've finished tests on the combobox and created gail tests for radio
button which pass there but still not pass in the bridge because I have
the implementation in progress,

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
but it seems to be easier thanks to the class hierarchy rearchitecture I
recently committed about this (checkbox and radiobutton inherit from an
abstract class togglebutton that inherits from non-abstract class
button, which is a hierarchy a very similar structure as gail)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:14

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
(BTW I also rearchitected the class hierarchy on inheritance of the
Component interface in order not to implement it in the toplevel item
and to make all items implement it correctly; thanks also to sandy, we
can now see the region coordinates of each widget when clicking on them
on accerciser)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:15

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
nice! I saw that

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
I got stuck also on the combobox implementation because I had doubts
about how to query the children but MarioC told me recently that it was
now possible in the provider so I guess implementing it now will be
really straightforward

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I also came out with an idea for unit-testing the events (which seem to
be a field we haven't almost explored in the bridge, even in past
iterations), so bgmerrell has helped providing me with a python app
which monitors AT-SPI events received on a particular AT-enabled program

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:16

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so what I plan for the next iteration is:

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
​a) Finish implementation of ComboBox and RadioButton, making tests pass

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
​b) Start looking at how to integrate the brian's atspimon.py (and maybe
tweak it a bit to show the output in a certain way)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:17

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
​c) Set up my parallel mono env

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
and

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
​d) start looking at the next item in my iteration: spinner, to do tests
and implementation (although maybe I'm replacing it with the Window
class, as it's already started and maybe this way I can finish all
things I've planned for this iteration)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:18

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
(sorry, maybe I was too long) :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
knocte: do you think the only way we'll be able to unit test the events
is all the way through at-spi?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:19

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
calvin: I'm not sure, but I haven't come out with any other idea, as the
events are implemented in the backend as signals

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B> </B>

</TD>
<TD VALIGN=TOP>
-!- jpallen [\~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
maybe I can come out with a signal catcher in C\# from the ATK side, I
didn't think about that

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
this might be subject we can discuss after the meeting, but I'd like to
see us not involve at-spi.. it just feels like it's outside the scope of
a unit test

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:20

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
knocte: thanks, and no, that was not too long

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
ok, bgmerrell: go

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B> </B>

</TD>
<TD VALIGN=TOP>
-!- jpallen [\~jpallen@137.65.132.2] has joined \#mono-a11y

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
This iteration: I spent most of my time working on the test harness.
Most of the work was related to creating useful logs and cleaning up
tests.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:21

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I also reviewed some style guidelines that Calen created for us, then
changed some code and files around to match those guidelines.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
Then I spent yesterday writing the app that monitors and logs atspi
events

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
Next iteration: I think will mostly be spent learning more about
Strongwind with Calen.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:22

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I do have some other tasks if I get time: looking into orca tests (which
keeps getting pushed as we're working on the Strongwind stuff more right
now), writing more documentation for testers, updating the non-opensuse
vms that i've been neglecting, and updating the test plan to reflect the
new stuff we've done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
done

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:23

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: have you started to look at any of the packaging? rolling
anything out, or is the stuff still not quite there for you to use?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
calvin: afaik it's not ready yet

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:24

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
decriptor is keeping me well informed though

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Ray: go

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
last iteration, I was starting to learn IronPython,

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
it consumes me a few days,

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:25

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
till now, I have implemented three samples (form, fontdialog,
progressbar) for cutting my teeth.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
and commit them into uia2atk/test/samples/

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I'm not sure if someone could review my QA works.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
decriptor has created an account on OBS for us to build our stuff.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:26

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
so we could talk about more on that.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
in the next iteration, I'll continue to implement the control samples.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
done. :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
Ray: sounds good, is there no current build/packaging work to be done in
the next iteration?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:27

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
not sure, the one thing I want to ask,

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
shall we upgrade the main 3 distros have upgraded already, do we need to
upgrade these 3 platforms we based on? Fedora 8 to 9, openSUSE 10.3 to
11.0, Ubuntu 7.10 to 8.04 ?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
Yes, we'll need to do that, but I would wait until they are released

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:28

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
calvin: wait a couple hours and I think they'll all be released :P

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
We don't need to switch to any beta or pre-releases

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
heh

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
ok, sure

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
done

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:29

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
and depending on how you look at it they are all in reality released
(mostly meaning 11)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
ngao: hmm, I don't see you listed in the iteration at all

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
decriptor: yep :)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:30

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@ngao\> </B>

</TD>
<TD VALIGN=TOP>
calvin: actually i'm in front of Ray :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
Ray: fyi, the Ubuntu and Fedora test VMs in the lab have been updated

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
ngao: Are you looking at Iteration 5? I don't see you in there

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: thank you very much for your big efforts. :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
Ray: i will probably update openSUSE this iteration

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
ngao: oh, sorry, I'm looking at the current iteration

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:31

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
ngao: ok, I found you... why don't you go now

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@ngao\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
I determined the value of IDs, ran nunit on Vista in the last iteration

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:32

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
i've finished GridPatternIdentifiers

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
and Test

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
i need to finish StatusBar Test

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:33

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
and start to implement CheckedListBox

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
ngao: nice, so CheckedListBox is planned for this iteration?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@ngao\> </B>

</TD>
<TD VALIGN=TOP>
yes

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:34

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
alright!

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
ok, mgorse, sorry, it looks like I skipped you too, let's have you go
now

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
ngao, don't forget to revamp your classes to our latest changes in the
winforms-implementation

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@mgorse\> </B>

</TD>
<TD VALIGN=TOP>
ok

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I've been testing and debugging my cspi work

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
It now passes events on (although I'm not sure about keyboard/mouse
events)

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
and it can find an app through the registry and load in a tree of
objects from it

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Next iteration I'm going to continue testing/debugging and work on the
hypertext, editableText, and table interfaces

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
mgorse: very nice indeed!

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:35

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
Calen: go

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\< Calen\> </B>

</TD>
<TD VALIGN=TOP>
okay, turn me

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
i have finished "test coding standard" wiki page.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
have updated winforms application samples base on coding standard and
also have updated Test\_Plan\_WinForms\_Controls wiki page.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
i have been writing and learning a Strongwind test against gtk
application(treeview control) as practice. it can be run but still have
some problems & questions should be solved by discuss with Brian.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:36

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so i will have worked with Brian to discuss some details about
Strongwind test tomorrow.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
and i will continue to practice strongwind test against gtk application

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
Calen: thanks

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
decriptor: ok, now I'm pretty sure I don't see you on the iteration, am
I just not seeing it again?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:37

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
nope not there yet

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I'll try and make sure I'm on the iteration list for this next round

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
decriptor: ok, you want to cover what you did and have planned?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
OBS link:
<A HREF="https://build.opensuse.org/project/show?project=home%3Auia2atk"><https://build.opensuse.org/project/show>?
project=home%3Auia2atk</A>

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:38

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I created that 'user' on OBS for joint build stuff, so if anyone needs
access let me know (all built stuff should show up on the
software.opensuse.com/search page

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
some of it is still broken, so... working on that

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:39

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I've been talking on and off with the mono build guys and looking at
monobuild to see if we want to use their system as well. They have some
test stuff built into their build system

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:40

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
someone just gave me a suse packagers manual, so I'm making my way
through that as well.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
for this next time around, hoping to be able to have
UIAutomationWinforms and UiaAtkBridge building

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:41

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I'm also hoping to have a script in place to automate this stuff....
Work with ray and packaging for different distros namely deb based stuff

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:42

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
That sounds really good, hopefull we can start using the builds to roll
things out to the test machines

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
ok, did I skip or miss anyone?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
calvin: hopefully

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
once the uia stuff is in a buildable state, that shouldn't be too hard

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:43

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
sandy: do you want to briefly cover the parallel mono environment stuff
and then the plan for how the assemblies are going to be deployed?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
sure thing

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
okay, so I've updated this wiki page:
<A HREF="http://mono-project.com/Accessibility"><http://mono-project.com/Accessibility></A>:\_B
uildingProviderSide

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I plan to keep instructions there

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Basically, anybody who is actually going to build our code needs to have
some mono stuff from svn installed

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:44

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
and the safest way to do that is by installing Mono into a completely
separate area, and having a completely different environment that you
run whenever you want to use that mono installation

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
the instructions for doing that are here:
<A HREF="http://mono-project.com/index.php?title=Parallel_Mono_Environments.&amp;action=edit"><http://mono-project.com/index.php?title>=
Parallel\_Mono\_Environments.&action=edit</A>

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:45

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
whoops

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
anyway, I'll fix that link later

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
heh

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:46

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
once we have packages for the UIA stuff, Olive, and Winforms, people
will be able to run our stuff using those packages instead of building
it all in a parallel enviornment

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
but developers will probably want to keep doing everything in the
parallel env

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
I wonder if it would be possible to have a parallel env in which you
could use our uia stuff, the bleeding edge gtk-sharp,... but \*current
stable\* mono rpms

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
maybe using symlinks?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:47

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
knocte: could be

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I don't know

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\* decriptor </B>

</TD>
<TD VALIGN=TOP>
its fixed

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
setting up a complete parallel mono environment only takes about 30
minutes

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
plus time spent reading instructions

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
if you have any questions, I'd be happy to help out

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
that would make things become easier (for example, solving the issue
about MD and MonoAddins)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
knocte, you can... you don't need to install mono/mcs, only your
development releases

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:48

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
the only problem is that we \*do\* need System.Windows.Forms

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
MarioC: how?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
and the easiest way to do that is to install mono/mcs

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
sandy: oh, that's right! but maybe we can build only MWF separately?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
knocte, it's the same... skip installing mono/mcs, that's all

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
but as sandy mentions, MWF depends on mcs, and mcs depends on mono,
so...

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:49

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
knocte, MarioC, everyone: No matter what, we MUST install and run
MonoDevelop from the parallel environment

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
this is based on the recommendation of the MD developers

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
in our case we "need to" install because of UIA

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
so we're not going to have a very minimal install anyway

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
and we are using latest MD that "needs" latest mono

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so... as sandy says, we need mono/mcs anyway

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:50

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
sandy: oh yeah you're right, unless we could tweak it to launch things
under the other mono env

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
ok

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
it won't be long before we have a tarball release containing the new
SWF, anyway

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:51

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so people will be able to install mono/mcs from a stable tarball instead
of from SVN

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
SWF?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
Winforms

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
sandy: what about the assembly details? (something miguel recommened?)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
calvin: well, that's nothing that really needs to concern everyone, but
I'll explain

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:52

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
decriptor: SWF == System.Windows.Forms :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
Miguel wants the UIAutomation\* assemblies from Olive installed
separately from the 3.0 assemblies in Olive

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
before, we would install Olive, and our stuff would show up in the GAC,
with symlinks in \$prefix/lib/mono/3.0

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:53

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
with my proposed patch, when we install Olive, our UIAutomation\*
assemblies will still get installed into the GAC, with symlinks in
\$prefix/lib/mono/a11y, and a mono-uia.pc file will be installed that
references UIAutomation\* and WindowsBase, allowing people to compile
with -pkg:mono-uia (and also allowing our assemblies to show up in MD's
references dialog)

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:54

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
calvin: the thing I'm a little confused about is how this Olive stuff
should get packaged, though

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
clearly we can package our UIAutomation\* stuff in Olive separately

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:55

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
but it would depend on WindowsBase

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I'm just not sure what this is supposed to look like from a packaging
standpoint

</TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
but I guess that's not really my problem :-)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
:   P
    </TD>
    </TR>

<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
ray and I were talking a little bit about that last night

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:56

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
heh, perhaps I'll walk over and have a discussion with Miguel about this

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@Ray\> </B>

</TD>
<TD VALIGN=TOP>
sure

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
calvin: I'd walk over myself, but well that might take too long :P

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
I'm guessing the reason he wants us packaged outside of Olive is due to
the fact we're very Linux specific, and Olive will go on many platforms
including windows

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\< jpallen\> </B>

</TD>
<TD VALIGN=TOP>
so, before we adjourn, i have a question: when are we going to have some
completed controls that we can start testing? :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
calvin: there are allowances for such things in the makefiles, though

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:57

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@knocte\> </B>

</TD>
<TD VALIGN=TOP>
jpallen: I think they could be tested already if QA devs set up their
mono env as well

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:58

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
jpallen: I think the issue we are waiting for on testing is the
packaging and rollout... the tests should just fail on part of the
controls aren't there

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\< jpallen\> </B>

</TD>
<TD VALIGN=TOP>
ah

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
07:59

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
so we're waiting on decriptor? ;-)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
:   (
    </TD>
    </TR>

<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
jpallen: we have a number of issues that still need to be corrected to
get 100% complete controls (in the bridge, the hierarchy, and other
issues we discussed above)

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
yep, it's all on decriptor

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
heh

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
no pressure :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
jpallen: I think the changes we've been making in the build system (that
sandy discussed) will help with that

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:00

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\< jpallen\> </B>

</TD>
<TD VALIGN=TOP>
ok. so can we be ready by the end of this next iteration?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
decriptor: can you be sure to put in Iteration 5 and 6 your plans and
when you think that stuff will be ready to roll?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
sure can

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:01

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
decriptor: and as jpallen suggested, the end of this iteration would be
best! :)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
I guess I'll prioritize the makefile stuff again

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
and put pressure on the olive guys to review and accept my changes

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
the problem with tests just failing on parts of controls that are not
there is that in many cases the expected results of some action depend
on the previous action succeeding.

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Strongwind, by default, just bails as soon as one action fails.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:02

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@decriptor\> </B>

</TD>
<TD VALIGN=TOP>
let me know about the olive stuff

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: true, but at least we can start getting some test results

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
bgmerrell: even if they are all FAILED

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
the sooner we see failing tests the sooner we can fix them :-)

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
\

</TD>
<TD VALIGN=TOP>
fix our stuff, I mean

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
sandy: oh, you didn't mean rig the tests?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:03

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
:   -P
    </TD>
    </TR>

<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
heh

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
ok, I think that wraps this up

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
Assert.Pass

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
please go into Iteration 5 and get your stuff updated

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
Thanks everyone

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
thanks cap'n

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:04

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
sandy, can I takeover the ListBox provider?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
Well, what i'm saying is that if i have some app and checking a checkbox
fails, Strongwind justs throws a stack trace and goes on to the next
test

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
MarioC: that would be great, if you have time

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
especially since ngao plans on doing CheckedListBox

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
sandy, I need to... because ComboBox uses it...

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@sandy\> </B>

</TD>
<TD VALIGN=TOP>
MarioC: oh, sorry! :-/

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:05

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
I didn't realize I was blocking you

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
<B>\* sandy </B>

</TD>
<TD VALIGN=TOP>
begins shame spiral

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: I understand, but when it throws a stack trace, that is
reported as a failure right?

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
calvin: right, but a failure for the whole test, not just that action.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
sandy, Ok, I'll update the schedule.

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: well, I'm not sure I understand, if this is going to be a
problem, isn't it always going to be a problem, even when we think we
have things done all the way?

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:06

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@MarioC\> </B>

</TD>
<TD VALIGN=TOP>
done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
calvin: well, i think it's the best way to do things. but if we're
trying to test components we know aren't implmented completely i just
don't think we'll get very far into the test, but i guess that's fine
for now

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:08

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: I think for most cases, you'll find that the controls will
check fine, but you may not get the events you expected or something
like that... for the most part, the actions and such will work, that's
the easy part

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:09

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B> </B>

</TD>
<TD VALIGN=TOP>
-!- Ray is now known as Ray|brb

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:11

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: another example, you might have a menu.. the menu works, but
if you remove the menu or try to dock it somewhere, that won't quite
work (although I'm not sure we have menu done at all)

</TD>
</TR>
<TR>
<TD VALIGN=TOP NOWRAP>
</TD>
<TD VALIGN=TOP>
but what I'm saying is the fringe cases are the things you'll find
aren't quite working, that's why the controls are not 100% done

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@bgmerrell\> </B>

</TD>
<TD VALIGN=TOP>
calvin: well, i just remember trying to test the click action for the
button control manually and was having pretty rough time testing a
single action. maybe something has changed since then.

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:12

</TD>
</TR>
<TR>
<TD VALIGN=TOP>
<B>\<@calvin\> </B>

</TD>
<TD VALIGN=TOP>
bgmerrell: I think the problem there was the environment... but we'll
never know until those tests begin to be executed

</TD>
<TD VALIGN=TOP ALIGN=RIGHT>
08:13

</TD>
</TR>
</TABLE>

---
layout: main
title: Frenetic Tutorial
---

Getting Started
---------------

This is a hands-on tutorial with several programming exercises.
We strongly recomend using the tutorial VM we've prepared that has
all the software that you need pre-installed. You can get the tutorial
VM from the following link:

https://github.com/frenetic-lang/frenetic/releases/frenetic-1.0.1

TODO(arjun): Update this link.

Introduction
------------

In this tutorial, you will learn to program software-defined networks (SDNs)
using OpenFlow and Frenetic. The tutorial is
divided into two sections:

* **Ox:** The first set of chapters introduce the nuts and bolts of
programming an OpenFlow-based SDN. In these chapters, we use *Ox*, a
simple platform for writing OpenFlow controllers in OCaml. Apart from
managing the socket connections and serialization, Ox gives you direct
access to the OpenFlow protocol.

Ox is loosely based on platforms such as
[POX](https://openflow.stanford.edu/display/ONL/POX+Wiki) and
[NOX](http://www.noxrepo.org/nox/about-nox/). The concepts and techniques
you learn in this tutorial are applicable to those platforms too.

{% comment %}
Outer paragraph disables markdown processing. Without it, each link is rendered
as a separate paragraph.
{% endcomment %}

<p>
{% for item in site.data.toc %}
{% if item.group == "ox" %}
{% assign ix = forloop.index|minus:1 %}
[<a href="{{ site.data.toc[ix].path }}">{{ site.data.toc[ix].name }}</a>]
{% endif %}
{% endfor %}
</p>

* **Frenetic:** The next set of chapters teach you how to program SDNs
  using the _Frenetic_ domain-specific programming language
  (FreneticDSL). You will see that FreneticDSL provides high-level
  abstractions and rich, compositional features that make SDN
  programming much easier.

<p>
{% for item in site.data.toc %}
{% if item.group == "frenetic" %}
{% assign ix = forloop.index|minus:1 %}
[<a href="{{ site.data.toc[ix].path }}">{{ site.data.toc[ix].name }}</a>]
{% endif %}
{% endfor %}
</p>

### Frenetic

This tutorial should also be viewed as a stepping stone toward
learning how to program in the more powerful *Frenetic* environment
which allows you to write Frenetic program embedded in OCaml.
Frenetic applications react to network events, such as topology
changes and statistics queries.  For example:

1. An event reaches the application.

1. The application generates a new static network configuration and
   sends it to the Frenetic run time.

1. The Frenetic run time compiles it to OpenFlow and updates the
   running network.

Static network configurations are built using
[FreneticLib](http://frenetic-lang.github.io/frenetic/docs/NetCore_Types.html),
which has the same semantics as FreneticDSL, which is presented in this tutorial.
Hence, a Frenetic program is really just a general-purpose
OCaml program that reacts to network events and generates a stream of
FreneticDSL policies.

#### Why Frenetic?

As an aside, you may find it interesting to read about [why we created
Frenetic](http://frenetic-lang.org/publications/overview-ieeecoms13.pdf) in the
first place.

Background Material
-------------------

To write Frenetic and Ox programs, you'll need to know a little bit of OCaml
programming. We only use a small fragment of the language and provide lots
of example code.

[Real World OCaml] is a pragmatic introduction to OCaml. The full text of the
book is available online. If you skim Chapters 1--8, you'll have enough
background to do the Ox tutorial. Frenetic uses the Async library, which is
covered in Chapter 18.

Handy References
----------------

- [Ox Platform Reference](http://frenetic-lang.github.io/frenetic/docs/)

  In the first part of this tutorial, you will write controllers using
  the Ox Controller platform.

- [OpenFlow 1.0 Specification](http://www.openflow.org/documents/openflow-spec-v1.0.0.pdf)

  The OpenFlow specification describes OpenFlow-conformant switches
  and details the wire-format of the OpenFlow protocol. You'll find that
  most of the Ox Platform Reference simply reflects the OpenFlow messages
  and data types into OCaml.

  You don't need to read the OpenFlow specification to follow the
  guide. But, you will need to do so to understand OpenFlow in depth.

- [Mininet](http://mininet.org/walkthrough/)

  You will use the Mininet network simulator to run your
  controllers. We will tell you exactly what Mininet commands to use,
  so you don't really need to read this.

[Real World OCaml]: https://realworldocaml.org

[Action]: http://frenetic-lang.github.io/frenetic/docs/OpenFlow0x01.Action.html

[PacketIn]: http://frenetic-lang.github.io/frenetic/docs/OpenFlow0x01.PacketIn.html

[PacketOut]: http://frenetic-lang.github.io/frenetic/docs/OpenFlow0x01.PacketOut.html

[OxPlatform]: http://frenetic-lang.github.io/frenetic/docs/Ox_Controller.OxPlatform.html

[Match]: http://frenetic-lang.github.io/frenetic/docs/OpenFlow0x01.Match.html

[Packet]: http://frenetic-lang.github.io/frenetic/docs/Packet.html
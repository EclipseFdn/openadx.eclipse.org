---
title: "Technologies"
date: 2019-04-16T16:09:45+02:00
layout: "single"
headline: "Technologies"
#subtitle: "Some tagline"
hide_sidebar: true
hide_page_title: true
---

<h2>About Technologies</h2>

Automated Driving (AD) is clustered into three equally important technology areas:

1. In-vehicle technology
2. Cloud technology (backend)
3. Design, development, test and validation tools (tool chain)

OpenADx is currently focused on the AD tool chain. The goal is to accelerate AD development through open collaboration and open source.

OpenADx' vision is to ensure transparency and make the complex AD tool landscape more easily accessible for enterprise users.

<h3>Challenge</h3>

AD is a complex challenge and therefore requires a multifaceted development process incorporating a variety of software tools. The tools the industry currently uses are very good, but they don’t seamlessly work with one another. This is a result of the tools not being designed to work together. This is an industry-wide issue that slows us down in the race to AD development. By pooling resources, we can remove the “friction” between widely used tools. We can create something of use to all of us: open, compatible and accessible.

{{<image src="images/tool_scheme.jpg" class="img-responsive">}}

<h3>Problem and benefits for OEMs and Tier1s</h3>

User insight:

"Developing automated driving functions is extremely complicated and requires the use of many complex software tools which do not work efficiently with one another. What I need is a set of tools which work with each other seamlessly so that my teams can move through the development process more quickly and efficiently."

Benefit:

The automated driving tool chain allows your team to work together more efficiently with a suite of highly integrated tools by enabling seamless transfer of data and code through each step of the automated driving development process.

<h3>Problem and benefits for tool and technology providers</h3>

User insight:

"Currently, tools used to create automated driving applications do not work efficiently with one another. If our tool/technology is compatible with other widely used technologies and tools, it will ease the development process for our customers and make our products even more attractive to them."

Benefit:

The seamless integration of your technology in the automated driving tool chain makes it more attractive to organizations developing automated driving applications by increasing their development efficiency.
<hr>
<div class="row">
  <div class="col-sm-12 col-sm-offset-6 shortcodes-technologies text-center match-height-item">
    <span class="circle-outline circle-outline-center">{{< image width="40" src="/images/technologies/technologies_simulation_and_test.png">}}</span>
    <h3 class="h4 header-underline">Simulation and Test</h3>
    <p class="margin-bottom-0"><a class="btn btn-primary" href="https://projects.eclipse.org/proposals/eclipse-cloe">Learn More</a></p>
  </div>
</div>
<hr>
<h3>Cloe Description</h3>

Cloe is an enhanced middleware solution for closed-loop simulations, with a focus on functional software tests on system level. Cloe is used as a development tool for interactive and scripted workstation simulations, for code debugging, and for automated tests on servers. Cloe covers a central part of the verification and validation strategy, needed by all vendors in the field of Automated Driving.

- Cloe acts as closed-loop simulation master and middleware for all involved components, such as simulator engine, vehicle controller, and component models.
- Cloe provides a tool for orchestrating such closed-loop simulations in a variety of environments, e.g. on localhost or in a Kubernetes cluster.
- Cloe provides a lightweight web-based user-interface for visualizing the simulation state.
- Simulations are described through Cloe stack-files for reproducibility.

These core characteristics of Cloe allow it to (partially) fulfil the closed-loop simulation in the V&V strategy. Vehicle controllers and models can be easily integrated with Cloe and immediately have access to multiple simulator engines. Given M simulator engines and N vehicle controllers, Cloe allows the number of integrations to be reduced to M+N, rather than M×N that would otherwise be necessary. Multiple simulator engines are supported, proprietary as well as open source. This allows a user to mix-and-match engines to their system-under-test based on test requirements. Cloe provides generalized interfaces allowing ground truth and key-performance indicator extraction, as well as fault injection.

Orchestration features provided by Cloe allow faster scaling of simulation tests and evaluation. Through containerization and the simulation description files, development artifacts along with their tests can be easily archived and the results quickly reproduced.
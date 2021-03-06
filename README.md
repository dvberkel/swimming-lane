Swimming Lane
=============

[![Build Status](https://secure.travis-ci.org/dvberkel/swimming-lane.png)](http://travis-ci.org/dvberkel/swimming-lane)

A co-worker showed my some diagrams he created by hand. It is a kind
of flow diagram he uses to get a feel for the overal flow of an
application. With these diagrams one is able to reason about a process
from a higher level.

Although the diagrams are extremely valuable, they are labor
intensive and hard to maintain. Because of this they are not as
ubiquitous as they should be.

In order to bridge that gap this project is started.

Reference
---------

Wikipedia has an article on 
[swim lanes](http://en.wikipedia.org/wiki/Swim_lane "Wikipedia on swim lanes")

Below is an impression of a swim lane.

![Wikipedia example of a swim lane](http://upload.wikimedia.org/wikipedia/commons/a/a5/Approvals.jpg)

Goals
-----

The goals for this project are stated below.

Create

* a [Domain Specific
  Language](http://en.wikipedia.org/wiki/Domain-specific_language
  "Wikipedia on DSL's") (DSL) which describes swimming lanes.
* a rich object model which models swimming lanes.
* various views which display the modeled swimming lanes.

Environment
-----------

### Ruby

We will be using 
[Ruby](http://www.ruby-lang.org/en/ "Homepage of Ruby Programming Language")
and the Ruby Version Manager 
([rvm](http://beginrescueend.com/ "Homepage of rvm")). We are working
in with a gemset to contain the influence of installed gems. Our setup
is detailed below.

    > rvm use 1.9.2
    > rvm gemset create swim-lane

Whenever we work on the project we issue the following command

    > rvm use 1.9.2@swim-lane

### Bundler

We are using 
[bundler](http://gembundler.com/ "Homepage for bundler")
to manage our applications dependencies. It can be installed with the
following command

    > gem install bundler

To retrieve all the dependency run

    > bundle install

### Gem

We try to follow the project structure as detailed by a RubyGem
[manual](http://docs.rubygems.org/read/chapter/24 "Structure of gem")

    swimlane/
    |-- lib/
    |   |-- swimlane.rb  
    |   |-- swimlane/
    |   |   |-- source1.rb
    |   |   |-- source2.rb
    |-- spec/
    |-- README.md
    |-- Rakefile
    |-- swimlane.gemspec

This allows us to eventually create a gem from this project. 

### Rake

We use 
[rake](http://rake.rubyforge.org/ "Homepage for rake; Ruby Make")
to automate tasks.

DSL Example
-----------

Below is an example of how the DSL should look like. As an example the
impression is described. Note that this is a work in progress so not
all feature of the impression will be accuratly displayed.

    Diagram("Order")
      lanes
        Customer
        Sales
        Contracts
        Legal
        Fulfillment
        
      moments
        moment
          screens
            Customer: Customer submits PO
            Sales: Rep logs PO, Enters Order
            Contracts: Contract agents reviews order
          
          transfers 
            Customer -> Sales
            Sales -> Contracts
        
        moment
          screens
            Contracts: Standard Terms?

        moment
          screens
            Contacts: Agent approves order
            Fullfillment: Pick order, log shipment

          transfers
            Contracts -> Fullfillment

        moment
          screens
            Fulfillment: Order is shipped
            
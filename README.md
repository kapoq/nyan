Nyan ![travis-ci](https://secure.travis-ci.org/textgoeshere/nyan.png)
==================

Your favourite aging meme is reheated as an RSpec custom formatter.

For entertainment purposes only.

![NYAN?](https://github.com/kapoq/nyan/raw/master/docs/nyan_animated.gif)

FAQ
---

* Didn't this meme jump the shark, like, ages ago?

Yes.

* It's got no tail

Look closer.

* It's got no feet!

LOOK CLOSER.

* It's really slow

Write faster specs.

* It's still really slow

Send me a pull request where the animation runs in a separate thread.

* The colours are all wrong

Probably need a new graphics card or something.

Requirements
------------

* Your terminal window should have a **black background** and be at least 180 columns x 50 rows.
* RSpec 2 (tested against RSpec 2.6)

Install
-------

Add to your `Gemfile` (usually inside your `:test` group):

    gem "nyan"

Alternatively install directly:

    $ gem install nyan

Usage
-----

    $ rspec spec -f Nyan::Formatter

Or if you want the joy of Nyan without running specs, use the binary:

    $ nyan

Your terminal should be at least

Development
-----------

* Source hosted at [GitHub](https://github.com/kapoq/nyan)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/kapoq/nyan)
* CI at [Travis](http://travis-ci.org/#!/textgoeshere/nyan)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change
you make.

Testing
-------

    $ rake

Author
------

[Dave Nolan](https://github.com/textgoeshere)

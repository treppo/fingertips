Website Template
===

Installation
---

You will Node and Ruby installed to use all required tools.

To begin, install all Npm modules

```sh
npm install #this may take a while
```

In order to run the compilations and deployment workflows you need to install
Gulp and Bower globally

```sh
npm install -g gulp bower
```

Next we need to install all the frontend dependencies

```sh
bower install
```

That's it for the dependencies part.

Usage
---

To compile all sources, run the tests and spin up a webserver, that runs the
site, we use Gulp

```sh
gulp watch
```

This is a long running process, that listens to all changes in the source files
and automatically compiles and reruns the tests. Just refresh your browser to
see the change.

Deployed version
---

The deployed website can be seen at [http://treppo.org/website-template](http://treppo.org/website-template)

© 2014 Christian Treppo, licensed under GPL v3, see License.txt

Fingertips
===

Installation
---

You will need Node and Ruby installed to use all required tools.

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

To compile a distribution snapshot, just run

```sh
gulp dist
```

The resulting, compiled files can be found in the dist folder.

Deployed version
---

The deployed website can be seen at [http://treppo.org/fingertips](http://treppo.org/fingertips)
The source for the deployed version can be found in the gh-pages branch of this
repository.

Organization
---

All source and test files are written in Coffeescript and can be located in the
src directory. They use the module system of the coming ECMA–Script
version 6 (ES6). Because this standard is not final yet and therefore not supported
by browsers, the files are transpiled to ES5, and using the Node/Common–JS/require syntax.
This is handy because for the unit tests to run with Node–Jasmine, this syntax is
used already and no library is needed. To support the Common–JS syntax in the browser,
this template uses the Browserify library, that bundles up all required modules,
that are needed for the website. The result is a single file containing all JS.

For styling, SASS is used as a source format. The stylesheets can be found in
the style folder. Zurb Foundation is used as the stylesheet framework. Same as
with the Javascript, all styles are bundled up into a single file.

© 2014 Christian Treppo, licensed under GPL v3, see License.txt

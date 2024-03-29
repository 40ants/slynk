<a id="x-2840ANTS-SLYNK-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# 40ants-slynk - Utilities to start SLYNK if needed and to track active connections.

<a id="40-ants-slynk-asdf-system-details"></a>

## 40ANTS-SLYNK ASDF System Details

* Description: Utilities to start `SLYNK` if needed and to track active connections.
* Licence: Unlicense
* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>
* Homepage: [https://40ants.com/slynk/][fe84]
* Bug tracker: [https://github.com/40ants/slynk/issues][f5e4]
* Source control: [GIT][1ed5]
* Depends on: [40ants-logging][422a], [global-vars][07be], [log4cl][7f8b], [slynk][b440], [slynk-macrostep][e044], [slynk-named-readtables][433f]

[![](https://github-actions.40ants.com/40ants/slynk/matrix.svg?only=ci.run-tests)][e83d]

![](http://quickdocs.org/badge/40ants-slynk.svg)

<a id="x-2840ANTS-SLYNK-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-slynk)
```
<a id="x-2840ANTS-SLYNK-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

This library provides a little helper, used in `40A`nts webservices.
it does two things:

* Starts Slynk server in there is `SLYNK`_`PORT` env variable.
* Setup logging for connected Slynk connection. It uses [`40ants-logging`][970f] system for configuration.

<a id="x-2840ANTS-SLYNK-DOCS-2FINDEX-3A-3A-40API-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## API

<a id="x-2840ANTS-SLYNK-3A-2ACONNECTIONS-2A-20-28VARIABLE-29-29"></a>

### [variable](9cbd) `40ants-slynk:*connections*` nil

Here we'll store all Slynk connections.

<a id="x-2840ANTS-SLYNK-3ASTART-SLYNK-IF-NEEDED-20FUNCTION-29"></a>

### [function](0e2b) `40ants-slynk:start-slynk-if-needed`

Use this function before starting the backend server.

If `SLYNK`_`PORT` environment variable is set, then this function
will create a Slynk server on that port and localhost interface.
To change an interface, set `SLYNK`_`INTERFACE` environment variable.


[970f]: https://40ants.com/logging/#x-28-23A-28-2814-29-20BASE-CHAR-20-2E-20-2240ants-logging-22-29-20ASDF-2FSYSTEM-3ASYSTEM-29
[fe84]: https://40ants.com/slynk/
[1ed5]: https://github.com/40ants/slynk
[e83d]: https://github.com/40ants/slynk/actions
[9cbd]: https://github.com/40ants/slynk/blob/856ea1acdfba75e0c8523c7426f6aa4a354e199f/src/core.lisp#L23
[0e2b]: https://github.com/40ants/slynk/blob/856ea1acdfba75e0c8523c7426f6aa4a354e199f/src/core.lisp#L63
[f5e4]: https://github.com/40ants/slynk/issues
[422a]: https://quickdocs.org/40ants-logging
[07be]: https://quickdocs.org/global-vars
[7f8b]: https://quickdocs.org/log4cl
[b440]: https://quickdocs.org/slynk
[e044]: https://quickdocs.org/slynk-macrostep
[433f]: https://quickdocs.org/slynk-named-readtables

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]

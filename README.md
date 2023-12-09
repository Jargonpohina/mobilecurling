# Mobile curling

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

This will be the real-time server node of the project. Also works as the primary documentation node
regarding the course.

Check [documentation](/doc) for more detailed information.

- [Design plan](/doc/groupBP_design_plan.pdf)
- [Overview of todo](/doc/todo.md)

## Install

```sh
~$ git clone git@github.com:Jargonpohina/mobilecurling.git
~$ cd mobilecurling
~/mobilecurling$
```

To run the project, you need to install [Dart Frog](https://dartfrog.vgv.dev/docs/overview), which itself requires 
[Dart SDK](https://dart.dev/get-dart). 

After installing Frog, you're good to go.

## Run

To start the dev server (default port 8080):

```sh
~/mobilecurling$ dart_frog dev 
```

Build for production:

```sh
~/mobilecurling$ dart_frog build
```

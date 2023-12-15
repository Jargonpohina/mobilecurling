# Mobilecurling real-time server

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

![logo.png](/doc/logo.png)

This is the real-time server node of the project. 
Also works as the primary documentation node
regarding the course.

Server running here: https://rts-ic4hp354na-ew.a.run.app

Game can be tested here:
- https://mobilecurling.web.app/
- https://curling.walkscape.app/

## Components of the application

- [Client](https://github.com/Jargonpohina/mobilecurling-client)
- [Auth node](https://github.com/Jargonpohina/mobilecurling-auth)
- [Matchmaking node](https://github.com/Jargonpohina/mobilecurling-lobby)

## Documentation

Check [documentation](/doc) for more detailed information.

- [Design plan](/doc/design_plan.pdf)
- [Architecture](/doc/architecture.png)
- [Working time](/doc/working_time.md)

## Install

```sh
~$ git clone git@github.com:Jargonpohina/mobilecurling.git
~$ cd mobilecurling
~/mobilecurling$ dart pub get
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

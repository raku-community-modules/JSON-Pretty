[![Actions Status](https://github.com/raku-community-modules/JSON-Pretty/workflows/test/badge.svg)](https://github.com/raku-community-modules/JSON-Pretty/actions)

NAME
====

JSON::Pretty - A JSON (de)serializer that produces easily readable JSON

SYNOPSIS
========

```raku
use JSON::Pretty;
my $json = to-json([1, 2, "a third item"]);
my $copy-of-original-data-structure = from-json($json);
```

DESCRIPTION
===========

A simple Raku module for serializing and deserializing JSON, with the difference that produced JSON is indented. Its goal is to be readable especially for debugging purposes.

This module exposes the same API as `JSON::Fast`, so all you have to do to switch between both is to change your `use` statement.

All files (unless noted otherwise) can be used, modified and redistributed under the terms of the Artistic License Version 2. Examples (in the documentation, in tests or distributed as separate files) can be considered public domain.

CREDITS
=======

Moritz Lenz Johan Viklund Jonathan Worthington

AUTHOR
======

Tobias Leich (FROGGS)

Source can be located at: https://github.com/raku-community-modules/JSON-Pretty . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2013, 2015, 2016, 2017 Tobias Leich, 2023 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.


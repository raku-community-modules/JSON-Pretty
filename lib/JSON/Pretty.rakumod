use JSON::Fast;

my constant $s = 2;
my proto pretty-json($, :$indent, :$first) {*}
multi pretty-json(Cool:D $d, :$indent = 0, :$first = 0) {
    (' ' x $first) ~ to-json($d)
}
multi pretty-json(Positional:D $d, :$indent = 0, :$first = 0) {
    (' ' x $first)
      ~ "\["
      ~ ($d
          ?? $d.map({
                 "\n"
                   ~ pretty-json($_, :indent($indent + $s), :first($indent + $s))
             }).join(",") ~ "\n" ~ (' ' x $indent)
          !! ' ')
      ~ ']'
}
multi pretty-json(Associative:D $d, :$indent = 0, :$first = 0) {
    (' ' x $first)
      ~ "\{"
      ~ ($d
          ?? $d.map({
                 "\n"
                   ~ pretty-json(.key, :first($indent + $s))
                   ~ ' : '
                   ~ pretty-json(.value, :indent($indent + $s))
             }).join(",") ~ "\n" ~ (' ' x $indent)
          !! ' '
        )
      ~ '}'
}

multi pretty-json(Mu:U $, :$indent = 0, :$first = 0) {
    'null'
}
multi pretty-json(Mu:D $s, :$indent = 0, :$first = 0) {
    die "Can't serialize an object of type " ~ $s.^name;
}

sub EXPORT() {
    Map.new:
      '&to-json'   => &pretty-json,
      '&from-json' => &from-json
}

=begin pod

=head1 NAME

JSON::Pretty - A JSON (de)serializer that produces easily readable JSON
 
=head1 SYNOPSIS

=begin code :lang<raku>

use JSON::Pretty;
my $json = to-json([1, 2, "a third item"]);
my $copy-of-original-data-structure = from-json($json);

=end code

=head1 DESCRIPTION

A simple Raku module for serializing and deserializing JSON, with the
difference that produced JSON is indented. Its goal is to be readable
especially for debugging purposes.

This module exposes the same API as C<JSON::Fast>, so all you have
to do to switch between both is to change your C<use> statement.

All files (unless noted otherwise) can be used, modified and redistributed
under the terms of the Artistic License Version 2. Examples (in the
documentation, in tests or distributed as separate files) can be considered
public domain.

=head1 CREDITS

Moritz Lenz
Johan Viklund
Jonathan Worthington

=head1 AUTHOR

Tobias Leich (FROGGS)

Source can be located at: https://github.com/raku-community-modules/JSON-Pretty .
Comments and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2013, 2015, 2016, 2017 Tobias Leich, 2023 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4

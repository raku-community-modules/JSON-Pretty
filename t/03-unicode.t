use v6;
BEGIN { @*INC.push('lib') };

use JSON::Pretty::Grammar;
use JSON::Pretty::Actions;
use Test;


my @t =
    '{ "a" : "b\u00E5" }' => { 'a' => 'bå' },
    '[ "\u2685" ]' => [ '⚅' ];

plan (+@t);
for @t -> $p {
    my $a = JSON::Pretty::Actions.new();
    my $o = JSON::Pretty::Grammar.parse($p.key, :actions($a));
    is_deeply $o.ast, $p.value, "Correct data structure for «{$p.key}»"
        or say "# Got: {$o.ast.perl}\n# Expected: {$p.value.perl}";
}

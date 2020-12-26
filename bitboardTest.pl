#!/usr/bin/perl
#
use strict; use warnings;

use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));

use KungFuChess::Bitboards;

KungFuChess::Bitboards::setupInitialPosition();

print KungFuChess::Bitboards::pretty();

my $go = 1;
while ($go) {
    my $input = <STDIN>;
    chomp($input);

    if ($input =~ m/^[a-z][0-9][a-z][0-9]$/) {
        my ($color, $move, $dir, $fr_bb, $to_bb)
            = KungFuChess::Bitboards::isLegalMove($input);
        if ($move != 0) { # MOVE_NONE
            print KungFuChess::Bitboards::move($fr_bb, $to_bb);
        } else {
            print "  $input not legal\n";
        }
        print "\n\n";
        print KungFuChess::Bitboards::pretty();
    }
    if ($input eq 'q') {
        $go = 0;
    }
}

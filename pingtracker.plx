#!/usr/bin/perl
use warnings;
use strict;

print "Ping Tracker is running.\nCTRL-D to quit...\n";
open(OUT_FH, ">", "pingoutput.txt") or die "Couldn't open file for output!\n";
print OUT_FH system("ping www.google.com");
while(<STDIN>)
{
        my @vals = split(" ");
        if($vals[0] eq 'PING')
        {
                next;
        }
        $vals[7] =~ s/time\=//g;
        if($vals[0] != '64')
        {
                last;
        }
        print "$vals[7]\n";

}
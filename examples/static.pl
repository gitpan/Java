#!/home/markt/bin/perl -w
use lib '/home/markt/goo/Java';
use strict;
no strict 'subs';
use Java;

my $java = new Java();

my $str = $java->get_field("java.util.Locale","CHINESE")->getDisplayName->get_value;
print "Chinese Locale: $str\n";

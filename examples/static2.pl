#!/home/markt/bin/perl -w
use lib '/home/markt/goo/Java';
use strict;
no strict 'subs';
use Java;

my $java = new Java();

my $val =  $java->static_call("path.obj_here.TT","gimmie")->get_value;
print "GOT $val\n";

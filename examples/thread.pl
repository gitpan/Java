#!/home/markt/usr/local/Linux/bin/perl -w
use strict;
no strict 'subs';
use lib '/home/markt/goo/Java';
use Java;

my $java = new Java(host=>"laggard");


my $thread = $java->create_object("java.lang.Thread");

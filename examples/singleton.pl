#!/home/markt/usr/local/Linux/bin/perl -w
use strict;
no strict 'subs';
use Java;

# Connect to JavaServer
my $java = new Java();

my $self = $java->static_call("MyTest","self");
print "Called a static method on a personal static class not in a package!\n";

#!/usr/local/bin/perl
use strict;
use lib '..';
no strict 'subs';
use Java;

my $java = new Java();

#my $obj = $java->create_object("thot.Test","mark");
#print $obj->get->get_value;
#exit;
my $class = $java->java_lang_Class("forName","Test");
my $constructors = $class->getConstructors();
my $v = $constructors->{name};
my $test_obj = $class->newInstance();
my $val = $test_obj->get->get_value;
print "GOT: $v $val\n";

my $val3 = $java->get_field("TestInterface","two_long")->get_value;
#my $val3 = $int->get_field('ErErrSetup')->get_value;
print "GOT: $val3\n";

# use new 'call' method
my $val2 = $test_obj->call("get_string")->get_value;
print "GOT: $val2\n";

# use new 'smart' Autoloading  - note function name has '_' in it!
my $val4 = $test_obj->get_string->get_value;
print "GOT: $val4\n";


#!/home/markt/bin/perl -w
use strict;
no strict 'subs';
use Java;

my $java = new Java();

my $class = $java->java_lang_Class("forName","Test");
my $constructors = $class->getConstructors();
my $v = $constructors->{name};
my $test_obj = $class->newInstance();
my $val = $test_obj->get->get_value;
print "GOT: $v $val\n";



#!/home/markt/usr/local/Linux/bin/perl -w
use strict;
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



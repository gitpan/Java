#!/home/markt/bin/perl -w
use strict;
no strict 'subs';
use Java;

my $java = new Java(port=>2000);

my $array = $java->create_array("java.lang.String",5);
$array->set_field(3,"Mark Rulez");
print "$array->{name}\n";
my $len = $array->get_length;
my $vv =  $array->get_field(3)->get_value;
print "ARRAY: $vv $len\n";
# $array->set_value(0,$constructor);
# $my vv = $array->get_value(3);

my $class = $java->java_lang_Class("forName","Test");
my $constructor_array = $class->getConstructors();
for (my $i = 0; $i < $constructor_array->get_length; $i++)
{
	my $cons = $constructor_array->get_field($i);
	my $val = $cons->get_value();
	print "Constructor $i: $val\n";
}


# NEW [Ljava.lang.reflect.Constructor;(5 (,34,2,3,2))
# GET [Ljava.lang.reflect.Constructor;^3#2
# SET [Ljava.lang.reflect.Constructor;^3#(<object>)
# GET [Ljava.lang.reflect.Constructor;^3#len	== get length
sleep(9000);

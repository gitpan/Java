#!/home/markt/usr/local/Linux/bin/perl -w
use strict;
no strict 'subs';
use Java;

# Localization example...

##
# See http://www.javasoft.com/products/jdk/1.1/docs/guide/intl/encoding.doc.html
#	for list of valid Java string encodings...
###
my $java = new Java(host=>"laggard");

my $label = $java->create_object("java.awt.Label","this:is:a:str:string");
my $l_val = $label->getText->get_value;
my $utf8_button = $java->create_object("java.awt.Button","Unicode String:string_UTF8");

my $label_val = $utf8_button->getLabel->get_value;

print "Button label: $l_val $label_val\n";

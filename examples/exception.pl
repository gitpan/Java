#!/home/markt/usr/local/Linux/bin/perl -w
use strict;
no strict 'subs';
use Java;

###
# Practice catching Exceptions
###

my $java = new Java();

print "Gimmie an Integer to try to convert -> ";
my $int = <STDIN>;
chomp $int;

my $I;
eval 
{
	$I = $java->java_lang_Integer("parseInt","$int:string");
};
if ($@)
{
	$@ =~ s/ERROR: //;
	$@ =~ s/at $0.*$//;
	
	print "$@\n";
}	

print $I->get_value, "\n" if $I;

print "This will attempt to install JavaServer.jar somewhere & then tell you\n";
print "how to run it... hopefully!\n";

my $jhome = $ENV{JAVA_HOME};
my $OS = $^O;
my $line;
if ($jhome)
{
	my $lib = "$jhome/lib";
	print "Cool - your JAVA_HOME environment variable is set to $jhome.\n";
	print "If you let me copy it into $lib it'll be easier to run.\n";
	print "Do I have permission to copy 'JavaServer.jar' to $lib? (Y/n)? ";
	my $in = <STDIN>;
	if ($in !~ /^n/i)
	{
		if ($OS =~ /windows/i)
		{
			system("copy JavaServer.jar $lib");
		}
		else
		{
			system("/bin/cp JavaServer.jar $lib");
		}
		$jar = $lib;
	}
	else
	{
		$jar = ".";
	}

		$line = "java -classpath $lib/classes.zip:$lib/swingall.jar:$lib/swing.jar:$jar/JavaServer.jar JavaServer";

	if ($OS =~ /windows/i)
	{
		open(O,">run_js.bat");
		print O "$line";
		close(O);
		$f = ".bat";
	}
	else
	{
		open(O,">run_js.sh");
		print O "#!/bin/sh\n";
		print O "$line\n";
		close(O);
		$f = ".sh";
		chmod 0777,"run_js.sh";
	}

	print "To run JavaServer type this line:\n";
	print "run_js$f\n";
}
else
{
	my $cp = $ENV{CLASSPATH};
	if ($cp)
	{
		print "Add the directory where 'JavaServer.jar' will sit to your\n";
		print "CLASSPATH environment variable and then type:\n";
		print "java JavaServer\n";
		print "to run JavaServer.\n";
	}
	else
	{
		print "Yer gonna hafta hunt down your 'classes.zip' file as\n";
		print "well as 'swing.jar' and 'swingall.jar' if you want to\n";
		print "use Swing, and manually list all of those files including\n";
		print "the directories they're in on the 'java' command line like -\n";
		print "As well as putting JavaServer.jar someplace and then execute:\n";
		print "/path/to/java -classpath /path/to/classes.zip:/path/to/swing.jar:/path/to/swingall/jar:/path/to/JavaServer.jar JavaServer\n";
		print "to run JavaServer.\n";
	}
}


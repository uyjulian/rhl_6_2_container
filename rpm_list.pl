
use strict;
use warnings;

my $installlistfile = $ARGV[0];
my $httplistfile = $ARGV[1];
my $exclusionlistfile = $ARGV[2];
open my $fh1, "<", $installlistfile or die;
while (<$fh1>)
{
	my ($x1) = $_ =~ m/Installing (.*?)\.$/;
	if (!defined($x1))
	{
		next;
	}
	my $curstr = "";
	open my $fh2, "<", $httplistfile or die;
	while (<$fh2>)
	{
		if (my ($x2) = $_ =~ m/"(\Q$x1\E-.*?\.rpm)"/)
		{
			if (length($curstr) == 0 || length($curstr) > length($x2))
			{
				$curstr = $x2;
			}
		}
	}
	if (length($curstr) != 0)
	{
		open my $fh3, "<", $exclusionlistfile or die;
		my $excluded = 0;
		while (my $xcurstr = <$fh3>)
		{
			chomp $xcurstr;
			if ($xcurstr eq $x1)
			{
				$excluded = 1;
				last;
			}
		}
		if ($excluded == 0)
		{
			print $curstr;
			print "\n";
		}
	}
}

#!/usr/bin/perl -w

use strict;
use Test::More tests => 1;

use Email::ARF::Hotmail;

# FH because we're being backcompat to pre-lexical
sub readfile {
	my $fn = shift;
	open FH, "$fn" or die $!;
	local $/;
	my $text = <FH>;
	close FH;
	return $text;
}

my $message = readfile('t/corpus/hotmail.msg');

my $report = Email::ARF::Hotmail->create_report($message);

my $des = $report->description;
chomp $des;

is($des, "An email abuse report from hotmail", "description is right");

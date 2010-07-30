#!/usr/bin/perl -w

use strict;
use warnings;
use Data::Dumper;
use Email::ARF::Hotmail;

my $message;

{ local $/; $message = <STDIN>; }

my $report = Email::ARF::Hotmail->create_report($message);

print Dumper($report);

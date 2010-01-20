package Email::ARF::Hotmail;

use 5.008009;
use strict;
use warnings;
use Email::ARF::Report;
use Email::MIME;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Email::ARF::Hotmail ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';
$VERSION = eval $VERSION;

sub create_report {
	my $class = shift;
	my $message = shift;

	my $parsed = Email::MIME->new($message);

	if ($parsed->header("X-Original-Sender") eq 'staff@hotmail.com' or $parsed->header("Sender") eq 'staff@hotmail.com') {
		my $description = "An email abuse report from hotmail";
		my %fields;
		$fields{"Feedback-Type"} = "abuse";
		$fields{"User-Agent"} = "Email::ARF::Hotmail-conversion";
		$fields{"Version"} = "0.1";
		my ($source_ip) = ($parsed->header("Subject") =~ /^complaint about message from (\w+$)/);
		$fields{"Source-IP"} = $source_ip;
		my $original_email = ($parsed->parts)[0];

		return Email::ARF::Report->create(
				original_email => $original_email,
				description => $description,
				fields => \%fields
			);

	} else {
		die "Not a hotmail abuse report";
	}
}

1;
__END__
=head1 NAME

Email::ARF::Hotmail - Perl extension for Hotmail Abuse reports

=head1 SYNOPSIS

  use Email::ARF::Hotmail;

  my $report = Email::ARF::Hotmail->create($message);

=head1 DESCRIPTION

This is a perl module to process Hotmail abuse reports (which are not in ARF) and generate
Email::ARF::Report objects.

=head1 METHODS

=head2 create_report

  my $report = Email::ARF::Hotmail->create($message);
  
Creates an Email::ARF::Report object or dies with an error if the message
cannot be parsed as a hotmail abuse report.

=head1 SEE ALSO

* Email::ARF::Report

* http://postmaster.live.com/Services.aspx

=head1 AUTHOR

Michael Stevens, E<lt>mstevens@etla.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Michael Stevens

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.9 or,
at your option, any later version of Perl 5 you may have available.

=cut

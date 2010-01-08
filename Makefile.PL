use 5.008009;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Email::ARF::Hotmail',
    VERSION_FROM      => 'lib/Email/ARF/Hotmail.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Email/ARF/Hotmail.pm', # retrieve abstract from module
       AUTHOR         => 'A. U. Thor <mstevens@server2.dianomi.co.uk>') : ()),
);

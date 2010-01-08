use 5.008009;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Email::ARF::Hotmail',
    VERSION_FROM      => 'lib/Email/ARF/Hotmail.pm', # finds $VERSION
    PREREQ_PM         => { 'Email::ARF' => 0.005,
							'Email::MIME' => 1.903,
							'Test::More' => 0.94,
						}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Email/ARF/Hotmail.pm', # retrieve abstract from module
       AUTHOR         => 'Michael Stevens <mstevens@etla.org') : ()),
);

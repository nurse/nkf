use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'NKF',
    'VERSION_FROM' => 'NKF.pm', # finds $VERSION
    'LIBS'	=> [''],   # e.g., '-lm' 
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '',     # e.g., '-I/usr/include/other' 
    'INC'	=> '',     # e.g., '-I/usr/include/other' 
);

sub MM::postamble {
	   '
NKF.c: ../nkf.c ../utf8tbl.c
';
}


#!/usr/bin/perl
#
# nkf test program for nkf 1.7
#    Shinji KONO <kono@ie.u-ryukyu.ac.jp>
# Sun Aug 18 12:25:40 JST 1996
# Sun Nov  8 00:16:06 JST 1998
# Sun Sep  8 14:03:28 JST 2002
#
# This is useful when you add new patch on nkf.
# Since this test is too strict, faileurs may not mean
# wrong conversion. 
#
# nkf 2.0 utf8
# nkf 1.5 differs on MIME decoding
# nkf 1.4 passes Basic Conversion tests
# nkf PDS version passes Basic Conversion tests  using "nkf -iB -oB "
#

$nkf = "./nkf";
# $nkf = "doscmd nkf.exe";

# If you want to see the testing process, set next flag.

$detail_all = 0;
$diff = 1;

&library_test0();
sub test  {
    use NKF;
    &library_test(@_);
}

sub library_test {
    local ($nkf,$in,@ans) = @_;
    local ($result);


    # $nkf =~ s/^[^_]* //;
    local (@nkf) = split(/ /,$nkf);
    shift(@nkf);
    print "\nINPUT:\n",$in  if ($detail || $detail_all);
    print "\nEXPECT:\n", $ans if ($detail || $detail_all);
    $result = NKF::nkf(@nkf,$in);
    print "\nGOT:\n",$result if ($detail || $detail_all);

    if( $nkf =~ /-\S*m/) {
        $result =~ s/ //g;
    }
    $i = 0;
    foreach $ans (@ans) {
        if( $nkf =~ /-\S*m/) {
            $ans =~ s/ //g;
        }
        last if ($result eq $ans) ;
        $i++;
    }
    $ans = @ans[$i];

    print (($result eq $ans)?"Ok\n":"Fail\n");
    if ($diff) {
	if ($result ne $ans) {
            open(R,"|od -c >tmp.result.bad"); print R $result; close(R);
            open(R,"|od -c >tmp.expect.bad"); print R $ans; close(R);
            system "diff -c tmp.result.bad tmp.expect.bad";
        }
    }
    return $result;
}

sub library_test0 {
BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
    use NKF;
    $loaded = 1;
    print "ok 1\n";

    ######################### End of black magic.

    # Insert your test code below (better if it prints "ok 13"
    # (correspondingly "not ok 13") depending on the success of chunk 13
    # of the test code):

    if ( nkf("-m","-e","1") ) {
	print "ok 2\n";
    } else {
	print "no 2\n";
    }

    $output = nkf("\033\$@#1#3#2%B");
    if ($output) {
    # print $output,"\n";
	print "ok 3\n";
    } else {
	print "no 3\n";
    }

    $output = nkf("-Zj","\033\$@#1#3#2%B");
    if ($output) {
    # print $output,"\n";
	print "ok 4\n";
    } else {
	print "no 4\n";
    }

    # conversion makes strings longer
    $output = "\244\306 " x 1024;
	$old =  length($output);
    $output = nkf("-j",$output);
    if ($output) {
    # print $output,"\n";
	print "ok 5 $old ",length($output),"\n";
    } else {
	print "no 5\n";
    }


}

do "../nkf_test.pl";

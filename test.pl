#!/usr/bin/perl
#
# nkf test program for nkf 2.0
#    Shinji KONO <kono@ie.u-ryukyu.ac.jp>
# Sun Aug 18 12:25:40 JST 1996
# Sun Nov  8 00:16:06 JST 1998
# Sun Sep  8 14:04:02 JST 2002
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

if ($ARGV[0]) {
    $nkf = $ARGV[0];
} else {
    $nkf = 'MSWin32' eq $^O ? ".\\nkf" : "./nkf";
}
# $nkf = "doscmd nkf.exe";

# If you want to see the testing process, set next flag.

$detail_all = 0;
$error_count=1;
$diff=1;

# &library_test0();
sub test {
    &command_test(@_);
}

sub command_test {
    local ($nkf,$in,@ans) = @_;
    local ($result);

    $result = '';
    open(OUT,"> nkf.in");
    binmode OUT;
    print OUT $in;
    close(OUT);
    system("$nkf <nkf.in >nkf.out");   # easy
    open(IN,"< nkf.out");
    binmode IN;
    while(<IN>) {
	$result .= $_;
    }

    if( $nkf =~ /-\S*m/) {
	$result =~ s/ //g;
    }
    $i = 0;
    foreach $ans (@ans) {
	if( $nkf =~ /-\S*m/) {
	    $ans =~ s/ //g;
	}
        if ($result eq $ans) {
	    print "Ok\n";
	    return $result;
	}
        $i++;
    }
    $ans = $ans[0];
    print "Fail\n";
    system "mv nkf.in nkf.in.$error_count.bad";
    system "mv nkf.out nkf.out.$error_count.bad";
    open(OUT,"> nkf.expect.$error_count.bad");
    binmode OUT;
    print OUT $ans;
    close(OUT);
    $error_count++;
    if ($diff) {
	open(R,"|od -c >tmp.result.bad"); binmode R; print R $result; close(R);
	open(R,"|od -c >tmp.expect.bad"); binmode R; print R $ans; close(R);
	system "diff -c tmp.result.bad tmp.expect.bad";
    }
    return $result;
}

do "nkf_test.pl";

unlink "nkf.in";
unlink "nkf.out";

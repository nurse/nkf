#!/usr/bin/perl
while ( <test_data/*.cmd> ) {
    $file = $_; 
    $test = $file; $test =~ s/\.cmd$//;
    $out = $test.".out"; $out = `cat $out`;
    $in = $test.".in"; $in = `cat $in`;
    $opt = `cat $file`; chop($opt);

    $inpack = pack('u',$in); chop($inpack);
    $outpack = pack('u',$out); chop($outpack);

print << "EOFEOF";
# $test

\$example{'$test'} = unpack('u',<<'eofeof');
$inpack
eofeof

\$example{'$test.ans'} = unpack('u',<<'eofeof');
$outpack
eofeof

print "$test    ";
    \&test("\$nkf $opt",\$example{'$test'},\$example{'$test.ans'});
EOFEOF

}

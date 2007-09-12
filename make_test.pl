#!/usr/bin/perl
while ( <test_data/*.cmd> ) {
    $file = $_; 
    $test = $file; $test =~ s/\.cmd$//;
    $out = $test.".out"; $out = `cat $out`;
    $in = $test.".in"; $in = `cat $in`;
    $opt = `cat $file`; chomp($opt);

    $inpack = pack('u',$in); chomp($inpack);
    $outpack = pack('u',$out); chomp($outpack);

print << "EOFEOF";
# $test

\$example{'$test'} = unpack('u',<<'eofeof');
$inpack
eofeof

\$example{'$test.ans'} = unpack('u',<<'eofeof');
$outpack
eofeof

printf "%-40s",  "$test    ";
    \&test("\$nkf $opt",\$example{'$test'},\$example{'$test.ans'});
EOFEOF

}

#!/usr/local/bin/perl
#
# nkf test program for nkf-2
#
# $Id: nkf_test.pl,v 1.17 2006/05/01 19:51:31 naruse Exp $
#
#    Shinji KONO <kono@ie.u-ryukyu.ac.jp>
# Sun Aug 18 12:25:40 JST 1996
# Sun Nov  8 00:16:06 JST 1998
#
# This is useful when you add new patch on nkf.
# Since this test is too strict, faileurs may not mean
# wrong conversion. 
#
# nkf 1.5 differs on MIME decoding
# nkf 1.4 passes Basic Conversion tests
# nkf PDS version passes Basic Conversion tests  using "nkf -iB -oB "
#

# Basic Conversion
print "\nBasic Conversion test\n\n";

# I gave up simple literal quote because there are big difference
# on perl4 and perl5 on literal quote. Of course we cannot use
# jperl.

$example{'jis'} = unpack('u',<<'eofeof');
M1FER<W0@4W1A9V4@&R1"(3DQ(3%^2R%+?D]3&RA"(%-E8V]N9"!3=&%G92`;
M)$)0)TU:&RA"($AI<F%G86YA(!LD0B0B)"0D)B0H)"HD;R1R)',;*$(*2V%T
M86MA;F$@&R1")2(E)"4F)2@E*B5O)7(E<QLH0B!+:6=O=2`;)$(A)B%G(S`C
/029!)E@G(B=!*$`;*$(*
eofeof

$example{'sjis'} = unpack('u',<<'eofeof');
M1FER<W0@4W1A9V4@@5B)0(F>ED"6GIAR(%-E8V]N9"!3=&%G92"8I9=Y($AI
M<F%G86YA((*@@J*"I(*F@JB"[8+P@O$*2V%T86MA;F$@@T&#0X-%@T>#28./
>@Y*#DR!+:6=O=2"!18&'@D^"8(._@]:$081@A+X*
eofeof

$example{'euc'} = unpack('u',<<'eofeof');
M1FER<W0@4W1A9V4@H;FQH;'^RZ'+_L_3(%-E8V]N9"!3=&%G92#0I\W:($AI
M<F%G86YA(*2BI*2DIJ2HI*JD[Z3RI/,*2V%T86MA;F$@I:*EI*6FI:BEJJ7O
>I?*E\R!+:6=O=2"AIJ'GH["CP:;!IMBGHJ?!J,`*
eofeof

$example{'utf8'} = unpack('u',<<'eofeof');
M[[N_1FER<W0@4W1A9V4@XX"%Z9FBY;^<YK.5YKJ`Z(65(%-E8V]N9"!3=&%G
M92#DN+SI@:4@2&ER86=A;F$@XX&"XX&$XX&&XX&(XX&*XX*/XX*2XX*3"DMA
M=&%K86YA(.."HN."I.."IN."J.."JN.#K^.#LN.#LR!+:6=O=2#C@[OBB)[O
1O)#OO*'.L<^)T)'0K^*5@@H`
eofeof

$example{'utf8N'} = unpack('u',<<'eofeof');
M1FER<W0@4W1A9V4@XX"%Z9FBY;^<YK.5YKJ`Z(65(%-E8V]N9"!3=&%G92#D
MN+SI@:4@2&ER86=A;F$@XX&"XX&$XX&&XX&(XX&*XX*/XX*2XX*3"DMA=&%K
M86YA(.."HN."I.."IN."J.."JN.#K^.#LN.#LR!+:6=O=2#C@[OBB)[OO)#O
.O*'.L<^)T)'0K^*5@@H`
eofeof

$example{'u16L'} = unpack('u',<<'eofeof');
M__Y&`&D`<@!S`'0`(`!3`'0`80!G`&4`(``%,&*6W%_5;(!N58$@`%,`90!C
M`&\`;@!D`"``4P!T`&$`9P!E`"``/$YED"``2`!I`'(`80!G`&$`;@!A`"``
M0C!$,$8P2#!*,(\PDC"3,`H`2P!A`'0`80!K`&$`;@!A`"``HC"D,*8PJ#"J
I,.\P\C#S,"``2P!I`&<`;P!U`"``^S`>(A#_(?^Q`\D#$00O!$(E"@``
eofeof

$example{'u16L0'} = unpack('u',<<'eofeof');
M1@!I`'(`<P!T`"``4P!T`&$`9P!E`"``!3!BEMQ?U6R`;E6!(`!3`&4`8P!O
M`&X`9``@`%,`=`!A`&<`90`@`#Q.99`@`$@`:0!R`&$`9P!A`&X`80`@`$(P
M1#!&,$@P2C"/,)(PDS`*`$L`80!T`&$`:P!A`&X`80`@`*(PI#"F,*@PJC#O
G,/(P\S`@`$L`:0!G`&\`=0`@`/LP'B(0_R'_L0/)`Q$$+P1")0H`
eofeof

$example{'u16B'} = unpack('u',<<'eofeof');
M_O\`1@!I`'(`<P!T`"``4P!T`&$`9P!E`"`P!99B7]QLU6Z`@54`(`!3`&4`
M8P!O`&X`9``@`%,`=`!A`&<`90`@3CR090`@`$@`:0!R`&$`9P!A`&X`80`@
M,$(P1#!&,$@P2C"/,)(PDP`*`$L`80!T`&$`:P!A`&X`80`@,*(PI#"F,*@P
IJC#O,/(P\P`@`$L`:0!G`&\`=0`@,/LB'O\0_R$#L0/)!!$$+R5"``H`
eofeof

$example{'u16B0'} = unpack('u',<<'eofeof');
M`$8`:0!R`',`=``@`%,`=`!A`&<`90`@,`668E_<;-5N@(%5`"``4P!E`&,`
M;P!N`&0`(`!3`'0`80!G`&4`($X\D&4`(`!(`&D`<@!A`&<`80!N`&$`(#!"
M,$0P1C!(,$HPCS"2,),`"@!+`&$`=`!A`&L`80!N`&$`(#"B,*0PIC"H,*HP
G[S#R,/,`(`!+`&D`9P!O`'4`(##[(A[_$/\A`[$#R001!"\E0@`*
eofeof

$example{'jis1'} = unpack('u',<<'eofeof');
M&R1";3%Q<$$L&RA""ALD0F4Z3F\;*$(*&R1"<FT;*$()&R1"/F5.3D]+&RA"
#"0D*
eofeof

$example{'sjis1'} = unpack('u',<<'eofeof');
8YU#ID)%+"N-9E^T*Z>L)C^.7S)AJ"0D*
eofeof

$example{'euc1'} = unpack('u',<<'eofeof');
8[;'Q\,&L"N6ZSN\*\NT)ON7.SL_+"0D*
eofeof

$example{'utf1'} = unpack('u',<<'eofeof');
AZ+J%Z:N/Z8JM"N>VNNFZEPKIM(D)Y+B*Z:"8Y+J8"0D*
eofeof

$example{'jis2'} = unpack('u',<<'eofeof');
+&R1".EA&(QLH0@H`
eofeof

$example{'sjis2'} = unpack('u',<<'eofeof');
%C=:3H0H`
eofeof

$example{'euc2'} = unpack('u',<<'eofeof');
%NMC&HPH`
eofeof

$example{'utf2'} = unpack('u',<<'eofeof');
'YI:.Z)>D"@``
eofeof

# From JIS

print "JIS  to JIS ...";&test("$nkf -j",$example{'jis'},$example{'jis'});
print "JIS  to SJIS...";&test("$nkf -s",$example{'jis'},$example{'sjis'});
print "JIS  to EUC ...";&test("$nkf -e",$example{'jis'},$example{'euc'});
print "JIS  to UTF8...";&test("$nkf -w",$example{'jis'},$example{'utf8N'});
print "JIS  to U16L...";&test("$nkf -w16L",$example{'jis'},$example{'u16L'});
print "JIS  to U16B...";&test("$nkf -w16B",$example{'jis'},$example{'u16B'});
print "JIS  to JIS ...";&test("$nkf --ic=iso-2022-jp --oc=iso-2022-jp"	,$example{'jis'},$example{'jis'});
print "JIS  to SJIS...";&test("$nkf --ic=iso-2022-jp --oc=shift_jis"	,$example{'jis'},$example{'sjis'});
print "JIS  to EUC ...";&test("$nkf --ic=iso-2022-jp --oc=euc-jp"	,$example{'jis'},$example{'euc'});
print "JIS  to UTF8...";&test("$nkf --ic=iso-2022-jp --oc=utf-8n"	,$example{'jis'},$example{'utf8N'});
print "JIS  to U16L...";&test("$nkf --ic=iso-2022-jp --oc=utf-16le-bom",$example{'jis'},$example{'u16L'});
print "JIS  to U16B...";&test("$nkf --ic=iso-2022-jp --oc=utf-16be-bom",$example{'jis'},$example{'u16B'});

# From SJIS

print "SJIS to JIS ...";&test("$nkf -j",$example{'sjis'},$example{'jis'});
print "SJIS to SJIS...";&test("$nkf -s",$example{'sjis'},$example{'sjis'});
print "SJIS to EUC ...";&test("$nkf -e",$example{'sjis'},$example{'euc'});
print "SJIS to UTF8...";&test("$nkf -w",$example{'sjis'},$example{'utf8N'});
print "SJIS to U16L...";&test("$nkf -w16L",$example{'sjis'},$example{'u16L'});
print "SJIS to U16B...";&test("$nkf -w16B",$example{'sjis'},$example{'u16B'});
print "SJIS to JIS ...";&test("$nkf --ic=shift_jis --oc=iso-2022-jp"	,$example{'sjis'},$example{'jis'});
print "SJIS to SJIS...";&test("$nkf --ic=shift_jis --oc=shift_jis"	,$example{'sjis'},$example{'sjis'});
print "SJIS to EUC ...";&test("$nkf --ic=shift_jis --oc=euc-jp"	,$example{'sjis'},$example{'euc'});
print "SJIS to UTF8...";&test("$nkf --ic=shift_jis --oc=utf-8n"	,$example{'sjis'},$example{'utf8N'});
print "SJIS to U16L...";&test("$nkf --ic=shift_jis --oc=utf-16le-bom"	,$example{'sjis'},$example{'u16L'});
print "SJIS to U16B...";&test("$nkf --ic=shift_jis --oc=utf-16be-bom"	,$example{'sjis'},$example{'u16B'});

# From EUC

print "EUC  to JIS ...";&test("$nkf -j",$example{'euc'},$example{'jis'});
print "EUC  to SJIS...";&test("$nkf -s",$example{'euc'},$example{'sjis'});
print "EUC  to EUC ...";&test("$nkf -e",$example{'euc'},$example{'euc'});
print "EUC  to UTF8...";&test("$nkf -w",$example{'euc'},$example{'utf8N'});
print "EUC  to U16L...";&test("$nkf -w16L",$example{'euc'},$example{'u16L'});
print "EUC  to U16B...";&test("$nkf -w16B",$example{'euc'},$example{'u16B'});
print "EUC  to JIS ...";&test("$nkf --ic=euc-jp --oc=iso-2022-jp"	,$example{'euc'},$example{'jis'});
print "EUC  to SJIS...";&test("$nkf --ic=euc-jp --oc=shift_jis"	,$example{'euc'},$example{'sjis'});
print "EUC  to EUC ...";&test("$nkf --ic=euc-jp --oc=euc-jp"	,$example{'euc'},$example{'euc'});
print "EUC  to UTF8...";&test("$nkf --ic=euc-jp --oc=utf-8n"	,$example{'euc'},$example{'utf8N'});
print "EUC  to U16L...";&test("$nkf --ic=euc-jp --oc=utf-16le-bom"	,$example{'euc'},$example{'u16L'});
print "EUC  to U16B...";&test("$nkf --ic=euc-jp --oc=utf-16be-bom"	,$example{'euc'},$example{'u16B'});

# From UTF8

print "UTF8 to JIS ...";&test("$nkf -j",	$example{'utf8N'},$example{'jis'});
print "UTF8 to SJIS...";&test("$nkf -s",	$example{'utf8N'},$example{'sjis'});
print "UTF8 to EUC ...";&test("$nkf -e",	$example{'utf8N'},$example{'euc'});
print "UTF8 to UTF8N..";&test("$nkf -w",	$example{'utf8N'},$example{'utf8N'});
print "UTF8 to UTF8...";&test("$nkf -w8",	$example{'utf8N'},$example{'utf8'});
print "UTF8 to UTF8N..";&test("$nkf -w80",	$example{'utf8N'},$example{'utf8N'});
print "UTF8 to U16L...";&test("$nkf -w16L",	$example{'utf8N'},$example{'u16L'});
print "UTF8 to U16L0..";&test("$nkf -w16L0",	$example{'utf8N'},$example{'u16L0'});
print "UTF8 to U16B...";&test("$nkf -w16B",	$example{'utf8N'},$example{'u16B'});
print "UTF8 to U16B0..";&test("$nkf -w16B0",	$example{'utf8N'},$example{'u16B0'});
print "UTF8 to JIS ...";&test("$nkf --ic=utf-8 --oc=iso-2022-jp",	$example{'utf8N'},$example{'jis'});
print "UTF8 to SJIS...";&test("$nkf --ic=utf-8 --oc=shift_jis",	$example{'utf8N'},$example{'sjis'});
print "UTF8 to EUC ...";&test("$nkf --ic=utf-8 --oc=euc-jp",		$example{'utf8N'},$example{'euc'});
print "UTF8 to UTF8N..";&test("$nkf --ic=utf-8 --oc=utf-8",		$example{'utf8N'},$example{'utf8N'});
print "UTF8 to UTF8BOM";&test("$nkf --ic=utf-8 --oc=utf-8-bom",	$example{'utf8N'},$example{'utf8'});
print "UTF8 to UTF8N..";&test("$nkf --ic=utf-8 --oc=utf-8n",		$example{'utf8N'},$example{'utf8N'});
print "UTF8 to U16L...";&test("$nkf --ic=utf-8 --oc=utf-16le-bom",	$example{'utf8N'},$example{'u16L'});
print "UTF8 to U16L0..";&test("$nkf --ic=utf-8 --oc=utf-16le",		$example{'utf8N'},$example{'u16L0'});
print "UTF8 to U16B...";&test("$nkf --ic=utf-8 --oc=utf-16be-bom",	$example{'utf8N'},$example{'u16B'});
print "UTF8 to U16B0..";&test("$nkf --ic=utf-8 --oc=utf-16be",		$example{'utf8N'},$example{'u16B0'});



# From JIS

print "JIS  to JIS ...";&test("$nkf -j",$example{'jis1'},$example{'jis1'});
print "JIS  to SJIS...";&test("$nkf -s",$example{'jis1'},$example{'sjis1'});
print "JIS  to EUC ...";&test("$nkf -e",$example{'jis1'},$example{'euc1'});
print "JIS  to UTF8...";&test("$nkf -w",$example{'jis1'},$example{'utf1'});

# From SJIS

print "SJIS to JIS ...";&test("$nkf -j",$example{'sjis1'},$example{'jis1'});
print "SJIS to SJIS...";&test("$nkf -s",$example{'sjis1'},$example{'sjis1'});
print "SJIS to EUC ...";&test("$nkf -e",$example{'sjis1'},$example{'euc1'});
print "SJIS to UTF8...";&test("$nkf -w",$example{'sjis1'},$example{'utf1'});

# From EUC

print "EUC  to JIS ...";&test("$nkf -j",$example{'euc1'},$example{'jis1'});
print "EUC  to SJIS...";&test("$nkf -s",$example{'euc1'},$example{'sjis1'});
print "EUC  to EUC ...";&test("$nkf -e",$example{'euc1'},$example{'euc1'});
print "EUC  to UTF8...";&test("$nkf -w",$example{'euc1'},$example{'utf1'});

# From UTF8

print "UTF8 to JIS ...";&test("$nkf -j",$example{'utf1'},$example{'jis1'});
print "UTF8 to SJIS...";&test("$nkf -s",$example{'utf1'},$example{'sjis1'});
print "UTF8 to EUC ...";&test("$nkf -e",$example{'utf1'},$example{'euc1'});
print "UTF8 to UTF8...";&test("$nkf -w",$example{'utf1'},$example{'utf1'});

print "\nOther Features\n\n";

# Ambigous Case

$example{'amb'} = unpack('u',<<'eofeof');
MI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&E
MPK"QI<*PL:7"L+&EPK"QI<(*I<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*P
ML:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<(*I<*PL:7"L+&E
MPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"
ML+&EPK"QI<(*I<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"Q
MI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<(*I<*PL:7"L+&EPK"QI<*PL:7"
ML+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<*PL:7"L+&EPK"QI<(*
eofeof

$example{'amb.euc'} = unpack('u',<<'eofeof');
M&R1")4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25"
M,#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*&R1")4(P,25",#$E0C`Q)4(P,25"
M,#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;
M*$(*&R1")4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P
M,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*&R1")4(P,25",#$E0C`Q)4(P
M,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q
M)4(;*$(*&R1")4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q
>)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*
eofeof

$example{'amb.sjis'} = unpack('u',<<'eofeof');
M&RA))4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25"
M,#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*&RA))4(P,25",#$E0C`Q)4(P,25"
M,#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;
M*$(*&RA))4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P
M,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*&RA))4(P,25",#$E0C`Q)4(P
M,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q
M)4(;*$(*&RA))4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q
>)4(P,25",#$E0C`Q)4(P,25",#$E0C`Q)4(;*$(*
eofeof

printf "%-40s", "Ambiguous Case.";
    &test("$nkf -j",$example{'amb'},$example{'amb.euc'});

# Input assumption

printf "%-40s", "SJIS  Input assumption";
    &test("$nkf -jSx",$example{'amb'},$example{'amb.sjis'});

# Broken JIS

printf "%-40s", "Broken JIS";
    $input = $example{'jis'};
    $input =~ s/\033//g;
    &test("$nkf -Be",$input,$example{'euc'});
printf "%-40s", "Broken JIS is safe on Normal JIS?";
    $input = $example{'jis'};
    &test("$nkf -Be",$input,$example{'euc'});

# test_data/cp932

$example{'test_data/cp932'} = unpack('u',<<'eofeof');
%^D`@_$L`
eofeof

$example{'test_data/cp932.ans'} = unpack('u',<<'eofeof');
%_/$@_.X`
eofeof

printf "%-40s", "test_data/cp932";
    &test("$nkf -eS",$example{'test_data/cp932'},$example{'test_data/cp932.ans'});
printf "%-40s", "test_data/cp51932";
    &test("$nkf --ic=cp932 --oc=cp51932",$example{'test_data/cp932'},$example{'test_data/cp932.ans'});

# test_data/cp932inv
printf "%-40s", "test_data/cp932inv";
    &test("$nkf -sE --cp932inv",$example{'test_data/cp932.ans'},$example{'test_data/cp932'});

# test_data/no-cp932inv

$example{'test_data/no-cp932inv.ans'} = unpack('u',<<'eofeof');
%[N\@[NP`
eofeof

printf "%-40s", "test_data/no-cp932inv";
    &test("$nkf -sE --no-cp932",$example{'test_data/cp932.ans'},$example{'test_data/no-cp932inv.ans'});
# ISO-2022-JP-MS
$example{'iso2022jpms_sjis'} = "\xA1\xDF\xF0\xA0\xF4\xFC\xF5\x40\xF9\xFC";
$example{'iso2022jpms_euc'} = "\x8e\xa1\x8e\xdf\xf6\xa2\xfe\xfe\x8f\xf5\xa1\x8f\xfe\xfe";
$example{'iso2022jpms_jis'} = "\x1b\x28\x49\x21\x5f\x1b\x24\x28\x3f\x22\x22\x2a\x7e\x2b\x21\x34\x7e\x1b\x28\x42";

# printf "%-40s", "ISO-2022-JP-MS to CP932";
#     &test("$nkf --ic=ISO-2022-JP-MS --oc=CP932",$example{'iso2022jpms_jis'},$example{'iso2022jpms_sjis'});
# 
# printf "%-40s", "CP932 to ISO-2022-JP-MS";
#     &test("$nkf --ic=CP932 --oc=ISO-2022-JP-MS",$example{'iso2022jpms_sjis'},$example{'iso2022jpms_jis'});
# 
# printf "%-40s", "ISO-2022-JP-MS to eucJP-ms";
#     &test("$nkf --ic=ISO-2022-JP-MS --oc=eucJP-ms",$example{'iso2022jpms_jis'},$example{'iso2022jpms_euc'});
# 
# printf "%-40s", "eucJP-ms to ISO-2022-JP-MS";
#     &test("$nkf --ic=eucJP-ms --oc=ISO-2022-JP-MS",$example{'iso2022jpms_euc'},$example{'iso2022jpms_jis'});
# JIS X 0212
$example{'jisx0212_euc'} = "\x8F\xA2\xAF\x8F\xED\xE3";
$example{'jisx0212_jis'} = "\x1b\x24\x28\x44\x22\x2f\x6d\x63\x1b\x28\x42";

printf "%-40s", "ISO-2022-JP-1 to EUC-JP";
    &test("$nkf --ic=ISO-2022-JP-1 --oc=EUC-JP",$example{'jisx0212_jis'},$example{'jisx0212_euc'});

printf "%-40s", "EUC-JP to ISO-2022-JP-1";
    &test("$nkf --ic=EUC-JP --oc=ISO-2022-JP-1",$example{'jisx0212_euc'},$example{'jisx0212_jis'});
# JIS X 0213

$example{'jisx0213_sjis'} = unpack('u',<<'eofeof');
0@:V(G9ATF)WJIN_W\$#\]```
eofeof

$example{'jisx0213_euc'} = unpack('u',<<'eofeof');
2HJ^O_<_5S_WTJ/[YCZ&AC_[V
eofeof

$example{'jisx0213_jis'} = unpack('u',<<'eofeof');
;&R0H3R(O+WU/54]]="A^>1LD*%`A(7YV&RA"
eofeof

printf "%-40s", "Shift_JISX0213 to EUC-JISX0213";
    &test("$nkf --ic=Shift_JISX0213 --oc=EUC-JISX0213",$example{'jisx0213_sjis'},$example{'jisx0213_euc'});

printf "%-40s", "EUC-JISX0213 to Shift_JISX0213";
    &test("$nkf --ic=EUC-JISX0213 --oc=Shift_JISX0213",$example{'jisx0213_euc'},$example{'jisx0213_sjis'});

printf "%-40s", "ISO-2022-JP-3 to EUC-JISX0213";
    &test("$nkf --ic=ISO-2022-JP-3 --oc=EUC-JISX0213",$example{'jisx0213_jis'},$example{'jisx0213_euc'});

printf "%-40s", "EUC-JISX0213 to ISO-2022-JP-3";
    &test("$nkf --ic=EUC-JISX0213 --oc=ISO-2022-JP-3",$example{'jisx0213_euc'},$example{'jisx0213_jis'});
# test_data/no_best_fit_chars

$example{'test_data/no_best_fit_chars'} = unpack('u',<<'eofeof');
;XH"5XHBE[[R-[[^@[[^A[[^B[[^C[[^D[[^E
eofeof

printf "%-40s", "no_best_fit_chars (eucJP-ascii)";
    &test("$nkf -W --oc=eucJP-ascii --no-best-fit-chars",$example{'test_data/no_best_fit_chars'},'');

$example{'test_data/no_best_fit_chars_ms'} = unpack('u',<<'eofeof');
9PJ+"H\*EPJ;"K.*`E.*`EN*`ON*(DN.`G```
eofeof

printf "%-40s", "no_best_fit_chars (eucJP-ms)";
    &test("$nkf -W --oc=eucJP-ms --no-best-fit-chars",$example{'test_data/no_best_fit_chars_ms'},'');

$example{'test_data/no_best_fit_chars_cp932'} = unpack('u',<<'eofeof');
MPJ'"HL*CPJ7"IL*IPJK"J\*LPJW"KL*OPK+"L\*UPK?"N,*YPKK"N\.`PX'#
M@L.#PX3#A<.&PX?#B,.)PXK#B\.,PXW#CL./PY##D<.2PY/#E,.5PY;#F,.9
MPYK#F\.<PYW#GL.?PZ##H<.BPZ/#I,.EPZ;#I\.HPZG#JL.KPZS#K<.NPZ_#
@L,.QP[+#L\.TP[7#ML.XP[G#NL.[P[S#O<.^P[_C@I0`
eofeof

printf "%-40s", "no_best_fit_chars (cp932)";
    &test("$nkf -W --oc=CP932 --no-best-fit-chars",$example{'test_data/no_best_fit_chars_cp932'},'');
# test_data/irv

# $example{'test_data/irv'} = unpack('u',<<'eofeof');
# %#B`/(!L`
# eofeof
# 
# $example{'test_data/irv.ans'} = unpack('u',<<'eofeof');
# %#B`/(!L`
# eofeof
# 
# printf "%-40s", "test_data/irv";
#    &test("$nkf -wE",$example{'test_data/irv'},$example{'test_data/irv.ans'});


# UCS Mapping Test
print "\nUCS Mapping Test\n\n";

print "Shift_JIS to UTF-16\n";
$example{'ms_ucs_map_1_sjis'} = "\x81\x60\x81\x61\x81\x7C\x81\x91\x81\x92\x81\xCA";
$example{'ms_ucs_map_1_utf16'} = "\x30\x1C\x20\x16\x22\x12\x00\xA2\x00\xA3\x00\xAC";
$example{'ms_ucs_map_1_utf16_ms'} = "\xFF\x5E\x22\x25\xFF\x0D\xFF\xE0\xFF\xE1\xFF\xE2";

printf "%-40s", "Normal UCS Mapping :";
    &test("$nkf -w16B0 -S",$example{'ms_ucs_map_1_sjis'},$example{'ms_ucs_map_1_utf16'});

printf "%-40s", "Microsoft UCS Mapping :";
    &test("$nkf -w16B0 -S --ms-ucs-map",$example{'ms_ucs_map_1_sjis'},$example{'ms_ucs_map_1_utf16_ms'});
printf "%-40s", "CP932 to UTF-16BE :";
    &test("$nkf --ic=cp932 --oc=utf-16be",$example{'ms_ucs_map_1_sjis'},$example{'ms_ucs_map_1_utf16_ms'});

# X0201 仮名
# X0201->X0208 conversion
# X0208 aphabet -> ASCII
# X0201 相互変換

print "\nX0201 test\n\n";

$example{'x0201.sjis'} = unpack('u',<<'eofeof');
MD5.*<(-*@TR#3H-0@U*#2X--@T^#48-3"I%3B7""8()A@F*"8X)D@F6"9H*!
M@H*"@X*$@H6"AH*'"I%3BTR-AH%)@9>!E(&0@9.!3X&5@9:!:8%J@7R!>X&!
M@6V!;H%O@7"!CPJ4O(IPMK>X/;FZMMZWWKC>N=ZZWH+&"I2\BG#*W\O?S-_-
MW\[?M]^QW@K*W\O?S`IH86YK86MU(,K?R]_,I`K*W\O?S-VA"I2\BG""S(SC
!"@!"
eofeof

$example{'x0201.euc'} = unpack('u',<<'eofeof');
MP;2ST:6KI:VEKZ6QI;.EK*6NI;"ELJ6T"L&TL=&CP:/"H\.CQ*/%H\:CQZ/A
MH^*CXZ/DH^6CYJ/G"L&TM:VYYJ&JH?>A]*'PH?.AL*'UH?:ARJ'+H=VAW*'A
MH<ZASZ'0H=&A[PK(OK/1CK:.MXZX/8ZYCKJ.MH[>CK>.WHZXCMZ.N8[>CKJ.
MWJ3("LB^L]&.RH[?CLN.WX[,CM^.S8[?CLZ.WXZWCM^.L8[>"H[*CM^.RX[?
MCLP*:&%N:V%K=2".RH[?CLN.WX[,CJ0*CLJ.WX[+CM^.S([=CJ$*R+ZST:3.
#N.4*
eofeof

$example{'x0201.utf'} = unpack('u',<<'eofeof');
MY86HZ*>2XX*KXX*MXX*OXX*QXX*SXX*LXX*NXX*PXX*RXX*T"N6%J.B+L>^\
MH>^\HN^\H^^\I.^\I>^\IN^\I^^]@>^]@N^]@^^]A.^]A>^]AN^]APKEA:CH
MJ)CEC[?OO('OO*#OO(/OO(3OO(7OO+[OO(;OO(KOO(COO(GBB)+OO(OOO)WO
MO+OOO+WOO9OOO9W"I0KEC8KHIY+OO;;OO;?OO;@][[VY[[VZ[[VV[[Z>[[VW
M[[Z>[[VX[[Z>[[VY[[Z>[[VZ[[Z>XX&H"N6-BNBGDN^^BN^^G^^^B^^^G^^^
MC.^^G^^^C>^^G^^^CN^^G^^]M^^^G^^]L>^^G@KOOHKOOI_OOHOOOI_OOHP*
M:&%N:V%K=2#OOHKOOI_OOHOOOI_OOHSOO:0*[[Z*[[Z?[[Z+[[Z?[[Z,[[Z=
1[[VA"N6-BNBGDN.!KN6^C`H`
eofeof

$example{'x0201.jis'} = unpack('u',<<'eofeof');
M&R1"030S424K)2TE+R4Q)3,E+"4N)3`E,B4T&RA""ALD0D$T,5$C02-"(T,C
M1"-%(T8C1R-A(V(C8R-D(V4C9B-G&RA""ALD0D$T-2TY9B$J(7<A="%P(7,A
M,"%U(78A2B%+(5TA7"%A(4XA3R%0(5$A;QLH0@H;)$)(/C-1&RA)-C<X&RA"
M/1LH23DZ-EXW7CA>.5XZ7ALD0B1(&RA""ALD0D@^,U$;*$E*7TM?3%]-7TY?
M-U\Q7ALH0@H;*$E*7TM?3!LH0@IH86YK86MU(!LH24I?2U],)!LH0@H;*$E*
97TM?3%TA&RA""ALD0D@^,U$D3CAE&RA""@``
eofeof

$example{'x0201.sosi'} = unpack('u',<<'eofeof');
M&R1"030S424K)2TE+R4Q)3,E+"4N)3`E,B4T&RA*"ALD0D$T,5$C02-"(T,C
M1"-%(T8C1R-A(V(C8R-D(V4C9B-G&RA*"ALD0D$T-2TY9B$J(7<A="%P(7,A
M,"%U(78A2B%+(5TA7"%A(4XA3R%0(5$A;QLH2@H;)$)(/C-1&RA*#C8W.`\;
M*$H]#CDZ-EXW7CA>.5XZ7@\;)$(D2!LH2@H;)$)(/C-1&RA*#DI?2U],7TU?
M3E\W7S%>#PH.2E]+7TP/&RA*"FAA;FMA:W4@#DI?2U],)`\;*$H*#DI?2U],
672$/&RA*"ALD0D@^,U$D3CAE&RA""@``
eofeof

$example{'x0201.x0208'} = unpack('u',<<'eofeof');
M&R1"030S424K)2TE+R4Q)3,E+"4N)3`E,B4T&RA""ALD0D$T,5$;*$)!0D-$
M149'86)C9&5F9PH;)$)!-#4M.68;*$(A0",D)5XF*B@I+2L]6UU[?1LD0B%O
M&RA""ALD0D@^,U$E*R4M)2\;*$(]&R1")3$E,R4L)2XE,"4R)30D2!LH0@H;
M)$)(/C-1)5$E5"57)5HE724M(2PE(B$K&RA""ALD0B51)50E51LH0@IH86YK
M86MU(!LD0B51)50E52$B&RA""ALD0B51)50E525S(2,;*$(*&R1"2#XS421.
&.&4;*$(*
eofeof

# -X is necessary to allow X0201 in SJIS
# -Z convert X0208 alphabet to ASCII
printf "%-40s", "X0201 conversion: SJIS";
    &test("$nkf -jXZ",$example{'x0201.sjis'},$example{'x0201.x0208'});
printf "%-40s", "X0201 conversion: JIS";
    &test("$nkf -jZ",$example{'x0201.jis'},$example{'x0201.x0208'});
printf "%-40s", "X0201 conversion: SI/SO";
    &test("$nkf -jZ",$example{'x0201.sosi'},$example{'x0201.x0208'});
printf "%-40s", "X0201 conversion: EUC";
    &test("$nkf -jZ",$example{'x0201.euc'},$example{'x0201.x0208'});
printf "%-40s", "X0201 conversion: UTF8";
    &test("$nkf -jZ",$example{'x0201.utf'},$example{'x0201.x0208'});
# -x means X0201 output
printf "%-40s", "X0201 output: SJIS";
    &test("$nkf -xs",$example{'x0201.euc'},$example{'x0201.sjis'});
printf "%-40s", "X0201 output: JIS";
    &test("$nkf -xj",$example{'x0201.sjis'},$example{'x0201.jis'});
printf "%-40s", "X0201 output: EUC";
    &test("$nkf -xe",$example{'x0201.jis'},$example{'x0201.euc'});
printf "%-40s", "X0201 output: UTF8";
    &test("$nkf -xw",$example{'x0201.jis'},$example{'x0201.utf'});

# MIME decode

print "\nMIME test\n\n";

# MIME ISO-2022-JP

$example{'mime.iso2022'} = unpack('u',<<'eofeof');
M/3])4T\M,C`R,BU*4#]"/T=Y4D%.144W96E23TI566Q/4U9)1WEH2S\]"CT_
M:7-O+3(P,C(M2E`_0C]'>5)!3D5%-V5I4D]*55EL3U-624=Y:$L_/0H]/VES
M;RTR,#(R+4I0/U$_/3%")$(D1B11/3%"*$)?96YD/ST*&R1`)#TD)B0K)$H;
M*$H@/3])4T\M,C`R,BU*4#]"/T=Y4D%.144W96E23U!Y:S=D:'-O4V<]/3\]
M(&5N9"!O9B!L:6YE"CT_25-/+3(P,C(M2E`_0C]'>5)!3D5%-V5I4D]0>6LW
M9&AS;U-G/3T_/2`]/TE33RTR,#(R+4I0/T(_1WE204Y%13=E:5)/4'EK-V1H
M<V]39ST]/ST*0G)O:V5N(&-A<V4*/3])4T\M,C`R,BU*4#]"/T=Y4D%.144W
M96E23U!Y:S=D"FAS;U-G/3T_/2`]/TE33RTR,`HR,BU*4#]"/T=Y4D%.144W
M96E23U!Y:S=D:'-O4V<]/3\]"CT_25-/+3(P,C(M2E`_0C]'>5)!3D5%-V5I
44D]*55EL3QM;2U-624=Y:$L_/0H_
eofeof

$example{'mime.ans.strict'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"(&5N9`H;)$(D/20F)"LD2ALH0B`;)$(T03MZ)$X_*3MV&RA"96YD(&]F
M(&QI;F4*&R1"-$$[>B1./RD[=C1!.WHD3C\I.W8;*$(*0G)O:V5N(&-A<V4*
M/3])4T\M,C`R,BU*4#]"/T=Y4D%.144W96E23U!Y:S=D"FAS;U-G/3T_/2`]
M/TE33RTR,`HR,BU*4#]"/T=Y4D%.144W96E23U!Y:S=D:'-O4V<]/3\]"CT_
L25-/+3(P,C(M2E`_0C]'>5)!3D5%-V5I4D]*55EL3QM;2U-624=Y:$L_/0H_
eofeof

$example{'mime.unbuf.strict'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"(&5N9`H;)$(D/20F)"LD2ALH0B`;)$(T03MZ)$X_*3MV&RA"96YD(&]F
M(&QI;F4*&R1"-$$[>B1./RD[=C1!.WHD3C\I.W8;*$(*0G)O:V5N(&-A<V4*
M&R1"-$$[>B1./RD;*$)H<V]39ST]/ST@/3])4T\M,C`*,C(M2E`_0C]'>5)!
M3D5%-V5I4D]0>6LW9&AS;U-G/3T_/0H;)$(T03MZ)$XE1ALH0EM+4U9)1WEH
$2S\]"F5I
eofeof

$example{'mime.ans'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"(&5N9`H;)$(D/20F)"LD2ALH0B`;)$(T03MZ)$X_*3MV&RA"96YD(&]F
M(&QI;F4*&R1"-$$[>B1./RD[=C1!.WHD3C\I.W8;*$(*0G)O:V5N(&-A<V4*
M&R1"-$$[>B1./RD;*$)H<V]39ST]/ST@&R1"-$$[>B1./RD[=ALH0@H;)$(T
603MZ)$XE1ALH0EM+4U9)1WEH2S\]"@`*
eofeof

$example{'mime.unbuf'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"(&5N9`H;)$(D/20F)"LD2ALH0B`;)$(T03MZ)$X_*3MV&RA"96YD(&]F
M(&QI;F4*&R1"-$$[>B1./RD[=C1!.WHD3C\I.W8;*$(*0G)O:V5N(&-A<V4*
M&R1"-$$[>B1./RD;*$)H<V]39ST]/ST@&R1"-$$[>B1./RD[=ALH0@H;)$(T
603MZ)$XE1ALH0EM+4U9)1WEH2S\]"@`*
eofeof

$example{'mime.base64'} = unpack('u',<<'eofeof');
M9W-M5"])3&YG<FU#>$I+-&=Q=4,S24LS9W%Q0E%:3TUI-39,,S0Q-&=S5T)1
M43!+9VUA1%9O3T@*9S)+1%1O3'=K8C)1;$E+;V=Q2T-X24MG9W5M0W%*3EEG
<<T=#>$E+9V=U;4,X64Q&9W)70S592VMG<6U""F=Q
eofeof

$example{'mime.base64.ans'} = unpack('u',<<'eofeof');
M&R1")$M&?B1I)#LD1D0Z)"TD7B0Y)"PA(D5L-7XV83E9)$<A(ALH0@T*&R1"
M(T<E-R5G)4,E+R1R0C\_="0J)"0D1B0B)&LD*D4Y)$,D1B0B)&LD<R1')#<D
(9R0F)"L;*$(E
eofeof

# printf "%-40s", "Next test is expected to Fail.\n";
printf "%-40s", "MIME decode (strict)";
    $tmp = &test("$nkf -jmS",$example{'mime.iso2022'},$example{'mime.ans.strict'});

$example{'mime.ans.alt'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"96YD"ALD0B0])"8D*R1*&RA"&R1"-$$[>B1./RD[=ALH0F5N9&]F;&EN
M90H;)$(T03MZ)$X_*3MV-$$[>B1./RD[=ALH0@I"<F]K96YC87-E"ALD0C1!
H.WHD3C\I.W8T03MZ)$X_*3MV&RA""ALD0C1!.WHD3B5&)3DE)!LH0@``
eofeof

$example{'mime.unbuf.alt'} = unpack('u',<<'eofeof');
M&R1"-$$[>B1.)48E.25(&RA""ALD0C1!.WHD3B5&)3DE2!LH0@H;)$(D1B11
M&RA"96YD"ALD0B0])"8D*R1*&RA"&R1"-$$[>B1./RD[=ALH0F5N9&]F;&EN
M90H;)$(T03MZ)$X_*3MV-$$[>B1./RD[=ALH0@I"<F]K96YC87-E"ALD0C1!
H.WHD3C\I.W8T03MZ)$X_*3MV&RA""ALD0C1!.WHD3B5&)3DE)!LH0@``
eofeof

printf "%-40s", "MIME decode (nonstrict)";
    $tmp = &test("$nkf -jmN",$example{'mime.iso2022'},$example{'mime.ans'},$example{'mime.ans.alt'});
    # open(OUT,">tmp1");printf "%-40s", OUT pack('u',$tmp);close(OUT);
# unbuf mode implies more pessimistic decode
printf "%-40s", "MIME decode (unbuf)";
    $tmp = &test("$nkf -jmNu",$example{'mime.iso2022'},$example{'mime.unbuf'},$example{'mime.unbuf.alt'});
    # open(OUT,">tmp2");printf "%-40s", OUT pack('u',$tmp);close(OUT);
printf "%-40s", "MIME decode (base64)";
    &test("$nkf -jmB",$example{'mime.base64'},$example{'mime.base64.ans'});
#MIME BASE64 must be LF?

# MIME ISO-8859-1

$example{'mime.is8859'} = unpack('u',<<'eofeof');
M/3])4T\M.#@U.2TQ/U$_*CU#-V%V83\_/2`*4&5E<B!4]G)N9W)E;@I,87-S
M92!(:6QL97+X92!0971E<G-E;B`@7"`B36EN(&MA97!H97-T(&AA<B!F86%E
M="!E="!F;V5L(2(*06%R:'5S(%5N:79E<G-I='DL($1%3DU!4DL@(%P@(DUI
<;B!KYG!H97-T(&AA<B!FY65T(&5T(&;X;"$B"@!K
eofeof

$example{'mime.is8859.ans'} = unpack('u',<<'eofeof');
M*L=A=F$_(`I0965R(%3V<FYG<F5N"DQA<W-E($AI;&QE<OAE(%!E=&5R<V5N
M("!<(")-:6X@:V%E<&AE<W0@:&%R(&9A865T(&5T(&9O96PA(@I!87)H=7,@
M56YI=F5R<VET>2P@1$5.34%22R`@7"`B36EN(&OF<&AE<W0@:&%R(&;E970@
)970@9OAL(2(*
eofeof

# Without -l, ISO-8859-1 was handled as X0201.

printf "%-40s", "MIME ISO-8859-1 (Q)";
    &test("$nkf -ml",$example{'mime.is8859'},$example{'mime.is8859.ans'});

# test for -f is not so simple.

print "\nBug Fixes\n\n";

# test_data/cr

$example{'test_data/cr'} = unpack('u',<<'eofeof');
1I,:DN:3(#71E<W0-=&5S=`T`
eofeof

$example{'test_data/cr.ans'} = unpack('u',<<'eofeof');
7&R1")$8D.21(&RA""G1E<W0*=&5S=`H`
eofeof

printf "%-40s", "test_data/cr";
    &test("$nkf -jd",$example{'test_data/cr'},$example{'test_data/cr.ans'});
# test_data/fixed-qencode

$example{'test_data/fixed-qencode'} = unpack('u',<<'eofeof');
M("`@("`@("`],4(D0CYE/STS1#TQ0BA""B`@("`@("`@/3%")$(^93TS1CTS
'1#TQ0BA""@``
eofeof

$example{'test_data/fixed-qencode.ans'} = unpack('u',<<'eofeof');
F("`@("`@("`;)$(^93\]&RA""B`@("`@("`@&R1"/F4_/1LH0@H`
eofeof

printf "%-40s", "test_data/fixed-qencode";
    &test("$nkf -jmQ",$example{'test_data/fixed-qencode'},$example{'test_data/fixed-qencode.ans'});
# test_data/long-fold-1

$example{'test_data/long-fold-1'} = unpack('u',<<'eofeof');
MI,JDK*2DI,JDK*2DI,JDK*'!I*2DKJ3GI*:DK*2BI.JDWJ2WI,:AHJ2SI.RD
M\J2]I,ZDWJ3>I**DQ*2KI*:DR*&BI,FDIJ3BI-^DT*2HI*RD[Z3KI*2DMZ&B
MI,BDP:3EI*:DQZ3!I.>D\Z2NI.RDZZ2KI.*DMZ3SI,JDI*&C"J2SI+.DSR!#
M4B],1B"DSKG4H:,-"J2SI+.DSR!#4B"DSKG4H:,-I+.DLZ3/($Q&+T-2(*3.
9N=2AHPH-"J2SI+.DSR!,1B"DSKG4H:,*"@``
eofeof

$example{'test_data/long-fold-1.ans'} = unpack('u',<<'eofeof');
M&R1")$HD+"0D)$HD+"0D)$HD+"%!)"0D+B1G)"8D+"0B)&HD7B0W)$8A(B0S
M)&PD<B0])$XD7B1>)"(D1"0K&RA""ALD0B0F)$@A(B1))"8D8B1?)%`D*"0L
M)&\D:R0D)#<A(B1()$$D920F)$<D021G)',D+B1L)&LD*R1B)#<D<QLH0@H;
M)$(D2B0D(2,;*$(*&R1")#,D,R1/&RA"($-2+TQ&(!LD0B1..50A(QLH0@H;
M)$(D,R0S)$\;*$(@0U(@&R1")$XY5"$C&RA""ALD0B0S)#,D3QLH0B!,1B]#
M4B`;)$(D3CE4(2,;*$(*"ALD0B0S)#,D3QLH0B!,1B`;)$(D3CE4(2,;*$(*
!"@``
eofeof

printf "%-40s", "test_data/long-fold-1";
    &test("$nkf -jF60",$example{'test_data/long-fold-1'},$example{'test_data/long-fold-1.ans'});
# test_data/long-fold

$example{'test_data/long-fold'} = unpack('u',<<'eofeof');
MI,JDK*2DI,JDK*2DI,JDK*'!I*2DKJ3GI*:DK*2BI.JDWJ2WI,:AHJ2SI.RD
M\J2]I,ZDWJ3>I**DQ*2KI*:DR*&BI,FDIJ3BI-^DT*2HI*RD[Z3KI*2DMZ&B
MI,BDP:3EI*:DQZ3!I.>D\Z2NI.RDZZ2KI.*DMZ3SI,JDI*&C"J2SI+.DS\.[
'I*2YU*&C"@``
eofeof

$example{'test_data/long-fold.ans'} = unpack('u',<<'eofeof');
M&R1")$HD+"0D)$HD+"0D)$HD+"%!)"0D+B1G)"8D+"0B)&HD7B0W)$8A(B0S
M)&PD<B0])$XD7B1>)"(D1"0K&RA""ALD0B0F)$@A(B1))"8D8B1?)%`D*"0L
M)&\D:R0D)#<A(B1()$$D920F)$<D021G)',D+B1L)&LD*R1B)#<D<QLH0@H;
:)$(D2B0D(2,D,R0S)$]#.R0D.50A(QLH0@H`
eofeof

printf "%-40s", "test_data/long-fold";
    &test("$nkf -jf60",$example{'test_data/long-fold'},$example{'test_data/long-fold.ans'});
# test_data/mime_out

$example{'test_data/mime_out'} = unpack('u',<<'eofeof');
M"BTM+2T*4W5B:F5C=#H@86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@86%A82!A86%A"BTM+2T*
M4W5B:F5C=#H@I**DI*2FI*BDJJ2KI*VDKZ2QI+.DM:2WI+FDNZ2]I+^DP:3$
MI,:DR*3*I,NDS*3-I,ZDSZ32I-6DV*3;I-ZDWZ3@I.&DXJ3DI*2DYJ2HI.@*
M+2TM+0I3=6)J96-T.B!A86%A(&%A86$@86%A82!A86%A(&%A86$@86%A82!A
I86%A(*2BI*2DIJ2HI*H@86%A82!A86%A(&%A86$@86%A80HM+2TM"@H`
eofeof

$example{'test_data/mime_out.ans'} = unpack('u',<<'eofeof');
M"BTM+2T*4W5B:F5C=#H@86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@86%A80H@86%A80HM+2TM
M"E-U8FIE8W0Z(#T_25-/+3(P,C(M2E`_0C]'>5)#2D-):TI#46U*0V=K2VE1
M<DI#,&M,>5%X2D1-:TY343-*1&MB2T5)/3\]"B`]/TE33RTR,#(R+4I0/T(_
M1WE20TI$<VM04U$O2D5%:U)#4D=*16=K4VE23$I%=VM44U)/2D4X:U5I4E9*
M1F=B2T5)/3\]"B`]/TE33RTR,#(R+4I0/T(_1WE20TI&<VM8:5)F2D=!:UE3
M4FE*1U%K2D-2;4I#9VMA0G-O46<]/3\]"BTM+2T*4W5B:F5C=#H@86%A82!A
M86%A(&%A86$@86%A82!A86%A(&%A86$@86%A80H@/3])4T\M,C`R,BU*4#]"
M/T=Y4D-*0TEK2D-1;4I#9VM+:'-O46<]/3\](&%A86$@86%A82!A86%A(&%A
)86$*+2TM+0H*
eofeof

$example{'test_data/mime_out.ans.alt'} = unpack('u',<<'eofeof');
M"BTM+2T*4W5B:F5C=#H@86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@
M86%A82!A86%A(&%A86$*(&%A86$@86%A82!A86%A(&%A86$@86%A80HM+2TM
M"E-U8FIE8W0Z(#T_25-/+3(P,C(M2E`_0C]'>5)#2D-):TI#46U*0V=K2VE1
M<DI#,&M,>5%X2D1-:TY343-'>6A#/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#
M2D1K:T]Y43E*1#AK45-214I%66M30U)+2D5S:U1#4DY*131K5'E24TI&56M7
M0U)B1WEH0S\]"B`]/TE33RTR,#(R+4I0/T(_1WE20TI&-&M8>5)G2D=%:UEI
M4FM*0U%K6FE1;TI'9V)+14D]/ST*+2TM+0I3=6)J96-T.B!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A"B`]/TE33RTR,#(R+4I0/T(_1WE2
M0TI#26M*0U%M2D-G:TMH<V]19ST]/ST@86%A82!A86%A(&%A86$*(&%A86$*
&+2TM+0H*
eofeof

$example{'test_data/mime_out.ans.alt2'} = unpack('u',<<'eofeof');
M"BTM+2T*4W5B:F5C=#H@86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@86%A80H@86%A80HM+2TM
M"E-U8FIE8W0Z(#T_25-/+3(P,C(M2E`_0C]'>5)#2D-):TI#46U*0V=K2VE1
M<DI#,&M,>5%X2D1-:TY343-*1&MK3WE1.4=Y:$,_/0H@/3])4T\M,C`R,BU*
M4#]"/T=Y4D-*1#AK45-214I%66M30U)+2D5S:U1#4DY*131K5'E24TI&56M7
M0U)B2D8T:UAY4F='>6A#/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D=%:UEI
M4FM*0U%K6FE1;TI'9V)+14D]/ST*+2TM+0I3=6)J96-T.B!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A(#T_25-/+3(P,C(M2E`_0C]'>5)#
M2D-):TI"<V]19ST]/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D-9:TM#47%'
@>6A#/ST@86%A82!A86%A(&%A86$@86%A80HM+2TM"@H`
eofeof

printf "%-40s", "test_data/mime_out";
    &test("$nkf -jM",$example{'test_data/mime_out'},$example{'test_data/mime_out.ans'},$example{'test_data/mime_out.ans.alt'},$example{'test_data/mime_out.ans.alt2'});
# test_data/mime_out2

$example{'test_data/mime_out2'} = unpack('u',<<'eofeof');
M5&AI<R!M96UO(&1E<V-R:6)E<R!S:6UI;&%R('1E8VAN:7%U97,@=&\@86QL\
M;W<@=&AE(&5N8V]D:6YG(&]F(&YO;BU!4T-)22!T97AT(&EN('9A<FEO=7,@
M<&]R=&EO;G,@;V8@82!21D,@.#(R(%LR72!M97-S86=E(&AE861E<BP@:6X@
M82!M86YN97(@=VAI8V@@:7,@=6YL:6ME;'D@=&\@8V]N9G5S92!E>&ES=&EN
M9R!M97-S86=E(&AA;F1L:6YG('-O9G1W87)E+@H*4W5B:F5C=#H@=&5S=#$@
M=&5S=#(@@L2"MX+&@J<@=&5S=#,@@L2"MX+&@O$@=&5S=#0*"E-U8FIE8W0Z
M('1E<W0Q("!T97-T,B""Q"""MR""QB""IR!T97-T,R`@@L2"MX+&@O$@('1E
M<W0T"@I!4T-)22"3^I9[C.H@05-#24D@05-#24D@D_J6>XSJ()/ZEGN,ZB!!
M4T-)22!!4T-)29/ZEGN,ZB!!4T-)20H*@J`@@J(@@J0@@J8@@J@@@JD@@JL@
M@JT@@J\@@K$@@K,@@K4@@K<@@KD@@KL@@KT@@K\@@L(@@L0@@L8@@L@@@LD@
8@LH@@LL@@LP*"@H*"@H*"@H*"@H*"@H*
eofeof

$example{'test_data/mime_out2.ans'} = unpack('u',<<'eofeof');
M5&AI<R!M96UO(&1E<V-R:6)E<R!S:6UI;&%R('1E8VAN:7%U97,@=&\@86QL
M;W<@=&AE(&5N8V]D:6YG(&]F(&YO;BU!4T-)20H@=&5X="!I;B!V87)I;W5S
M('!O<G1I;VYS(&]F(&$@4D9#(#@R,B!;,ET@;65S<V%G92!H96%D97(L(&EN
M(&$@;6%N;F5R"B!W:&EC:"!I<R!U;FQI:V5L>2!T;R!C;VYF=7-E(&5X:7-T
M:6YG(&UE<W-A9V4@:&%N9&QI;F<@<V]F='=A<F4N"@I3=6)J96-T.B!T97-T
M,2!T97-T,B`]/TE33RTR,#(R+4I0/T(_1WE20TI%66M/4U))2D-K8DM%23T_
M/2!T97-T,PH@/3])4T\M,C`R,BU*4#]"/T=Y4D-*15EK3U-224I(36)+14D]
M/ST@=&5S=#0*"E-U8FIE8W0Z('1E<W0Q("!T97-T,B`]/TE33RTR,#(R+4I0
M/T(_1WE20TI%66)+14EG1WE20TI$:V)+14D]/ST*(#T_25-/+3(P,C(M2E`_
M0C]'>5)#2D5G8DM%26='>5)#2D-K8DM%23T_/2!T97-T,R`*(#T_25-/+3(P
M,C(M2E`_0C]'>5)#2D59:T]34DE*2$UB2T5)/3\]("!T97-T-`H*05-#24D@
M/3])4T\M,C`R,BU*4#]"/T=Y4D-2;GA,6$1H<T=Y:$,_/2!!4T-)22!!4T-)
M20H@/3])4T\M,C`R,BU*4#]"/T=Y4D-2;GA,6$1H<T=Y:$-)0G-K46M:.%,Q
M=S1B0G-O46<]/3\]($%30TE)"B`]/TE33RTR,#(R+4I0/T(_459.1%-5:V)*
M14I'9D5T8T]'=V)+14D]/ST@05-#24D*"CT_25-/+3(P,C(M2E`_0C]'>5)#
M2D-)8DM%26='>5)#2D-18DM%26='>5)#2D-98DM%26='>5)#2D-G8DM%26<_
M/0H@/3])4T\M,C`R,BU*4#]"/T=Y4D-*0V]B2T5)9T=Y4D-*0W-B2T5)9T=Y
M4D-*0S!B2T5)9T=Y4D-*0SAB2T5)9S\]"B`]/TE33RTR,#(R+4I0/T(_1WE2
M0TI$16)+14EG1WE20TI$36)+14EG1WE20TI$56)+14EG1WE20TI$8V)+14EG
M/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D1K8DM%26='>5)#2D1S8DM%26='
M>5)#2D0P8DM%26='>5)#2D0X8DM%26<_/0H@/3])4T\M,C`R,BU*4#]"/T=Y
M4D-*145B2T5)9T=Y4D-*15%B2T5)9T=Y4D-*15EB2T5)9T=Y4D-*16=B2T5)
M9S\]"B`]/TE33RTR,#(R+4I0/T(_1WE20TI%;V)+14EG1WE20TI%<V)+14EG
M1WE20TI%=V)+14EG1WE20TI%,&)+14EG/ST*(#T_25-/+3(P,C(M2E`_0C]'
=>5)#2D4T8DM%23T_/0H*"@H*"@H*"@H*"@H*"@H`
eofeof

$example{'test_data/mime_out2.ans.alt'} = unpack('u',<<'eofeof');
M5&AI<R!M96UO(&1E<V-R:6)E<R!S:6UI;&%R('1E8VAN:7%U97,@=&\@86QL
M;W<@=&AE(&5N8V]D:6YG"B!O9B!N;VXM05-#24D@=&5X="!I;B!V87)I;W5S
M('!O<G1I;VYS(&]F(&$@4D9#(#@R,B!;,ET*(&UE<W-A9V4@:&5A9&5R+"!I
M;B!A(&UA;FYE<B!W:&EC:"!I<R!U;FQI:V5L>2!T;R!C;VYF=7-E(&5X:7-T
M:6YG"B!M97-S86=E(&AA;F1L:6YG('-O9G1W87)E+@H*4W5B:F5C=#H@=&5S
M=#$@=&5S=#(@/3])4T\M,C`R,BU*4#]"/T=Y4D-*15EK3U-224I#:V)+14D]
M/ST@=&5S=#,*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D59:T]34DE*2$UB2T5)
M/3\]('1E<W0T"@I3=6)J96-T.B!T97-T,2`@=&5S=#(@/3])4T\M,C`R,BU*
M4#]"/T=Y4D-*15EB2T5)9T=Y4D-*1&MB2T5)9T=Y4D-*16=B2T5)/3\]"B`]
M/TE33RTR,#(R+4I0/T(_1WE20T=Y:$-)0G-K46E1<$=Y:$,_/2!T97-T,R`*
M(#T_25-/+3(P,C(M2E`_0C]'>5)#2D59:T]34DE*2$UB2T5)/3\]("!T97-T
M-`H*05-#24D@/3])4T\M,C`R,BU*4#]"/T=Y4D-2;GA,6$1H<T=Y:$,_/2!!
M4T-)22!!4T-)20H@/3])4T\M,C`R,BU*4#]"/T=Y4D-2;GA,6$1H<T=Y:$-)
M0G-K46M:.%,Q=S1B0G-O46<]/3\]($%30TE)"B`]/TE33RTR,#(R+4I0/T(_
M459.1%-5:V)*14I'9D5T8T]'=V)+14D]/ST@05-#24D*"CT_25-/+3(P,C(M
M2E`_0C]'>5)#2D-)8DM%26='>5)#2D-18DM%26='>5)#2D-98DM%26='>5)#
M2D-G8DM%26='>5)#2D-O8DM%23T_/0H@/3])4T\M,C`R,BU*4#]"/T=Y4D-'
M>6A#24)S:U%I47)'>6A#24)S:U%I471'>6A#24)S:U%I479'>6A#24)S:U%I
M47A'>6A#/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#1WEH0TE"<VM1:5%Z1WEH
M0TE"<VM1:5$Q1WEH0TE"<VM1:5$S1WEH0TE"<VM1:5$U1WEH0S\]"B`]/TE3
M3RTR,#(R+4I0/T(_1WE20T=Y:$-)0G-K46E1-T=Y:$-)0G-K46E1.4=Y:$-)
M0G-K46E1+T=Y:$-)0G-K46E20D=Y:$,_/0H@/3])4T\M,C`R,BU*4#]"/T=Y
M4D-'>6A#24)S:U%I4D5'>6A#24)S:U%I4D='>6A#24)S:U%I4DE'>6A#24)S
M:U%I4DM'>6A#/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#1WEH0TE"<VM1:5),
M1WEH0TE"<VM1:5)-1WEH0TE"<VM1:5).1WEH0TE"<VM1:5)/1WEH0S\]"B`]
I/TE33RTR,#(R+4I0/T(_1WE20T=Y:$,_/0H*"@H*"@H*"@H*"@H*"@H`
eofeof

$example{'test_data/mime_out2.ans.alt2'} = unpack('u',<<'eofeof');
M5&AI<R!M96UO(&1E<V-R:6)E<R!S:6UI;&%R('1E8VAN:7%U97,@=&\@86QL
M;W<@=&AE(&5N8V]D:6YG(&]F(&YO;BU!4T-)20H@=&5X="!I;B!V87)I;W5S
M('!O<G1I;VYS(&]F(&$@4D9#(#@R,B!;,ET@;65S<V%G92!H96%D97(L(&EN
M(&$@;6%N;F5R('=H:6-H"B!I<R!U;FQI:V5L>2!T;R!C;VYF=7-E(&5X:7-T
M:6YG(&UE<W-A9V4@:&%N9&QI;F<@<V]F='=A<F4N"@I3=6)J96-T.B!T97-T
M,2!T97-T,B`]/TE33RTR,#(R+4I0/T(_1WE20TI%66M/4U))2D-K8DM%23T_
M/2!T97-T,R`*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D59:T]34DE*2$UB2T5)
M/3\]('1E<W0T"@I3=6)J96-T.B!T97-T,2`@=&5S=#(@/3])4T\M,C`R,BU*
M4#]"/T=Y4D-*15EB2T5)9T=Y4D-*1&MB2T5)9T=Y4D-*16=B2T5)9S\]"B`]
M/TE33RTR,#(R+4I0/T(_1WE20TI#:V)+14D]/ST@=&5S=#,@(#T_25-/+3(P
M,C(M2E`_0C]'>5)#2D59:T]34DE'>6A#/ST*(#T_25-/+3(P,C(M2E`_0C]'
M>5)#2DA-8DM%23T_/2`@=&5S=#0*"D%30TE)(#T_25-/+3(P,C(M2E`_0C]'
M>5)#4FYX3%A$:'-'>6A#/ST@05-#24D@05-#24D@"B`]/TE33RTR,#(R+4I0
M/T(_1WE20U)N>$Q81&AS1WEH0TE"<VM1:UHX4S%W-&)"<V]19ST]/ST@05-#
M24D@"B`]/TE33RTR,#(R+4I0/T(_459.1%-5:V)*14I'9D5T8T]'=V)+14D]
M/ST@05-#24D*"CT_25-/+3(P,C(M2E`_0C]'>5)#2D-)8DM%26='>5)#2D-1
M8DM%26='>5)#2D-98DM%26='>5)#2D-G8DM%26='>5)#2D-O8DM%26<_/0H@
M/3])4T\M,C`R,BU*4#]"/T=Y4D-*0W-B2T5)9T=Y4D-*0S!B2T5)9T=Y4D-*
M0SAB2T5)9T=Y4D-*1$5B2T5)9T=Y4D-*1$UB2T5)9S\]"B`]/TE33RTR,#(R
M+4I0/T(_1WE20TI$56)+14EG1WE20TI$8V)+14EG1WE20TI$:V)+14EG1WE2
M0TI$<V)+14EG1WE20TI$,&)+14EG/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#
M2D0X8DM%26='>5)#2D5%8DM%26='>5)#2D518DM%26='>5)#2D598DM%26='
M>5)#2D5G8DM%26<_/0H@/3])4T\M,C`R,BU*4#]"/T=Y4D-*16]B2T5)9T=Y
M4D-*17-B2T5)9T=Y4D-*17=B2T5)9T=Y4D-*13!B2T5)9T=Y4D-*131B2T5)
92T-G;TM#9V]+0V=O2T-G;TM#9V]+/ST*(```
eofeof

printf "%-40s", "test_data/mime_out2";
    &test("$nkf -jM",$example{'test_data/mime_out2'},$example{'test_data/mime_out2.ans'},$example{'test_data/mime_out2.ans.alt'},$example{'test_data/mime_out2.ans.alt2'});
# test_data/mime_out

$example{'test_data/mime_out3'} = "\x82\xD9\x82\xB0 A";

$example{'test_data/mime_out3.ans'} = "=?ISO-2022-JP?B?GyRCJFskMhsoQg==?= A";

printf "%-40s", "test_data/mime_out3";
    &test("$nkf -jSM",$example{'test_data/mime_out3'},$example{'test_data/mime_out3.ans'});
# test_data/multi-line

$example{'test_data/multi-line'} = unpack('u',<<'eofeof');
MI,JDK*2DI,JDK*2DI,JDK*'!I*2DKJ3GI*:DK*2BI.JDWJ2WI,:AH@"DLZ3L
MI/*DO:3.I-ZDWJ2BI,2DJZ2FI,BAHJ3)I*:DXJ3?I-"DJ*2LI.^DZZ2DI+>A
MHJ3(I,&DY:2FI,>DP:3GI/.DKJ3LI.NDJZ3BI+>D\Z3*I*2AHPJDLZ2SI,_#
8NZ2DN=2AHP`*I+.DLZ3/P[NDI+G4H:,*
eofeof

$example{'test_data/multi-line.ans'} = unpack('u',<<'eofeof');
MI,JDK*2DI,JDK*2DI,JDK*'!I*2DKJ3GI*:DK*2BI.JDWJ2WI,:AH@"DLZ3L
MI/*DO:3.I-ZDWJ2BI,2DJZ2FI,BAHJ3)I*:DXJ3?I-"DJ*2LI.^DZZ2DI+>A
MHJ3(I,&DY:2FI,>DP:3GI/.DKJ3LI.NDJZ3BI+>D\Z3*I*2AHPJDLZ2SI,_#
8NZ2DN=2AHP`*I+.DLZ3/P[NDI+G4H:,*
eofeof

printf "%-40s", "test_data/multi-line";
    &test("$nkf -e",$example{'test_data/multi-line'},$example{'test_data/multi-line.ans'});
# test_data/nkf-19-bug-1

$example{'test_data/nkf-19-bug-1'} = unpack('u',<<'eofeof');
,I*:DJZ2D"KK8QJ,*
eofeof

$example{'test_data/nkf-19-bug-1.ans'} = unpack('u',<<'eofeof');
8&R1")"8D*R0D&RA""ALD0CI81B,;*$(*
eofeof

printf "%-40s", "test_data/nkf-19-bug-1";
    &test("$nkf -Ej",$example{'test_data/nkf-19-bug-1'},$example{'test_data/nkf-19-bug-1.ans'});
# test_data/nkf-19-bug-2

$example{'test_data/nkf-19-bug-2'} = unpack('u',<<'eofeof');
%I-NDL@H`
eofeof

$example{'test_data/nkf-19-bug-2.ans'} = unpack('u',<<'eofeof');
%I-NDL@H`
eofeof

printf "%-40s", "test_data/nkf-19-bug-2";
    &test("$nkf -Ee",$example{'test_data/nkf-19-bug-2'},$example{'test_data/nkf-19-bug-2.ans'});
# test_data/nkf-19-bug-3

$example{'test_data/nkf-19-bug-3'} = unpack('u',<<'eofeof');
8[;'Q\,&L"N6ZSN\*\NT)ON7.SL_+"0D*
eofeof

$example{'test_data/nkf-19-bug-3.ans'} = unpack('u',<<'eofeof');
8[;'Q\,&L"N6ZSN\*\NT)ON7.SL_+"0D*
eofeof

printf "%-40s", "test_data/nkf-19-bug-3";
    &test("$nkf -e",$example{'test_data/nkf-19-bug-3'},$example{'test_data/nkf-19-bug-3.ans'});
# test_data/non-strict-mime

$example{'test_data/non-strict-mime'} = unpack('u',<<'eofeof');
M/3])4T\M,C`R,BU*4#]"/PIG<U-#;V]+.6=R-D-O;TQ%9W1Y0W0T1D-$46].
M0V\V16=S,D]N;T999S1Y1%=)3$IG=4-0:UD*2W!G<FU#>$E+:6=R,D-V;TMI
,9W-30V]O3&,*/ST*
eofeof

$example{'test_data/non-strict-mime.ans'} = unpack('u',<<'eofeof');
M&R1")$8D)"0_)$`D)"1&)%XD.2$C&RA"#0H-"ALD0CMD)$\[?B$Y)6PE.21+
<)&(]<20K)#LD1B0D)#\D0"0D)$8D)"1>&RA""@``
eofeof

printf "%-40s", "test_data/non-strict-mime";
    &test("$nkf -jmN",$example{'test_data/non-strict-mime'},$example{'test_data/non-strict-mime.ans'});
# test_data/q-encode-softrap

$example{'test_data/q-encode-softrap'} = unpack('u',<<'eofeof');
H/3%")$(T03MZ)3T*,R$\)4DD3CTQ0BA""CTQ0B1"2E$T.3TQ0BA""@``
eofeof

$example{'test_data/q-encode-softrap.ans'} = unpack('u',<<'eofeof');
>&R1"-$$[>B4S(3PE221.&RA""ALD0DI1-#D;*$(*
eofeof

printf "%-40s", "test_data/q-encode-softrap";
    &test("$nkf -jmQ",$example{'test_data/q-encode-softrap'},$example{'test_data/q-encode-softrap.ans'});
# test_data/rot13

$example{'test_data/rot13'} = unpack('u',<<'eofeof');
MI+.D\Z3+I,&DSZ&BS:W"]*3(I*2DI*3>I+FAHPH*;FMF('9E<BXQ+CDR(*3R
MS?C-T:2UI+NDQJ2DI+^DP*2DI,:DI*3>I+FDK*&B05-#24D@I,O"T*2WI,8@
M4D]4,3,@I*P*P+6DMZ2OQK"DI*3&I*2DRJ2DI.BDIJ3'H:*PRK*\I,ZDZ*2F
MI,O*T;2YI+6D[*3>I+ND\Z&C"@HE(&5C:&\@)VAO9V4G('P@;FMF("UR"FAO
#9V4*
eofeof

$example{'test_data/rot13.ans'} = unpack('u',<<'eofeof');
M&R1"4V)31%-Z4W!3?E!1?%QQ15-W4U-34U,O4VA04ALH0@H*87AS(&ER92XQ
M+CDR(!LD0E-#?$E\(E-D4VI3=5-34VY3;U-34W534U,O4VA36U!1&RA"3D90
M5E8@&R1"4WIQ(5-F4W4;*$(@14)',3,@&R1"4UL;*$(*&R1";V139E->=5]3
M4U-U4U-3>5-34SE355-V4%%?>6%K4WU3.5-54WIY(F-H4V13/5,O4VI31%!2
A&RA""@HE(')P=6(@)W5B='(G('P@87AS("UE"G5B='(*
eofeof

printf "%-40s", "test_data/rot13";
    &test("$nkf -jr",$example{'test_data/rot13'},$example{'test_data/rot13.ans'});
# test_data/slash

$example{'test_data/slash'} = unpack('u',<<'eofeof');
7("`]/U8\5"U5.5=%2RTK.U<U32LE+PH`
eofeof

$example{'test_data/slash.ans'} = unpack('u',<<'eofeof');
7("`]/U8\5"U5.5=%2RTK.U<U32LE+PH`
eofeof

printf "%-40s", "test_data/slash";
    &test("$nkf  ",$example{'test_data/slash'},$example{'test_data/slash.ans'});
# test_data/z1space-0

$example{'test_data/z1space-0'} = unpack('u',<<'eofeof');
"H:$`
eofeof

$example{'test_data/z1space-0.ans'} = unpack('u',<<'eofeof');
"H:$`
eofeof

printf "%-40s", "test_data/z1space-0";
    &test("$nkf -e -Z",$example{'test_data/z1space-0'},$example{'test_data/z1space-0.ans'});
# test_data/z1space-1

$example{'test_data/z1space-1'} = unpack('u',<<'eofeof');
"H:$`
eofeof

$example{'test_data/z1space-1.ans'} = unpack('u',<<'eofeof');
!(```
eofeof

printf "%-40s", "test_data/z1space-1";
    &test("$nkf -e -Z1",$example{'test_data/z1space-1'},$example{'test_data/z1space-1.ans'});
# test_data/z1space-2

$example{'test_data/z1space-2'} = unpack('u',<<'eofeof');
"H:$`
eofeof

$example{'test_data/z1space-2.ans'} = unpack('u',<<'eofeof');
"("``
eofeof

printf "%-40s", "test_data/z1space-2";
    &test("$nkf -e -Z2",$example{'test_data/z1space-2'},$example{'test_data/z1space-2.ans'});
# test_data/bug2273

$example{'test_data/bug2273'} = unpack('u',<<'eofeof');
M/3]I<V\M,C`R,BUJ<#]Q/STY-CU!,CTX1CU",STY,3U&.#TX1$P].$0].3`]
M.#$]038*:'1T<#HO+V5X86UP;&4N8V]M+S]O<&4]<V5L"FAT='`Z+R]E>&UA
,<&QE+FIP+PHN+BX*
eofeof

$example{'test_data/bug2273.ans'} = unpack('u',<<'eofeof');
MS*2^M<+ZN:VY\**H"FAT='`Z+R]E>&%M<&QE+F-O;2\_;W!E/7-E;`IH='1P
3.B\O97AM87!L92YJ<"\*+BXN"@``
eofeof

printf "%-40s", "test_data/bug2273";
    &test("$nkf -e",$example{'test_data/bug2273'},$example{'test_data/bug2273.ans'});

# end


#!/usr/local/bin/perl
#
# nkf test program for nkf-2
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

print "UTF8 to UTF8...";&test("$nkf -w","\xf0\xa0\x80\x8b","\xf0\xa0\x80\x8b");

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

# UTF
sub h {pack("H*",shift)}
print "SJIS to -w...          ";&test("$nkf -w",h("82A0"),h("E38182"));
print "SJIS to -w8...         ";&test("$nkf -w8",h("82A0"),h("EFBBBFE38182"));
print "SJIS to -w80...        ";&test("$nkf -w80",h("82A0"),h("E38182"));
print "SJIS to UTF-8...       ";&test("$nkf --oc=UTF-8",h("82A0"),h("E38182"));
print "SJIS to UTF-8N...      ";&test("$nkf --oc=UTF-8N",h("82A0"),h("E38182"));
print "SJIS to UTF-8-BOM...   ";&test("$nkf --oc=UTF-8-BOM",h("82A0"),h("EFBBBFE38182"));
print "SJIS to -w16...        ";&test("$nkf -w16",h("82A0"),h("FEFF3042"));
print "SJIS to UTF-16...      ";&test("$nkf --oc=UTF-16",h("82A0"),h("FEFF3042"));
print "SJIS to -w16B...       ";&test("$nkf -w16B",h("82A0"),h("FEFF3042"));
print "SJIS to -w16B0...      ";&test("$nkf -w16B0",h("82A0"),h("3042"));
print "SJIS to UTF-16BE...    ";&test("$nkf --oc=UTF-16BE",h("82A0"),h("3042"));
print "SJIS to UTF-16BE-BOM...";&test("$nkf --oc=UTF-16BE-BOM",h("82A0"),h("FEFF3042"));
print "SJIS to -w16L...       ";&test("$nkf -w16L",h("82A0"),h("FFFE4230"));
print "SJIS to -w16L0...      ";&test("$nkf -w16L0",h("82A0"),h("4230"));
print "SJIS to UTF-16LE...    ";&test("$nkf --oc=UTF-16LE",h("82A0"),h("4230"));
print "SJIS to UTF-16LE-BOM...";&test("$nkf --oc=UTF-16LE-BOM",h("82A0"),h("FFFE4230"));
print "SJIS to -w32...        ";&test("$nkf -w32",h("82A0"),h("0000FEFF00003042"));
print "SJIS to UTF-32...      ";&test("$nkf --oc=UTF-32",h("82A0"),h("0000FEFF00003042"));
print "SJIS to -w32B...       ";&test("$nkf -w32B",h("82A0"),h("0000FEFF00003042"));
print "SJIS to -w32B0...      ";&test("$nkf -w32B0",h("82A0"),h("00003042"));
print "SJIS to UTF-32BE...    ";&test("$nkf --oc=UTF-32BE",h("82A0"),h("00003042"));
print "SJIS to UTF-32BE-BOM...";&test("$nkf --oc=UTF-32BE-BOM",h("82A0"),h("0000FEFF00003042"));
print "SJIS to -w32L...       ";&test("$nkf -w32L",h("82A0"),h("FFFE000042300000"));
print "SJIS to -w32L0...      ";&test("$nkf -w32L0",h("82A0"),h("42300000"));
print "SJIS to UTF-32LE...    ";&test("$nkf --oc=UTF-32LE",h("82A0"),h("42300000"));
print "SJIS to UTF-32LE-BOM...";&test("$nkf --oc=UTF-32LE-BOM",h("82A0"),h("FFFE000042300000"));


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

# UTF8_STR_OF_JIS_SECOND_LEVEL_KANJI
$example{'utf8_str_of_jis_second_level_kanji'} = "\xe9\xa4\x83\xe5\xad\x90";

printf "%-40s", "UTF8_STR_OF_JIS_SECOND_LEVEL_KANJI";
    &test("$nkf -w",$example{'utf8_str_of_jis_second_level_kanji'},
	    $example{'utf8_str_of_jis_second_level_kanji'});

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
    &test("$nkf -sE --cp932",$example{'test_data/cp932.ans'},$example{'test_data/cp932'});

# test_data/no-cp932inv

$example{'test_data/no-cp932inv.ans'} = unpack('u',<<'eofeof');
%[N\@[NP`
eofeof

printf "%-40s", "test_data/no-cp932inv";
    &test("$nkf -sE --no-cp932",$example{'test_data/cp932.ans'},$example{'test_data/no-cp932inv.ans'});
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

$example{'jisx0213_jis2000'} = unpack('u',<<'eofeof');
;&R0H3R(O+WU/54]]="A^>1LD*%`A(7YV&RA"
eofeof
$example{'jisx0213_jis2004'} = unpack('u',<<'eofeof');
;&R0H42(O+WU/54]]="A^>1LD*%`A(7YV&RA"
eofeof

$example{'jisx0213_utf8'} = unpack('u',<<'eofeof');
:[[R'Y:REY:V!Y;>+Y;>BZ;ZB\*""B?"JFK(`
eofeof

printf "%-40s", "Shift_JISX0213 to EUC-JISX0213";
    &test("$nkf --ic=Shift_JISX0213 --oc=EUC-JISX0213",$example{'jisx0213_sjis'},$example{'jisx0213_euc'});

printf "%-40s", "EUC-JISX0213 to Shift_JISX0213";
    &test("$nkf --ic=EUC-JISX0213 --oc=Shift_JISX0213",$example{'jisx0213_euc'},$example{'jisx0213_sjis'});

printf "%-40s", "ISO-2022-JP-3 to EUC-JISX0213";
    &test("$nkf --ic=ISO-2022-JP-3 --oc=EUC-JISX0213",$example{'jisx0213_jis2000'},$example{'jisx0213_euc'});

printf "%-40s", "ISO-2022-JP-2004 to EUC-JISX0213";
    &test("$nkf --ic=ISO-2022-JP-2004 --oc=EUC-JISX0213",$example{'jisx0213_jis2004'},$example{'jisx0213_euc'});

printf "%-40s", "EUC-JISX0213 to ISO-2022-JP-2004";
    &test("$nkf --ic=EUC-JISX0213 --oc=ISO-2022-JP-2004",$example{'jisx0213_euc'},$example{'jisx0213_jis2004'});

printf "%-40s", "EUC-JISX0213 to UTF-8";
    &test("$nkf --ic=EUC-JISX0213 -w",$example{'jisx0213_euc'},$example{'jisx0213_utf8'});

printf "%-40s", "UTF-8 to EUC-JISX0213";
    &test("$nkf -W --oc=EUC-JISX0213",$example{'jisx0213_utf8'},$example{'jisx0213_euc'});

printf "%-40s",  "ISO-2022-JP-{1,3,2004} to UTF-8";
    &test("$nkf --ic=iso-2022-jp-2004 -w",
	"\x1b\$B5Y\x1b\$(O~e\x1b\$(Q.!\x1b\$(P#M\x1b\$(D\\e\x1b(B",
	"\xe4\xbc\x91\xe9\xb7\x97\xe4\xbf\xb1\xe5\x8c\x8b\xe8\xa4\xb1");
printf "%-40s",  "UTF-8 to ISO-2022-JP-2004";
    &test("$nkf -W --oc=iso-2022-jp-2004",
	"\xe4\xbc\x91\xe9\xb7\x97\xe4\xbf\xb1\xe5\x8c\x8b\xe8\xa4\xb1",
	"\x1b\$(Q5Y~e.!\x1b\$(P#M\x1b(B");

# test_data/jisx0213nonbmp

$example{'test_data/jisx0213nonbmp'} = unpack('u',<<'eofeof');
MKJ*OPJ_,K^"O^\_4S^//[O6Z]?+VJ?:R]N#W[/C^^:GYQ_G4^>[ZW?NS^\G[
M[/S)_-'^YH^AH8^AJX^AKH^AMH^AQH^A\(^A]X^A^8^CHH^CI8^CIX^CL8^C
MLH^CN(^COX^CP8^CRH^CTH^CTX^CV8^CW(^C]X^DJH^DL8^DLH^DNH^DO8^D
MV8^DW(^DWH^DXX^DZH^DZX^D\H^D](^D]8^EI8^ELH^EOH^EQ(^EQX^EU8^E
MUH^E_H^HL(^HMX^HN(^HNH^HNX^HOX^HP(^HQ8^HR(^HRH^HRX^HVX^HYH^H
M[(^LHH^LJX^LL(^LT(^LY8^L[8^L\H^MI(^MJ8^MJH^MLH^MM(^MM8^MN8^M
MUH^M_8^NHX^NI(^NNH^NO(^NO8^NPH^NPX^NQ(^NQX^NR8^NU8^NUH^NUX^N
MVX^N]X^N^(^OJH^OOX^OP(^OPH^OPX^OSH^OV8^OX8^OZ8^OZH^O\(^O]8_N
MHX_NM(_NR8_NW(_NWH_NWX_NX(_OLH_OQX_OS8_OX8_OY(_PHH_PLX_PN8_P
MTX_P^X_QKH_QL(_QM8_QQ(_QW8_QX8_QYH_QZ8_Q]8_Q]X_Q^H_RH8_RHX_R
MI(_RJ(_RK(_RO8_RR(_RVX_R]8_R]H_SLH_SO8_SOH_SP(_STH_SW8_SWH_S
M\X_S](_S]8_S]X_S^X_S_8_THH_TI(_TIX_TKH_TKX_TM(_TM8_TO8_TPH_T
MSX_TZ8_TZX_T\H_T]8_T^8_UM8_UNH_UQH_UUH_UV(_UVH_UW8_UWX_UXX_U
MZH_U\(_U\X_VQ(_VSH_VW8_V]8_V_H_WH8_WHH_WLX_WMH_WY(_WY8_WZX_W
M[H_W\X_XJ8_XJH_XK(_XM(_XO(_XOH_XPH_XUH_XXX_X]X_X^8_X^H_YI8_Y
MKX_YLH_YN8_YPH_YR(_YV8_YWH_YYH_YZX_Y^H_Y_H_ZH8_ZK(_ZKX_ZSX_Z
MT(_ZUX_ZY8_ZYH_Z\8_Z\H_Z_H_[H8_[K(_[K8_[MH_[MX_[O8_[OH_[SH_[
MSX_[UX_[VH_[W(_[W8_[X8_[Y8_[YX_[Z8_[\8_\HH_\HX_\N(_\PH_\S(_\
MUH_\V8_\W8_\]H_]K(_]RX_]S(_]V8_]VX_]W8_]YX_][8_]\(_^I8_^J8_^
=JX_^LH_^M8_^TX_^V(_^VH_^[H_^\(_^\H_^]@H`
eofeof

$example{'test_data/jisx0213nonbmp.ans'} = unpack('u',<<'eofeof');
M\*"`B_"AB+WPH8R;\*&1KO"AHKWPH*Z?\*&:M/"AN+3PHX>$\*.7A/"CG+_P
MHYVC\*.SOO"DG['PI9*.\*64CO"EG;'PI:>$\*6VH?"FJ[_PIKF`\*>#M/"G
MFH3PJ(FW\*B/C?"JAI#PH(*)\*""HO"@@J3PH(:B\*"(D_"@C*OPH(Z!\*"-
ML?"@C[GPH)&*\*"4B?"@EY;PH)BH\*"=C_"@H(?PH*"Z\*"BN?"@I;SPH*:=
M\*"KD_"@K)WPH+6%\*"WH?"@NI7PH+FM\*"YI/"@O9_PH8B!\*&)E?"AB;OP
MH8FT\*&+I/"ABY?PH8N]\*&,MO"AC83PH8^$\*&1K?"AEY?PIK"I\*&9A_"A
MG(;PH9V"\*&G@_"AL9;PH;2M\*&UA?"AM;CPH;6B\*&VH?"AMISPH;:2\*&V
MM_"AMZ#PH;BS\*&\GO"AO;;PH;^Z\**%N_"BC)[PHHZM\**;L_"BH9OPHJ*K
M\**FC_"BJKCPHJV/\**MD/"BK8;PHK"=\**NIO"BL*3PHK>A\*.'@_"CA[7P
MHX:V\*.-LO"CCY/PHX^2\*./D/"CCZ3PHX^5\*./FO"CCY_PHY&*\*.1D?"C
MD8OPHY&E\*.3I/"CE9KPHY:4\*.8N?"CF8?PHYBX\*.8NO"CG)SPHYR,\*.=
MI/"CG[_PHY^G\*.@I/"CH+WPHZJ8\*.QO_"CM(#PH[6`\*.WNO"CM[GPH[>3
M\*.]OO"D@I;PI(2#\*2'AO"DA[[PI(Z\\*28J?"DFJ7PI**6\*2IC?"DK9;P
MI*VO\*2PEO"DM)3PI+B.\*2XM_"DN:KPI+J+\*6!BO"E@97PI82B\*6&J?"E
MAZ7PI8>-\*6(GO"EB8SPI9"N\*63F?"EEJ?PI9ZI\*6>M/"EIY3PI:ND\*6K
MH_"EJ['PI:ZR\*6QB_"EL:3PI;BN\*6YEO"EN:7PI;FB\*6[F/"ENX+PI;NH
M\*6\H_"EO9SPI;^@\*6_E/"F@(SPI;^[\*:`E_"F@:#PIH.M\*:)L/"FBH;P
MIHV,\*.TCO"FD(+PIIF^\*::L/"FG)WPIJ.=\*:CJO"FI9'PIJ6O\*:GG?"F
MJ)[PIJF8\*:JC/"FJK?PIK&S\*:SG?"FN:7PIKZ4\*:_N/"FO[;PIK^W\*>$
MC?"GA+GPIX^;\*>/FO"GC[[PIY"0\*>1B?"GF)7PIYB4\*>8L?"GFI/PIYR.
M\*><H_"GG9+PIZ:%\*>JA/"GKK/PIZZ^\*>OA_"GLKCPI[:@\*>XD/"GOK?P
MJ(**\*B"N_"HBH+PJ(NS\*B0C/"HD97PJ)6K\*B7B/"HEXGPJ)N7\*B;NO"H
MI8GPJ*6&\*BEJ_"HIH?PJ*:(\*BFNO"HIKOPJ*B>\*BHJ?"HJ;'PJ*F#\*BJ
MF?"HJXWPJ*ND\*BKG?"HKX'PJ*^O\*BTD/"HM;'PJ+>[\*BXG_"HN+;PJ+J)
M\*B[J_"HO++PJ+^X\*F*H/"IBK'PJ9*0\*F7C_"IF;_PJ9NP\*F<F?"IG9#P
MJ:.&\*FILO"IMYOPJ;B]\*FXE?"INHKPJ;F)\*F[A/"INZGPJ;N;\*F_CO"J
K@*_PJH":\*J#N?"J@H+PHHB8\*J.C/"JD+?PJI>Q\*J8@O"JF)KPJIJR"@``
eofeof

printf "%-40s",  "EUC-JISX0213 to UTF-8 (not in BMP)";
    &test("$nkf --ic=euc-jisx0213 -w",$example{'test_data/jisx0213nonbmp'},$example{'test_data/jisx0213nonbmp.ans'});
printf "%-40s",  "UTF-8 to EUC-JISX0213 (not in BMP)";
    &test("$nkf -W --oc=euc-jisx0213",$example{'test_data/jisx0213nonbmp.ans'},$example{'test_data/jisx0213nonbmp'});

# test_data/jisx0213needx0213_f

$example{'test_data/jisx0213needx0213_f'} = unpack('u',<<'eofeof');
MXH*LPKS#B<.?P['%C<6"Q)C$C<6OR:[%B\63RJ+)FLN0RZ;+GN*=O^*%M^*3
MFN.+DN.+G^*8GO"@@(OE@(+EA(OCDYOEC:'EC:/EEH;OJ+CEG+/EHJGEI9WE
MB9WFD[?FF8CFFJ#FGKOFH;+CKK;GI(#OJ8WGIKCOJ97GKYGGL:WGM9SGN8?H
M@+?PIJN_Z(VBZ(ZGZ(^1Z)2CZ)F;Z)FLZ*"?[ZFA[ZFB[ZFD\*B)M^F"F>F$
ME>F$I^>J@N>JN>>MI.>ML^>OL.>RIN>SM>2+G>>VI^>ZD>>]DO"CM([H@([P
MIIJPZ(2>\*:CG>B)B^^IG>B*M.B.E.B0C^B1O.B4F^B5D?"FO[;HF:_HFZ;H
MG+KHG;+HH(OPIYB4Z*.2Z*6%Y)JAZ*BUY)R,\*>NOO"GMJ#HM(GHN:SDH8[H
MOK;HO['I@K#IA8;IA9GIB9'PJ*:(Z8N&Z8N[Z8V:Z9")Z96XZ9J]Z9N:Z9Z6
MZ:"EZ:*\Z:.QZ:6`Z:B@Z:BQZ:NE\*FXO>FOKO"INZGIL:GPJH":Z;:9Z;B"
-\**(F/"JE['PJIJR"@``
eofeof

$example{'test_data/jisx0213needx0213_f.ans'} = unpack('u',<<'eofeof');
MJ:&ILZG`J=6IYZG^JJZJOJK,JM6JZZKZJZJKO:O#J]6KX:OQK*JLO*S+K-VL
MZJW^KJ*NO*[,KMNN[Z[PKZJOMJ_%K]^OZ:_^]:3UN/7$]=CUX_7^^:WYM/G$
M^='YYOGP^J3ZM/K(^MWZ[?KY^Z'[MOO.^]+[Y_OY_*_\N/S)_-W\[/SPC_.M
MC_.TC_/.C_/1C_/CC_/VC_2HC_2[C_3$C_3>C_3JC_3UC_6EC_6ZC_7!C_76
MC_7KC_7TC_:BC_:WC_;!C_;2C_;FC_;PC_>AC_>[C_?.C_?:C_?BC_?\C_BJ
MC_BSC_C`C_C.C_C8C_CKC_CYC_FOC_FSC_G/C_G<C_GJC_GTC_JHC_J^C_K!
MC_K=C_KFC_KVC_NDC_NQC_O%C_O2C_OOC_OSC_RDC_R\C_S&C_S2C_SDC_S^
EC_VAC_VTC_W,C_W8C_WMC_WVC_ZKC_Z\C_[-C_[3C_[NC_[V"@``
eofeof

printf "%-40s",  "test_data/jisx0213needx0213_f    ";
    &test("$nkf -W --oc=euc-jisx0213",$example{'test_data/jisx0213needx0213_f'},$example{'test_data/jisx0213needx0213_f.ans'});

# test_data/shift_jisx0213-utf8-need-no-cp932

$example{'test_data/shift_jisx0213-utf8-need-no-cp932'} = unpack('u',<<'eofeof');
M[4#M3NU/[5/M7NU?[6;M;>UO[7#M=^U][7[MA.V-[8_MGNV?[:OMKNVO[;[M
MO^W"[<[MS^W0[=[MW^WL[>[M[^W[[?SN1>Y.[D_N4>Y>[E_N;>YO[GWN?NZ'
F[HWNC^Z0[I[NG^ZF[J[NK^ZV[K_NQ^[.[L_NT.[?[NSN[^[[[OP`
eofeof

$example{'test_data/shift_jisx0213-utf8-need-no-cp932.ans'} = unpack('u',<<'eofeof');
MYZ&#YZ2<YZ2N[ZF-[ZF2[ZF3\*6=L>>HN>>IK>^IE>>KJ^>MCN>MH.^IEN2)
MI.>QF>>TL>>U@>>WH^>XB.>XD>>_G^>_K.^IF^B%H.B%I^B%J.B*H^B*I.B,
MHNB,NNB-@^B/A^B/C^B0BNB2M.B2NNB3@NB6HNB6L.B9F^B9HNB>K>B>M>B@
MG^BCM>^IH.BDF.BHE>BHHNBIN>^IH^BMAN^II.BWCO"HB;?HO93PJ(^-Z+ZF
/Z8*^Z82BZ82OZ8>[Z8>D
eofeof

printf "%-40s",  "test_data/shift_jisx0213-utf8-need-no-cp932    ";
    &test("$nkf --ic=shift_jisx0213 -w",$example{'test_data/shift_jisx0213-utf8-need-no-cp932'},$example{'test_data/shift_jisx0213-utf8-need-no-cp932.ans'});

# jisx0213conflict-ibmext
$example{'shift_jisx0213conflict-ibmext'} = "\x87\x40\xed\x40\xee\xf6\xfa\x52\xfb\x45\xfb\xfc\xfc\x4b";
$example{'shift_jisx0213conflict-ibmext.x0213utf8'} = "\xe2\x91\xa0\xe7\xa1\x83\xe9\x86\x9e\xe8\xb4\x89\xe9\x8c\x8d\xe9\xa8\xa0\xf0\xa9\xa9\xb2";
$example{'shift_jisx0213conflict-ibmext.cp932utf8'} = "\xe2\x91\xa0\xe7\xba\x8a\xe2\x85\xb7\xe2\x85\xa8\xe6\xb7\xbc\xe9\xab\x99\xe9\xbb\x91";

printf "%-40s",  "Shift_JISX0213 to UTF-8 (ibmext etc)";
    &test("$nkf --ic=shift_jisx0213 -w",
    $example{'shift_jisx0213conflict-ibmext'},
    $example{'shift_jisx0213conflict-ibmext.x0213utf8'});

printf "%-40s",  "CP932 to UTF-8 (ibmext etc)";
    &test("$nkf --ic=cp932 -w",
    $example{'shift_jisx0213conflict-ibmext'},
    $example{'shift_jisx0213conflict-ibmext.cp932utf8'});

printf "%-40s",  "UTF-8 to Shift_JISX0213 (ibmext etc)";
    &test("$nkf --oc=shift_jisx0213 -W",
    $example{'shift_jisx0213conflict-ibmext.x0213utf8'},
    $example{'shift_jisx0213conflict-ibmext'});

printf "%-40s",  "UTF-8 to CP932 (ibmext etc)";
    &test("$nkf --oc=cp932 -W --cp932inv",
    $example{'shift_jisx0213conflict-ibmext.cp932utf8'},
    "\x87\x40\xfa\x5c\xfa\x47\x87\x5c\xfb\x45\xfb\xfc\xfc\x4b");
# test_data/jisx0213utf8comb

$example{'test_data/jisx0213utf8comb'} = unpack('u',<<'eofeof');
MI/>D^*3YI/JD^Z7WI?BE^:7ZI?NE_*7]I?ZF^*O$J\BKR:O*J\NKS*O-J\ZK
.SZOEJ^:KVJO<J^"KY`H`
eofeof

$example{'test_data/jisx0213utf8comb.ans'} = unpack('u',<<'eofeof');
MXX&+XX*:XX&-XX*:XX&/XX*:XX&1XX*:XX&3XX*:XX*KXX*:XX*MXX*:XX*O
MXX*:XX*QXX*:XX*SXX*:XX*[XX*:XX.$XX*:XX.(XX*:XX>WXX*:PZ;,@,F4
MS(#)E,R!RHS,@,J,S(')F<R`R9G,@<F:S(#)FLR!RZG+I<NERZG,@<R`RZ7+
"J0H`
eofeof

$example{'test_data/jisx0213utf8combr.ans'} = unpack('u',<<'eofeof');
MI/>D^*3YI/JD^Z7WI?BE^:7ZI?NE_*7]I?ZF^*O$J\BKR:O*J\NKS*O-J\ZK
,SZOEJ^:KVJO<J^8*
eofeof

printf "%-40s",  "EUC-JISX0213 to UTF-8 (combining)";
    &test("$nkf --ic=euc-jisx0213 -w",$example{'test_data/jisx0213utf8comb'},$example{'test_data/jisx0213utf8comb.ans'});
printf "%-40s",  "UTF-8 to EUC-JISX0213 (combining)";
    &test("$nkf -W --oc=euc-jisx0213",$example{'test_data/jisx0213utf8comb.ans'},$example{'test_data/jisx0213utf8combr.ans'});

# test_data/jisx0213comb

$example{'test_data/jisx0213comb'} = unpack('u',<<'eofeof');
MXX&+XX*:XX&-XX*:XX&/XX*:XX&1XX*:XX&3XX*:XX*KXX*:XX*MXX*:XX*O
MXX*:XX*QXX*:XX*SXX*:XX*[XX*:XX.$XX*:XX.(XX*:XX>WXX*:PZ;,@,F4
MS(#)E,R!RHS,@,J,S(')F<R`R9G,@<F:S(#)FLR!RZG+I<NERZG,@<R`RZ7+
"J0H`
eofeof

$example{'test_data/jisx0213comb.ans'} = unpack('u',<<'eofeof');
M,$LPFC!-,)HP3S":,%$PFC!3,)HPJS":,*TPFC"O,)HPL3":,+,PFC"[,)HP
MQ#":,,@PFC'W,)H`Y@,``E0#``)4`P$"C`,``HP#`0)9`P`"60,!`EH#``):
4`P$"Z0+E`N4"Z0,!`P`"Y0+I``H`
eofeof

printf "%-40s",  "UTF-8 to UTF-16BE (combining)";
    &test("$nkf -W --oc=utf-16be",$example{'test_data/jisx0213comb'},$example{'test_data/jisx0213comb.ans'});
printf "%-40s",  "UTF-16BE to UTF-8 (combining)";
    &test("$nkf --ic=utf-16be -w",$example{'test_data/jisx0213comb.ans'},$example{'test_data/jisx0213comb'});

printf "%-40s", "UTF-32BE to EUC-JISX0213 (w/o comb char)";
    &test("$nkf --ic=UTF-32BE --oc=euc-jisx0213",h("000030AB"),h("A5AB"));
printf "%-40s", "UTF-16LE to EUC-JISX0213 (w/o comb char)";
    &test("$nkf --ic=utf-16le --oc=euc-jisx0213",h("AB30"),h("A5AB"));
printf "%-40s", "UTF-8 to EUC-JISX0213 (w/o comb char)";
    &test("$nkf --ic=utf-8 --oc=euc-jisx0213",h("E382AB"),h("A5AB"));

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
    &test("$nkf -w16B0 --ic=Shift_JIS",$example{'ms_ucs_map_1_sjis'},$example{'ms_ucs_map_1_utf16'});

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
printf "%-40s", "-wZ"; &test("$nkf -wZ",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	"\xE3\x80\x80aA&\xE3\x82\xA2");
printf "%-40s", "-wZ0"; &test("$nkf -wZ0",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	"\xE3\x80\x80aA&\xE3\x82\xA2");
printf "%-40s", "-wZ1"; &test("$nkf -wZ1",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	" aA&\xE3\x82\xA2");
printf "%-40s", "-wZ2"; &test("$nkf -wZ2",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	"  aA&\xE3\x82\xA2");
printf "%-40s", "-wZ3"; &test("$nkf -wZ3",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	"\xE3\x80\x80aA&amp;\xE3\x82\xA2");
printf "%-40s", "-wZ4"; &test("$nkf -wZ4",
	"\xE3\x80\x80\xEF\xBD\x81\xEF\xBC\xA1&\xE3\x82\xA2",
	"\xE3\x80\x80aA&\xEF\xBD\xB1");
# -x means X0201 output
printf "%-40s", "X0201 output: SJIS";
    &test("$nkf -xs",$example{'x0201.euc'},$example{'x0201.sjis'});
printf "%-40s", "X0201 output: JIS";
    &test("$nkf -xj",$example{'x0201.sjis'},$example{'x0201.jis'});
printf "%-40s", "X0201 output: EUC";
    &test("$nkf -xe",$example{'x0201.jis'},$example{'x0201.euc'});
printf "%-40s", "X0201 output: UTF8";
    &test("$nkf -xw",$example{'x0201.jis'},$example{'x0201.utf'});
# test_data/x0201jis=

$example{'test_data/x0201jis=.ans'} = unpack('u',<<'eofeof');
MH:*CI*6FIZBIJJNLK:ZOL+&RL[2UMK>XN;J[O+V^O\#!PL/$Q<;'R,G*R\S-
2SL_0T=+3U-76U]C9VMO<W=[?
eofeof

printf "%-40s",  "X0201 JIS contains '='";
    &test("$nkf -xs",
    "\x1b(I!\"#\$%&'()*+,-./0123456789:;<=>?\@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_\x1b(B",
    $example{'test_data/x0201jis=.ans'});
# test_data/Xx0213

$example{'test_data/Xx0213'} = unpack('u',<<'eofeof');
M[[VV[[Z?[[VW[[Z?[[VX[[Z?[[VY[[Z?[[VZ[[Z?[[V^[[Z?[[Z"[[Z?[[Z$
*[[Z?XX>WXX*:"@``
eofeof

$example{'test_data/Xx0213.ans'} = unpack('u',<<'eofeof');
3I?>E^*7YI?JE^Z7\I?VE_J;X"@``
eofeof

printf "%-40s",  "test_data/Xx0213    ";
    &test("$nkf -X -W --oc=euc-jisx0213",$example{'test_data/Xx0213'},$example{'test_data/Xx0213.ans'});
# test_data/xx0213

$example{'test_data/xx0213'} = unpack('u',<<'eofeof');
M[[VV[[Z?[[VW[[Z?[[VX[[Z?[[VY[[Z?[[VZ[[Z?[[V^[[Z?[[Z"[[Z?[[Z$
*[[Z?XX>WXX*:"@``
eofeof

$example{'test_data/xx0213.ans'} = unpack('u',<<'eofeof');
CCK:.WXZWCM^.N([?CKF.WXZZCM^.OH[?CL*.WX[$CM^F^`H`
eofeof

printf "%-40s",  "test_data/xx0213    ";
    &test("$nkf -x -W --oc=euc-jisx0213",$example{'test_data/xx0213'},$example{'test_data/xx0213.ans'});
# test_data/Z4x0213

$example{'test_data/Z4x0213'} = unpack('u',<<'eofeof');
3I?>E^*7YI?JE^Z7\I?VE_J;X"@``
eofeof

$example{'test_data/Z4x0213.ans'} = unpack('u',<<'eofeof');
M[[VV[[Z?[[VW[[Z?[[VX[[Z?[[VY[[Z?[[VZ[[Z?[[V^[[Z?[[Z"[[Z?[[Z$
*[[Z?XX>WXX*:"@``
eofeof

printf "%-40s",  "test_data/Z4x0213    ";
    &test("$nkf -Z4 --ic=euc-jisx0213 -w",$example{'test_data/Z4x0213'},$example{'test_data/Z4x0213.ans'});
# test_data/Z4comb

$example{'test_data/Z4comb'} = unpack('u',<<'eofeof');
MXX""XX",XX"-XX"!XX.[XX.\XX*;XX*<XX*AXX*BXX*CXX*DXX*EXX*FXX*G
MXX*HXX*IXX*JXX*KXX*LXX*MXX*NXX*OXX*PXX*QXX*RXX*SXX*TXX*UXX*V
MXX*WXX*XXX*YXX*ZXX*[XX*\XX*]XX*^XX*_XX.`XX.!XX."XX.#XX.$XX.%
MXX.&XX.'XX.(XX.)XX.*XX.+XX.,XX.-XX..XX./XX.0XX.1XX.2XX.3XX.4
MXX.5XX.6XX.7XX.8XX.9XX.:XX.;XX.<XX.=XX.>XX.?XX.@XX.AXX.BXX.C
MXX.DXX.EXX.FXX.GXX.HXX.IXX.JXX.KXX.LXX.MXX.OXX.RXX.SXX.TXX*K
MXX*:XX*MXX*:XX*OXX*:XX*QXX*:XX*SXX*:XX*[XX*:XX.$XX*:XX.(XX*:
-XX>WXX*:XX*BXX*9"@``
eofeof

$example{'test_data/Z4comb.ans'} = unpack('u',<<'eofeof');
MCJ&.HHZCCJ2.I8ZPCMZ.WXZGCK&.J(ZRCJF.LXZJCK2.JXZUCK:.MH[>CK>.
MMX[>CKB.N([>CKF.N8[>CKJ.NH[>CKN.NX[>CKR.O([>CKV.O8[>CKZ.OH[>
MCK^.OX[>CL".P([>CL&.P8[>CJ^.PH["CMZ.PX[#CMZ.Q([$CMZ.Q8[&CL>.
MR([)CLJ.RH[>CLJ.WX[+CLN.WH[+CM^.S([,CMZ.S([?CLV.S8[>CLV.WX[.
MCLZ.WH[.CM^.SX[0CM&.TH[3CJR.U(ZMCM6.KH[6CM>.V([9CMJ.VX[<CJ:.
LW8ZSCMZ.MH[?CK>.WXZXCM^.N8[?CKJ.WXZ^CM^.PH[?CL2.WZ;XCK&.W@H`
eofeof

printf "%-40s",  "test_data/Z4comb    ";
    &test("$nkf -Z4 -W --oc=euc-jisx0213",$example{'test_data/Z4comb'},$example{'test_data/Z4comb.ans'});

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
    &test("$nkf -jml",$example{'mime.is8859'},$example{'mime.is8859.ans'});

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

$example{'test_data/mime_out.ans.alt3'} = unpack('u',<<'eofeof');
M"BTM+2T*4W5B:F5C=#H@86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@
M86%A82!A86%A(&%A86$@86%A82!A86%A(&%A86$@86%A80H@86%A80HM+2TM
M"E-U8FIE8W0Z(#T_25-/+3(P,C(M2E`_0C]'>5)#2D-):TI#46U*0V=K2VE1
M<DI#,&M,>5%X2D1-:TY343-*1&MK3WE1.4=Y:$,_/0H@/3])4T\M,C`R,BU*
M4#]"/T=Y4D-*1#AK45-214I%66M30U)+2D5S:U1#4DY*131K5'E24TI&56M7
M0U)B2D8T:UAX<V]19ST]/ST*(#T_25-/+3(P,C(M2E`_0C]'>5)#2D=!:UE3
M4FE*1U%K2D-2;4I#9VMA0G-O46<]/3\]"BTM+2T*4W5B:F5C=#H@86%A82!A
M86%A(&%A86$@86%A82!A86%A(&%A86$@86%A82`]/TE33RTR,#(R+4I0/T(_
M1WE20TI#26M*0G-O46<]/3\]"B`]/TE33RTR,#(R+4I0/T(_1WE20TI#66M+
D0U%Q1WEH0S\](&%A86$@86%A82!A86%A(&%A86$*+2TM+0H*1
eofeof

printf "%-40s", "test_data/mime_out";
    &test("$nkf -jM",$example{'test_data/mime_out'},$example{'test_data/mime_out.ans'},$example{'test_data/mime_out.ans.alt'},$example{'test_data/mime_out.ans.alt2'},$example{'test_data/mime_out.ans.alt3'});
# test_data/mime_out3

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
# test_data/-Z4

$example{'test_data/-Z4'} = unpack('u',<<'eofeof');
MH:.AUJ'7H:*AIJ&\H:NAK*6AI:*EHZ6DI:6EIJ6GI:BEJ:6JI:NEK*6MI:ZE
MKZ6PI;&ELJ6SI;2EM:6VI;>EN*6YI;JENZ6\I;VEOJ6_I<"EP:7"I<.EQ*7%
MI<:EQZ7(I<FERJ7+I<RES:7.I<^ET*71I=*ETZ74I=6EUJ77I=BEV:7:I=NE
KW*7=I=ZEWZ7@I>&EXJ7CI>2EY:7FI>>EZ*7II>JEZZ7LI>VE[Z7RI?.E]```
eofeof

$example{'test_data/-Z4.ans'} = unpack('u',<<'eofeof');
MCJ&.HHZCCJ2.I8ZPCMZ.WXZGCK&.J(ZRCJF.LXZJCK2.JXZUCK:.MH[>CK>.
MMX[>CKB.N([>CKF.N8[>CKJ.NH[>CKN.NX[>CKR.O([>CKV.O8[>CKZ.OH[>
MCK^.OX[>CL".P([>CL&.P8[>CJ^.PH["CMZ.PX[#CMZ.Q([$CMZ.Q8[&CL>.
MR([)CLJ.RH[>CLJ.WX[+CLN.WH[+CM^.S([,CMZ.S([?CLV.S8[>CLV.WX[.
MCLZ.WH[.CM^.SX[0CM&.TH[3CJR.U(ZMCM6.KH[6CM>.V([9CMJ.VX[<CJ:.
%W8ZSCMX`
eofeof

printf "%-40s", "test_data/-Z4    ";
    &test("$nkf -eEZ4",$example{'test_data/-Z4'},$example{'test_data/-Z4.ans'});
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
# test_data/q-encode-utf-8

$example{'test_data/q-encode-utf-8'} = <<'eofeof';
=?utf-8?Q?=E3=81=82=E3=81=84=E3=81=86=E3=81=88=E3=81=8A?=
=?utf-8?Q?=E3=81=8B=E3=81=8D=E3=81=8F=E3=81=91=E3=81=93?=
eofeof

$example{'test_data/q-encode-utf-8.ans'} = <<"eofeof";
\xE3\x81\x82\xE3\x81\x84\xE3\x81\x86\xE3\x81\x88\xE3\x81\x8A
\xE3\x81\x8B\xE3\x81\x8D\xE3\x81\x8F\xE3\x81\x91\xE3\x81\x93
eofeof

printf "%-40s", "test_data/q-encode-utf-8";
    &test("$nkf -w",$example{'test_data/q-encode-utf-8'},$example{'test_data/q-encode-utf-8.ans'});
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
    &test("$nkf -j",$example{'test_data/slash'},$example{'test_data/slash.ans'});
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
# test_data/forum15899

$example{'test_data/forum15899'} = unpack('u',<<'eofeof');
I6#H@XX&"XX&$XX&&XX&(XX&*XX&+XX&-XX&/XX&1XX&3XX&5(..!EPH`
eofeof

$example{'test_data/forum15899.ans'} = unpack('u',<<'eofeof');
M6#H@/3])4T\M,C`R,BU*4#]"/T=Y4D-*0TEK2D-1;4I#9VM+:5%R2D,P:TQY
=47A*1$UK3E)S;U%I06)*14EK3GAS;U%G/3T_/0H`
eofeof

printf "%-40s", "test_data/forum15899";
    &test("$nkf -Mj",$example{'test_data/forum15899'},$example{'test_data/forum15899.ans'});
# test_data/bugs10904

$example{'test_data/bugs10904'} = unpack('u',<<'eofeof');
M4W5B:F5C=#H@Z*FFZ:B3YY2HXX.AXX.\XX.KZ*&HZ:&,(.BIINFHD^>4J..#
MH>.#O..#J^BAJ.FAC"#HJ:;IJ)/GE*CC@Z'C@[SC@ZOHH:CIH8P@Z*FFZ:B3
3YY2HXX.AXX.\XX.KZ*&HZ:&,"@``
eofeof

$example{'test_data/bugs10904.ans'} = unpack('u',<<'eofeof');
M4W5B:F5C=#H@/3])4T\M,C`R,BU*4#]"/T=Y4D-/,C0T33`Q4DI716A00U9R
?4U0Q0V%H<V]1:4%B2D5)-V)J9WI45D5B2T5)/3\]"@``
M(#T_25-/+3(P,C(M2E`_0C]'>5)#2E=%:%!#5G)35#%#86AS;U%I06)*14DW
?8FIG>E1616Q94T4X2E=T2E!52G%'>6A#24$]/3\]"@``
M(#T_25-/+3(P,C(M2E`_0C]'>5)#3S(T-$TP,5)*5T5H4$-6<E-4,4-A:'-O
'46<]/3\]"@``
eofeof

printf "%-40s", "test_data/bugs10904";
    &test("$nkf -Mj",$example{'test_data/bugs10904'},$example{'test_data/bugs10904.ans'});

printf "%-40s", "test_data/ruby-dev:39722";
    &test("$nkf -MjW",<<eom,<<eom);
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\xE3\x81\x82
eom
=?US-ASCII?Q?aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa?=
 =?US-ASCII?Q?aaaaaaaaaaaaaaaaa?= =?ISO-2022-JP?B?GyRCJCIbKEI=?=
eom
# test_data/bug19779

$example{'test_data/bug19779'} = unpack('u',<<'eofeof');
2&R1","$;*$(*&R1"7V8;*$(*
eofeof

$example{'test_data/bug19779.ans'} = unpack('u',<<'eofeof');
M/3])4T\M,C`R,BU*4#]"/T=Y4D--0T5B2T5)/3\]"CT_25-/+3(P,C(M2E`_
10C]'>5)#6#)98DM%23T_/0H`
eofeof

printf "%-40s",  "test_data/bug19779    ";
    &test("$nkf -jM",$example{'test_data/bug19779'},$example{'test_data/bug19779.ans'});

printf "%-40s",  "[nkf-forum:47327]    ";
    &test("$nkf -wM",pack('H*','feffd852de76d814dc45000a'),"=?UTF-8?B?8KSptvCVgYU=?=\n");

printf "%-40s",  "[nkf-forum:47334]    ";
    &test("$nkf -w",pack('H*','feff006100620063000a'),"abc\n");

printf "%-40s",  "[nkf-bug:20079]    ";
    &test("$nkf -jSxM","\xBB \xBB","=?ISO-2022-JP?B?GyhJOxsoQiAbKEk7GyhC?=");

printf "%-40s",  "[nkf-bug:20079]    ";
    &test("$nkf -SxMw8","\xBB \xBB","=?UTF-8?B?77u/7727IO+9uw==?=");

printf "%-40s",  "[nkf-forum:48850]    ";
    &test("$nkf -jSM",
	"From: \x82\xA0\x82\xA0\x82\xA0\x82\xA0\x82\xA0\x82\xA0\x82\xA0\x82\xA0\x82\xA0" .
	" <x-xxxx@xxxxxxxxxxxx.co.jp>\n",
	"From: =?ISO-2022-JP?B?GyRCJCIkIiQiJCIkIiQiJCIkIiQiGyhC?=" .
	" <x-xxxx@xxxxxxxxxxxx.co.jp>\n");

printf "%-40s",  "[nkf-bug:21393]-x  ";
    &test("$nkf --ic=UTF-8 --oc=CP932",
    "\xEF\xBD\xBC\xEF\xBE\x9E\xEF\xBD\xAC\xEF\xBD\xB0\xEF\xBE\x8F\xEF\xBE\x9D\xEF\xBD\xA5\xEF\xBE\x8E\xEF\xBE\x9F\xEF\xBE\x83\xEF\xBE\x84\xEF\xBD\xA1",
    "\xBC\xDE\xAC\xB0\xCF\xDD\xA5\xCE\xDF\xC3\xC4\xA1");

printf "%-40s",  "[nkf-bug:21393]-X  ";
    &test("$nkf --ic=UTF-8 --oc=CP932 -X",
    "\xEF\xBD\xBC\xEF\xBE\x9E\xEF\xBD\xAC\xEF\xBD\xB0\xEF\xBE\x8F\xEF\xBE\x9D\xEF\xBD\xA5\xEF\xBE\x8E\xEF\xBE\x9F\xEF\xBE\x83\xEF\xBE\x84\xEF\xBD\xA1",
    "\x83W\x83\x83\x81[\x83}\x83\x93\x81E\x83|\x83e\x83g\x81B");

printf "%-40s",  "[nkf-forum:65316]  ";
    &test("$nkf -xwW -f10",
    "\xEF\xBD\xB1\xEF\xBD\xB2\xEF\xBD\xB3\xEF\xBD\xB4\xEF\xBD\xB5\xEF\xBD\xB6\xEF\xBD\xB7\xEF\xBD\xB8\xEF\xBD\xB9\xEF\xBD\xBA\xEF\xBD\xBB\xEF\xBD\xBC\xEF\xBD\xBD\xEF\xBD\xBE\xEF\xBD\xBF\xEF\xBE\x80\xEF\xBE\x81\xEF\xBE\x82\xEF\xBE\x83\xEF\xBE\x84",
    "\xEF\xBD\xB1\xEF\xBD\xB2\xEF\xBD\xB3\xEF\xBD\xB4\xEF\xBD\xB5\xEF\xBD\xB6\xEF\xBD\xB7\xEF\xBD\xB8\xEF\xBD\xB9\xEF\xBD\xBA\n\xEF\xBD\xBB\xEF\xBD\xBC\xEF\xBD\xBD\xEF\xBD\xBE\xEF\xBD\xBF\xEF\xBE\x80\xEF\xBE\x81\xEF\xBE\x82\xEF\xBE\x83\xEF\xBE\x84\n");

printf "%-40s",  "[nkf-forum:65482]  ";
    &test("$nkf --ic=CP50221 --oc=CP932",
    "\x1b\x24\x42\x7f\x21\x80\x21\x1b\x28\x42\n",
    "\xf0\x40\xf0\x9f\x0a");

printf "%-40s",  "[nkf-bug:38800]  ";
    &test("$nkf -W -e --fb-java",
    "\xF0\xA0\xAE\xB7",
    "\\uD842\\uDFB7");

# [KNOWNBUG]
# printf "%-40s",  "[ruby-dev:47057]  ";
#     &test("$nkf -jW -M --cp932",
#     "\xe3\x80\x8c\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82 by \xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x81\x82\xe3\x80\x8d\xe3\x81\xae\xe3\x83\xac\xe3\x82\xb7\xe3\x83\x94",
#     "=?ISO-2022-JP?B?GyRCIVYkIiQiJCIkIiQiJCIkIiQiJCIkIiQiGyhC?= by\n =?ISO-2022-JP?B?GyRCJCIkIiQiJCIkIiQiJCIkIiQiJCIhVyROJWwlNyVUGyhC?=");

printf "%-40s",  "[nkf-bug:32328] SJIS";
    &test("$nkf -Sw",
    "\x1b\x82\xa0",
    "\x1b\xe3\x81\x82");

printf "%-40s",  "[nkf-bug:32328] JIS";
    &test("$nkf -Jw",
    "\x1b\x1b\$B\$\x22\x1b(B",
    "\x1b\xe3\x81\x82");

printf "%-40s",  "[nkf-bug:36572]";
    &test("$nkf -sW --fb-html",
    "\xe6\xbf\xb9\xe4\xb8\x8a",
    "&#28665;\x8f\xe3");

    if (!NKF) {
printf "%-40s", "Guess NL";
&command_tests(
	"$nkf --guess","none",      "ASCII\n",
	"$nkf --guess","\n",        "ASCII (LF)\n",
	"$nkf --guess","\n\n",      "ASCII (LF)\n",
	"$nkf --guess","\n\r",      "ASCII (MIXED NL)\n",
	"$nkf --guess","\n\r\n",    "ASCII (MIXED NL)\n",
	"$nkf --guess","\n.\n",     "ASCII (LF)\n",
	"$nkf --guess","\n.\r",     "ASCII (MIXED NL)\n",
	"$nkf --guess","\n.\r\n",   "ASCII (MIXED NL)\n",
	"$nkf --guess","\r",        "ASCII (CR)\n",
	"$nkf --guess","\r\r",      "ASCII (CR)\n",
	"$nkf --guess","\r\r\n",    "ASCII (MIXED NL)\n",
	"$nkf --guess","\r.\n",     "ASCII (MIXED NL)\n",
	"$nkf --guess","\r.\r",     "ASCII (CR)\n",
	"$nkf --guess","\r.\r\n",   "ASCII (MIXED NL)\n",
	"$nkf --guess","\r\n",      "ASCII (CRLF)\n",
	"$nkf --guess","\r\n\n",    "ASCII (MIXED NL)\n",
	"$nkf --guess","\r\n\r",    "ASCII (MIXED NL)\n",
	"$nkf --guess","\r\n\r\n",  "ASCII (CRLF)\n",
	"$nkf --guess","\r\n.\n",   "ASCII (MIXED NL)\n",
	"$nkf --guess","\r\n.\r",   "ASCII (MIXED NL)\n",
	"$nkf --guess","\r\n.\r\n", "ASCII (CRLF)\n");
    }

printf "%-40s", "Convert NL to LF";
&command_tests(
	"$nkf -jLu","none",      "none",
	"$nkf -jLu","\n",        "\n",
	"$nkf -jLu","\n\n",      "\n\n",
	"$nkf -jLu","\n\r",      "\n\n",
	"$nkf -jLu","\n\r\n",    "\n\n",
	"$nkf -jLu","\n.\n",     "\n.\n",
	"$nkf -jLu","\n.\r",     "\n.\n",
	"$nkf -jLu","\n.\r\n",   "\n.\n",
	"$nkf -jLu","\r",        "\n",
	"$nkf -jLu","\r\r",      "\n\n",
	"$nkf -jLu","\r\r\n",    "\n\n",
	"$nkf -jLu","\r.\n",     "\n.\n",
	"$nkf -jLu","\r.\r",     "\n.\n",
	"$nkf -jLu","\r.\r\n",   "\n.\n",
	"$nkf -jLu","\r\n",      "\n",
	"$nkf -jLu","\r\n\n",    "\n\n",
	"$nkf -jLu","\r\n\r",    "\n\n",
	"$nkf -jLu","\r\n\r\n",  "\n\n",
	"$nkf -jLu","\r\n.\n",   "\n.\n",
	"$nkf -jLu","\r\n.\r",   "\n.\n",
	"$nkf -jLu","\r\n.\r\n", "\n.\n");

printf "%-40s", "Convert NL to LF";
&command_tests(
	"$nkf -jLm","none",      "none",
	"$nkf -jLm","\n",        "\r",
	"$nkf -jLm","\n\n",      "\r\r",
	"$nkf -jLm","\n\r",      "\r\r",
	"$nkf -jLm","\n\r\n",    "\r\r",
	"$nkf -jLm","\n.\n",     "\r.\r",
	"$nkf -jLm","\n.\r",     "\r.\r",
	"$nkf -jLm","\n.\r\n",   "\r.\r",
	"$nkf -jLm","\r",        "\r",
	"$nkf -jLm","\r\r",      "\r\r",
	"$nkf -jLm","\r\r\n",    "\r\r",
	"$nkf -jLm","\r.\n",     "\r.\r",
	"$nkf -jLm","\r.\r",     "\r.\r",
	"$nkf -jLm","\r.\r\n",   "\r.\r",
	"$nkf -jLm","\r\n",      "\r",
	"$nkf -jLm","\r\n\n",    "\r\r",
	"$nkf -jLm","\r\n\r",    "\r\r",
	"$nkf -jLm","\r\n\r\n",  "\r\r",
	"$nkf -jLm","\r\n.\n",   "\r.\r",
	"$nkf -jLm","\r\n.\r",   "\r.\r",
	"$nkf -jLm","\r\n.\r\n", "\r.\r");

printf "%-40s", "Convert NL to CRLF";
&command_tests(
	"$nkf -jLw","none",      "none",
	"$nkf -jLw","\n",        "\r\n",
	"$nkf -jLw","\n\n",      "\r\n\r\n",
	"$nkf -jLw","\n\r",      "\r\n\r\n",
	"$nkf -jLw","\n\r\n",    "\r\n\r\n",
	"$nkf -jLw","\n.\n",     "\r\n.\r\n",
	"$nkf -jLw","\n.\r",     "\r\n.\r\n",
	"$nkf -jLw","\n.\r\n",   "\r\n.\r\n",
	"$nkf -jLw","\r",        "\r\n",
	"$nkf -jLw","\r\r",      "\r\n\r\n",
	"$nkf -jLw","\r\r\n",    "\r\n\r\n",
	"$nkf -jLw","\r.\n",     "\r\n.\r\n",
	"$nkf -jLw","\r.\r",     "\r\n.\r\n",
	"$nkf -jLw","\r.\r\n",   "\r\n.\r\n",
	"$nkf -jLw","\r\n",      "\r\n",
	"$nkf -jLw","\r\n\n",    "\r\n\r\n",
	"$nkf -jLw","\r\n\r",    "\r\n\r\n",
	"$nkf -jLw","\r\n\r\r\n",  "\r\n\r\n\r\n",
	"$nkf -jLw","\r\n.\n",   "\r\n.\r\n",
	"$nkf -jLw","\r\n.\r",   "\r\n.\r\n",
	"$nkf -jLw","\r\n.\r\n", "\r\n.\r\n");
# end

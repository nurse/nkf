INSTALLの仕方

	    Sun Sep  8 14:11:16 JST 2002

Makefile があるので、
    CC
    CFLAGS
    PERL
が正しいかどうかを確認して、
    make
してください。Linux, Solaris, Mac OS X で動作確認しています。

mkstemp がない場合は、config.h の #define OVERWRITE をコメントアウト
してください。

Perl モジュールを作るには、
    make perl
です。NKF.mod 下にできます。そちらで、perl Makefile.PL; make
でもOk。 Perl 5 以上で動作します。5.6, 5.8 で動作確認しています。

make test でテストが行われます。NKF.mod でも make test
が可能。


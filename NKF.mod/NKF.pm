## Copyright (C) 1996,1998
## Copyright (C) 2002
## 連絡先： 琉球大学情報工学科 河野 真治  mime/X0208 support
## （E-Mail Address: kono@ie.u-ryukyu.ac.jp）
## 連絡先： COW for DOS & Win16 & Win32 & OS/2
## （E-Mail Address: GHG00637@niftyserve.or.p）
##    
##    このソースのいかなる複写，改変，修正も許諾します。ただし、
##    その際には、誰が貢献したを示すこの部分を残すこと。
##    再配布や雑誌の付録などの問い合わせも必要ありません。
##    営利利用も上記に反しない範囲で許可します。
##    バイナリの配布の際にはversion messageを保存することを条件とします。
##    このプログラムについては特に何の保証もしない、悪しからず。
##    
##    Everyone is permitted to do anything on this program
##    including copying, modifying, improving, 
##    as long as you don't try to pretend that you wrote it.
##    i.e., the above copyright notice has to appear in all copies.  
##    Binar y distribution requires original version messages.
##    You don't have to ask before copying, redistribution or publishing.
##    THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE.


package NKF;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	nkf	nkf_continue	inputcode
);
$VERSION = '2.08';

bootstrap NKF $VERSION;

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

#
# =begin から =begin COMMAND までは Perl/NKF のドキュメント
# =begin COMMAND から =end までは nkf コマンドのドキュメント
# 

=head1 NAME

=begin

NKF - Perl extension for Network Kanji Filter

=begin COMMAND

nkf - Network Kanji Filter

=end

=head1 SYNOPSIS

=begin

  use NKF;
  $output = nkf("-s",$input);

=begin COMMAND

nkf B<[-butjnesliohrTVvwWJESZxXFfmMBOcdILg]> B<[>I<file ...>B<]>

=end

=head1 DESCRIPTION

=begin

This is a Perl Extension version of nkf (Netowrk Kanji Filter).
It converts the last argument and return converted result. Conversion
details are specified by flags before the last argument.

=end

B<Nkf> is a yet another kanji code converter among networks, hosts and terminals.
It converts input kanji code to designated kanji code
such as ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8 or UTF-16.

One of the most unique faculty of B<nkf> is the guess of the input kanji encodings.
It currently recognizes ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8 and UTF-16.
So users needn't set the input kanji code explicitly.

By default, X0201 kana is converted into X0208 kana.
For X0201 kana, SO/SI, SSO and ESC-(-I methods are supported.
For automatic code detection, nkf assumes no X0201 kana in Shift_JIS.
To accept X0201 in Shift_JIS, use B<-X>, B<-x> or B<-S>.

=head1 OPTIONS

=over

=item B<-b -u>

Output is buffered (DEFAULT), Output is unbuffered.

=item B<-j -s -e -w -w16>

Output code is ISO-2022-JP (7bit JIS), Shift_JIS, EUC-JP,
UTF-8N, UTF-16BE.
Without this option and compile option, ISO-2022-JP is assumed.

=item B<-J -S -E -W -W16>

Input assumption is JIS 7 bit, Shift_JIS, EUC-JP,
UTF-8, UTF-16LE.

=over

=item B<-J>

Assume  JIS input. It also accepts EUC-JP.
This is the default. This flag does not exclude Shift_JIS.

=item B<-S>

Assume Shift_JIS and X0201 kana input. It also accepts JIS.
EUC-JP is recognized as X0201 kana. Without B<-x> flag,
X0201 kana (halfwidth kana) is converted into X0208.

=item B<-E>

Assume EUC-JP input. It also accepts JIS.
Same as -J.

=back

=item B<-t>

No conversion.

=item B<-i[@B]>

Specify the Esc Seq for JIS X 0208-1978/83. (DEFAULT B)

=item B<-o[BJH]>

Specify the Esc Seq for ASCII/Roman. (DEFAULT B)

=item B<-r>

{de/en}crypt ROT13/47

=item B<-h[123] --hiragana --katakana --katakana-hiragana>

=over

=item B<-h1 --hiragana>

Katakana to Hiragana conversion.

=item B<-h2 --katakana>

Hiragana to Katakana conversion.

=item B<-h3 --katakana-hiragana>

Katakana to Hiragana and Hiragana to Katakana conversion.

=back

=item B<-T>

Text mode output (MS-DOS)

=item B<-l>

ISO8859-1 (Latin-1) support

=item B<-f[I<m> [- I<n>]]>

Folding on I<m> length with I<n> margin in a line.
Without this option, fold length is 60 and fold margin is 10.

=item B<-F>

New line preserving line folding.

=item B<-Z[0-3]>

Convert X0208 alphabet (Fullwidth Alphabets) to ASCII.

=over

=item B<-Z -Z0>

Convert X0208 alphabet to ASCII.

=item B<-Z1>

Converts X0208 kankaku to single ASCII space.

=item B<-Z2>

Converts X0208 kankaku to double ASCII spaces.

=item B<-Z3>

Replacing Fullwidth >, <, ", & into '&gt;', '&lt;', '&quot;', '&amp;' as in HTML.

=back

=item B<-X -x>

Assume X0201 kana in MS-Kanji.
With B<-X> or without this option, X0201 is converted into X0208 Kana.
With B<-x>, try to preserve X0208 kana and do not convert X0201 kana to X0208.
In JIS output, ESC-(-I is used. In EUC output, SSO is used.

=item B<-B[0-2]>

Assume broken JIS-Kanji input, which lost ESC.
Useful when your site is using old B-News Nihongo patch.

=over

=item B<-B1>

allows any char after ESC-( or ESC-$.

=item B<-B2>

forces ASCII after NL.

=back

=item B<-I>

Replacing non iso-2022-jp char into a geta character
(substitute character in Japanese).

=item B<-m[BQN0]>

MIME ISO-2022-JP/ISO8859-1 decode. (DEFAULT)
To see ISO8859-1 (Latin-1) -l is necessary.

=over

=item B<-mB>

Decode MIME base64 encoded stream. Remove header or other part before
conversion. 

=item B<-mQ>

Decode MIME quoted stream. '_' in quoted stream is converted to space.

=item B<-mN>

Non-strict decoding.
It allows line break in the middle of the base64 encoding.

=item B<-m0>

No MIME decode.

=back

=item B<-M>

MIME encode. Header style. All ASCII code and control characters are intact.

=over

=item B<-MB>

MIME encode Base64 stream.
Kanji conversion is performed before encoding, so this cannot be used as a picture encoder.

=item B<-MQ>

Perfome quoted encoding.

=back

=item B<-l>

Input and output code is ISO8859-1 (Latin-1) and ISO-2022-JP.
B<-s>, B<-e> and B<-x> are not compatible with this option.

=item B<-L[uwm] -d -c>

Convert line breaks.

=over

=item B<-Lu -d>

unix (LF)

=item B<-Lw -c>

windows (CRLF)

=item B<-Lm>

mac (CR)

Without this option, nkf doesn't convert line breaks.

=back

=item B<--fj --unix --mac --msdos --windows>

convert for these system

=item B<--jis --euc --sjis --mime --base64>

convert for named code

=item B<--jis-input --euc-input --sjis-input --mime-input --base64-input>

assume input system

=item B<--ic=I<input codeset> --oc=I<output codeset>>

Set the input or output codeset.
NKF supports following codesets and those codeset name are case insensitive.

=over

=item ISO-2022-JP

a.k.a. RFC1468, 7bit JIS, JUNET

=item EUC-JP (eucJP-nkf)

a.k.a. AT&T JIS, Japanese EUC, UJIS

=item eucJP-ascii

=item eucJP-ms

=item CP51932

Microsoft Version of EUC-JP.

=item Shift_JIS

a.k.a. SJIS, MS-Kanji

=item CP932

a.k.a. Windows-31J

=item UTF-8

same as UTF-8N

=item UTF-8N

UTF-8 without BOM

=item UTF-8-BOM

UTF-8 with BOM

=item UTF8-MAC (input only)

decomposed UTF-8

=item UTF-16

same as UTF-16BE

=item UTF-16BE

UTF-16 Big Endian without BOM

=item UTF-16BE-BOM

UTF-16 Big Endian with BOM

=item UTF-16LE

UTF-16 Little Endian without BOM

=item UTF-16LE-BOM

UTF-16 Little Endian with BOM

=back

=item B<--fb-{skip, html, xml, perl, java, subchar}>

Specify the way that nkf handles unassigned characters.
Without this option, --fb-skip is assumed.

=item B<--prefix=I<escape character>I<target character>..>

When nkf converts to Shift_JIS,
nkf adds a specified escape character to specified 2nd byte of Shift_JIS characters.
1st byte of argument is the escape character and following bytes are target characters.

=item B<--no-cp932ext>

Handle the characters extended in CP932 as unassigned characters.

=item B<--no-best-fit-chars>

When Unicode to Encoded byte conversion,
don't convert characters which is not round trip safe.
When Unicode to Unicode conversion,
with this and -x option, nkf can be used as UTF converter.
(In other words, without this and -x option, nkf doesn't save some characters)

When nkf convert string which related to path, you should use this opion.

=item B<--cap-input>

Decode hex encoded characters.

=item B<--url-input>

Unescape percent escaped characters.

=item B<--numchar-input>

Decode character reference, such as "&#....;".

=begin COMMAND

=item B<--in-place[=>I<SUFFIX>B<]>  B<--overwrite[=>I<SUFFIX>B<]>

Overwrite B<original> listed files by filtered result.

B<Note> --overwrite preserves timestamp of original files.

=item B<--guess>

Print guessed encoding.

=item B<--help>

Print nkf's help.

=item B<--version>

Print nkf's version.

=end

=item B<-->

Ignore rest of -option.

=back

=head1 AUTHOR

Copyright (C) 1987, FUJITSU LTD. (I.Ichikawa),2000 S. Kono, COW
Copyright (C) 2002-2006 Kono, Furukawa, Naruse, mastodon

=begin

=head1 SEE ALSO

perl(1).   nkf(1)

=end

=cut

# Copyright (c) 1987, Fujitsu LTD. (Itaru ICHIKAWA).
# Copyright (c) 1996-2018, The nkf Project.
# All rights reserved.
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
# claim that you wrote the original software. If you use this software
# in a product, an acknowledgment in the product documentation would be
# appreciated but is not required.
#
# 2. Altered source versions must be plainly marked as such, and must not be
# misrepresented as being the original software.
#
# 3. This notice may not be removed or altered from any source distribution.

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
$VERSION = '2.15';

bootstrap NKF $VERSION;

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

#
# 

=head1 NAME



nkf - Network Kanji Filter


=head1 SYNOPSIS



nkf B<[-butjnesliohrTVvwWJESZxXFfmMBOcdILg]> B<[>I<file ...>B<]>


=head1 DESCRIPTION


B<Nkf> is a yet another kanji code converter among networks, hosts and terminals.
It converts input kanji code to designated kanji code
such as ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8, UTF-16 or UTF-32.

One of the most unique faculty of B<nkf> is the guess of the input kanji encodings.
It currently recognizes ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8, UTF-16 and UTF-32.
So users needn't set the input kanji code explicitly.

By default, X0201 kana is converted into X0208 kana.
For X0201 kana, SO/SI, SSO and ESC-(-I methods are supported.
For automatic code detection, nkf assumes no X0201 kana in Shift_JIS.
To accept X0201 in Shift_JIS, use B<-X>, B<-x> or B<-S>.

multiple options are specifed as seprate strings, such as

  print nkf('--ic=UTF8-MAC', '-w', $string), "\n";

except the last arguments.

=head1 OPTIONS

=over

=item B<-J -S -E -W -W16 -W32 -j -s -e -w -w16 -w32>

Specify input and output encodings. Upper case is input.
cf. --ic and --oc.

=over

=item B<-J>

ISO-2022-JP (JIS code).

=item B<-S>

Shift_JIS and JIS X 0201 kana.
EUC-JP is recognized as X0201 kana. Without B<-x> flag,
JIS X 0201 Katakana (a.k.a.halfwidth kana) is converted into JIS X 0208.
If you use Windows, see Windows-31J (CP932).

=item B<-E>

EUC-JP.

=item B<-W>

UTF-8N.

=item B<-W16[BL][0]>

UTF-16.
B or L gives whether Big Endian or Little Endian.
0 gives whther put BOM or not.

=item B<-W32[BL][0]>

UTF-32.
B or L gives whether Big Endian or Little Endian.
0 gives whther put BOM or not.

=back

=item B<-b -u>

Output is buffered (DEFAULT), Output is unbuffered.

=item B<-t>

No conversion.

=item B<-i[@B]>

Specify the escape sequence for JIS X 0208.

=over

=item B<-i@>

Use ESC ( @. (JIS X 0208-1978)

=item B<-iB>

Use ESC ( B. (JIS X 0208-1983/1990 DEFAULT)

=back

=item B<-o[BJ]>

Specify the escape sequence for US-ASCII/JIS X 0201 Roman. (DEFAULT B)

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

Convert X0208 kankaku to single ASCII space.

=item B<-Z2>

Convert X0208 kankaku to double ASCII spaces.

=item B<-Z3>

Replacing fullwidth >, <, ", & into '&gt;', '&lt;', '&quot;', '&amp;' as in HTML.

=back

=item B<-X -x>

With B<-X> or without this option, X0201 is converted into X0208 Kana.
With B<-x>, try to preserve X0208 kana and do not convert X0201 kana to X0208.
In JIS output, ESC-(-I is used. In EUC output, SS2 is used.

=item B<-B[0-2]>

Assume broken JIS-Kanji input, which lost ESC.
Useful when your site is using old B-News Nihongo patch.

=over

=item B<-B1>

allows any chars after ESC-( or ESC-$.

=item B<-B2>

force ASCII after NL.

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

Perform quoted encoding.

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

Convert for these systems.

=item B<--jis --euc --sjis --mime --base64>

Convert to named code.

=item B<--jis-input --euc-input --sjis-input --mime-input --base64-input>

Assume input system

=item B<--ic=I<input codeset> --oc=I<output codeset>>

Set the input or output codeset.
NKF supports following codesets and those codeset names are case insensitive.

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

a.k.a. SJIS, MS_Kanji

=item Windows-31J

a.k.a. CP932

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

=item UTF-32

same as UTF-32BE

=item UTF-32BE

UTF-32 Big Endian without BOM

=item UTF-32BE-BOM

UTF-32 Big Endian with BOM

=item UTF-32LE

UTF-32 Little Endian without BOM

=item UTF-32LE-BOM

UTF-32 Little Endian with BOM

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

When nkf converts strings that related to path, you should use this opion.

=item B<--cap-input>

Decode hex encoded characters.

=item B<--url-input>

Unescape percent escaped characters.

=item B<--numchar-input>

Decode character reference, such as "&#....;".


=item B<--in-place[=>I<SUFFIX>B<]>  B<--overwrite[=>I<SUFFIX>B<]>

Overwrite B<original> listed files by filtered result.

B<Note> --overwrite preserves timestamps of original files.

=item B<--guess=[12]>

Print guessed encoding and newline. (2 is default, 1 is only encoding)

=item B<--help>

Print nkf's help.

=item B<--version>

Print nkf's version.


=item B<-->

Ignore rest of -option.

=back

=head1 AUTHOR

Copyright (c) 1987, Fujitsu LTD. (Itaru ICHIKAWA).

Copyright (c) 1996-2018, The nkf Project.


=cut

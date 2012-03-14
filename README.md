# NAME



nkf - Network Kanji Filter



# SYNOPSIS



nkf __[-butjnesliohrTVvwWJESZxXFfmMBOcdILg]__ __[___file ...___]__



# DESCRIPTION



__Nkf__ is a yet another kanji code converter among networks, hosts and terminals.
It converts input kanji code to designated kanji code
such as ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8, UTF-16 or UTF-32.

One of the most unique faculty of __nkf__ is the guess of the input kanji encodings.
It currently recognizes ISO-2022-JP, Shift_JIS, EUC-JP, UTF-8, UTF-16 and UTF-32.
So users needn't set the input kanji code explicitly.

By default, X0201 kana is converted into X0208 kana.
For X0201 kana, SO/SI, SSO and ESC-(-I methods are supported.
For automatic code detection, nkf assumes no X0201 kana in Shift_JIS.
To accept X0201 in Shift_JIS, use __-X__, __-x__ or __-S__.

# OPTIONS

- __-J -S -E -W -W16 -W32 -j -s -e -w -w16 -w32__

Specify input and output encodings. Upper case is input.
cf. --ic and --oc.

    - __-J__

    ISO-2022-JP (JIS code).

    - __-S__

    Shift_JIS and JIS X 0201 kana.
    EUC-JP is recognized as X0201 kana. Without __-x__ flag,
    JIS X 0201 Katakana (a.k.a.halfwidth kana) is converted into JIS X 0208.
    If you use Windows, see Windows-31J (CP932).

    - __-E__

    EUC-JP.

    - __-W__

    UTF-8N.

    - __-W16[BL][0]__

    UTF-16.
    B or L gives whether Big Endian or Little Endian.
    0 gives whther put BOM or not.

    - __-W32[BL][0]__

    UTF-32.
    B or L gives whether Big Endian or Little Endian.
    0 gives whther put BOM or not.

- __-b -u__

Output is buffered (DEFAULT), Output is unbuffered.

- __-t__

No conversion.

- __-i[@B]__

Specify the escape sequence for JIS X 0208.

    - __-i@__

    Use ESC ( @. (JIS X 0208-1978)

    - __-iB__

    Use ESC ( B. (JIS X 0208-1983/1990 DEFAULT)

- __-o[BJ]__

Specify the escape sequence for US-ASCII/JIS X 0201 Roman. (DEFAULT B)

- __-r__

{de/en}crypt ROT13/47

    - __-h[123] --hiragana --katakana --katakana-hiragana__
    - __-h1 --hiragana__

    Katakana to Hiragana conversion.

    - __-h2 --katakana__

    Hiragana to Katakana conversion.

    - __-h3 --katakana-hiragana__

    Katakana to Hiragana and Hiragana to Katakana conversion.

- __-T__

Text mode output (MS-DOS)

- __-f[_m_ [- _n_]]__

Folding on _m_ length with _n_ margin in a line.
Without this option, fold length is 60 and fold margin is 10.

- __-F__

New line preserving line folding.

- __-Z[0-3]__

Convert X0208 alphabet (Fullwidth Alphabets) to ASCII.

    - __-Z -Z0__

    Convert X0208 alphabet to ASCII.

    - __-Z1__

    Convert X0208 kankaku to single ASCII space.

    - __-Z2__

    Convert X0208 kankaku to double ASCII spaces.

    - __-Z3__

    Replacing fullwidth >, <, ", & into '&gt;', '&lt;', '&quot;', '&amp;' as in HTML.

- __-X -x__

With __-X__ or without this option, X0201 is converted into X0208 Kana.
With __-x__, try to preserve X0208 kana and do not convert X0201 kana to X0208.
In JIS output, ESC-(-I is used. In EUC output, SS2 is used.

- __-B[0-2]__

Assume broken JIS-Kanji input, which lost ESC.
Useful when your site is using old B-News Nihongo patch.

    - __-B1__

    allows any chars after ESC-( or ESC-$.

    - __-B2__

    force ASCII after NL.

- __-I__

Replacing non iso-2022-jp char into a geta character
(substitute character in Japanese).

- __-m[BQN0]__

MIME ISO-2022-JP/ISO8859-1 decode. (DEFAULT)
To see ISO8859-1 (Latin-1) -l is necessary.

    - __-mB__

    Decode MIME base64 encoded stream. Remove header or other part before
    conversion. 

    - __-mQ__

    Decode MIME quoted stream. '_' in quoted stream is converted to space.

    - __-mN__

    Non-strict decoding.
    It allows line break in the middle of the base64 encoding.

    - __-m0__

    No MIME decode.

- __-M__

MIME encode. Header style. All ASCII code and control characters are intact.

    - __-MB__

    MIME encode Base64 stream.
    Kanji conversion is performed before encoding, so this cannot be used as a picture encoder.

    - __-MQ__

    Perform quoted encoding.

- __-l__

Input and output code is ISO8859-1 (Latin-1) and ISO-2022-JP.
__-s__, __-e__ and __-x__ are not compatible with this option.

- __-L[uwm] -d -c__

Convert line breaks.

    - __-Lu -d__

    unix (LF)

    - __-Lw -c__

    windows (CRLF)

    - __-Lm__

    mac (CR)

    Without this option, nkf doesn't convert line breaks.

- __--fj --unix --mac --msdos --windows__

Convert for these systems.

- __--jis --euc --sjis --mime --base64__

Convert to named code.

- __--jis-input --euc-input --sjis-input --mime-input --base64-input__

Assume input system

- __--ic=_input codeset_ --oc=_output codeset___

Set the input or output codeset.
NKF supports following codesets and those codeset names are case insensitive.

    - ISO-2022-JP

    a.k.a. RFC1468, 7bit JIS, JUNET

    - EUC-JP (eucJP-nkf)

    a.k.a. AT&T JIS, Japanese EUC, UJIS

            - eucJP-ascii
        - eucJP-ms
    - CP51932

    Microsoft Version of EUC-JP.

    - Shift_JIS

    a.k.a. SJIS, MS_Kanji

    - Windows-31J

    a.k.a. CP932

    - UTF-8

    same as UTF-8N

    - UTF-8N

    UTF-8 without BOM

    - UTF-8-BOM

    UTF-8 with BOM

    - UTF8-MAC (input only)

    decomposed UTF-8

    - UTF-16

    same as UTF-16BE

    - UTF-16BE

    UTF-16 Big Endian without BOM

    - UTF-16BE-BOM

    UTF-16 Big Endian with BOM

    - UTF-16LE

    UTF-16 Little Endian without BOM

    - UTF-16LE-BOM

    UTF-16 Little Endian with BOM

    - UTF-32

    same as UTF-32BE

    - UTF-32BE

    UTF-32 Big Endian without BOM

    - UTF-32BE-BOM

    UTF-32 Big Endian with BOM

    - UTF-32LE

    UTF-32 Little Endian without BOM

    - UTF-32LE-BOM

    UTF-32 Little Endian with BOM

- __--fb-{skip, html, xml, perl, java, subchar}__

Specify the way that nkf handles unassigned characters.
Without this option, --fb-skip is assumed.

- __--prefix=_escape character__target character_..__

When nkf converts to Shift_JIS,
nkf adds a specified escape character to specified 2nd byte of Shift_JIS characters.
1st byte of argument is the escape character and following bytes are target characters.

- __--no-cp932ext__

Handle the characters extended in CP932 as unassigned characters.

- __--no-best-fit-chars__

When Unicode to Encoded byte conversion,
don't convert characters which is not round trip safe.
When Unicode to Unicode conversion,
with this and -x option, nkf can be used as UTF converter.
(In other words, without this and -x option, nkf doesn't save some characters)

When nkf converts strings that related to path, you should use this opion.

- __--cap-input__

Decode hex encoded characters.

- __--url-input__

Unescape percent escaped characters.

- __--numchar-input__

Decode character reference, such as "&#....;".



- __--in-place[=___SUFFIX___]__  __--overwrite[=___SUFFIX___]__

Overwrite __original__ listed files by filtered result.

__Note__ --overwrite preserves timestamps of original files.

- __--guess=[12]__

Print guessed encoding and newline. (2 is default, 1 is only encoding)

- __--help__

Print nkf's help.

- __--version__

Print nkf's version.



- __--__

Ignore rest of -option.

# AUTHOR

Copyright (c) 1987, Fujitsu LTD. (Itaru ICHIKAWA).

Copyright (c) 1996-2012, The nkf Project.


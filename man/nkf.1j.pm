=encoding euc-jp

=head1 NAME

nkf - ネットワーク用漢字コード変換フィルタ

=head1 SYNOPSIS

nkf B<[-butjnesliohrTVvwWJESZxXFfmMBOcdILg]> B<[>I<file ...>B<]>

=head1 DESCRIPTION

B<nkf> はネットワークでメールやニュースの読み書きをするために作られた、漢字コードの変換フィルタである。

このB<nkf>の特徴としては、入力漢字コード系の統計的な自動認識機能がある。
このため、利用者は、入力漢字コード系が何であるかを知らなくても、出力漢字コード系のみ指定すれば良いことになる。
ただ、この判定機構は、理論的には完全ではないが、通常のニュースやメールのメッセージについては確実に動作する安全なものにはなっている。

現在、B<nkf>が認識できる入力の漢字コード系は、いわゆる JIS コード (ISO-2022-JP に基づくもの)、Shift_JIS (MS 漢字コード)、
日本語 EUC (AT&T コード)、UTF-8、UTF-16 のいずれかである。
出力する漢字コード系も、これらである。
入力は、ファイルを指定しなければ、標準入力となる。
出力は標準出力である。


=head1 OPTIONS

指定できるオプションは、以下の通り。
B<-mu> のように続けることができる。

=over

=item B<-j>

JIS コードを出力する。

=item B<-e>

EUC コードを出力する。

=item B<-s>

Shift_JIS コードを出力する。

=item B<-w -w8[0] -w16[BL][0]>

Unicode を出力する。

=over

=item B<-w -w80>

UTF8 コードを出力する。 (BOM 無し)

=item B<-w8>

UTF8 コードを出力する。

=item B<-w16 -w16B0>

UTF16 コードを出力する。 (Big Endian / BOM 無し)

=item B<-w16B>

UTF16 コードを出力する。 (Big Endian / BOM 有り)

=item B<-w16L>

UTF16 コードを出力する。 (Little Endian / BOM 有り)

=item B<-w16L0>

UTF16 コードを出力する。 (Little Endian / BOM 無し)

=back

=item B<-m[BQSN0]>

MIME を解読する。(デフォルト)
ISO-2022-JP (B encode) と ISO-8859-1 (Q encode) のみを解読する。
ISO-8859-1 (Latin-1) を解読する時は、B<-l> フラグも必要である。
B<-m0> では MIME を解読しない。
B<-mB>, B<-mQ> では、BASE64, Q encode されているものとして処理する。

=over

=item B<-mB>

MIME base64 stream を解読する。
ヘッダなどは取り除くこと。

=item B<-mQ>

MIME quoted stream を解読する。

=item B<-mS>

MIME のチェックを厳しくする (デフォルト)

=item B<-mN>

MIME のチェックを緩くする

=item B<-m0>

MIME を解読しない。

=back

B<-mS> は、宣言の内容と、その後に続く encoded-text の整合性をチェックする。
B<-mN> は、改行で切られた MIME なども解読する。解読が止まらないこともある。

=item B<-M[BQ]>

MIME に変換する。

=over

=item B<-M>

ヘッダ形式に変換する

=item B<-MB>

base64 stream に変換する

=item B<-MQ>

Quoted stream に変換する

=back

=item B<-J -E -S -W>

期待される入力コードの性質を指定する。

=over

=item B<-J>

ISO-2022-JP を仮定する。

=item B<-E>

日本語 EUC (AT&T) を仮定する。

=item B<-S>

Shift_JIS を仮定する。
いわゆる半角カナ (JIS X 0201 片仮名) も受け入れる。

=item B<-W>

UTF-8 を仮定する。

=item B<-W8>

UTF-8 を仮定する。

=item B<-W16>

UTF-16 (Little Endian)を仮定する。

=item B<-W16B>

UTF-16 (Big Endian)を仮定する。

=item B<-W16L>

UTF-16 (Little Endian)を仮定する。

=back

=item B<-x>

通常おこなわれる、いわゆる半角カナ (JIS X 0201 片仮名)
からいわゆる全角カナ (JIS X 0208 片仮名) への変換を行わず、半角カナを保存する。
入力は、Shift_JIS の 1byte カナ、SO/SI、ESC-(-I, SSO を受け付ける。
出力は、日本語 EUC 中では SSO、JIS コード中では ESC-(-I をデフォルトで用いる。

=item B<-X>

いわゆる半角カナ (JIS X 0201 片仮名) を いわゆる全角カナ (JIS X 0208 片仮名) へと変換する。

=item B<-B>

壊れた (Broken) JIS コード。
ESC がなくなったと仮定する。

=over

=item B<-B1>

B<ESC-(>, B<ESC-$> のあとのコードを問わない

=item B<-B2>

改行のあとに強制的に ASCII に戻す

=back

=item B<-f>[I<m>[-I<n>]]

一行 I<m> 文字になるように、マージンを I<n> として簡単な整形をおこなう。
デフォルトは文字数は 60、マージンは 10 である。

=item B<-Z[0-3]>

JIS X 0208 英数字と若干の記号を ASCII に変換する。
つまり、全角を半角に変換する。

=over

=item B<-Z -Z0>

Convert X0208 alphabet to ASCII.

=item B<-Z1>

JIS X 0208 和字間隔を ASCII space 一つに変換する。

=item B<-Z2>

JIS X 0208 和字間隔を ASCII space 二つに変換する。

=item B<-Z3>

＞、＜、”、＆、を &gt;、&lt;、&quot;、&amp; に変換する。

=back

=item B<-b>

バッファリング出力を行う。(デフォルト)

=item B<-u>

出力時に、バッファリングしない。
ssh localhost | nkf -u というように使う。

=item B<-t>

何もしない。

=item B<-I>

ISO-2022-JP 以外の漢字コードを〓に変換。

=item B<-i[@B]>

JIS 漢字を指示するシーケンスを指定する。

=over

=item B<-i@>

JIS X 0208-1978 を用いる。

=item B<-iB>

JIS X 0208-1983/1990 を用いる。

=back

=item B<-o[BJH]>

1 バイト英数文字セットを指示するシーケンスを指定する。

=over

=item B<-oB>

1 バイト英数文字セットとして US-ASCII を用いる。

=item B<-oJ>

1 バイト英数文字セットとして JIS X 0201 Roman を用いる。

=item B<-oH>

ESC ( H は初期の JUNET コードでのみ用いられたもので、現在は使ってはならない。

=back

=item B<-r>

ROT13/47 の変換をする。

=item B<-g>

自動判別の結果を出力します。

=item B<-T>

テキストモードで出力する。(MS-DOS 上でのみ効力を持つ)

=item B<-l>

0x80-0xfe のコードを ISO-8859-1 (Latin-1) として扱う。
JIS コードアウトプットとの組合せみのみ有効。
B<-s, -e, -x> とは両立しない。

=item B<-O>

ファイルに出力する。
UNIX では不要な機能だが Windows や MSDOS では必要らしい。
直後の引き数でなく、最後のファイル名が出力ファイル名となり上書きされてしまうので注意。
ファイル名がない場合は nkf.out。

=item B<-L[uwm] -d -c>

改行コードを変換する。

=over

=item B<-Lu -d>

unix (LF)

=item B<-Lw -c>

windows (CRLF)

=item B<-Lm>

mac (CR)

=back

デフォルトでは変換しない。

=item B<--ic=<input_codeset> --oc=<output_codeset>>

入力・出力の漢字コード系を指定します。

=over

=item B<ISO-2022-JP>

いわゆる JIS コード。B<-j, -J> と同じ。

=item B<ISO-2022-JP-1>

RFC 2237 に定められた形式。 JIS X 0212 を含む。

=item B<ISO-2022-JP-3>

RFC 2237 に定められた形式。 JIS X 0213 を含む。

=item B<EUC-JP>

EUC コード。B<-e, -E> と同じ。

=item B<EUC-JISX0213>

文字集合に JIS X 0213:2000 を用いた EUC-JP。

=item B<EUC-JIS-2004>

文字集合に JIS X 0213:2004 を用いた EUC-JP。

=item B<eucJP-ascii>

オープングループ日本ベンダ協議会が定義した eucJP-ascii。
B<-x> が暗黙のうちに指定される。

=item B<eucJP-ms>

オープングループ日本ベンダ協議会が定義した euc-JPms。
B<-x> が暗黙のうちに指定される。

=item B<CP51932>

Micorosft Code Page 51932。
B<-x> が暗黙のうちに指定される。

=item B<Shift_JIS>

Shift_JIS。
B<-s, -S> と同じ。

=item B<Shift_JISX0213>

文字集合に JIS X 0213:2000 を用いた Shift_JIS。

=item B<Shift_JIS-2004>

文字集合に JIS X 0213:2004 を用いた Shift_JIS。

=item B<CP932>

Micorosft Code Page 932。
B<-x> が暗黙のうちに指定される。

=item B<UTF-8 UTF-8N>

BOM 無しの UTF-8。
B<-w, -W> と同じ。

=item B<UTF-8-BOM>

BOM 付きの UTF-8。B<-w8> または B<-W> と同じ。

=item B<UTF8-MAC>

UTF8-MAC。互換分解されたひらがな・カタカナ等を結合します。
入力のみの対応です。

=item B<UTF-16 UTF-16BE-BOM>

BOM 有りで Big Endian の UTF-16。
B<-w16B, -W16B> と同じ。

=item B<UTF-16BE>

BOM 無しで Big Endian の UTF-16。
B<-w16B0. -W16B> と同じ。

=item B<UTF-16LE-BOM>

BOM 有りで Little Endian の UTF-16。
B<-w16L, -W16L> と同じ。

=item B<UTF-16LE>

BOM 無しで Little Endian の UTF-16。
B<-w16L0, -W16L> と同じ。

=back

=item B<--fj --unix --mac --msdos  --windows>

これらのシステムに適した変換をします。


=item B<--jis --euc --sjis --mime --base64>

対応する変換をします。

=item B<--hiragana --katakana>

平仮名、片仮名変換

=item B<--fb-{skip, html, xml, perl, java, subchar}>

Unicode から Shift_JIS, EUC-JP, ISO-2022-JP に変換する際に、変換できなかった文字をどう扱うかを指定できます。

=item B<--prefix=I<escape character>I<target character>..>

EUC-JP から Shift_JIS への変換の際、2 バイト目
に現れた文字の前にエスケープ文字をつけることができます。
引数の 1 文字目がエスケープ文字、2 文字目以降にエスケープされるべき文字を指定します。

例えば、

--prefix=\$@ とすると、Shift_JIS の 2 文字目に $ か @ が来たら、その前に \ が挿入されます
--prefix=@@ とすると、Shift_JIS の 2 文字目に @ が来たら、その前に @ が挿入されます

=item B<--no-cp932ext>

CP932 において拡張された、NEC 特殊文字、NEC 選定 IBM 拡張文字 (89-92 区)、IBM 拡張文字を変換しません。

=item B<--no-best-fit-chars>

Unicode からの変換の際に、往復安全性が確保されない文字の変換を行いません。
Unicode から Unicode の変換の際に -x と共に指定すると、nkf を UTF 形式の変換に用いることができます。
(逆に言えば、これを指定しないと一部の文字が保存されません)

パスに関わる文字列を変換する際には、このオプションを指定することを強く推奨します。

=item B<--cap-input, --url-input>

それぞれ :、% に続く 16 進数を文字に変換する

=item B<--numchar-input>

&#....; のような Unicode 文字参照を変換する

=item B<--in-place[=I<SUFFIX>]  --overwrite[=I<SUFFIX>]>

元のファイルを変換結果で置き換える。
複数のファイルを書き換えることも可能。
元のファイルのタイムスタンプとパーミッションが保持される。
現在、作成日時や inode は変更されるが、将来にわたってこの実装のままである保証は無い。

=item B<--guess>

自動判別の結果を出力する

=item B<--help>

コマンドの簡単な説明を表示する。

=item B<-V>

nkf の設定を表示する。

=item B<-v> B<--version>

nkf のバージョンを表示する。

=item B<-->

これ以降のオプションを無視する

=item B<--exec-in>

nkf [options] --exec-in cmd args... とやると、cmd の出力を nkf の入力とする
(config.h で EXEC_IO を define してコンパイルした時のみ有効)

=item B<--exec-out>

nkf [options] --exec-out cmd args... とやると、nkf の出力を cmd の入力とする
(config.h で EXEC_IO を define してコンパイルした時のみ有効)

=back

=head1 BUGS

実は、入力のコード系の判定は、Shift_JIS と EUC との自動判定であり、最初に特定できる文字が来た時点で確定してしまう。
そして、特定不能の間は保留バッファにためておかれ、確定後に処理される。
このため、7 ビット JIS は常に認識される。
Shift_JIS、EUC 混合もほとんどの場合は問題がない。
ただし、Shift_JIS のいわゆる半角カナ (JIS X 0201 片仮名) と EUC 漢字が識別できない。
したがって、デフォルトでは Shift_JIS のいわゆる半角カナはないと仮定している。
(つまり、Shift_JIS か EUC か迷った時は EUC とみなす)

Unicode の日本語以外の部分の変換には対応していないが、B<--no-best-fit-chars> を指定すれば、UTF-8 と UTF-16 の相互変換をすることは可能である。

=head1 ACKNOWLEDGE

以下のかたがた、どうもありがとうございました。

=head2 nkf 1.4

morb@fujitsu, kiss@ayumi.stars.flab.fujitsu, cen122@flab.fujitsu,
yuki@flab.fujitsu 他、fujitsu & flab.fujitsu の皆さんの協力に感謝。
shinoda@cs.titech, kato@cs.titech, uematsu@cs.titech  TNX
kono@ie.u-ryukyu.ac.jp
void@merope.pleiades.or.jp (Kusakabe Youichi)
NIDE Naoyuki <nide@ics.nara-wu.ac.jp>
ohta@src.ricoh.co.jp (Junn Ohta)
inouet@strl.nhk.or.jp (Tomoyuki Inoue)
kiri@pulser.win.or.jp (Tetsuaki Kiriyama)
Kimihiko Sato <sato@sail.t.u-tokyo.ac.jp>
a_kuroe@kuroe.aoba.yokohama.jp (Akihiko Kuroe)
kono@ie.u-ryukyu.ac.jp (Shinji Kono)
GHG00637@nifty-serve.or.jp (COW)

=head2 nkf 1.9-

=over

=item 河野真治

=item Akio Furukawa

=item Andy Taki

=item From: OHARA Shigeki

=item Fumitaka Kitagawa

=item Hiroaki Sengoku

=item Ikuhiro MORITA (森田 育宏)

=item Yoshiharu ITO

=item Junn Ohta

=item KAWAMURA Masao

=item Kazuhiko Mori

=item Keitaro Isokawa

=item Ken-ichi Hirose

=item Ki-ichiro SATO

=item Kiwamu Aoyama

=item Koichi Hirayama

=item Mitsuru Hase (長谷　満)

=item OHARA Shigeki (大原 重樹)

=item Rei FURUKAWA

=item Satoru Takabayashi

=item Shigeyuki Takagi

=item Shin MICHIMUKO

=item Tadamasa Teranishi

=item TOYODA Jiro

=item TSUCHIYA Masatoshi

=item Tsutomu Sakai

=item YAMASHITA Junji (山下 純司)

=item Yasuyuki Sato

=item Yoshiaki Yanagihara

=item hat@so-net

=item ＤＣＣ技術部渡辺

=item かとぺ / 加藤 貴司

=item かべdais

=item ひろせ まさあき

=item イントラネットシステム(株)松尾

=item 鵜飼文敏

=item 塩崎 毅彦(SHIOZAKI Takehiko)

=item 河村雅夫 (Media Lab.)

=item 河野 康司

=item 喜瀬“冬猫”浩＠南国沖縄

=item 金井 智彦

=item 桂田 祐史 (かつらだ まさし)

=item 高橋宜盟

=item 国吉

=item 黒江明彦

=item 三宅正泰

=item 山倉 真

=item 山本 芳人

=item 山野裕司 (やまのゆうじ)

=item 重村法克

=item 小島基靖

=item 上田　健

=item 新井 康司 (Koji Arai)

=item 森　千絵子

=item 森　和彦

=item 水野 貴文

=item 前地和俊

=item 仲宗根＠並列信頼研

=item 猪谷 英一郎 == Eiichiro Itani

=item 藤原　秀行

=item 八田 真行 (Masayuki Hatta)

=item 尾川敏也

=item 望月 孝志

=item 木村 (＠筑波大学数学研究科)

=item 野村俊彰

=item 有岡＠ミノルタ

=item 有沢 明宏

=item 落合一喜

=item 林  亮

=item 國安 治

=item 木下 雄介

=item 田中隆裕

=item 鶴谷直樹

=item 中田伸悦

=item わたなべひろふみ

=item MoonWolf

=item sava

=back

=head1 AUTHOR

=over

=item 市川  至        ichikawa@flab.fujitsu.co.jp (was ichikawa@fujitsu.JUNET)

=item 河野  真治      kono@ie.u-ryukyu.acjp

=item Rei FURUKAWA    furukawa@tcp-ip.or.jp

=item 成瀬

=item mastodon

=back

https://osdn.jp/projects/nkf/

Copyright (C) 1987, FUJITSU LTD. (I.Ichikawa).

Copyright (C) 1996-2018, The nkf Project.

=cut

#ifndef _CONFIG_H_
#define _CONFIG_H_

/* UTF8 入出力 */
#define UTF8_INPUT_ENABLE
#define UTF8_OUTPUT_ENABLE

/* Shift_JIS 範囲外の文字を、CP932 で同値な文字に読み換える */
#define SHIFTJIS_CP932

/* オプションで入力を指定した時に、文字コードを固定する */
#define INPUT_CODE_FIX

/* -OW オプション */
/* by Satoru Takabayashi <ccsatoru@vega.aichi-u.ac.jp> */
#define OVERWRITE

/* --cap-input, --url-input, --numchar-input オプション */
#define INPUT_OPTION

/* --debug, --no-output オプション */
#define CHECK_OPTION

/* SunOS の cc を使うときは undef にしてください */
#define ANSI_C_PROTOTYPE

/******************************/
/* デフォルトの出力コード選択 */
/* Select DEFAULT_CODE */
#define DEFAULT_CODE_JIS
/* #define DEFAULT_CODE_SJIS */
/* #define DEFAULT_CODE_EUC */
/* #define DEFAULT_CODE_UTF8 */
/******************************/

#endif /* _CONFIG_H_ */

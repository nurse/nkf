#ifndef _CONFIG_H_
#define _CONFIG_H_

/* UTF8 入出力 */
#define UTF8_INPUT_ENABLE
#define UTF8_OUTPUT_ENABLE

/* オプションで入力を指定した時に、文字コードを固定する */
#define INPUT_CODE_FIX

/* -OW オプション */
/* by Satoru Takabayashi <ccsatoru@vega.aichi-u.ac.jp> */
#define OVERWRITE

/* --cap-input, --url-input オプション */
#define CAP_URL_OPTION

/* --debug, --no-output オプション */
#define CHECK_OPTION

#endif /* _CONFIG_H_ */

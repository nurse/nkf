/***********************************************************************
** Copyright (C) 1996,1998
** Copyright (C) 2002
** Ϣ���衧 ΰ����ؾ��󹩳ز� ���� ����  mime/X0208 support
** ��E-Mail Address: kono@ie.u-ryukyu.ac.jp��
** Ϣ���衧 COW for DOS & Win16 & Win32 & OS/2
** ��E-Mail Address: GHG00637@niftyserve.or.p��
**    
**    ���Υ������Τ����ʤ�ʣ�̡����ѡ�������������ޤ�����������
**    ���κݤˤϡ�ï���׸������򼨤�������ʬ��Ĥ����ȡ�
**    �����ۤ仨�����Ͽ�ʤɤ��䤤��碌��ɬ�פ���ޤ���
**    �������Ѥ�嵭��ȿ���ʤ��ϰϤǵ��Ĥ��ޤ���
**    �Х��ʥ�����ۤκݤˤ�version message����¸���뤳�Ȥ���Ȥ��ޤ���
**    ���Υץ����ˤĤ��Ƥ��ä˲����ݾڤ⤷�ʤ����������餺��
**    
**    Everyone is permitted to do anything on this program
**    including copying, modifying, improving, 
**    as long as you don't try to pretend that you wrote it.
**    i.e., the above copyright notice has to appear in all copies.  
**    Binar y distribution requires original version messages.
**    You don't have to ask before copying, redistribution or publishing.
**    THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE.
***********************************************************************/

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

/* Replace nkf's getchar/putchar for variable modification */
/* we never use getc, ungetc */

#undef getc
#undef ungetc
#define getc(f)   	(input_ctr>=i_len?-1:input[input_ctr++])
#define ungetc(c,f)	input_ctr--

#define INCSIZE		32
#undef putchar
#undef TRUE
#undef FALSE
#define putchar(c)	nkf_putchar(c)

/* Input/Output pointers */

static unsigned char *output;
static unsigned char *input;
static STRLEN input_ctr;
static STRLEN i_len;
static STRLEN output_ctr;
static STRLEN o_len;
static STRLEN incsize;

static
SV *result;

/* put one char in the result string variable */

static int nkf_putchar_grow(unsigned int c) ;

/* inline ... no use */
static
int
nkf_putchar(unsigned int c) 
{
    /* string length is enough? */
    if(output_ctr<o_len) {
	return output[output_ctr++] = c;
    } else {
	return nkf_putchar_grow(c) ;
    }
}

static
int
nkf_putchar_grow(unsigned int c) 
{
    /* extends string length */
    o_len += incsize;
    SvGROW(result, o_len);
    /* to avoid linear growing, increase extension size */
    incsize *= 2;
    output = SvPVX(result);
    /* SvPV(result,o_len) breaks o_len */
    return output[output_ctr++] = c;
}

/* Include kanji filter main part */
/* getchar and putchar will be replaced during inclusion */

#define PERL_XS 1
#include "../utf8tbl.c"
#undef SP
#include "../nkf.c"
#undef SP
#define SP sp /* perl's CORE/pp.h */

/* package defenition  */

/* nkf accepts variable length arguments. The last argument is */
/* the input data. Other strings are flags for nkf translation.    */

MODULE = NKF		PACKAGE = NKF		

SV *
nkf(...)
    PROTOTYPE: @
    PREINIT:
    SV* sv;
    SV* last;
    char **argv;
    char *cp;
    char *data;
    STRLEN cplen,rlen;
    int i,argc;
    CODE:

    /* Flags are reset at each call. */
    reinit();

    argc = items - 1;

    /* Process flags except the last once */
    for (i=0;i<argc;i++) {
        sv = ST(i);
        cp = SvPV(sv,cplen);
        if(*cp != '-') continue;
	options(cp);
    }

    /* Get input data pointer from the last variable. */
    data = SvPV(ST(argc),i_len);
    input_ctr = 0;

    /* allocate the result buffer */

    /* During conversion, stirngs length may grow. This is the unit */
    /* of growth */
    incsize = INCSIZE; 
    rlen = i_len+INCSIZE;
    result = newSV(rlen);
    input  = data;

    /* SvPV(result,o_len) does not work here. */
    output = SvPVX(result);
    o_len = rlen;
    output_ctr = 0;

    /* Convestion */
    kanji_convert(NULL);
    nkf_putchar(0);     /* Null terminator */

    RETVAL = result;
    SvPOK_on(RETVAL);       
    /* We cannot use 
	   SvCUR_set(RETVAL, strlen(output)); 
       because output can contain \0. 
     */
    SvCUR_set(RETVAL, output_ctr - 1);

    OUTPUT:
    RETVAL

SV *
nkf_continue(...)
    PROTOTYPE: @
    PREINIT:
    char *data;
    STRLEN rlen;
    CODE:

    /* Get input data pointer from the last variable. */
    data = SvPV(ST(0),i_len);
    input_ctr = 0;

    /* allocate the result buffer */

    /* During conversion, stirngs length may grow. This is the unit */
    /* of growth */
    incsize = INCSIZE; 
    rlen = i_len+INCSIZE;
    result = newSV(rlen);
    input  = data;

    /* SvPV(result,o_len) does not work here. */
    output = SvPVX(result);
    o_len = rlen;
    output_ctr = 0;

    /* Convestion */
    kanji_convert(NULL);
    nkf_putchar(0);     /* Null terminator */

    RETVAL = result;
    SvPOK_on(RETVAL);       
    /* We cannot use 
	   SvCUR_set(RETVAL, strlen(output)); 
       because output can contain \0. 
     */
    SvCUR_set(RETVAL, output_ctr - 1);

    OUTPUT:
    RETVAL

SV*
inputcode(...)
    CODE:
    RETVAL = newSV(strlen(input_codename) + 1);
    sv_setpv(RETVAL, input_codename);
    OUTPUT:
    RETVAL

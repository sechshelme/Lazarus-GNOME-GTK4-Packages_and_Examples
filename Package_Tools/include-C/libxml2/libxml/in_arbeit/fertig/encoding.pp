
unit encoding;
interface

{
  Automatically converted by H2Pas 1.0.0 from encoding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    encoding.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
Pchar  = ^char;
Plongint  = ^longint;
PUChar  = ^UChar;
Puconv_t  = ^uconv_t;
PUConverter  = ^UConverter;
PxmlCharEncoding  = ^xmlCharEncoding;
PxmlCharEncodingHandler  = ^xmlCharEncodingHandler;
PxmlCharEncodingHandlerPtr  = ^xmlCharEncodingHandlerPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interface for the encoding conversion functions
 * Description: interface for the encoding conversion functions needed for
 *              XML basic encoding and iconv() support.
 *
 * Related specs are
 * rfc2044        (UTF-8 and UTF-16) F. Yergeau Alis Technologies
 * [ISO-10646]    UTF-8 and UTF-16 in Annexes
 * [ISO-8859-1]   ISO Latin-1 characters codes.
 * [UNICODE]      The Unicode Consortium, "The Unicode Standard --
 *                Worldwide Character Encoding -- Version 1.0", Addison-
 *                Wesley, Volume 1, 1991, Volume 2, 1992.  UTF-8 is
 *                described in Unicode Technical Report #4.
 * [US-ASCII]     Coded Character Set--7-bit American Standard Code for
 *                Information Interchange, ANSI X3.4-1986.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_CHAR_ENCODING_H__}
{$define __XML_CHAR_ENCODING_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_ICONV_ENABLED}
{$include <iconv.h>}
{$endif}
{$ifdef LIBXML_ICU_ENABLED}
{$include <unicode/ucnv.h>}
{$endif}
{ C++ extern C conditionnal removed }
{
 * xmlCharEncoding:
 *
 * Predefined values for some standard encodings.
 * Libxml does not do beforehand translation on UTF8 and ISOLatinX.
 * It also supports ASCII, ISO-8859-1, and UTF16 (LE and BE) by default.
 *
 * Anything else would have to be translated to UTF8 before being
 * given to the parser itself. The BOM for UTF16 and the encoding
 * declaration are looked at and a converter is looked for at that
 * point. If not found the parser stops here as asked by the XML REC. A
 * converter can be registered by the user using xmlRegisterCharEncodingHandler
 * but the current form doesn't allow stateful transcoding (a serious
 * problem agreed !). If iconv has been found it will be used
 * automatically and allow stateful transcoding, the simplest is then
 * to be sure to enable iconv and to provide iconv libs for the encoding
 * support needed.
 *
 * Note that the generic "UTF-16" is not a predefined value.  Instead, only
 * the specific UTF-16LE and UTF-16BE are present.
  }
{ No char encoding detected  }
{ No char encoding detected  }
{ UTF-8  }
{ UTF-16 little endian  }
{ UTF-16 big endian  }
{ UCS-4 little endian  }
{ UCS-4 big endian  }
{ EBCDIC uh!  }
{ UCS-4 unusual ordering  }
{ UCS-4 unusual ordering  }
{ UCS-2  }
{ ISO-8859-1 ISO Latin 1  }
{ ISO-8859-2 ISO Latin 2  }
{ ISO-8859-3  }
{ ISO-8859-4  }
{ ISO-8859-5  }
{ ISO-8859-6  }
{ ISO-8859-7  }
{ ISO-8859-8  }
{ ISO-8859-9  }
{ ISO-2022-JP  }
{ Shift_JIS  }
{ EUC-JP  }
{ pure ASCII  }
type
  PxmlCharEncoding = ^TxmlCharEncoding;
  TxmlCharEncoding =  Longint;
  Const
    XML_CHAR_ENCODING_ERROR = -(1);
    XML_CHAR_ENCODING_NONE = 0;
    XML_CHAR_ENCODING_UTF8 = 1;
    XML_CHAR_ENCODING_UTF16LE = 2;
    XML_CHAR_ENCODING_UTF16BE = 3;
    XML_CHAR_ENCODING_UCS4LE = 4;
    XML_CHAR_ENCODING_UCS4BE = 5;
    XML_CHAR_ENCODING_EBCDIC = 6;
    XML_CHAR_ENCODING_UCS4_2143 = 7;
    XML_CHAR_ENCODING_UCS4_3412 = 8;
    XML_CHAR_ENCODING_UCS2 = 9;
    XML_CHAR_ENCODING_8859_1 = 10;
    XML_CHAR_ENCODING_8859_2 = 11;
    XML_CHAR_ENCODING_8859_3 = 12;
    XML_CHAR_ENCODING_8859_4 = 13;
    XML_CHAR_ENCODING_8859_5 = 14;
    XML_CHAR_ENCODING_8859_6 = 15;
    XML_CHAR_ENCODING_8859_7 = 16;
    XML_CHAR_ENCODING_8859_8 = 17;
    XML_CHAR_ENCODING_8859_9 = 18;
    XML_CHAR_ENCODING_2022_JP = 19;
    XML_CHAR_ENCODING_SHIFT_JIS = 20;
    XML_CHAR_ENCODING_EUC_JP = 21;
    XML_CHAR_ENCODING_ASCII = 22;
;
{*
 * xmlCharEncodingInputFunc:
 * @out:  a pointer to an array of bytes to store the UTF-8 result
 * @outlen:  the length of @out
 * @in:  a pointer to an array of chars in the original encoding
 * @inlen:  the length of @in
 *
 * Take a block of chars in the original encoding and try to convert
 * it to an UTF-8 block of chars out.
 *
 * Returns the number of bytes written, -1 if lack of space, or -2
 *     if the transcoding failed.
 * The value of @inlen after return is the number of octets consumed
 *     if the return value is positive, else unpredictiable.
 * The value of @outlen after return is the number of octets consumed.
  }
(* Const before type ignored *)
type

  TxmlCharEncodingInputFunc = function (out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint):longint;cdecl;
{*
 * xmlCharEncodingOutputFunc:
 * @out:  a pointer to an array of bytes to store the result
 * @outlen:  the length of @out
 * @in:  a pointer to an array of UTF-8 chars
 * @inlen:  the length of @in
 *
 * Take a block of UTF-8 chars in and try to convert it to another
 * encoding.
 * Note: a first call designed to produce heading info is called with
 * in = NULL. If stateful this should also initialize the encoder state.
 *
 * Returns the number of bytes written, -1 if lack of space, or -2
 *     if the transcoding failed.
 * The value of @inlen after return is the number of octets consumed
 *     if the return value is positive, else unpredictiable.
 * The value of @outlen after return is the number of octets produced.
  }
(* Const before type ignored *)

  TxmlCharEncodingOutputFunc = function (out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint):longint;cdecl;
{
 * Block defining the handlers for non UTF-8 encodings.
 * If iconv is supported, there are two extra fields.
  }
{$ifdef LIBXML_ICU_ENABLED}
{ Size of pivot buffer, same as icu/source/common/ucnv.cpp CHUNK_SIZE  }

const
  ICU_PIVOT_BUF_SIZE = 1024;  
{ for conversion between an encoding and UTF-16  }
{ for conversion between UTF-8 and UTF-16  }
type
  Puconv_t = ^Tuconv_t;
  Tuconv_t = record
      uconv : PUConverter;cdecl;
      utf8 : PUConverter;
      pivot_buf : array[0..(ICU_PIVOT_BUF_SIZE)-1] of TUChar;
      pivot_source : PUChar;
      pivot_target : PUChar;
    end;

{$endif}
type

  PxmlCharEncodingHandlerPtr = ^TxmlCharEncodingHandlerPtr;
  TxmlCharEncodingHandlerPtr = PxmlCharEncodingHandler;
{$ifdef LIBXML_ICONV_ENABLED}
{$endif}
{ LIBXML_ICONV_ENABLED  }
{$ifdef LIBXML_ICU_ENABLED}
{$endif}
{ LIBXML_ICU_ENABLED  }
type
  PxmlCharEncodingHandler = ^TxmlCharEncodingHandler;
  TxmlCharEncodingHandler = record
      name : Pchar;
      input : TxmlCharEncodingInputFunc;
      output : TxmlCharEncodingOutputFunc;
      iconv_in : Ticonv_t;
      iconv_out : Ticonv_t;
      uconv_in : Puconv_t;
      uconv_out : Puconv_t;
    end;

{ C++ end of extern C conditionnal removed }
{$include <libxml/tree.h>}
{ C++ extern C conditionnal removed }
{
 * Interfaces for encoding handlers.
  }

procedure xmlInitCharEncodingHandlers;cdecl;external;
procedure xmlCleanupCharEncodingHandlers;cdecl;external;
procedure xmlRegisterCharEncodingHandler(handler:TxmlCharEncodingHandlerPtr);cdecl;external;
function xmlGetCharEncodingHandler(enc:TxmlCharEncoding):TxmlCharEncodingHandlerPtr;cdecl;external;
(* Const before type ignored *)
function xmlFindCharEncodingHandler(name:Pchar):TxmlCharEncodingHandlerPtr;cdecl;external;
(* Const before type ignored *)
function xmlNewCharEncodingHandler(name:Pchar; input:TxmlCharEncodingInputFunc; output:TxmlCharEncodingOutputFunc):TxmlCharEncodingHandlerPtr;cdecl;external;
{
 * Interfaces for encoding names and aliases.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAddEncodingAlias(name:Pchar; alias:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlDelEncodingAlias(alias:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetEncodingAlias(alias:Pchar):Pchar;cdecl;external;
procedure xmlCleanupEncodingAliases;cdecl;external;
(* Const before type ignored *)
function xmlParseCharEncoding(name:Pchar):TxmlCharEncoding;cdecl;external;
(* Const before type ignored *)
function xmlGetCharEncodingName(enc:TxmlCharEncoding):Pchar;cdecl;external;
{
 * Interfaces directly used by the parsers.
  }
(* Const before type ignored *)
function xmlDetectCharEncoding(in:Pbyte; len:longint):TxmlCharEncoding;cdecl;external;
function xmlCharEncOutFunc(handler:PxmlCharEncodingHandler; out:TxmlBufferPtr; in:TxmlBufferPtr):longint;cdecl;external;
function xmlCharEncInFunc(handler:PxmlCharEncodingHandler; out:TxmlBufferPtr; in:TxmlBufferPtr):longint;cdecl;external;
function xmlCharEncFirstLine(handler:PxmlCharEncodingHandler; out:TxmlBufferPtr; in:TxmlBufferPtr):longint;cdecl;external;
function xmlCharEncCloseFunc(handler:PxmlCharEncodingHandler):longint;cdecl;external;
{
 * Export a few useful functions
  }
{$ifdef LIBXML_OUTPUT_ENABLED}
(* Const before type ignored *)
function UTF8Toisolat1(out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint):longint;cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
(* Const before type ignored *)

function isolat1ToUTF8(out:Pbyte; outlen:Plongint; in:Pbyte; inlen:Plongint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_CHAR_ENCODING_H__  }

implementation


end.


unit hpdf_encoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_encoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_encoder.h
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
Pchar  = ^char;
PHPDF_BaseEncodings  = ^HPDF_BaseEncodings;
PHPDF_BasicEncoderAttr  = ^HPDF_BasicEncoderAttr;
PHPDF_BasicEncoderAttr_Rec  = ^HPDF_BasicEncoderAttr_Rec;
PHPDF_BYTE  = ^HPDF_BYTE;
PHPDF_CidRange_Rec  = ^HPDF_CidRange_Rec;
PHPDF_CMapEncoderAttr  = ^HPDF_CMapEncoderAttr;
PHPDF_CMapEncoderAttr_Rec  = ^HPDF_CMapEncoderAttr_Rec;
PHPDF_Encoder  = ^HPDF_Encoder;
PHPDF_Encoder_EncodeText_Func  = ^HPDF_Encoder_EncodeText_Func;
PHPDF_Encoder_Rec  = ^HPDF_Encoder_Rec;
PHPDF_EncodingType  = ^HPDF_EncodingType;
PHPDF_ParseText_Rec  = ^HPDF_ParseText_Rec;
PHPDF_UINT  = ^HPDF_UINT;
PHPDF_UINT16  = ^HPDF_UINT16;
PHPDF_UnicodeMap_Rec  = ^HPDF_UnicodeMap_Rec;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_encoder.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_ENCODER_H}
{$define _HPDF_ENCODER_H}
{$include "hpdf_consts.h"}
{$include "hpdf_streams.h"}
{ C++ extern C conditionnal removed }
{-- HPDF_Encoder --------------------------------------- }

const
  HPDF_ENCODER_SIG_BYTES = $454E4344;  
{---------------------------------------------------------------------------- }
{------ predefined font encodings ------------------------------------------- }
  HPDF_ENCODING_FONT_SPECIFIC = 'FontSpecific';  
  HPDF_ENCODING_STANDARD = 'StandardEncoding';  
  HPDF_ENCODING_MAC_ROMAN = 'MacRomanEncoding';  
  HPDF_ENCODING_WIN_ANSI = 'WinAnsiEncoding';  
  HPDF_ENCODING_ISO8859_2 = 'ISO8859-2';  
  HPDF_ENCODING_ISO8859_3 = 'ISO8859-3';  
  HPDF_ENCODING_ISO8859_4 = 'ISO8859-4';  
  HPDF_ENCODING_ISO8859_5 = 'ISO8859-5';  
  HPDF_ENCODING_ISO8859_6 = 'ISO8859-6';  
  HPDF_ENCODING_ISO8859_7 = 'ISO8859-7';  
  HPDF_ENCODING_ISO8859_8 = 'ISO8859-8';  
  HPDF_ENCODING_ISO8859_9 = 'ISO8859-9';  
  HPDF_ENCODING_ISO8859_10 = 'ISO8859-10';  
  HPDF_ENCODING_ISO8859_11 = 'ISO8859-11';  
  HPDF_ENCODING_ISO8859_13 = 'ISO8859-13';  
  HPDF_ENCODING_ISO8859_14 = 'ISO8859-14';  
  HPDF_ENCODING_ISO8859_15 = 'ISO8859-15';  
  HPDF_ENCODING_ISO8859_16 = 'ISO8859-16';  
  HPDF_ENCODING_CP1250 = 'CP1250';  
  HPDF_ENCODING_CP1251 = 'CP1251';  
  HPDF_ENCODING_CP1252 = 'CP1252';  
  HPDF_ENCODING_CP1253 = 'CP1253';  
  HPDF_ENCODING_CP1254 = 'CP1254';  
  HPDF_ENCODING_CP1255 = 'CP1255';  
  HPDF_ENCODING_CP1256 = 'CP1256';  
  HPDF_ENCODING_CP1257 = 'CP1257';  
  HPDF_ENCODING_CP1258 = 'CP1258';  
  HPDF_ENCODING_KOI8_R = 'KOI8-R';  
{---------------------------------------------------------------------------- }
{----- definition for font encoding ----------------------------------------- }
  char_NOTDEF = '.notdef';  
type
  PHPDF_EncodingType = ^THPDF_EncodingType;
  THPDF_EncodingType =  Longint;
  Const
    HPDF_STANDARD_ENCODING = 0;
    HPDF_MAC_ROMAN_ENCODING = 1;
    HPDF_WIN_ANSI_ENCODING = 2;
    HPDF_FONT_SPECIFIC = 3;
    HPDF_ENCODING_EOF = 4;
;
(* Const before type ignored *)
type
  PHPDF_ParseText_Rec = ^THPDF_ParseText_Rec;
  THPDF_ParseText_Rec = record
      text : PHPDF_BYTE;
      index : THPDF_UINT;
      len : THPDF_UINT;
      byte_type : THPDF_ByteType;
    end;

  PHPDF_Encoder = ^THPDF_Encoder;
  THPDF_Encoder = PHPDF_Encoder_Rec;

  THPDF_Encoder_ByteType_Func = function (encoder:THPDF_Encoder; state:PHPDF_ParseText_Rec):THPDF_ByteType;cdecl;

  THPDF_Encoder_ToUnicode_Func = function (encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_UNICODE;cdecl;
(* Const before type ignored *)

  PHPDF_Encoder_EncodeText_Func = ^THPDF_Encoder_EncodeText_Func;
  THPDF_Encoder_EncodeText_Func = function (encoder:THPDF_Encoder; text:Pchar; len:THPDF_UINT; encoded_length:PHPDF_UINT):Pchar;cdecl;

  THPDF_Encoder_Write_Func = function (encoder:THPDF_Encoder; out:THPDF_Stream):THPDF_STATUS;cdecl;

  THPDF_Encoder_Init_Func = function (encoder:THPDF_Encoder):THPDF_STATUS;cdecl;

  THPDF_Encoder_Free_Func = procedure (encoder:THPDF_Encoder);cdecl;
{
    char                         lang_code[3];
    char                         country_code[3];
     }

  PHPDF_Encoder_Rec = ^THPDF_Encoder_Rec;
  THPDF_Encoder_Rec = record
      sig_bytes : THPDF_UINT32;
      name : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      _type : THPDF_EncoderType;
      byte_type_fn : THPDF_Encoder_ByteType_Func;
      to_unicode_fn : THPDF_Encoder_ToUnicode_Func;
      encode_text_fn : THPDF_Encoder_EncodeText_Func;
      write_fn : THPDF_Encoder_Write_Func;
      free_fn : THPDF_Encoder_Free_Func;
      init_fn : THPDF_Encoder_Init_Func;
      attr : pointer;
    end;

  PHPDF_BaseEncodings = ^THPDF_BaseEncodings;
  THPDF_BaseEncodings =  Longint;
  Const
    HPDF_BASE_ENCODING_STANDARD = 0;
    HPDF_BASE_ENCODING_WIN_ANSI = 1;
    HPDF_BASE_ENCODING_MAC_ROMAN = 2;
    HPDF_BASE_ENCODING_FONT_SPECIFIC = 3;
    HPDF_BASE_ENCODING_EOF = 4;
;

function HPDF_Encoder_Validate(encoder:THPDF_Encoder):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
procedure HPDF_Encoder_SetParseText(encoder:THPDF_Encoder; state:PHPDF_ParseText_Rec; text:PHPDF_BYTE; len:THPDF_UINT);cdecl;external;
function HPDF_Encoder_ByteType(encoder:THPDF_Encoder; state:PHPDF_ParseText_Rec):THPDF_ByteType;cdecl;external;
function HPDF_Encoder_ToUnicode(encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_UNICODE;cdecl;external;
procedure HPDF_Encoder_Free(encoder:THPDF_Encoder);cdecl;external;
{-- HPDF_BasicEncoder ---------------------------------- }
type
  PHPDF_BasicEncoderAttr = ^THPDF_BasicEncoderAttr;
  THPDF_BasicEncoderAttr = PHPDF_BasicEncoderAttr_Rec;

  PHPDF_BasicEncoderAttr_Rec = ^THPDF_BasicEncoderAttr_Rec;
  THPDF_BasicEncoderAttr_Rec = record
      base_encoding : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      first_char : THPDF_BYTE;
      last_char : THPDF_BYTE;
      unicode_map : array[0..255] of THPDF_UNICODE;
      has_differences : THPDF_BOOL;
      differences : array[0..255] of THPDF_BYTE;
    end;
(* Const before type ignored *)

function HPDF_BasicEncoder_New(mmgr:THPDF_MMgr; encoding_name:Pchar):THPDF_Encoder;cdecl;external;
procedure HPDF_BasicEncoder_Free(encoder:THPDF_Encoder);cdecl;external;
function HPDF_BasicEncoder_Write(encoder:THPDF_Encoder; out:THPDF_Stream):THPDF_STATUS;cdecl;external;
function HPDF_BasicEncoder_ToUnicode(encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_UNICODE;cdecl;external;
{-- HPDF_CMapEncoder ---------------------------------- }
type

  THPDF_CMapEncoder_ByteType_Func = function (encoder:THPDF_Encoder; b:THPDF_BYTE):THPDF_BOOL;cdecl;

  PHPDF_CidRange_Rec = ^THPDF_CidRange_Rec;
  THPDF_CidRange_Rec = record
      from : THPDF_UINT16;
      to : THPDF_UINT16;
      cid : THPDF_UINT16;
    end;

  PHPDF_UnicodeMap_Rec = ^THPDF_UnicodeMap_Rec;
  THPDF_UnicodeMap_Rec = record
      code : THPDF_UINT16;
      unicode : THPDF_UINT16;
    end;

  PHPDF_CMapEncoderAttr = ^THPDF_CMapEncoderAttr;
  THPDF_CMapEncoderAttr = PHPDF_CMapEncoderAttr_Rec;

  PHPDF_CMapEncoderAttr_Rec = ^THPDF_CMapEncoderAttr_Rec;
  THPDF_CMapEncoderAttr_Rec = record
      unicode_map : array[0..255] of array[0..255] of THPDF_UNICODE;
      cid_map : array[0..255] of array[0..255] of THPDF_UINT16;
      jww_line_head : array[0..(HPDF_MAX_JWW_NUM)-1] of THPDF_UINT16;
      cmap_range : THPDF_List;
      notdef_range : THPDF_List;
      code_space_range : THPDF_List;
      writing_mode : THPDF_WritingMode;
      registry : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      ordering : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      suppliment : THPDF_INT;
      is_lead_byte_fn : THPDF_CMapEncoder_ByteType_Func;
      is_trial_byte_fn : THPDF_CMapEncoder_ByteType_Func;
      uid_offset : THPDF_INT;
      xuid : array[0..2] of THPDF_UINT;
    end;

function HPDF_CMapEncoder_New(mmgr:THPDF_MMgr; name:Pchar; init_fn:THPDF_Encoder_Init_Func):THPDF_Encoder;cdecl;external;
function HPDF_CMapEncoder_InitAttr(encoder:THPDF_Encoder):THPDF_STATUS;cdecl;external;
procedure HPDF_CMapEncoder_Free(encoder:THPDF_Encoder);cdecl;external;
function HPDF_CMapEncoder_Write(encoder:THPDF_Encoder; out:THPDF_Stream):THPDF_STATUS;cdecl;external;
function HPDF_CMapEncoder_ToUnicode(encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_UNICODE;cdecl;external;
function HPDF_CMapEncoder_ToCID(encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_UINT16;cdecl;external;
(* Const before type ignored *)
function HPDF_CMapEncoder_SetParseText(encoder:THPDF_Encoder; state:PHPDF_ParseText_Rec; text:PHPDF_BYTE; len:THPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_CMapEncoder_ByteType(encoder:THPDF_Encoder; state:PHPDF_ParseText_Rec):THPDF_ByteType;cdecl;external;
(* Const before type ignored *)
function HPDF_CMapEncoder_AddCMap(encoder:THPDF_Encoder; range:PHPDF_CidRange_Rec):THPDF_STATUS;cdecl;external;
function HPDF_CMapEncoder_AddNotDefRange(encoder:THPDF_Encoder; range:THPDF_CidRange_Rec):THPDF_STATUS;cdecl;external;
function HPDF_CMapEncoder_AddCodeSpaceRange(encoder:THPDF_Encoder; range:THPDF_CidRange_Rec):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
procedure HPDF_CMapEncoder_SetUnicodeArray(encoder:THPDF_Encoder; array1:PHPDF_UnicodeMap_Rec);cdecl;external;
(* Const before type ignored *)
function HPDF_CMapEncoder_AddJWWLineHead(encoder:THPDF_Encoder; code:PHPDF_UINT16):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Encoder_CheckJWWLineHead(encoder:THPDF_Encoder; code:THPDF_UINT16):THPDF_BOOL;cdecl;external;
{-- utility functions ---------------------------------- }
(* Const before type ignored *)
function HPDF_UnicodeToGlyphName(unicode:THPDF_UNICODE):Pchar;cdecl;external;
(* Const before type ignored *)
function HPDF_GlyphNameToUnicode(glyph_name:Pchar):THPDF_UNICODE;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_ENCODER_H  }

implementation


end.

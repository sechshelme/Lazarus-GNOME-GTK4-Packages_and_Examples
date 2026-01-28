
unit hpdf_streams;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_streams.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_streams.h
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
PHPDF_BYTE  = ^HPDF_BYTE;
PHPDF_MemStreamAttr  = ^HPDF_MemStreamAttr;
PHPDF_MemStreamAttr_Rec  = ^HPDF_MemStreamAttr_Rec;
PHPDF_Stream  = ^HPDF_Stream;
PHPDF_Stream_Rec  = ^HPDF_Stream_Rec;
PHPDF_StreamType  = ^HPDF_StreamType;
PHPDF_UINT  = ^HPDF_UINT;
PHPDF_WhenceMode  = ^HPDF_WhenceMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_streams.h
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
 * 2005.12.20 Created.
 *
  }
{$ifndef _HPDF_STREAMS_H}
{$define _HPDF_STREAMS_H}
{$include "hpdf_list.h"}
{$include "hpdf_encrypt.h"}
{ C++ extern C conditionnal removed }

const
  HPDF_STREAM_SIG_BYTES = $5354524D;  
type
  PHPDF_StreamType = ^THPDF_StreamType;
  THPDF_StreamType =  Longint;
  Const
    HPDF_STREAM_UNKNOWN = 0;
    HPDF_STREAM_CALLBACK = 1;
    HPDF_STREAM_FILE = 2;
    HPDF_STREAM_MEMORY = 3;
;
  HPDF_STREAM_FILTER_NONE = $0000;  
  HPDF_STREAM_FILTER_ASCIIHEX = $0100;  
  HPDF_STREAM_FILTER_ASCII85 = $0200;  
  HPDF_STREAM_FILTER_FLATE_DECODE = $0400;  
  HPDF_STREAM_FILTER_DCT_DECODE = $0800;  
  HPDF_STREAM_FILTER_CCITT_DECODE = $1000;  
type
  PHPDF_WhenceMode = ^THPDF_WhenceMode;
  THPDF_WhenceMode =  Longint;
  Const
    HPDF_SEEK_SET = 0;
    HPDF_SEEK_CUR = 1;
    HPDF_SEEK_END = 2;
;
type
  PHPDF_Stream = ^THPDF_Stream;
  THPDF_Stream = PHPDF_Stream_Rec;
(* Const before type ignored *)

  THPDF_Stream_Write_Func = function (stream:THPDF_Stream; ptr:PHPDF_BYTE; siz:THPDF_UINT):THPDF_STATUS;cdecl;

  THPDF_Stream_Read_Func = function (stream:THPDF_Stream; ptr:PHPDF_BYTE; siz:PHPDF_UINT):THPDF_STATUS;cdecl;

  THPDF_Stream_Seek_Func = function (stream:THPDF_Stream; pos:THPDF_INT; mode:THPDF_WhenceMode):THPDF_STATUS;cdecl;

  THPDF_Stream_Tell_Func = function (stream:THPDF_Stream):THPDF_INT32;cdecl;

  THPDF_Stream_Free_Func = procedure (stream:THPDF_Stream);cdecl;

  THPDF_Stream_Size_Func = function (stream:THPDF_Stream):THPDF_UINT32;cdecl;

  PHPDF_MemStreamAttr = ^THPDF_MemStreamAttr;
  THPDF_MemStreamAttr = PHPDF_MemStreamAttr_Rec;

  PHPDF_MemStreamAttr_Rec = ^THPDF_MemStreamAttr_Rec;
  THPDF_MemStreamAttr_Rec = record
      buf : THPDF_List;
      buf_siz : THPDF_UINT;
      w_pos : THPDF_UINT;
      w_ptr : PHPDF_BYTE;
      r_ptr_idx : THPDF_UINT;
      r_pos : THPDF_UINT;
      r_ptr : PHPDF_BYTE;
    end;

  PHPDF_Stream_Rec = ^THPDF_Stream_Rec;
  THPDF_Stream_Rec = record
      sig_bytes : THPDF_UINT32;
      _type : THPDF_StreamType;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      size : THPDF_UINT;
      write_fn : THPDF_Stream_Write_Func;
      read_fn : THPDF_Stream_Read_Func;
      seek_fn : THPDF_Stream_Seek_Func;
      free_fn : THPDF_Stream_Free_Func;
      tell_fn : THPDF_Stream_Tell_Func;
      size_fn : THPDF_Stream_Size_Func;
      attr : pointer;
    end;

function HPDF_MemStream_New(mmgr:THPDF_MMgr; buf_siz:THPDF_UINT):THPDF_Stream;cdecl;external;
function HPDF_MemStream_GetBufPtr(stream:THPDF_Stream; index:THPDF_UINT; length:PHPDF_UINT):PHPDF_BYTE;cdecl;external;
function HPDF_MemStream_GetBufSize(stream:THPDF_Stream):THPDF_UINT;cdecl;external;
function HPDF_MemStream_GetBufCount(stream:THPDF_Stream):THPDF_UINT;cdecl;external;
function HPDF_MemStream_Rewrite(stream:THPDF_Stream; buf:PHPDF_BYTE; size:THPDF_UINT):THPDF_STATUS;cdecl;external;
procedure HPDF_MemStream_FreeData(stream:THPDF_Stream);cdecl;external;
function HPDF_Stream_WriteToStream(src:THPDF_Stream; dst:THPDF_Stream; filter:THPDF_UINT; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_FileReader_New(mmgr:THPDF_MMgr; fname:Pchar):THPDF_Stream;cdecl;external;
(* Const before type ignored *)
function HPDF_FileWriter_New(mmgr:THPDF_MMgr; fname:Pchar):THPDF_Stream;cdecl;external;
function HPDF_CallbackReader_New(mmgr:THPDF_MMgr; read_fn:THPDF_Stream_Read_Func; seek_fn:THPDF_Stream_Seek_Func; tell_fn:THPDF_Stream_Tell_Func; size_fn:THPDF_Stream_Size_Func; 
           data:pointer):THPDF_Stream;cdecl;external;
function HPDF_CallbackWriter_New(mmgr:THPDF_MMgr; write_fn:THPDF_Stream_Write_Func; data:pointer):THPDF_Stream;cdecl;external;
procedure HPDF_Stream_Free(stream:THPDF_Stream);cdecl;external;
function HPDF_Stream_WriteChar(stream:THPDF_Stream; value:char):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_WriteStr(stream:THPDF_Stream; value:Pchar):THPDF_STATUS;cdecl;external;
function HPDF_Stream_WriteUChar(stream:THPDF_Stream; value:THPDF_BYTE):THPDF_STATUS;cdecl;external;
function HPDF_Stream_WriteInt(stream:THPDF_Stream; value:THPDF_INT):THPDF_STATUS;cdecl;external;
function HPDF_Stream_WriteUInt(stream:THPDF_Stream; value:THPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_Stream_WriteReal(stream:THPDF_Stream; value:THPDF_REAL):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_Write(stream:THPDF_Stream; ptr:PHPDF_BYTE; size:THPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_Stream_Read(stream:THPDF_Stream; ptr:PHPDF_BYTE; size:PHPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_Stream_ReadLn(stream:THPDF_Stream; s:Pchar; size:PHPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_Stream_Tell(stream:THPDF_Stream):THPDF_INT32;cdecl;external;
function HPDF_Stream_Seek(stream:THPDF_Stream; pos:THPDF_INT; mode:THPDF_WhenceMode):THPDF_STATUS;cdecl;external;
function HPDF_Stream_EOF(stream:THPDF_Stream):THPDF_BOOL;cdecl;external;
function HPDF_Stream_Size(stream:THPDF_Stream):THPDF_UINT32;cdecl;external;
function HPDF_Stream_Flush(stream:THPDF_Stream):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_WriteEscapeName(stream:THPDF_Stream; value:Pchar):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_WriteEscapeText2(stream:THPDF_Stream; text:Pchar; len:THPDF_UINT):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_WriteEscapeText(stream:THPDF_Stream; text:Pchar):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Stream_WriteBinary(stream:THPDF_Stream; data:PHPDF_BYTE; len:THPDF_UINT; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external;
function HPDF_Stream_Validate(stream:THPDF_Stream):THPDF_STATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_STREAMS_H  }

implementation


end.

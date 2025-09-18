
unit gmime_filter_yenc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_yenc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_yenc.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterYenc  = ^GMimeFilterYenc;
PGMimeFilterYencClass  = ^GMimeFilterYencClass;
Pguint32  = ^guint32;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_FILTER_YENC_H__}
{$define __GMIME_FILTER_YENC_H__}
{$include <gmime/gmime-filter.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_YENC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_YENC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_YENC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC_GET_CLASS(obj : longint) : longint;

type
{*
 * GMIME_YDECODE_STATE_INIT:
 *
 * Initial state for the g_mime_ydecode_step() function.
 * }

const
  GMIME_YDECODE_STATE_INIT = 0;  
{*
 * GMIME_YENCODE_STATE_INIT:
 *
 * Initial state for the g_mime_ydecode_step() function.
 * }
  GMIME_YENCODE_STATE_INIT = 0;  
{ first 8 bits are reserved for saving a byte  }
{*
 * GMIME_YDECODE_STATE_EOLN:
 *
 * State bit that denotes the yEnc filter has reached an end-of-line.
 *
 * This state is for internal use only.
 * }
  GMIME_YDECODE_STATE_EOLN = 1 shl 8;  
{*
 * GMIME_YDECODE_STATE_ESCAPE:
 *
 * State bit that denotes the yEnc filter has reached an escape
 * sequence.
 *
 * This state is for internal use only.
 * }
  GMIME_YDECODE_STATE_ESCAPE = 1 shl 9;  
{ bits 10 and 11 reserved for later uses?  }
{*
 * GMIME_YDECODE_STATE_BEGIN:
 *
 * State bit that denotes the yEnc filter has found the =ybegin line.
 * }
  GMIME_YDECODE_STATE_BEGIN = 1 shl 12;  
{*
 * GMIME_YDECODE_STATE_PART:
 *
 * State bit that denotes the yEnc filter has found the =ypart
 * line. (Note: not all yencoded blocks have one)
 * }
  GMIME_YDECODE_STATE_PART = 1 shl 13;  
{*
 * GMIME_YDECODE_STATE_DECODE:
 *
 * State bit that denotes yEnc filter has begun decoding the actual
 * yencoded content and will continue to do so until an =yend line is
 * found (or until there is nothing left to decode).
 * }
  GMIME_YDECODE_STATE_DECODE = 1 shl 14;  
{*
 * GMIME_YDECODE_STATE_END:
 *
 * State bit that denoates that g_mime_ydecode_step() has finished
 * decoding.
 * }
  GMIME_YDECODE_STATE_END = 1 shl 15;  
{*
 * GMIME_YENCODE_CRC_INIT:
 *
 * Initial state for the crc and pcrc state variables.
 * }
  GMIME_YENCODE_CRC_INIT =  not (0);  
{*
 * GMIME_YENCODE_CRC_FINAL:
 * @crc: crc or pcrc state variable
 *
 * Gets the final crc value from @crc.
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GMIME_YENCODE_CRC_FINAL(crc : longint) : longint;

{*
 * GMimeFilterYenc:
 * @parent_object: parent #GMimeFilter
 * @encode: encode vs decode
 * @part: part id
 * @state: encode/decode state
 * @pcrc: part crc
 * @crc: full crc
 *
 * A filter for yEncoding or yDecoding a stream.
 * }
type
  PGMimeFilterYenc = ^TGMimeFilterYenc;
  TGMimeFilterYenc = record
      parent_object : TGMimeFilter;
      encode : Tgboolean;
      part : longint;
      state : longint;
      pcrc : Tguint32;
      crc : Tguint32;
    end;

  PGMimeFilterYencClass = ^TGMimeFilterYencClass;
  TGMimeFilterYencClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_yenc_get_type:TGType;cdecl;external;
function g_mime_filter_yenc_new(encode:Tgboolean):PGMimeFilter;cdecl;external;
procedure g_mime_filter_yenc_set_state(yenc:PGMimeFilterYenc; state:longint);cdecl;external;
procedure g_mime_filter_yenc_set_crc(yenc:PGMimeFilterYenc; crc:Tguint32);cdecl;external;
{int     g_mime_filter_yenc_get_part (GMimeFilterYenc *yenc); }
function g_mime_filter_yenc_get_pcrc(yenc:PGMimeFilterYenc):Tguint32;cdecl;external;
function g_mime_filter_yenc_get_crc(yenc:PGMimeFilterYenc):Tguint32;cdecl;external;
(* Const before type ignored *)
function g_mime_ydecode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; pcrc:Pguint32; 
           crc:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_yencode_step(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; pcrc:Pguint32; 
           crc:Pguint32):Tsize_t;cdecl;external;
(* Const before type ignored *)
function g_mime_yencode_close(inbuf:Pbyte; inlen:Tsize_t; outbuf:Pbyte; state:Plongint; pcrc:Pguint32; 
           crc:Pguint32):Tsize_t;cdecl;external;
{$endif}
{ __GMIME_FILTER_YENC_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_YENC : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_YENC:=g_mime_filter_yenc_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC(obj : longint) : longint;
begin
  GMIME_FILTER_YENC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_YENC,GMimeFilterYenc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_YENC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_YENC,GMimeFilterYencClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_YENC(obj : longint) : longint;
begin
  GMIME_IS_FILTER_YENC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_YENC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_YENC_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_YENC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_YENC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_YENC_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_YENC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_YENC,GMimeFilterYencClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_YENCODE_CRC_FINAL(crc : longint) : longint;
begin
  GMIME_YENCODE_CRC_FINAL:= not (crc);
end;


end.

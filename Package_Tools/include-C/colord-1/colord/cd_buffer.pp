
unit cd_buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_buffer.h
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
PCdBufferKind  = ^CdBufferKind;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2013 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_BUFFER_H__}
{$define __CD_BUFFER_H__}
{$include <glib.h>}
type
  PCdBufferKind = ^TCdBufferKind;
  TCdBufferKind =  Longint;
  Const
    CD_BUFFER_KIND_REQUEST = 0;
    CD_BUFFER_KIND_RESPONSE = 1;
    CD_BUFFER_KIND_UNKNOWN = 2;
;
(* Const before type ignored *)

procedure cd_buffer_debug(buffer_kind:TCdBufferKind; data:Pguint8; length:Tgsize);cdecl;external;
(* Const before type ignored *)
function cd_buffer_read_uint16_be(buffer:Pguint8):Tguint16;cdecl;external;
(* Const before type ignored *)
function cd_buffer_read_uint16_le(buffer:Pguint8):Tguint16;cdecl;external;
procedure cd_buffer_write_uint16_be(buffer:Pguint8; value:Tguint16);cdecl;external;
procedure cd_buffer_write_uint16_le(buffer:Pguint8; value:Tguint16);cdecl;external;
(* Const before type ignored *)
function cd_buffer_read_uint32_be(buffer:Pguint8):Tguint32;cdecl;external;
(* Const before type ignored *)
function cd_buffer_read_uint32_le(buffer:Pguint8):Tguint32;cdecl;external;
procedure cd_buffer_write_uint32_be(buffer:Pguint8; value:Tguint32);cdecl;external;
procedure cd_buffer_write_uint32_le(buffer:Pguint8; value:Tguint32);cdecl;external;
{$endif}
{ __CD_BUFFER_H__  }

implementation


end.

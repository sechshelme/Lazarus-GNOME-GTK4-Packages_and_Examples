
unit gmime_part;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_part.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_part.h
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
PGError  = ^GError;
PGMimeDataWrapper  = ^GMimeDataWrapper;
PGMimeDecryptResult  = ^GMimeDecryptResult;
PGMimePart  = ^GMimePart;
PGMimePartClass  = ^GMimePartClass;
PGMimeSignatureList  = ^GMimeSignatureList;
PGPtrArray  = ^GPtrArray;
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
{$ifndef __GMIME_PART_H__}
{$define __GMIME_PART_H__}
{$include <glib.h>}
{$include <stdio.h>}
{$include <gmime/gmime-object.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-filter-best.h>}
{$include <gmime/gmime-filter-openpgp.h>}
{$include <gmime/gmime-data-wrapper.h>}
{$include <gmime/gmime-crypto-context.h>}

{ was #define dname def_expr }
function GMIME_TYPE_PART : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimePart:
 * @parent_object: parent #GMimeObject
 * @encoding: a #GMimeContentEncoding
 * @openpgp: a #GMimeOpenPGPData
 * @content_description: Content-Description string
 * @content_location: Content-Location string
 * @content_md5: Content-MD5 string
 * @content: a #GMimeDataWrapper representing the MIME part's content
 *
 * A leaf-node MIME part object.
 * }
  PGMimePart = ^TGMimePart;
  TGMimePart = record
      parent_object : TGMimeObject;
      encoding : TGMimeContentEncoding;
      openpgp : TGMimeOpenPGPData;
      content_description : Pchar;
      content_location : Pchar;
      content_md5 : Pchar;
      content : PGMimeDataWrapper;
    end;

  PGMimePartClass = ^TGMimePartClass;
  TGMimePartClass = record
      parent_class : TGMimeObjectClass;
      set_content : procedure (mime_part:PGMimePart; content:PGMimeDataWrapper);cdecl;
    end;


function g_mime_part_get_type:TGType;cdecl;external;
{ constructors  }
function g_mime_part_new:PGMimePart;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_part_new_with_type(_type:Pchar; subtype:Pchar):PGMimePart;cdecl;external;
{ accessor functions  }
(* Const before type ignored *)
procedure g_mime_part_set_content_description(mime_part:PGMimePart; description:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_part_get_content_description(mime_part:PGMimePart):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_part_set_content_id(mime_part:PGMimePart; content_id:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_part_get_content_id(mime_part:PGMimePart):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_part_set_content_md5(mime_part:PGMimePart; content_md5:Pchar);cdecl;external;
function g_mime_part_verify_content_md5(mime_part:PGMimePart):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_mime_part_get_content_md5(mime_part:PGMimePart):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_part_set_content_location(mime_part:PGMimePart; content_location:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_part_get_content_location(mime_part:PGMimePart):Pchar;cdecl;external;
procedure g_mime_part_set_content_encoding(mime_part:PGMimePart; encoding:TGMimeContentEncoding);cdecl;external;
function g_mime_part_get_content_encoding(mime_part:PGMimePart):TGMimeContentEncoding;cdecl;external;
function g_mime_part_get_best_content_encoding(mime_part:PGMimePart; constraint:TGMimeEncodingConstraint):TGMimeContentEncoding;cdecl;external;
function g_mime_part_is_attachment(mime_part:PGMimePart):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_mime_part_set_filename(mime_part:PGMimePart; filename:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_part_get_filename(mime_part:PGMimePart):Pchar;cdecl;external;
procedure g_mime_part_set_content(mime_part:PGMimePart; content:PGMimeDataWrapper);cdecl;external;
function g_mime_part_get_content(mime_part:PGMimePart):PGMimeDataWrapper;cdecl;external;
procedure g_mime_part_set_openpgp_data(mime_part:PGMimePart; data:TGMimeOpenPGPData);cdecl;external;
function g_mime_part_get_openpgp_data(mime_part:PGMimePart):TGMimeOpenPGPData;cdecl;external;
(* Const before type ignored *)
function g_mime_part_openpgp_encrypt(mime_part:PGMimePart; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; recipients:PGPtrArray; 
           err:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_mime_part_openpgp_decrypt(mime_part:PGMimePart; flags:TGMimeDecryptFlags; session_key:Pchar; err:PPGError):PGMimeDecryptResult;cdecl;external;
(* Const before type ignored *)
function g_mime_part_openpgp_sign(mime_part:PGMimePart; userid:Pchar; err:PPGError):Tgboolean;cdecl;external;
function g_mime_part_openpgp_verify(mime_part:PGMimePart; flags:TGMimeVerifyFlags; err:PPGError):PGMimeSignatureList;cdecl;external;
{$endif}
{ __GMIME_PART_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_PART : longint; { return type might be wrong }
  begin
    GMIME_TYPE_PART:=g_mime_part_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART(obj : longint) : longint;
begin
  GMIME_PART:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_PART,GMimePart);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART_CLASS(klass : longint) : longint;
begin
  GMIME_PART_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_PART,GMimePartClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PART(obj : longint) : longint;
begin
  GMIME_IS_PART:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PART_CLASS(klass : longint) : longint;
begin
  GMIME_IS_PART_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_PART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PART_GET_CLASS(obj : longint) : longint;
begin
  GMIME_PART_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_PART,GMimePartClass);
end;


end.

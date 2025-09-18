unit gmime_part;

interface

uses
  fp_glib2, fp_gmime3;

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


function g_mime_part_get_type:TGType;cdecl;external libgmime3;
{ constructors  }
function g_mime_part_new:PGMimePart;cdecl;external libgmime3;
function g_mime_part_new_with_type(_type:Pchar; subtype:Pchar):PGMimePart;cdecl;external libgmime3;
{ accessor functions  }
procedure g_mime_part_set_content_description(mime_part:PGMimePart; description:Pchar);cdecl;external libgmime3;
function g_mime_part_get_content_description(mime_part:PGMimePart):Pchar;cdecl;external libgmime3;
procedure g_mime_part_set_content_id(mime_part:PGMimePart; content_id:Pchar);cdecl;external libgmime3;
function g_mime_part_get_content_id(mime_part:PGMimePart):Pchar;cdecl;external libgmime3;
procedure g_mime_part_set_content_md5(mime_part:PGMimePart; content_md5:Pchar);cdecl;external libgmime3;
function g_mime_part_verify_content_md5(mime_part:PGMimePart):Tgboolean;cdecl;external libgmime3;
function g_mime_part_get_content_md5(mime_part:PGMimePart):Pchar;cdecl;external libgmime3;
procedure g_mime_part_set_content_location(mime_part:PGMimePart; content_location:Pchar);cdecl;external libgmime3;
function g_mime_part_get_content_location(mime_part:PGMimePart):Pchar;cdecl;external libgmime3;
procedure g_mime_part_set_content_encoding(mime_part:PGMimePart; encoding:TGMimeContentEncoding);cdecl;external libgmime3;
function g_mime_part_get_content_encoding(mime_part:PGMimePart):TGMimeContentEncoding;cdecl;external libgmime3;
function g_mime_part_get_best_content_encoding(mime_part:PGMimePart; constraint:TGMimeEncodingConstraint):TGMimeContentEncoding;cdecl;external libgmime3;
function g_mime_part_is_attachment(mime_part:PGMimePart):Tgboolean;cdecl;external libgmime3;
procedure g_mime_part_set_filename(mime_part:PGMimePart; filename:Pchar);cdecl;external libgmime3;
function g_mime_part_get_filename(mime_part:PGMimePart):Pchar;cdecl;external libgmime3;
procedure g_mime_part_set_content(mime_part:PGMimePart; content:PGMimeDataWrapper);cdecl;external libgmime3;
function g_mime_part_get_content(mime_part:PGMimePart):PGMimeDataWrapper;cdecl;external libgmime3;
procedure g_mime_part_set_openpgp_data(mime_part:PGMimePart; data:TGMimeOpenPGPData);cdecl;external libgmime3;
function g_mime_part_get_openpgp_data(mime_part:PGMimePart):TGMimeOpenPGPData;cdecl;external libgmime3;
function g_mime_part_openpgp_encrypt(mime_part:PGMimePart; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; recipients:PGPtrArray; 
           err:PPGError):Tgboolean;cdecl;external libgmime3;
function g_mime_part_openpgp_decrypt(mime_part:PGMimePart; flags:TGMimeDecryptFlags; session_key:Pchar; err:PPGError):PGMimeDecryptResult;cdecl;external libgmime3;
function g_mime_part_openpgp_sign(mime_part:PGMimePart; userid:Pchar; err:PPGError):Tgboolean;cdecl;external libgmime3;
function g_mime_part_openpgp_verify(mime_part:PGMimePart; flags:TGMimeVerifyFlags; err:PPGError):PGMimeSignatureList;cdecl;external libgmime3;
{$endif}
{ __GMIME_PART_H__  }

// === Konventiert am: 18-9-25 15:32:56 ===

function GMIME_TYPE_PART : TGType;
function GMIME_PART(obj : Pointer) : PGMimePart;
function GMIME_PART_CLASS(klass : Pointer) : PGMimePartClass;
function GMIME_IS_PART(obj : Pointer) : Tgboolean;
function GMIME_IS_PART_CLASS(klass : Pointer) : Tgboolean;
function GMIME_PART_GET_CLASS(obj : Pointer) : PGMimePartClass;

implementation

function GMIME_TYPE_PART : TGType;
  begin
    GMIME_TYPE_PART:=g_mime_part_get_type;
  end;

function GMIME_PART(obj : Pointer) : PGMimePart;
begin
  Result := PGMimePart(g_type_check_instance_cast(obj, GMIME_TYPE_PART));
end;

function GMIME_PART_CLASS(klass : Pointer) : PGMimePartClass;
begin
  Result := PGMimePartClass(g_type_check_class_cast(klass, GMIME_TYPE_PART));
end;

function GMIME_IS_PART(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_PART);
end;

function GMIME_IS_PART_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_PART);
end;

function GMIME_PART_GET_CLASS(obj : Pointer) : PGMimePartClass;
begin
  Result := PGMimePartClass(PGTypeInstance(obj)^.g_class);
end;



end.

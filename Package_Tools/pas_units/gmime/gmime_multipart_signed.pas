unit gmime_multipart_signed;

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
{$ifndef __GMIME_MULTIPART_SIGNED_H__}
{$define __GMIME_MULTIPART_SIGNED_H__}
{$include <gmime/gmime-multipart.h>}
{$include <gmime/gmime-crypto-context.h>}

type
  Txxxxxx =  Longint;
  Const
    GMIME_MULTIPART_SIGNED_CONTENT = 0;
    GMIME_MULTIPART_SIGNED_SIGNATURE = 1;

{*
 * GMimeMultipartSigned:
 * @parent_object: parent #GMimeMultipart
 *
 * A multipart/signed MIME part.
 * }
type
  PGMimeMultipartSigned = ^TGMimeMultipartSigned;
  TGMimeMultipartSigned = record
      parent_object : TGMimeMultipart;
    end;

  PGMimeMultipartSignedClass = ^TGMimeMultipartSignedClass;
  TGMimeMultipartSignedClass = record
      parent_class : TGMimeMultipartClass;
    end;


function g_mime_multipart_signed_get_type:TGType;cdecl;external libgmime3;
function g_mime_multipart_signed_new:PGMimeMultipartSigned;cdecl;external libgmime3;
function g_mime_multipart_signed_sign(ctx:PGMimeCryptoContext; entity:PGMimeObject; userid:Pchar; err:PPGError):PGMimeMultipartSigned;cdecl;external libgmime3;
function g_mime_multipart_signed_verify(mps:PGMimeMultipartSigned; flags:TGMimeVerifyFlags; err:PPGError):PGMimeSignatureList;cdecl;external libgmime3;
{$endif}
{ __GMIME_MULTIPART_SIGNED_H__  }

// === Konventiert am: 18-9-25 15:30:01 ===

function GMIME_TYPE_MULTIPART_SIGNED : TGType;
function GMIME_MULTIPART_SIGNED(obj : Pointer) : PGMimeMultipartSigned;
function GMIME_MULTIPART_SIGNED_CLASS(klass : Pointer) : PGMimeMultipartSignedClass;
function GMIME_IS_MULTIPART_SIGNED(obj : Pointer) : Tgboolean;
function GMIME_IS_MULTIPART_SIGNED_CLASS(klass : Pointer) : Tgboolean;
function GMIME_MULTIPART_SIGNED_GET_CLASS(obj : Pointer) : PGMimeMultipartSignedClass;

implementation

function GMIME_TYPE_MULTIPART_SIGNED : TGType;
  begin
    GMIME_TYPE_MULTIPART_SIGNED:=g_mime_multipart_signed_get_type;
  end;

function GMIME_MULTIPART_SIGNED(obj : Pointer) : PGMimeMultipartSigned;
begin
  Result := PGMimeMultipartSigned(g_type_check_instance_cast(obj, GMIME_TYPE_MULTIPART_SIGNED));
end;

function GMIME_MULTIPART_SIGNED_CLASS(klass : Pointer) : PGMimeMultipartSignedClass;
begin
  Result := PGMimeMultipartSignedClass(g_type_check_class_cast(klass, GMIME_TYPE_MULTIPART_SIGNED));
end;

function GMIME_IS_MULTIPART_SIGNED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_MULTIPART_SIGNED);
end;

function GMIME_IS_MULTIPART_SIGNED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_MULTIPART_SIGNED);
end;

function GMIME_MULTIPART_SIGNED_GET_CLASS(obj : Pointer) : PGMimeMultipartSignedClass;
begin
  Result := PGMimeMultipartSignedClass(PGTypeInstance(obj)^.g_class);
end;



end.

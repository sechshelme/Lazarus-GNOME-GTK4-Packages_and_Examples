unit gmime_multipart_encrypted;

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
{$ifndef __GMIME_MULTIPART_ENCRYPTED_H__}
{$define __GMIME_MULTIPART_ENCRYPTED_H__}
{$include <gmime/gmime-multipart.h>}
{$include <gmime/gmime-crypto-context.h>}

type
  Txxxxxxxxxxxxxx =  Longint;
  Const
    GMIME_MULTIPART_ENCRYPTED_VERSION = 0;
    GMIME_MULTIPART_ENCRYPTED_CONTENT = 1;

{*
 * GMimeMultipartEncrypted:
 * @parent_object: parent #GMimeMultipart
 *
 * A multipart/encrypted MIME part.
 * }
type
  PGMimeMultipartEncrypted = ^TGMimeMultipartEncrypted;
  TGMimeMultipartEncrypted = record
      parent_object : TGMimeMultipart;
    end;

  PGMimeMultipartEncryptedClass = ^TGMimeMultipartEncryptedClass;
  TGMimeMultipartEncryptedClass = record
      parent_class : TGMimeMultipartClass;
    end;


function g_mime_multipart_encrypted_get_type:TGType;cdecl;external libgmime3;
function g_mime_multipart_encrypted_new:PGMimeMultipartEncrypted;cdecl;external libgmime3;
function g_mime_multipart_encrypted_encrypt(ctx:PGMimeCryptoContext; entity:PGMimeObject; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; 
           recipients:PGPtrArray; err:PPGError):PGMimeMultipartEncrypted;cdecl;external libgmime3;
function g_mime_multipart_encrypted_decrypt(encrypted:PGMimeMultipartEncrypted; flags:TGMimeDecryptFlags; session_key:Pchar; result:PPGMimeDecryptResult; err:PPGError):PGMimeObject;cdecl;external libgmime3;
{$endif}
{ __GMIME_MULTIPART_ENCRYPTED_H__  }

// === Konventiert am: 18-9-25 15:29:56 ===

function GMIME_TYPE_MULTIPART_ENCRYPTED : TGType;
function GMIME_MULTIPART_ENCRYPTED(obj : Pointer) : PGMimeMultipartEncrypted;
function GMIME_MULTIPART_ENCRYPTED_CLASS(klass : Pointer) : PGMimeMultipartEncryptedClass;
function GMIME_IS_MULTIPART_ENCRYPTED(obj : Pointer) : Tgboolean;
function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass : Pointer) : Tgboolean;
function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj : Pointer) : PGMimeMultipartEncryptedClass;

implementation

function GMIME_TYPE_MULTIPART_ENCRYPTED : TGType;
  begin
    GMIME_TYPE_MULTIPART_ENCRYPTED:=g_mime_multipart_encrypted_get_type;
  end;

function GMIME_MULTIPART_ENCRYPTED(obj : Pointer) : PGMimeMultipartEncrypted;
begin
  Result := PGMimeMultipartEncrypted(g_type_check_instance_cast(obj, GMIME_TYPE_MULTIPART_ENCRYPTED));
end;

function GMIME_MULTIPART_ENCRYPTED_CLASS(klass : Pointer) : PGMimeMultipartEncryptedClass;
begin
  Result := PGMimeMultipartEncryptedClass(g_type_check_class_cast(klass, GMIME_TYPE_MULTIPART_ENCRYPTED));
end;

function GMIME_IS_MULTIPART_ENCRYPTED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj : Pointer) : PGMimeMultipartEncryptedClass;
begin
  Result := PGMimeMultipartEncryptedClass(PGTypeInstance(obj)^.g_class);
end;



end.

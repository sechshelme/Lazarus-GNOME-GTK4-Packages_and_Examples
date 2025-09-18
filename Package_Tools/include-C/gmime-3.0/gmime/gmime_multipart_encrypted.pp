
unit gmime_multipart_encrypted;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_multipart_encrypted.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_multipart_encrypted.h
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
PGMimeCryptoContext  = ^GMimeCryptoContext;
PGMimeDecryptResult  = ^GMimeDecryptResult;
PGMimeMultipartEncrypted  = ^GMimeMultipartEncrypted;
PGMimeMultipartEncryptedClass  = ^GMimeMultipartEncryptedClass;
PGMimeObject  = ^GMimeObject;
PGPtrArray  = ^GPtrArray;
Pxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxx;
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

{ was #define dname def_expr }
function GMIME_TYPE_MULTIPART_ENCRYPTED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_ENCRYPTED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj : longint) : longint;

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


function g_mime_multipart_encrypted_get_type:TGType;cdecl;external;
function g_mime_multipart_encrypted_new:PGMimeMultipartEncrypted;cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_encrypted_encrypt(ctx:PGMimeCryptoContext; entity:PGMimeObject; sign:Tgboolean; userid:Pchar; flags:TGMimeEncryptFlags; 
           recipients:PGPtrArray; err:PPGError):PGMimeMultipartEncrypted;cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_encrypted_decrypt(encrypted:PGMimeMultipartEncrypted; flags:TGMimeDecryptFlags; session_key:Pchar; result:PPGMimeDecryptResult; err:PPGError):PGMimeObject;cdecl;external;
{$endif}
{ __GMIME_MULTIPART_ENCRYPTED_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_MULTIPART_ENCRYPTED : longint; { return type might be wrong }
  begin
    GMIME_TYPE_MULTIPART_ENCRYPTED:=g_mime_multipart_encrypted_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED(obj : longint) : longint;
begin
  GMIME_MULTIPART_ENCRYPTED:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_MULTIPART_ENCRYPTED,GMimeMultipartEncrypted);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED_CLASS(klass : longint) : longint;
begin
  GMIME_MULTIPART_ENCRYPTED_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_MULTIPART_ENCRYPTED,GMimeMultipartEncryptedClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_ENCRYPTED(obj : longint) : longint;
begin
  GMIME_IS_MULTIPART_ENCRYPTED:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_ENCRYPTED_CLASS(klass : longint) : longint;
begin
  GMIME_IS_MULTIPART_ENCRYPTED_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_MULTIPART_ENCRYPTED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_ENCRYPTED_GET_CLASS(obj : longint) : longint;
begin
  GMIME_MULTIPART_ENCRYPTED_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_MULTIPART_ENCRYPTED,GMimeMultipartEncryptedClass);
end;


end.

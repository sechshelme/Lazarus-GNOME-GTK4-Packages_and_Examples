
unit gmime_application_pkcs7_mime;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_application_pkcs7_mime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_application_pkcs7_mime.h
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
PGMimeApplicationPkcs7Mime  = ^GMimeApplicationPkcs7Mime;
PGMimeApplicationPkcs7MimeClass  = ^GMimeApplicationPkcs7MimeClass;
PGMimeDecryptResult  = ^GMimeDecryptResult;
PGMimeObject  = ^GMimeObject;
PGMimeSecureMimeType  = ^GMimeSecureMimeType;
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
{$ifndef __GMIME_APPLICATION_PKCS7_MIME_H__}
{$define __GMIME_APPLICATION_PKCS7_MIME_H__}
{$include <glib.h>}
{$include <gmime/gmime-part.h>}
{$include <gmime/gmime-pkcs7-context.h>}

{ was #define dname def_expr }
function GMIME_TYPE_APPLICATION_PKCS7_MIME : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_APPLICATION_PKCS7_MIME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeSecureMimeType:
 * @GMIME_SECURE_MIME_TYPE_COMPRESSED_DATA: The S/MIME content contains compressed data.
 * @GMIME_SECURE_MIME_TYPE_ENVELOPED_DATA: The S/MIME content contains enveloped data.
 * @GMIME_SECURE_MIME_TYPE_SIGNED_DATA: The S/MIME content contains signed data.
 * @GMIME_SECURE_MIME_TYPE_CERTS_ONLY: The S/MIME content contains only certificates.
 * @GMIME_SECURE_MIME_TYPE_UNKNOWN: The S/MIME content is unknown.
 *
 * The S/MIME data type.
 * }

  PGMimeSecureMimeType = ^TGMimeSecureMimeType;
  TGMimeSecureMimeType =  Longint;
  Const
    GMIME_SECURE_MIME_TYPE_COMPRESSED_DATA = 0;
    GMIME_SECURE_MIME_TYPE_ENVELOPED_DATA = 1;
    GMIME_SECURE_MIME_TYPE_SIGNED_DATA = 2;
    GMIME_SECURE_MIME_TYPE_CERTS_ONLY = 3;
    GMIME_SECURE_MIME_TYPE_UNKNOWN = 4;
;
{*
 * GMimeApplicationPkcs7Mime:
 * @parent_object: parent #GMimePart object
 * @smime_type: The smime-type Content-Type parameter.
 *
 * An application/pkcs7-mime MIME part.
 * }
type
  PGMimeApplicationPkcs7Mime = ^TGMimeApplicationPkcs7Mime;
  TGMimeApplicationPkcs7Mime = record
      parent_object : TGMimePart;
      smime_type : TGMimeSecureMimeType;
    end;

  PGMimeApplicationPkcs7MimeClass = ^TGMimeApplicationPkcs7MimeClass;
  TGMimeApplicationPkcs7MimeClass = record
      parent_class : TGMimePartClass;
    end;


function g_mime_application_pkcs7_mime_get_type:TGType;cdecl;external;
function g_mime_application_pkcs7_mime_new(_type:TGMimeSecureMimeType):PGMimeApplicationPkcs7Mime;cdecl;external;
function g_mime_application_pkcs7_mime_get_smime_type(pkcs7_mime:PGMimeApplicationPkcs7Mime):TGMimeSecureMimeType;cdecl;external;
{GMimeApplicationPkcs7Mime *g_mime_application_pkcs7_mime_compress (GMimeObject *entity, GError **err); }
{GMimeObject *g_mime_application_pkcs7_mime_decompress (GMimeApplicationPkcs7Mime *pkcs7_mime); }
function g_mime_application_pkcs7_mime_encrypt(entity:PGMimeObject; flags:TGMimeEncryptFlags; recipients:PGPtrArray; err:PPGError):PGMimeApplicationPkcs7Mime;cdecl;external;
(* Const before type ignored *)
function g_mime_application_pkcs7_mime_decrypt(pkcs7_mime:PGMimeApplicationPkcs7Mime; flags:TGMimeDecryptFlags; session_key:Pchar; result:PPGMimeDecryptResult; err:PPGError):PGMimeObject;cdecl;external;
(* Const before type ignored *)
function g_mime_application_pkcs7_mime_sign(entity:PGMimeObject; userid:Pchar; err:PPGError):PGMimeApplicationPkcs7Mime;cdecl;external;
function g_mime_application_pkcs7_mime_verify(pkcs7_mime:PGMimeApplicationPkcs7Mime; flags:TGMimeVerifyFlags; entity:PPGMimeObject; err:PPGError):PGMimeSignatureList;cdecl;external;
{$endif}
{ __GMIME_APPLICATION_PKCS7_MIME_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_APPLICATION_PKCS7_MIME : longint; { return type might be wrong }
  begin
    GMIME_TYPE_APPLICATION_PKCS7_MIME:=g_mime_application_pkcs7_mime_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME(obj : longint) : longint;
begin
  GMIME_APPLICATION_PKCS7_MIME:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_APPLICATION_PKCS7_MIME,GMimeApplicationPkcs7Mime);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass : longint) : longint;
begin
  GMIME_APPLICATION_PKCS7_MIME_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_APPLICATION_PKCS7_MIME,GMimeApplicationPkcs7MimeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_APPLICATION_PKCS7_MIME(obj : longint) : longint;
begin
  GMIME_IS_APPLICATION_PKCS7_MIME:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass : longint) : longint;
begin
  GMIME_IS_APPLICATION_PKCS7_MIME_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj : longint) : longint;
begin
  GMIME_APPLICATION_PKCS7_MIME_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_APPLICATION_PKCS7_MIME,GMimeApplicationPkcs7MimeClass);
end;


end.

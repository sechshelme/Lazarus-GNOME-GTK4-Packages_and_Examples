unit gmime_application_pkcs7_mime;

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
{$ifndef __GMIME_APPLICATION_PKCS7_MIME_H__}
{$define __GMIME_APPLICATION_PKCS7_MIME_H__}
{$include <glib.h>}
{$include <gmime/gmime-part.h>}
{$include <gmime/gmime-pkcs7-context.h>}

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


function g_mime_application_pkcs7_mime_get_type:TGType;cdecl;external libgmime3;
function g_mime_application_pkcs7_mime_new(_type:TGMimeSecureMimeType):PGMimeApplicationPkcs7Mime;cdecl;external libgmime3;
function g_mime_application_pkcs7_mime_get_smime_type(pkcs7_mime:PGMimeApplicationPkcs7Mime):TGMimeSecureMimeType;cdecl;external libgmime3;
{GMimeApplicationPkcs7Mime *g_mime_application_pkcs7_mime_compress (GMimeObject *entity, GError **err); }
{GMimeObject *g_mime_application_pkcs7_mime_decompress (GMimeApplicationPkcs7Mime *pkcs7_mime); }
function g_mime_application_pkcs7_mime_encrypt(entity:PGMimeObject; flags:TGMimeEncryptFlags; recipients:PGPtrArray; err:PPGError):PGMimeApplicationPkcs7Mime;cdecl;external libgmime3;
function g_mime_application_pkcs7_mime_decrypt(pkcs7_mime:PGMimeApplicationPkcs7Mime; flags:TGMimeDecryptFlags; session_key:Pchar; result:PPGMimeDecryptResult; err:PPGError):PGMimeObject;cdecl;external libgmime3;
function g_mime_application_pkcs7_mime_sign(entity:PGMimeObject; userid:Pchar; err:PPGError):PGMimeApplicationPkcs7Mime;cdecl;external libgmime3;
function g_mime_application_pkcs7_mime_verify(pkcs7_mime:PGMimeApplicationPkcs7Mime; flags:TGMimeVerifyFlags; entity:PPGMimeObject; err:PPGError):PGMimeSignatureList;cdecl;external libgmime3;
{$endif}
{ __GMIME_APPLICATION_PKCS7_MIME_H__  }

// === Konventiert am: 18-9-25 15:25:07 ===

function GMIME_TYPE_APPLICATION_PKCS7_MIME : TGType;
function GMIME_APPLICATION_PKCS7_MIME(obj : Pointer) : PGMimeApplicationPkcs7Mime;
function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass : Pointer) : PGMimeApplicationPkcs7MimeClass;
function GMIME_IS_APPLICATION_PKCS7_MIME(obj : Pointer) : Tgboolean;
function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass : Pointer) : Tgboolean;
function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj : Pointer) : PGMimeApplicationPkcs7MimeClass;

implementation

function GMIME_TYPE_APPLICATION_PKCS7_MIME : TGType;
  begin
    GMIME_TYPE_APPLICATION_PKCS7_MIME:=g_mime_application_pkcs7_mime_get_type;
  end;

function GMIME_APPLICATION_PKCS7_MIME(obj : Pointer) : PGMimeApplicationPkcs7Mime;
begin
  Result := PGMimeApplicationPkcs7Mime(g_type_check_instance_cast(obj, GMIME_TYPE_APPLICATION_PKCS7_MIME));
end;

function GMIME_APPLICATION_PKCS7_MIME_CLASS(klass : Pointer) : PGMimeApplicationPkcs7MimeClass;
begin
  Result := PGMimeApplicationPkcs7MimeClass(g_type_check_class_cast(klass, GMIME_TYPE_APPLICATION_PKCS7_MIME));
end;

function GMIME_IS_APPLICATION_PKCS7_MIME(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

function GMIME_IS_APPLICATION_PKCS7_MIME_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_APPLICATION_PKCS7_MIME);
end;

function GMIME_APPLICATION_PKCS7_MIME_GET_CLASS(obj : Pointer) : PGMimeApplicationPkcs7MimeClass;
begin
  Result := PGMimeApplicationPkcs7MimeClass(PGTypeInstance(obj)^.g_class);
end;



end.

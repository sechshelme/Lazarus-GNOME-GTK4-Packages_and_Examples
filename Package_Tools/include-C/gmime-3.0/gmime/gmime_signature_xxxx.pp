
unit gmime_signature_xxxx;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_signature_xxxx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_signature_xxxx.h
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
PGMimeCertificate  = ^GMimeCertificate;
PGMimeSignature  = ^GMimeSignature;
PGMimeSignatureClass  = ^GMimeSignatureClass;
PGMimeSignatureList  = ^GMimeSignatureList;
PGMimeSignatureListClass  = ^GMimeSignatureListClass;
PGMimeSignatureStatus  = ^GMimeSignatureStatus;
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
{$ifndef __GMIME_SIGNATURE_H__}
{$define __GMIME_SIGNATURE_H__}
{$include <gmime/gmime-certificate.h>}

{ was #define dname def_expr }
function GMIME_TYPE_SIGNATURE_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_SIGNATURE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_SIGNATURE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeSignatureStatus:
 * @GMIME_SIGNATURE_STATUS_VALID: The signature is fully valid.
 * @GMIME_SIGNATURE_STATUS_GREEN: The signature is good.
 * @GMIME_SIGNATURE_STATUS_RED: The signature is bad.
 * @GMIME_SIGNATURE_STATUS_KEY_REVOKED: The key has been revoked.
 * @GMIME_SIGNATURE_STATUS_KEY_EXPIRED: The key has expired.
 * @GMIME_SIGNATURE_STATUS_SIG_EXPIRED: The signature has expired.
 * @GMIME_SIGNATURE_STATUS_KEY_MISSING: Can't verify due to missing key.
 * @GMIME_SIGNATURE_STATUS_CRL_MISSING: CRL not available.
 * @GMIME_SIGNATURE_STATUS_CRL_TOO_OLD: Available CRL is too old.
 * @GMIME_SIGNATURE_STATUS_BAD_POLICY: A policy was not met.
 * @GMIME_SIGNATURE_STATUS_SYS_ERROR: A system error occurred.
 * @GMIME_SIGNATURE_STATUS_TOFU_CONFLICT: Tofu conflict detected.
 *
 * A value representing the signature status bit flags for a particular
 * #GMimeSignature.
 * }

  PGMimeSignatureStatus = ^TGMimeSignatureStatus;
  TGMimeSignatureStatus =  Longint;
  Const
    GMIME_SIGNATURE_STATUS_VALID = $0001;
    GMIME_SIGNATURE_STATUS_GREEN = $0002;
    GMIME_SIGNATURE_STATUS_RED = $0004;
    GMIME_SIGNATURE_STATUS_KEY_REVOKED = $0010;
    GMIME_SIGNATURE_STATUS_KEY_EXPIRED = $0020;
    GMIME_SIGNATURE_STATUS_SIG_EXPIRED = $0040;
    GMIME_SIGNATURE_STATUS_KEY_MISSING = $0080;
    GMIME_SIGNATURE_STATUS_CRL_MISSING = $0100;
    GMIME_SIGNATURE_STATUS_CRL_TOO_OLD = $0200;
    GMIME_SIGNATURE_STATUS_BAD_POLICY = $0400;
    GMIME_SIGNATURE_STATUS_SYS_ERROR = $0800;
    GMIME_SIGNATURE_STATUS_TOFU_CONFLICT = $1000;
;
{*
 * GMIME_SIGNATURE_STATUS_ERROR_MASK:
 *
 * A convenience macro for masking out the non-error bit flags.
 * }
  GMIME_SIGNATURE_STATUS_ERROR_MASK =  not ((GMIME_SIGNATURE_STATUS_VALID or GMIME_SIGNATURE_STATUS_GREEN) or GMIME_SIGNATURE_STATUS_RED);  
{*
 * GMimeSignature:
 * @parent_object: parent #GObject
 * @status: A bitfield of #GMimeSignatureStatus values.
 * @cert: The #GMimeCertificate used in the signature.
 * @created: The creation date of the signature.
 * @expires: The expiration date of the signature.
 *
 * An object containing useful information about a signature.
 * }
type
  PGMimeSignature = ^TGMimeSignature;
  TGMimeSignature = record
      parent_object : TGObject;
      status : TGMimeSignatureStatus;
      cert : PGMimeCertificate;
      created : Ttime_t;
      expires : Ttime_t;
    end;

  PGMimeSignatureClass = ^TGMimeSignatureClass;
  TGMimeSignatureClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_signature_get_type:TGType;cdecl;external;
function g_mime_signature_new:PGMimeSignature;cdecl;external;
procedure g_mime_signature_set_certificate(sig:PGMimeSignature; cert:PGMimeCertificate);cdecl;external;
function g_mime_signature_get_certificate(sig:PGMimeSignature):PGMimeCertificate;cdecl;external;
procedure g_mime_signature_set_status(sig:PGMimeSignature; status:TGMimeSignatureStatus);cdecl;external;
function g_mime_signature_get_status(sig:PGMimeSignature):TGMimeSignatureStatus;cdecl;external;
procedure g_mime_signature_set_created(sig:PGMimeSignature; created:Ttime_t);cdecl;external;
function g_mime_signature_get_created(sig:PGMimeSignature):Ttime_t;cdecl;external;
function g_mime_signature_get_created64(sig:PGMimeSignature):Tgint64;cdecl;external;
procedure g_mime_signature_set_expires(sig:PGMimeSignature; expires:Ttime_t);cdecl;external;
function g_mime_signature_get_expires(sig:PGMimeSignature):Ttime_t;cdecl;external;
function g_mime_signature_get_expires64(sig:PGMimeSignature):Tgint64;cdecl;external;
{*
 * GMimeSignatureList:
 * @parent_object: parent #GObject
 *
 * A collection of #GMimeSignature objects.
 * }
{ < private >  }
type
  PGMimeSignatureList = ^TGMimeSignatureList;
  TGMimeSignatureList = record
      parent_object : TGObject;
      array : PGPtrArray;
    end;

  PGMimeSignatureListClass = ^TGMimeSignatureListClass;
  TGMimeSignatureListClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_signature_list_get_type:TGType;cdecl;external;
function g_mime_signature_list_new:PGMimeSignatureList;cdecl;external;
function g_mime_signature_list_length(list:PGMimeSignatureList):longint;cdecl;external;
procedure g_mime_signature_list_clear(list:PGMimeSignatureList);cdecl;external;
function g_mime_signature_list_add(list:PGMimeSignatureList; sig:PGMimeSignature):longint;cdecl;external;
procedure g_mime_signature_list_insert(list:PGMimeSignatureList; index:longint; sig:PGMimeSignature);cdecl;external;
function g_mime_signature_list_remove(list:PGMimeSignatureList; sig:PGMimeSignature):Tgboolean;cdecl;external;
function g_mime_signature_list_remove_at(list:PGMimeSignatureList; index:longint):Tgboolean;cdecl;external;
function g_mime_signature_list_contains(list:PGMimeSignatureList; sig:PGMimeSignature):Tgboolean;cdecl;external;
function g_mime_signature_list_index_of(list:PGMimeSignatureList; sig:PGMimeSignature):longint;cdecl;external;
function g_mime_signature_list_get_signature(list:PGMimeSignatureList; index:longint):PGMimeSignature;cdecl;external;
procedure g_mime_signature_list_set_signature(list:PGMimeSignatureList; index:longint; sig:PGMimeSignature);cdecl;external;
{$endif}
{ __GMIME_SIGNATURE_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_SIGNATURE_LIST : longint; { return type might be wrong }
  begin
    GMIME_TYPE_SIGNATURE_LIST:=g_mime_signature_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST(obj : longint) : longint;
begin
  GMIME_SIGNATURE_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_SIGNATURE_LIST,GMimeSignatureList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_SIGNATURE_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_SIGNATURE_LIST,GMimeSignatureListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_SIGNATURE_LIST(obj : longint) : longint;
begin
  GMIME_IS_SIGNATURE_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_SIGNATURE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_SIGNATURE_LIST_CLASS(klass : longint) : longint;
begin
  GMIME_IS_SIGNATURE_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_SIGNATURE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_SIGNATURE_LIST_GET_CLASS(obj : longint) : longint;
begin
  GMIME_SIGNATURE_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_SIGNATURE_LIST,GMimeSignatureListClass);
end;


end.

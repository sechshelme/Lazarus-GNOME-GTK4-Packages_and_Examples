unit gmime_pkcs7_context;

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
{$ifndef __GMIME_PKCS7_CONTEXT_H__}
{$define __GMIME_PKCS7_CONTEXT_H__}
{$include <gmime/gmime-crypto-context.h>}

type

function g_mime_pkcs7_context_get_type:TGType;cdecl;external libgmime3;
function g_mime_pkcs7_context_new:PGMimeCryptoContext;cdecl;external libgmime3;
{$endif}
{ __GMIME_PKCS7_CONTEXT_H__  }

// === Konventiert am: 18-9-25 15:33:11 ===

function GMIME_TYPE_PKCS7_CONTEXT : TGType;
function GMIME_PKCS7_CONTEXT(obj : Pointer) : PGMimePkcs7Context;
function GMIME_PKCS7_CONTEXT_CLASS(klass : Pointer) : PGMimePkcs7ContextClass;
function GMIME_IS_PKCS7_CONTEXT(obj : Pointer) : Tgboolean;
function GMIME_IS_PKCS7_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GMIME_PKCS7_CONTEXT_GET_CLASS(obj : Pointer) : PGMimePkcs7ContextClass;

implementation

function GMIME_TYPE_PKCS7_CONTEXT : TGType;
  begin
    GMIME_TYPE_PKCS7_CONTEXT:=g_mime_pkcs7_context_get_type;
  end;

function GMIME_PKCS7_CONTEXT(obj : Pointer) : PGMimePkcs7Context;
begin
  Result := PGMimePkcs7Context(g_type_check_instance_cast(obj, GMIME_TYPE_PKCS7_CONTEXT));
end;

function GMIME_PKCS7_CONTEXT_CLASS(klass : Pointer) : PGMimePkcs7ContextClass;
begin
  Result := PGMimePkcs7ContextClass(g_type_check_class_cast(klass, GMIME_TYPE_PKCS7_CONTEXT));
end;

function GMIME_IS_PKCS7_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_PKCS7_CONTEXT);
end;

function GMIME_IS_PKCS7_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_PKCS7_CONTEXT);
end;

function GMIME_PKCS7_CONTEXT_GET_CLASS(obj : Pointer) : PGMimePkcs7ContextClass;
begin
  Result := PGMimePkcs7ContextClass(PGTypeInstance(obj)^.g_class);
end;



end.

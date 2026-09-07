unit pk_client_helper;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010 Richard Hughes <richard@hughsie.com>
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
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_CLIENT_HELPER_H}
{$define __PK_CLIENT_HELPER_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

type
  PPkClientHelper = ^TPkClientHelper;
  TPkClientHelper = record
      parent : TGObject;
      priv : PPkClientHelperPrivate;
    end;

{ padding for future expansion  }
  PPkClientHelperClass = ^TPkClientHelperClass;
  TPkClientHelperClass = record
      parent_class : TGObjectClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_client_helper_get_type:TGType;cdecl;external libpackagekit ;
function pk_client_helper_new:PPkClientHelper;cdecl;external libpackagekit ;
function pk_client_helper_stop(client_helper:PPkClientHelper; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_client_helper_start(client_helper:PPkClientHelper; socket_filename:Pgchar; argv:PPgchar; envp:PPgchar; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_client_helper_start_with_socket(client_helper:PPkClientHelper; socket:PGSocket; argv:PPgchar; envp:PPgchar; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_client_helper_is_active(client_helper:PPkClientHelper):Tgboolean;cdecl;external libpackagekit ;
{$endif}
{ __PK_CLIENT_HELPER_H  }

// === Konventiert am: 7-9-26 15:04:11 ===

function PK_TYPE_CLIENT_HELPER : TGType;
function PK_CLIENT_HELPER(obj : Pointer) : PPkClientHelper;
function PK_CLIENT_HELPER_CLASS(klass : Pointer) : PPkClientHelperClass;
function PK_IS_CLIENT_HELPER(obj : Pointer) : Tgboolean;
function PK_IS_CLIENT_HELPER_CLASS(klass : Pointer) : Tgboolean;
function PK_CLIENT_HELPER_GET_CLASS(obj : Pointer) : PPkClientHelperClass;

implementation

function PK_TYPE_CLIENT_HELPER : TGType;
  begin
    PK_TYPE_CLIENT_HELPER:=pk_client_helper_get_type;
  end;

function PK_CLIENT_HELPER(obj : Pointer) : PPkClientHelper;
begin
  Result := PPkClientHelper(g_type_check_instance_cast(obj, PK_TYPE_CLIENT_HELPER));
end;

function PK_CLIENT_HELPER_CLASS(klass : Pointer) : PPkClientHelperClass;
begin
  Result := PPkClientHelperClass(g_type_check_class_cast(klass, PK_TYPE_CLIENT_HELPER));
end;

function PK_IS_CLIENT_HELPER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_CLIENT_HELPER);
end;

function PK_IS_CLIENT_HELPER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_CLIENT_HELPER);
end;

function PK_CLIENT_HELPER_GET_CLASS(obj : Pointer) : PPkClientHelperClass;
begin
  Result := PPkClientHelperClass(PGTypeInstance(obj)^.g_class);
end;



end.

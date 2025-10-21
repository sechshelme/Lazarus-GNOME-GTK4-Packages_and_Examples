unit gipropertyinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Property
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <girepository/gitypes.h>}

 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_PROPERTY_INFO(obj : longint) : longint;

{*
 * GI_IS_PROPERTY_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.PropertyInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_PROPERTY_INFO(obj : longint) : longint;

function gi_property_info_get_flags(info:PGIPropertyInfo):TGParamFlags;cdecl;external libgirepository2;
function gi_property_info_get_type_info(info:PGIPropertyInfo):PGITypeInfo;cdecl;external libgirepository2;
function gi_property_info_get_ownership_transfer(info:PGIPropertyInfo):TGITransfer;cdecl;external libgirepository2;
function gi_property_info_get_setter(info:PGIPropertyInfo):PGIFunctionInfo;cdecl;external libgirepository2;
function gi_property_info_get_getter(info:PGIPropertyInfo):PGIFunctionInfo;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:35:37 ===

function GI_TYPE_PROPERTY_INFO : TGType;
function GI_PROPERTY_INFO(obj : Pointer) : PGIPropertyInfo;
function GI_IS_PROPERTY_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_PROPERTY_INFO : TGType;
  begin
    GI_TYPE_PROPERTY_INFO:=gi_property_info_get_type;
  end;

function GI_PROPERTY_INFO(obj : Pointer) : PGIPropertyInfo;
begin
  Result := PGIPropertyInfo(g_type_check_instance_cast(obj, GI_TYPE_PROPERTY_INFO));
end;

function GI_IS_PROPERTY_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_PROPERTY_INFO);
end;



end.

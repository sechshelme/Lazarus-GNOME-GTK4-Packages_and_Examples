unit gisignalinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: Signal
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
{$include <glib-object.h>}
{$include <girepository/gitypes.h>}

 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_SIGNAL_INFO(obj : longint) : longint;

{*
 * GI_IS_SIGNAL_INFO:
 * @info: an info structure
 *
 * Checks if @info is a [class@GIRepository.SignalInfo] (or a derived type).
 *
 * Since: 2.80
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GI_IS_SIGNAL_INFO(obj : longint) : longint;

function gi_signal_info_get_flags(info:PGISignalInfo):TGSignalFlags;cdecl;external libgirepository2;
function gi_signal_info_get_class_closure(info:PGISignalInfo):PGIVFuncInfo;cdecl;external libgirepository2;
function gi_signal_info_true_stops_emit(info:PGISignalInfo):Tgboolean;cdecl;external libgirepository2;

// === Konventiert am: 21-10-25 13:36:22 ===

function GI_TYPE_SIGNAL_INFO : TGType;
function GI_SIGNAL_INFO(obj : Pointer) : PGISignalInfo;
function GI_IS_SIGNAL_INFO(obj : Pointer) : Tgboolean;

implementation

function GI_TYPE_SIGNAL_INFO : TGType;
  begin
    GI_TYPE_SIGNAL_INFO:=gi_signal_info_get_type;
  end;

function GI_SIGNAL_INFO(obj : Pointer) : PGISignalInfo;
begin
  Result := PGISignalInfo(g_type_check_instance_cast(obj, GI_TYPE_SIGNAL_INFO));
end;

function GI_IS_SIGNAL_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GI_TYPE_SIGNAL_INFO);
end;



end.

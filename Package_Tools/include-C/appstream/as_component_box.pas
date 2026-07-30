unit as_component_box;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "as-component.h"}
type
{< private > }
  PAsComponentBox = ^TAsComponentBox;
  TAsComponentBox = record
      parent_instance : TGObject;
      cpts : PGPtrArray;
    end;

{< private > }
  PAsComponentBoxClass = ^TAsComponentBoxClass;
  TAsComponentBoxClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;


function as_component_box_get_type:TGType;cdecl;external libappstream;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC   (AsComponentBox, g_object_unref) }
{*
 * AsComponentBoxFlags:
 * @AS_COMPONENT_BOX_FLAG_NONE:		No flags.
 * @AS_COMPONENT_BOX_FLAG_NO_CHECKS:	Only perform the most basic verification.
 *
 * Flags controlling the component box behavior.
 * }
type
  PAsComponentBoxFlags = ^TAsComponentBoxFlags;
  TAsComponentBoxFlags =  Longint;
  Const
    AS_COMPONENT_BOX_FLAG_NONE = 0;
    AS_COMPONENT_BOX_FLAG_NO_CHECKS = 1 shl 0;
;

function as_component_box_new(flags:TAsComponentBoxFlags):PAsComponentBox;cdecl;external libappstream;
function as_component_box_new_simple:PAsComponentBox;cdecl;external libappstream;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_component_box_index(cbox,index_ : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_component_box_len(cbox : longint) : longint;

function as_component_box_as_array(cbox:PAsComponentBox):PGPtrArray;cdecl;external libappstream;
function as_component_box_get_flags(cbox:PAsComponentBox):TAsComponentBoxFlags;cdecl;external libappstream;
function as_component_box_get_size(cbox:PAsComponentBox):Tguint;cdecl;external libappstream;
function as_component_box_index_safe(cbox:PAsComponentBox; index:Tguint):PAsComponent;cdecl;external libappstream;
function as_component_box_is_empty(cbox:PAsComponentBox):Tgboolean;cdecl;external libappstream;
function as_component_box_add(cbox:PAsComponentBox; cpt:PAsComponent; error:PPGError):Tgboolean;cdecl;external libappstream;
procedure as_component_box_clear(cbox:PAsComponentBox);cdecl;external libappstream;
procedure as_component_box_remove_at(cbox:PAsComponentBox; index:Tguint);cdecl;external libappstream;
procedure as_component_box_sort(cbox:PAsComponentBox);cdecl;external libappstream;
procedure as_component_box_sort_by_score(cbox:PAsComponentBox);cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:36:24 ===

function AS_TYPE_COMPONENT_BOX : TGType;
function AS_COMPONENT_BOX(obj : Pointer) : PAsComponentBox;

implementation

function AS_TYPE_COMPONENT_BOX : TGType;
  begin
    AS_TYPE_COMPONENT_BOX:=as_component_box_get_type;
  end;

function AS_COMPONENT_BOX(obj : Pointer) : PAsComponentBox;
begin
  Result := PAsComponentBox(g_type_check_instance_cast(obj, AS_TYPE_COMPONENT_BOX));
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_component_box_index(cbox,index_ : longint) : longint;
begin
  as_component_box_index:=AS_COMPONENT(g_ptr_array_index(cbox^.cpts,index_));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function as_component_box_len(cbox : longint) : longint;
begin
  as_component_box_len:=cbox^.(cpts^.len);
end;


end.

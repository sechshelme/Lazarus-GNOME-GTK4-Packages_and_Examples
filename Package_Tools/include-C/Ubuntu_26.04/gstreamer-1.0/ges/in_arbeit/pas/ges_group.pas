unit ges_group;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * Gstreamer
 *
 * Copyright (C) <2013> Thibault Saunier <thibault.saunier@collabora.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include "ges-clip.h"}
{$include "ges-container.h"}

{GES_DECLARE_TYPE(Group, group, GROUP); }
{< private > }
type
  PGESGroup = ^TGESGroup;
  TGESGroup = record
      parent : TGESContainer;
      priv : PGESGroupPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

  PGESGroupClass = ^TGESGroupClass;
  TGESGroupClass = record
      parent_class : TGESContainerClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_group_new:PGESGroup;cdecl;external libges;

// === Konventiert am: 27-7-26 20:01:18 ===

function GES_TYPE_GROUP: TGType;
function GES_GROUP(obj: Pointer): PGESGroup;
function GES_IS_GROUP(obj: Pointer): Tgboolean;
function GES_GROUP_CLASS(klass: Pointer): PGESGroupClass;
function GES_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
function GES_GROUP_GET_CLASS(obj: Pointer): PGESGroupClass;

implementation

function GES_TYPE_GROUP: TGType;
begin
  Result := ges_group_get_type;
end;

function GES_GROUP(obj: Pointer): PGESGroup;
begin
  Result := PGESGroup(g_type_check_instance_cast(obj, GES_TYPE_GROUP));
end;

function GES_IS_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_GROUP);
end;

function GES_GROUP_CLASS(klass: Pointer): PGESGroupClass;
begin
  Result := PGESGroupClass(g_type_check_class_cast(klass, GES_TYPE_GROUP));
end;

function GES_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_GROUP);
end;

function GES_GROUP_GET_CLASS(obj: Pointer): PGESGroupClass;
begin
  Result := PGESGroupClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESGroupPrivate = type Pointer

function ges_group_get_type: TGType; cdecl; external libgxxxxxxx;



end.

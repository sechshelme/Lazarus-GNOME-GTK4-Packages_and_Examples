unit ges_source_clip_asset;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2020 Igalia S.L
 *     Author: 2020 Thibault Saunier <tsaunier@igalia.com>
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
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <ges/ges-clip-asset.h>}

{*
 * GESSourceClipAsset:
 *
 * An asset types from which #GESSourceClip will be extracted
 *
 * Since: 1.18
  }
{G_DECLARE_DERIVABLE_TYPE(GESSourceClipAsset, ges_source_clip_asset, GES, SOURCE_CLIP_ASSET, GESClipAsset); }
{ FIXME 2.0: Add some padding, meanwhile that would break ABI  }
type
  PGESSourceClipAssetClass = ^TGESSourceClipAssetClass;
  TGESSourceClipAssetClass = record
      parent_class : TGESClipAssetClass;
    end;


// === Konventiert am: 28-7-26 13:14:08 ===

function GES_TYPE_SOURCE_CLIP_ASSET: TGType;
function GES_SOURCE_CLIP_ASSET(obj: Pointer): PGESSourceClipAsset;
function GES_IS_SOURCE_CLIP_ASSET(obj: Pointer): Tgboolean;
function GES_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): PGESSourceClipAssetClass;
function GES_IS_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESSourceClipAssetClass;

implementation

function GES_TYPE_SOURCE_CLIP_ASSET: TGType;
begin
  Result := ges_source_clip_asset_get_type;
end;

function GES_SOURCE_CLIP_ASSET(obj: Pointer): PGESSourceClipAsset;
begin
  Result := PGESSourceClipAsset(g_type_check_instance_cast(obj, GES_TYPE_SOURCE_CLIP_ASSET));
end;

function GES_IS_SOURCE_CLIP_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_SOURCE_CLIP_ASSET);
end;

function GES_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): PGESSourceClipAssetClass;
begin
  Result := PGESSourceClipAssetClass(g_type_check_class_cast(klass, GES_TYPE_SOURCE_CLIP_ASSET));
end;

function GES_IS_SOURCE_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_SOURCE_CLIP_ASSET);
end;

function GES_SOURCE_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESSourceClipAssetClass;
begin
  Result := PGESSourceClipAssetClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGESSourceClipAsset = record
    parent_instance: TGESClipAsset;
  end;
  PGESSourceClipAsset = ^TGESSourceClipAsset;

  PGESSourceClipAssetClass = type Pointer;

function ges_source_clip_asset_get_type: TGType; cdecl; external libgxxxxxxx;



end.

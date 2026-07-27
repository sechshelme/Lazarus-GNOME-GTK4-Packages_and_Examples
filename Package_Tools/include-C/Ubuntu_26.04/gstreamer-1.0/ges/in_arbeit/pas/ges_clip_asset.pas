unit ges_clip_asset;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 *
 * Copyright (C) 2012 Thibault Saunier <thibault.saunier@collabora.com>
 * Copyright (C) 2012 Volodymyr Rudyi <vladimir.rudoy@gmail.com>
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
{$include <ges/ges-asset.h>}

{GES_DECLARE_TYPE(ClipAsset, clip_asset, CLIP_ASSET); }
{ <private>  }
type
  PGESClipAsset = ^TGESClipAsset;
  TGESClipAsset = record
      parent : TGESAsset;
      priv : PGESClipAssetPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
   * GESClipAssetClass::get_natural_framerate:
   * @self: A #GESClipAsset
   * @framerate_n: The framerate numerator to retrieve
   * @framerate_d: The framerate denominator to retrieve
   *
   * Returns: %TRUE if @self has a natural framerate @FALSE otherwise.
   *
   * Since: 1.18
    }
  PGESClipAssetClass = ^TGESClipAssetClass;
  TGESClipAssetClass = record
      parent : TGESAssetClass;
      get_natural_framerate : function (self:PGESClipAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;


procedure ges_clip_asset_set_supported_formats(self:PGESClipAsset; supportedformats:TGESTrackType);cdecl;external libges;
function ges_clip_asset_get_supported_formats(self:PGESClipAsset):TGESTrackType;cdecl;external libges;
function ges_clip_asset_get_natural_framerate(self:PGESClipAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;external libges;
function ges_clip_asset_get_frame_time(self:PGESClipAsset; frame_number:TGESFrameNumber):TGstClockTime;cdecl;external libges;

// === Konventiert am: 27-7-26 19:55:22 ===

function GES_TYPE_CLIP_ASSET: TGType;
function GES_CLIP_ASSET(obj: Pointer): PGESClipAsset;
function GES_IS_CLIP_ASSET(obj: Pointer): Tgboolean;
function GES_CLIP_ASSET_CLASS(klass: Pointer): PGESClipAssetClass;
function GES_IS_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESClipAssetClass;

implementation

function GES_TYPE_CLIP_ASSET: TGType;
begin
  Result := ges_clip_asset_get_type;
end;

function GES_CLIP_ASSET(obj: Pointer): PGESClipAsset;
begin
  Result := PGESClipAsset(g_type_check_instance_cast(obj, GES_TYPE_CLIP_ASSET));
end;

function GES_IS_CLIP_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_CLIP_ASSET);
end;

function GES_CLIP_ASSET_CLASS(klass: Pointer): PGESClipAssetClass;
begin
  Result := PGESClipAssetClass(g_type_check_class_cast(klass, GES_TYPE_CLIP_ASSET));
end;

function GES_IS_CLIP_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_CLIP_ASSET);
end;

function GES_CLIP_ASSET_GET_CLASS(obj: Pointer): PGESClipAssetClass;
begin
  Result := PGESClipAssetClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESClipAssetPrivate = type Pointer

function ges_clip_asset_get_type: TGType; cdecl; external libgxxxxxxx;



end.

unit ges_track_element_asset;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 *
 * Copyright (C) 2012 Thibault Saunier <thibault.saunier@collabora.com>
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
{$include <gio/gio.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-asset.h>}

{GES_DECLARE_TYPE(TrackElementAsset, track_element_asset, TRACK_ELEMENT_ASSET); }
{ <private>  }
{ Padding for API extension  }
type
  PGESTrackElementAsset = ^TGESTrackElementAsset;
  TGESTrackElementAsset = record
      parent : TGESAsset;
      priv : PGESTrackElementAssetPrivate;
      __ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
   * GESTrackElementAssetClass::get_natural_framerate:
   * @self: A #GESTrackElementAsset
   * @framerate_n: The framerate numerator to retrieve
   * @framerate_d: The framerate denominator to retrieve
   *
   * Returns: %TRUE if @self has a natural framerate @FALSE otherwise.
   *
   * Since: 1.18
    }
  PGESTrackElementAssetClass = ^TGESTrackElementAssetClass;
  TGESTrackElementAssetClass = record
      parent_class : TGESAssetClass;
      get_natural_framerate : function (self:PGESTrackElementAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;


function ges_track_element_asset_get_track_type(asset:PGESTrackElementAsset):TGESTrackType;cdecl;external libges;
procedure ges_track_element_asset_set_track_type(asset:PGESTrackElementAsset; _type:TGESTrackType);cdecl;external libges;
function ges_track_element_asset_get_natural_framerate(self:PGESTrackElementAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;external libges;

// === Konventiert am: 28-7-26 13:18:18 ===

function GES_TYPE_TRACK_ELEMENT_ASSET: TGType;
function GES_TRACK_ELEMENT_ASSET(obj: Pointer): PGESTrackElementAsset;
function GES_IS_TRACK_ELEMENT_ASSET(obj: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): PGESTrackElementAssetClass;
function GES_IS_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_ASSET_GET_CLASS(obj: Pointer): PGESTrackElementAssetClass;

implementation

function GES_TYPE_TRACK_ELEMENT_ASSET: TGType;
begin
  Result := ges_track_element_asset_get_type;
end;

function GES_TRACK_ELEMENT_ASSET(obj: Pointer): PGESTrackElementAsset;
begin
  Result := PGESTrackElementAsset(g_type_check_instance_cast(obj, GES_TYPE_TRACK_ELEMENT_ASSET));
end;

function GES_IS_TRACK_ELEMENT_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRACK_ELEMENT_ASSET);
end;

function GES_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): PGESTrackElementAssetClass;
begin
  Result := PGESTrackElementAssetClass(g_type_check_class_cast(klass, GES_TYPE_TRACK_ELEMENT_ASSET));
end;

function GES_IS_TRACK_ELEMENT_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRACK_ELEMENT_ASSET);
end;

function GES_TRACK_ELEMENT_ASSET_GET_CLASS(obj: Pointer): PGESTrackElementAssetClass;
begin
  Result := PGESTrackElementAssetClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTrackElementAssetPrivate = type Pointer

function ges_track_element_asset_get_type: TGType; cdecl; external libgxxxxxxx;



end.

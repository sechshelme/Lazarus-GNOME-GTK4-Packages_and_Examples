unit ges_effect_asset;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; indent-tabs-mode: nil; c-basic-offset: 4; tab-width: 4 -*-   }
{
 * gst-editing-services
 * Copyright (C) 2013 Thibault Saunier <thibault.saunier@collabora.com>
 *
 gst-editing-services is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * gst-editing-services is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.";
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "ges-track-element-asset.h"}

{GES_DECLARE_TYPE(EffectAsset, effect_asset, EFFECT_ASSET); }
type
  PGESEffectAssetClass = ^TGESEffectAssetClass;
  TGESEffectAssetClass = record
      parent_class : TGESTrackElementAssetClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

  PGESEffectAsset = ^TGESEffectAsset;
  TGESEffectAsset = record
      parent_instance : TGESTrackElementAsset;
      priv : PGESEffectAssetPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


// === Konventiert am: 27-7-26 19:54:56 ===

function GES_TYPE_EFFECT_ASSET: TGType;
function GES_EFFECT_ASSET(obj: Pointer): PGESEffectAsset;
function GES_IS_EFFECT_ASSET(obj: Pointer): Tgboolean;
function GES_EFFECT_ASSET_CLASS(klass: Pointer): PGESEffectAssetClass;
function GES_IS_EFFECT_ASSET_CLASS(klass: Pointer): Tgboolean;
function GES_EFFECT_ASSET_GET_CLASS(obj: Pointer): PGESEffectAssetClass;

implementation

function GES_TYPE_EFFECT_ASSET: TGType;
begin
  Result := ges_effect_asset_get_type;
end;

function GES_EFFECT_ASSET(obj: Pointer): PGESEffectAsset;
begin
  Result := PGESEffectAsset(g_type_check_instance_cast(obj, GES_TYPE_EFFECT_ASSET));
end;

function GES_IS_EFFECT_ASSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EFFECT_ASSET);
end;

function GES_EFFECT_ASSET_CLASS(klass: Pointer): PGESEffectAssetClass;
begin
  Result := PGESEffectAssetClass(g_type_check_class_cast(klass, GES_TYPE_EFFECT_ASSET));
end;

function GES_IS_EFFECT_ASSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_EFFECT_ASSET);
end;

function GES_EFFECT_ASSET_GET_CLASS(obj: Pointer): PGESEffectAssetClass;
begin
  Result := PGESEffectAssetClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESEffectAssetPrivate = type Pointer

function ges_effect_asset_get_type: TGType; cdecl; external libgxxxxxxx;



end.

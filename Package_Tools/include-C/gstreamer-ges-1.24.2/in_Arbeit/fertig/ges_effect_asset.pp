
unit ges_effect_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_effect_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_effect_asset.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGESEffectAsset  = ^GESEffectAsset;
PGESEffectAssetClass  = ^GESEffectAssetClass;
PGESEffectAssetPrivate  = ^GESEffectAssetPrivate;
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

{ was #define dname def_expr }
function GES_TYPE_EFFECT_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (EffectAsset, effect_asset, EFFECT_ASSET); }
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


implementation

{ was #define dname def_expr }
function GES_TYPE_EFFECT_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_EFFECT_ASSET:=ges_effect_asset_get_type;
  end;


end.

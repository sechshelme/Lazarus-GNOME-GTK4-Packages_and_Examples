
unit ges_source_clip_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_source_clip_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_source_clip_asset.h
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
PGESSourceClipAssetClass  = ^GESSourceClipAssetClass;
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

{ was #define dname def_expr }
function GES_TYPE_SOURCE_CLIP_ASSET : longint; { return type might be wrong }

{*
 * GESSourceClipAsset:
 *
 * An asset types from which #GESSourceClip will be extracted
 *
 * Since: 1.18
  }
{G_DECLARE_DERIVABLE_TYPE (GESSourceClipAsset, ges_source_clip_asset, GES, SOURCE_CLIP_ASSET, GESClipAsset); }
{ FIXME 2.0: Add some padding, meanwhile that would break ABI  }
type
  PGESSourceClipAssetClass = ^TGESSourceClipAssetClass;
  TGESSourceClipAssetClass = record
      parent_class : TGESClipAssetClass;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_SOURCE_CLIP_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_SOURCE_CLIP_ASSET:=ges_source_clip_asset_get_type;
  end;


end.

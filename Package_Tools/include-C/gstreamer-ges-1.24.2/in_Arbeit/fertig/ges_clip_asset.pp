
unit ges_clip_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_clip_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_clip_asset.h
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
PGESClipAsset  = ^GESClipAsset;
PGESClipAssetClass  = ^GESClipAssetClass;
PGESClipAssetPrivate  = ^GESClipAssetPrivate;
Pgint  = ^gint;
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

{ was #define dname def_expr }
function GES_TYPE_CLIP_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (ClipAsset, clip_asset, CLIP_ASSET); }
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


procedure ges_clip_asset_set_supported_formats(self:PGESClipAsset; supportedformats:TGESTrackType);cdecl;external;
function ges_clip_asset_get_supported_formats(self:PGESClipAsset):TGESTrackType;cdecl;external;
function ges_clip_asset_get_natural_framerate(self:PGESClipAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;external;
function ges_clip_asset_get_frame_time(self:PGESClipAsset; frame_number:TGESFrameNumber):TGstClockTime;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_CLIP_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_CLIP_ASSET:=ges_clip_asset_get_type;
  end;


end.


unit ges_track_element_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_track_element_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_track_element_asset.h
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
PGESTrackElementAsset  = ^GESTrackElementAsset;
PGESTrackElementAssetClass  = ^GESTrackElementAssetClass;
PGESTrackElementAssetPrivate  = ^GESTrackElementAssetPrivate;
Pgint  = ^gint;
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

{ was #define dname def_expr }
function GES_TYPE_TRACK_ELEMENT_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TrackElementAsset, track_element_asset, TRACK_ELEMENT_ASSET); }
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

(* Const before type ignored *)

function ges_track_element_asset_get_track_type(asset:PGESTrackElementAsset):TGESTrackType;cdecl;external;
procedure ges_track_element_asset_set_track_type(asset:PGESTrackElementAsset; _type:TGESTrackType);cdecl;external;
function ges_track_element_asset_get_natural_framerate(self:PGESTrackElementAsset; framerate_n:Pgint; framerate_d:Pgint):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TRACK_ELEMENT_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_TRACK_ELEMENT_ASSET:=ges_track_element_asset_get_type;
  end;


end.

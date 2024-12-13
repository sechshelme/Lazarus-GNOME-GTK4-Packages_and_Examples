
unit ges_uri_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_uri_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_uri_asset.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGESUriClipAsset  = ^GESUriClipAsset;
PGESUriClipAssetClass  = ^GESUriClipAssetClass;
PGESUriClipAssetPrivate  = ^GESUriClipAssetPrivate;
PGESUriSourceAsset  = ^GESUriSourceAsset;
PGESUriSourceAssetClass  = ^GESUriSourceAssetClass;
PGESUriSourceAssetPrivate  = ^GESUriSourceAssetPrivate;
PGList  = ^GList;
PGstDiscoverer  = ^GstDiscoverer;
PGstDiscovererInfo  = ^GstDiscovererInfo;
PGstDiscovererStreamInfo  = ^GstDiscovererStreamInfo;
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
{$include <gio/gio.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-asset.h>}
{$include <ges/ges-source-clip-asset.h>}
{$include <ges/ges-track-element-asset.h>}

{ was #define dname def_expr }
function GES_TYPE_URI_CLIP_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (UriClipAsset, uri_clip_asset, URI_CLIP_ASSET); }
{ <private>  }
{ Padding for API extension  }
type
  PGESUriClipAsset = ^TGESUriClipAsset;
  TGESUriClipAsset = record
      parent : TGESSourceClipAsset;
      priv : PGESUriClipAssetPrivate;
      __ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ <private>  }
{ Unused  }
{ Unused  }
{ Unused  }
  PGESUriClipAssetClass = ^TGESUriClipAssetClass;
  TGESUriClipAssetClass = record
      parent_class : TGESSourceClipAssetClass;
      discoverer : PGstDiscoverer;
      sync_discoverer : PGstDiscoverer;
      discovered : procedure (discoverer:PGstDiscoverer; info:PGstDiscovererInfo; err:PGError; user_data:Tgpointer);cdecl;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function ges_uri_clip_asset_get_info(self:PGESUriClipAsset):PGstDiscovererInfo;cdecl;external;
function ges_uri_clip_asset_get_duration(self:PGESUriClipAsset):TGstClockTime;cdecl;external;
function ges_uri_clip_asset_get_max_duration(self:PGESUriClipAsset):TGstClockTime;cdecl;external;
function ges_uri_clip_asset_is_image(self:PGESUriClipAsset):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure ges_uri_clip_asset_new(uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function ges_uri_clip_asset_finish(res:PGAsyncResult; error:PPGError):PGESUriClipAsset;cdecl;external;
(* Const before type ignored *)
function ges_uri_clip_asset_request_sync(uri:Pgchar; error:PPGError):PGESUriClipAsset;cdecl;external;
procedure ges_uri_clip_asset_class_set_timeout(klass:PGESUriClipAssetClass; timeout:TGstClockTime);cdecl;external;
(* Const before type ignored *)
function ges_uri_clip_asset_get_stream_assets(self:PGESUriClipAsset):PGList;cdecl;external;
{ was #define dname def_expr }
function GES_TYPE_URI_SOURCE_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (UriSourceAsset, uri_source_asset, URI_SOURCE_ASSET); }
{*
 * GESUriSourceAsset:
 *
 * Asset to create a stream specific #GESSource for a media file.
 *
 * NOTE: You should never request such a #GESAsset as they will be created automatically
 * by #GESUriClipAsset-s.
  }
{ <private>  }
{ Padding for API extension  }
type
  PGESUriSourceAsset = ^TGESUriSourceAsset;
  TGESUriSourceAsset = record
      parent : TGESTrackElementAsset;
      priv : PGESUriSourceAssetPrivate;
      __ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

  PGESUriSourceAssetClass = ^TGESUriSourceAssetClass;
  TGESUriSourceAssetClass = record
      parent_class : TGESTrackElementAssetClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_uri_source_asset_get_stream_info(asset:PGESUriSourceAsset):PGstDiscovererStreamInfo;cdecl;external;
(* Const before type ignored *)
function ges_uri_source_asset_get_stream_uri(asset:PGESUriSourceAsset):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_uri_source_asset_get_filesource_asset(asset:PGESUriSourceAsset):PGESUriClipAsset;cdecl;external;
function ges_uri_source_asset_is_image(asset:PGESUriSourceAsset):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_URI_CLIP_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_URI_CLIP_ASSET:=ges_uri_clip_asset_get_type;
  end;

{ was #define dname def_expr }
function GES_TYPE_URI_SOURCE_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_URI_SOURCE_ASSET:=ges_uri_source_asset_get_type;
  end;


end.


unit ges_asset;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_asset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_asset.h
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
PGESAsset  = ^GESAsset;
PGESAssetClass  = ^GESAssetClass;
PGESAssetLoadingReturn  = ^GESAssetLoadingReturn;
PGESAssetPrivate  = ^GESAssetPrivate;
PGESExtractable  = ^GESExtractable;
PGList  = ^GList;
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
{$include <ges/ges-extractable.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-enums.h>}
{$include <gio/gio.h>}
{$include <gst/gst.h>}

{ was #define dname def_expr }
function GES_TYPE_ASSET : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Asset, asset, ASSET); }
{*
 * GESAssetLoadingReturn:
 * @GES_ASSET_LOADING_ERROR: Indicates that an error occurred
 * @GES_ASSET_LOADING_ASYNC: Indicates that the loading is being performed
 * asynchronously
 * @GES_ASSET_LOADING_OK: Indicates that the loading is complete, without
 * error
  }
type
  PGESAssetLoadingReturn = ^TGESAssetLoadingReturn;
  TGESAssetLoadingReturn =  Longint;
  Const
    GES_ASSET_LOADING_ERROR = 0;
    GES_ASSET_LOADING_ASYNC = 1;
    GES_ASSET_LOADING_OK = 2;
;
{ <private>  }
{ Padding for API extension  }
type
  PGESAsset = ^TGESAsset;
  TGESAsset = record
      parent : TGObject;
      priv : PGESAssetPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESAssetClass:
 * @start_loading: A method to be called when an asset is being requested
 * asynchronously. This will be after the properties of the asset have
 * been set, so it is tasked with (re)loading the 'state' of the asset.
 * The return value should indicated whether the loading is complete, is
 * carrying on asynchronously, or an error occurred. The default
 * implementation will simply return that loading is already complete (the
 * asset is already in a usable state after the properties have been set).
 * @extract: A method that returns a new object of the asset's
 * #GESAsset:extractable-type, or %NULL if an error occurs. The default
 * implementation will fetch the properties of the #GESExtractable from
 * its get_parameters_from_id() class method and set them on a new
 * #GESAsset:extractable-type #GObject, which is returned.
 * @request_id_update: A method called by a #GESProject when an asset has
 * failed to load. @error is the error given by
 * ges_asset_request_finish (). Returns: %TRUE if a new id for @self was
 * passed to @proposed_new_id.
 * @proxied: Deprecated: 1.18: This vmethod is no longer called.
  }
{ FIXME: add documentation for inform_proxy when it is used properly  }
{ Let subclasses know that we proxied an asset  }
(* Const before type ignored *)
{ Ask subclasses for a new ID for @self when the asset failed loading
   * This function returns %FALSE when the ID could be updated or %TRUE
   * otherwize  }
  PGESAssetClass = ^TGESAssetClass;
  TGESAssetClass = record
      parent : TGObjectClass;
      start_loading : function (self:PGESAsset; error:PPGError):TGESAssetLoadingReturn;cdecl;
      extract : function (self:PGESAsset; error:PPGError):PGESExtractable;cdecl;
      inform_proxy : procedure (self:PGESAsset; proxy_id:Pgchar);cdecl;
      proxied : procedure (self:PGESAsset; proxy:PGESAsset);cdecl;
      request_id_update : function (self:PGESAsset; proposed_new_id:PPgchar; error:PGError):Tgboolean;cdecl;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_asset_get_extractable_type(self:PGESAsset):TGType;cdecl;external;
(* Const before type ignored *)
procedure ges_asset_request_async(extractable_type:TGType; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function ges_asset_request(extractable_type:TGType; id:Pgchar; error:PPGError):PGESAsset;cdecl;external;
(* Const before type ignored *)
function ges_asset_get_id(self:PGESAsset):Pgchar;cdecl;external;
function ges_asset_request_finish(res:PGAsyncResult; error:PPGError):PGESAsset;cdecl;external;
function ges_asset_get_error(self:PGESAsset):PGError;cdecl;external;
function ges_asset_extract(self:PGESAsset; error:PPGError):PGESExtractable;cdecl;external;
function ges_list_assets(filter:TGType):PGList;cdecl;external;
function ges_asset_set_proxy(asset:PGESAsset; proxy:PGESAsset):Tgboolean;cdecl;external;
function ges_asset_unproxy(asset:PGESAsset; proxy:PGESAsset):Tgboolean;cdecl;external;
function ges_asset_list_proxies(asset:PGESAsset):PGList;cdecl;external;
function ges_asset_get_proxy_target(proxy:PGESAsset):PGESAsset;cdecl;external;
function ges_asset_get_proxy(asset:PGESAsset):PGESAsset;cdecl;external;
(* Const before type ignored *)
function ges_asset_needs_reload(extractable_type:TGType; id:Pgchar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_ASSET : longint; { return type might be wrong }
  begin
    GES_TYPE_ASSET:=ges_asset_get_type;
  end;


end.


unit ges_project;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_project.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_project.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGESAsset  = ^GESAsset;
PGESFormatter  = ^GESFormatter;
PGESProject  = ^GESProject;
PGESProjectClass  = ^GESProjectClass;
PGESProjectPrivate  = ^GESProjectPrivate;
PGESTimeline  = ^GESTimeline;
PGList  = ^GList;
PGstEncodingProfile  = ^GstEncodingProfile;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 *
 * Copyright (C) <2012> Thibault Saunier <thibault.saunier@collabora.com>
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
{$include <gst/pbutils/encoding-profile.h>}

{ was #define dname def_expr }
function GES_TYPE_PROJECT : longint; { return type might be wrong }

{GES_DECLARE_TYPE( Project, project, PROJECT); }
{ <private>  }
{ Padding for API extension  }
type
  PGESProject = ^TGESProject;
  TGESProject = record
      parent : TGESAsset;
      priv : PGESProjectPrivate;
      __ges_reserved : array[0..(GES_PADDING_LARGE)-1] of Tgpointer;
    end;

{ Signals  }
{*
   * GESProjectClass::loading:
   * @self: The self
   * @timeline: The loading timeline
   *
   * Since: 1.18
    }
  PGESProjectClass = ^TGESProjectClass;
  TGESProjectClass = record
      parent_class : TGESAssetClass;
      asset_added : procedure (self:PGESProject; asset:PGESAsset);cdecl;
      asset_loading : procedure (self:PGESProject; asset:PGESAsset);cdecl;
      asset_removed : procedure (self:PGESProject; asset:PGESAsset);cdecl;
      missing_uri : function (self:PGESProject; error:PGError; wrong_asset:PGESAsset):Pgchar;cdecl;
      loading_error : function (self:PGESProject; error:PGError; id:Pgchar; extractable_type:TGType):Tgboolean;cdecl;
      loaded : function (self:PGESProject; timeline:PGESTimeline):Tgboolean;cdecl;
      loading : procedure (self:PGESProject; timeline:PGESTimeline);cdecl;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;


function ges_project_add_asset(project:PGESProject; asset:PGESAsset):Tgboolean;cdecl;external;
function ges_project_remove_asset(project:PGESProject; asset:PGESAsset):Tgboolean;cdecl;external;
function ges_project_list_assets(project:PGESProject; filter:TGType):PGList;cdecl;external;
(* Const before type ignored *)
function ges_project_save(project:PGESProject; timeline:PGESTimeline; uri:Pgchar; formatter_asset:PGESAsset; overwrite:Tgboolean; 
           error:PPGError):Tgboolean;cdecl;external;
function ges_project_load(project:PGESProject; timeline:PGESTimeline; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_project_new(uri:Pgchar):PGESProject;cdecl;external;
function ges_project_get_uri(project:PGESProject):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_project_get_asset(project:PGESProject; id:Pgchar; extractable_type:TGType):PGESAsset;cdecl;external;
(* Const before type ignored *)
function ges_project_create_asset(project:PGESProject; id:Pgchar; extractable_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_project_create_asset_sync(project:PGESProject; id:Pgchar; extractable_type:TGType; error:PPGError):PGESAsset;cdecl;external;
function ges_project_get_loading_assets(project:PGESProject):PGList;cdecl;external;
function ges_project_add_encoding_profile(project:PGESProject; profile:PGstEncodingProfile):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_project_list_encoding_profiles(project:PGESProject):PGList;cdecl;external;
(* Const before type ignored *)
function ges_add_missing_uri_relocation_uri(uri:Pgchar; recurse:Tgboolean):Tgboolean;cdecl;external;
procedure ges_project_add_formatter(project:PGESProject; formatter:PGESFormatter);cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_PROJECT : longint; { return type might be wrong }
  begin
    GES_TYPE_PROJECT:=ges_project_get_type;
  end;


end.

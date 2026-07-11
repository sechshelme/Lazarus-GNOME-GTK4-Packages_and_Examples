unit gstpreset;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2006 Stefan Kost <ensonic@users.sf.net>
 *
 * gstpreset.h: helper interface header for element presets
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
{$ifndef __GST_PRESET_H__}
{$define __GST_PRESET_H__}
{$include <glib-object.h>}
{$include <gst/gstconfig.h>}

{ was #define dname def_expr }
function GST_TYPE_PRESET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PRESET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PRESET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PRESET_GET_INTERFACE(obj : longint) : longint;

{*
 * GstPreset:
 *
 * Opaque #GstPreset data structure.
  }
type
{ dummy object  }
{*
 * GstPresetInterface:
 * @parent: parent interface type.
 * @get_preset_names: virtual method to get list of presets
 * @get_property_names: virtual methods to get properties that are persistent
 * @load_preset: virtual methods to load a preset into properties
 * @save_preset: virtual methods to save properties into a preset
 * @rename_preset: virtual methods to rename a preset
 * @delete_preset: virtual methods to remove a preset
 * @set_meta: virtual methods to set textual meta data to a preset
 * @get_meta: virtual methods to get textual meta data from a preset
 *
 * #GstPreset interface.
  }
{ methods  }
{< private > }
  PGstPresetInterface = ^TGstPresetInterface;
  TGstPresetInterface = record
      parent : TGTypeInterface;
      get_preset_names : function (preset:PGstPreset):PPgchar;cdecl;
      get_property_names : function (preset:PGstPreset):PPgchar;cdecl;
      load_preset : function (preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;
      save_preset : function (preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;
      rename_preset : function (preset:PGstPreset; old_name:Pgchar; new_name:Pgchar):Tgboolean;cdecl;
      delete_preset : function (preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;
      set_meta : function (preset:PGstPreset; name:Pgchar; tag:Pgchar; value:Pgchar):Tgboolean;cdecl;
      get_meta : function (preset:PGstPreset; name:Pgchar; tag:Pgchar; value:PPgchar):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_preset_get_type:TGType;cdecl;external libgstreamer;
function gst_preset_get_preset_names(preset:PGstPreset):^Pgchar;cdecl;external libgstreamer;
function gst_preset_get_property_names(preset:PGstPreset):^Pgchar;cdecl;external libgstreamer;
function gst_preset_load_preset(preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_save_preset(preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_rename_preset(preset:PGstPreset; old_name:Pgchar; new_name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_delete_preset(preset:PGstPreset; name:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_set_meta(preset:PGstPreset; name:Pgchar; tag:Pgchar; value:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_get_meta(preset:PGstPreset; name:Pgchar; tag:Pgchar; value:PPgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_set_app_dir(app_dir:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_preset_get_app_dir:Pgchar;cdecl;external libgstreamer;
function gst_preset_is_editable(preset:PGstPreset):Tgboolean;cdecl;external libgstreamer;
{$endif}
{ __GST_PRESET_H__  }

// === Konventiert am: 11-7-26 15:25:08 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_PRESET : longint; { return type might be wrong }
  begin
    GST_TYPE_PRESET:=gst_preset_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PRESET(obj : longint) : longint;
begin
  GST_PRESET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PRESET,GstPreset);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PRESET(obj : longint) : longint;
begin
  GST_IS_PRESET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PRESET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PRESET_GET_INTERFACE(obj : longint) : longint;
begin
  GST_PRESET_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_PRESET,GstPresetInterface);
end;


end.

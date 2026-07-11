unit gstmetafactory;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Netflix Inc.
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
{$include <gst/gstconfig.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstmeta.h>}
{*
 * GstMetaFactory:
 *
 * The opaque #GstMetaFactory data structure.
 *
 * Since: 1.28
  }
type

{ was #define dname def_expr }
function GST_TYPE_META_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_META_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_META_FACTORY(obj : longint) : longint;

function gst_meta_factory_get_type:TGType;cdecl;external libgstreamer;
function gst_meta_factory_load(factoryname:Pgchar):PGstMetaInfo;cdecl;external libgstreamer;
function gst_meta_factory_register(plugin:PGstPlugin; meta_info:PGstMetaInfo):Tgboolean;cdecl;external libgstreamer;

// === Konventiert am: 11-7-26 15:18:24 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_META_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_META_FACTORY:=gst_meta_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_META_FACTORY(obj : longint) : longint;
begin
  GST_IS_META_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_META_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_META_FACTORY(obj : longint) : longint;
begin
  GST_META_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_META_FACTORY,GstMetaFactory);
end;


end.

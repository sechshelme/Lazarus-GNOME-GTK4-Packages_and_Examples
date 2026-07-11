unit gsttagsetter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gsttagsetter.h: Interfaces for tagging
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
{$ifndef __GST_TAG_SETTER_H__}
{$define __GST_TAG_SETTER_H__}
{$include <gst/gst.h>}

{*
 * GstTagSetter:
 *
 * Opaque #GstTagSetter data structure.
  }
type
{ Dummy typedef  }
{*
 * GstTagSetterInterface:
 * @g_iface: parent interface type.
 *
 * #GstTagSetterInterface interface.
  }
{ use an empty interface here to allow detection of elements using user-set
   tags  }
{ signals  }
{ virtual table  }
  PGstTagSetterInterface = ^TGstTagSetterInterface;
  TGstTagSetterInterface = record
      g_iface : TGTypeInterface;
    end;


function gst_tag_setter_get_type:TGType;cdecl;external libgstreamer;
procedure gst_tag_setter_reset_tags(setter:PGstTagSetter);cdecl;external libgstreamer;
procedure gst_tag_setter_merge_tags(setter:PGstTagSetter; list:PGstTagList; mode:TGstTagMergeMode);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tags(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tags(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tag_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tag_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tag_valist(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tag_valist_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external libgstreamer;
procedure gst_tag_setter_add_tag_value(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; value:PGValue);cdecl;external libgstreamer;
function gst_tag_setter_get_tag_list(setter:PGstTagSetter):PGstTagList;cdecl;external libgstreamer;
procedure gst_tag_setter_set_tag_merge_mode(setter:PGstTagSetter; mode:TGstTagMergeMode);cdecl;external libgstreamer;
function gst_tag_setter_get_tag_merge_mode(setter:PGstTagSetter):TGstTagMergeMode;cdecl;external libgstreamer;
{$endif}
{ __GST_TAG_SETTER_H__  }

// === Konventiert am: 11-7-26 15:33:39 ===

function GST_TYPE_TAG_SETTER : TGType;
function GST_TAG_SETTER(obj : Pointer) : PGstTagSetter;
function GST_IS_TAG_SETTER(obj : Pointer) : Tgboolean;
function GST_TAG_SETTER_GET_INTERFACE(obj : Pointer) : PGstTagSetterInterface;

implementation

function GST_TYPE_TAG_SETTER : TGType;
  begin
    GST_TYPE_TAG_SETTER:=gst_tag_setter_get_type;
  end;

function GST_TAG_SETTER(obj : Pointer) : PGstTagSetter;
begin
  Result := PGstTagSetter(g_type_check_instance_cast(obj, GST_TYPE_TAG_SETTER));
end;

function GST_IS_TAG_SETTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TAG_SETTER);
end;

function GST_TAG_SETTER_GET_INTERFACE(obj : Pointer) : PGstTagSetterInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_TAG_SETTER);
end;



end.

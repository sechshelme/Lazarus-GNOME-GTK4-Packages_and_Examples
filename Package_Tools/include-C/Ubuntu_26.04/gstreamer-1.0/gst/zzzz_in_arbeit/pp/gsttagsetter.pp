
unit gsttagsetter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttagsetter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttagsetter.h
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
PGstTagList  = ^GstTagList;
PGstTagSetter  = ^GstTagSetter;
PGstTagSetterInterface  = ^GstTagSetterInterface;
PGValue  = ^GValue;
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

{ was #define dname def_expr }
function GST_TYPE_TAG_SETTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TAG_SETTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TAG_SETTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TAG_SETTER_GET_INTERFACE(obj : longint) : longint;

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


function gst_tag_setter_get_type:TGType;cdecl;external;
procedure gst_tag_setter_reset_tags(setter:PGstTagSetter);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_setter_merge_tags(setter:PGstTagSetter; list:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_setter_add_tags(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external;
procedure gst_tag_setter_add_tags(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_setter_add_tag_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external;
procedure gst_tag_setter_add_tag_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_setter_add_tag_valist(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_setter_add_tag_valist_values(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_tag_setter_add_tag_value(setter:PGstTagSetter; mode:TGstTagMergeMode; tag:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
function gst_tag_setter_get_tag_list(setter:PGstTagSetter):PGstTagList;cdecl;external;
procedure gst_tag_setter_set_tag_merge_mode(setter:PGstTagSetter; mode:TGstTagMergeMode);cdecl;external;
function gst_tag_setter_get_tag_merge_mode(setter:PGstTagSetter):TGstTagMergeMode;cdecl;external;
{$endif}
{ __GST_TAG_SETTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TAG_SETTER : longint; { return type might be wrong }
  begin
    GST_TYPE_TAG_SETTER:=gst_tag_setter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TAG_SETTER(obj : longint) : longint;
begin
  GST_TAG_SETTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TAG_SETTER,GstTagSetter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TAG_SETTER(obj : longint) : longint;
begin
  GST_IS_TAG_SETTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TAG_SETTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TAG_SETTER_GET_INTERFACE(obj : longint) : longint;
begin
  GST_TAG_SETTER_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_TAG_SETTER,GstTagSetterInterface);
end;


end.

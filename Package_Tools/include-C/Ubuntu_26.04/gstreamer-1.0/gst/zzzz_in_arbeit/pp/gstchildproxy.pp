
unit gstchildproxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstchildproxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstchildproxy.h
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
PGObject  = ^GObject;
PGParamSpec  = ^GParamSpec;
PGstChildProxy  = ^GstChildProxy;
PGstChildProxyInterface  = ^GstChildProxyInterface;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Stefan Kost <ensonic@users.sf.net>
 *
 * gstchildproxy.h: interface header for multi child elements
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
{$ifndef __GST_CHILD_PROXY_H__}
{$define __GST_CHILD_PROXY_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}

{ was #define dname def_expr }
function GST_TYPE_CHILD_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CHILD_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CHILD_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CHILD_PROXY_GET_INTERFACE(obj : longint) : longint;

{*
 * GstChildProxy:
 *
 * Opaque #GstChildProxy data structure.
  }
type
{ dummy object  }
{*
 * GstChildProxyInterface:
 * @parent: parent interface type.
 *
 * #GstChildProxy interface.
  }
{ methods  }
{*
   * GstChildProxyInterface.get_child_by_name:
   * @parent: the #GstChildProxy
   * @name: the name of the child to fetch
   *
   * Fetch a child object by name
   *
   * Returns: (transfer full) (nullable): the child object
    }
(* Const before type ignored *)
{*
   * GstChildProxyInterface.get_child_by_index:
   * @parent: the #GstChildProxy
   * @index: the index of the child to fetch
   *
   * Fetch a child object by index
   *
   * Returns: (transfer full) (nullable): the child object
    }
{*
   * GstChildProxyInterface.get_children_count:
   * @parent: the #GstChildProxy
   *
   * Get the number of children in @parent
   *
   * Returns: the number of children
    }
{< private > }
{ signals  }
{*
   * GstChildProxyInterface.child_added:
   * @parent: the #GstChildProxy
   * @child: the child object
   * @name: the name of the child object
   *
   * Called when @child is added to @parent
    }
(* Const before type ignored *)
{*
   * GstChildProxyInterface.child_removed:
   * @parent: the #GstChildProxy
   * @child: the child object
   * @name: the name of the child object
   *
   * Called when @child is removed from @parent
    }
(* Const before type ignored *)
{< private > }
  PGstChildProxyInterface = ^TGstChildProxyInterface;
  TGstChildProxyInterface = record
      parent : TGTypeInterface;
      get_child_by_name : function (parent:PGstChildProxy; name:Pgchar):PGObject;cdecl;
      get_child_by_index : function (parent:PGstChildProxy; index:Tguint):PGObject;cdecl;
      get_children_count : function (parent:PGstChildProxy):Tguint;cdecl;
      child_added : procedure (parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;
      child_removed : procedure (parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_child_proxy_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_child_proxy_get_child_by_name(parent:PGstChildProxy; name:Pgchar):PGObject;cdecl;external;
(* Const before type ignored *)
function gst_child_proxy_get_child_by_name_recurse(child_proxy:PGstChildProxy; name:Pgchar):PGObject;cdecl;external;
function gst_child_proxy_get_children_count(parent:PGstChildProxy):Tguint;cdecl;external;
function gst_child_proxy_get_child_by_index(parent:PGstChildProxy; index:Tguint):PGObject;cdecl;external;
(* Const before type ignored *)
function gst_child_proxy_lookup(object:PGstChildProxy; name:Pgchar; target:PPGObject; pspec:PPGParamSpec):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_get_property(object:PGstChildProxy; name:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_get_valist(object:PGstChildProxy; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_get(object:PGstChildProxy; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure gst_child_proxy_get(object:PGstChildProxy; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_child_proxy_set_property(object:PGstChildProxy; name:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_set_valist(object:PGstChildProxy; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_set(object:PGstChildProxy; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure gst_child_proxy_set(object:PGstChildProxy; first_property_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_child_added(parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_child_proxy_child_removed(parent:PGstChildProxy; child:PGObject; name:Pgchar);cdecl;external;
{$endif}
{ __GST_CHILD_PROXY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_CHILD_PROXY : longint; { return type might be wrong }
  begin
    GST_TYPE_CHILD_PROXY:=gst_child_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CHILD_PROXY(obj : longint) : longint;
begin
  GST_CHILD_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CHILD_PROXY,GstChildProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CHILD_PROXY(obj : longint) : longint;
begin
  GST_IS_CHILD_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CHILD_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CHILD_PROXY_GET_INTERFACE(obj : longint) : longint;
begin
  GST_CHILD_PROXY_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_CHILD_PROXY,GstChildProxyInterface);
end;


end.

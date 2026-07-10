unit gstcontrolbinding;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2011 Stefan Sauer <ensonic@users.sf.net>
 *
 * gstcontrolbinding.h: Attachment for control sources
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
{$ifndef __GST_CONTROL_BINDING_H__}
{$define __GST_CONTROL_BINDING_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}

type
{$include <gst/gstcontrolsource.h>}
{*
 * GstControlBindingConvert: (attributes doc.skip=true)
 * FIXME(2.0): remove, this is unused
  }
type

  TGstControlBindingConvert = procedure (binding:PGstControlBinding; src_value:Tgdouble; dest_value:PGValue);cdecl;
{*
 * GstControlBinding:
 * @parent: the parent structure
 * @name: name of the property of this binding
 * @pspec: #GParamSpec for this property
 *
 * The instance structure of #GstControlBinding.
  }
{< public > }
{< private > }
{$ifndef GST_DISABLE_DEPRECATED}
{ GstObject owning the property
                                 * (== parent when bound)  }
{$else}
{$endif}
{< private > }
{< private > }
type
  PGstControlBinding = ^TGstControlBinding;
  TGstControlBinding = record
      parent : TGstObject;cdecl;
      name : Pgchar;
      pspec : PGParamSpec;
      object : PGstObject;
      __object : Tgpointer;
      disabled : Tgboolean;
      ABI : record
          case longint of
            0 : ( abi : record
                priv : PGstControlBindingPrivate;
              end );
            1 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
          end;
    end;

{*
 * GstControlBindingClass:
 * @parent_class: Parent class
 *
 * The class structure of #GstControlBinding.
  }
{< public > }
{*
   * GstControlBindingClass::sync_values:
   * @binding: the control binding
   * @object: the object that has controlled properties
   * @timestamp: the time that should be processed
   * @last_sync: the last time this was called
   *
   * Update the target values
   *
   * Returns: %TRUE if the controller value could be applied to the object
   * property, %FALSE otherwise
    }
{*
   * GstControlBindingClass::get_value:
   * @binding: the control binding
   * @timestamp: the time the control-change should be read from
   *
   * Fetch a single control-value
   *
   * Returns: (nullable): the GValue of the property at the given time,
   * or %NULL if the property isn't controlled.
    }
{*
   * GstControlBindingClass::get_value_array:
   * @binding: the control binding
   * @timestamp: the time that should be processed
   * @interval: the time spacing between subsequent values
   * @n_values: the number of values
   * @values: (array length=n_values): array to put control-values in
   *
   * Fetch a series of control-values
   *
   * Returns: %TRUE if the given array could be filled, %FALSE otherwise
    }
{*
   * GstControlBindingClass::get_g_value_array:
   * @binding: the control binding
   * @timestamp: the time that should be processed
   * @interval: the time spacing between subsequent values
   * @n_values: the number of values
   * @values: (array length=n_values): array to put control-values in
   *
   * Fetch a series of control-values as g_values
   *
   * Returns: %TRUE if the given array could be filled, %FALSE otherwise
    }
{< private > }
  PGstControlBindingClass = ^TGstControlBindingClass;
  TGstControlBindingClass = record
      parent_class : TGstObjectClass;
      sync_values : function (binding:PGstControlBinding; object:PGstObject; timestamp:TGstClockTime; last_sync:TGstClockTime):Tgboolean;cdecl;
      get_value : function (binding:PGstControlBinding; timestamp:TGstClockTime):PGValue;cdecl;
      get_value_array : function (binding:PGstControlBinding; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:Tgpointer):Tgboolean;cdecl;
      get_g_value_array : function (binding:PGstControlBinding; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:PGValue):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_CONTROL_BINDING_PSPEC(cb : longint) : longint;

function gst_control_binding_get_type:TGType;cdecl;external libgstreamer;
{ Functions  }
function gst_control_binding_sync_values(binding:PGstControlBinding; object:PGstObject; timestamp:TGstClockTime; last_sync:TGstClockTime):Tgboolean;cdecl;external libgstreamer;
function gst_control_binding_get_value(binding:PGstControlBinding; timestamp:TGstClockTime):PGValue;cdecl;external libgstreamer;
function gst_control_binding_get_value_array(binding:PGstControlBinding; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:Tgpointer):Tgboolean;cdecl;external libgstreamer;
function gst_control_binding_get_g_value_array(binding:PGstControlBinding; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:PGValue):Tgboolean;cdecl;external libgstreamer;
procedure gst_control_binding_set_disabled(binding:PGstControlBinding; disabled:Tgboolean);cdecl;external libgstreamer;
function gst_control_binding_is_disabled(binding:PGstControlBinding):Tgboolean;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstControlBinding, gst_object_unref) }
{$endif}
{ __GST_CONTROL_BINDING_H__  }

// === Konventiert am: 10-7-26 19:55:48 ===

function GST_TYPE_CONTROL_BINDING : TGType;
function GST_CONTROL_BINDING(obj : Pointer) : PGstControlBinding;
function GST_CONTROL_BINDING_CLASS(klass : Pointer) : PGstControlBindingClass;
function GST_IS_CONTROL_BINDING(obj : Pointer) : Tgboolean;
function GST_IS_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
function GST_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstControlBindingClass;

implementation

function GST_TYPE_CONTROL_BINDING : TGType;
  begin
    GST_TYPE_CONTROL_BINDING:=gst_control_binding_get_type;
  end;

function GST_CONTROL_BINDING(obj : Pointer) : PGstControlBinding;
begin
  Result := PGstControlBinding(g_type_check_instance_cast(obj, GST_TYPE_CONTROL_BINDING));
end;

function GST_CONTROL_BINDING_CLASS(klass : Pointer) : PGstControlBindingClass;
begin
  Result := PGstControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_CONTROL_BINDING));
end;

function GST_IS_CONTROL_BINDING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CONTROL_BINDING);
end;

function GST_IS_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_CONTROL_BINDING);
end;

function GST_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstControlBindingClass;
begin
  Result := PGstControlBindingClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_BINDING_PSPEC(cb : longint) : longint;
begin
  GST_CONTROL_BINDING_PSPEC:=(PGstControlBinding(cb))^.pspec;
end;


end.

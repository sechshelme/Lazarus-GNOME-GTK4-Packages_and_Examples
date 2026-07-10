unit gstcontrolsource;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2007 Sebastian Dröge <slomo@circular-chaos.org>
 *
 * gstcontrolsource.h: Interface declaration for control sources
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
{$ifndef __GST_CONTROL_SOURCE_H__}
{$define __GST_CONTROL_SOURCE_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{$include <gst/gstclock.h>}

type
{*
 * GstTimedValue:
 * @timestamp: timestamp of the value change
 * @value: the corresponding value
 *
 * Structure for storing a timestamp and a value.
  }
  PGstTimedValue = ^TGstTimedValue;
  TGstTimedValue = record
      timestamp : TGstClockTime;
      value : Tgdouble;
    end;

{*
 * GstControlSourceGetValue:
 * @self: the #GstControlSource instance
 * @timestamp: timestamp for which a value should be calculated
 * @value: a value which will be set to the result.
 *
 * Function for returning a value for a given timestamp.
 *
 * Returns: %TRUE if the value was successfully calculated.
 *
  }

  TGstControlSourceGetValue = function (self:PGstControlSource; timestamp:TGstClockTime; value:Pgdouble):Tgboolean;cdecl;
{*
 * GstControlSourceGetValueArray:
 * @self: the #GstControlSource instance
 * @timestamp: timestamp for which a value should be calculated
 * @interval: the time spacing between subsequent values
 * @n_values: the number of values
 * @values: array to put control-values in
 *
 * Function for returning an array of values starting at a given timestamp.
 *
 * Returns: %TRUE if the values were successfully calculated.
 *
  }

  TGstControlSourceGetValueArray = function (self:PGstControlSource; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:Pgdouble):Tgboolean;cdecl;
{*
 * GstControlSource:
 * @parent: the parent structure
 * @get_value: Function for returning a value for a given timestamp
 * @get_value_array: Function for returning a values array for a given timestamp
 *
 * The instance structure of #GstControlSource.
  }
{< public > }
{ Returns the value for a property at a given timestamp  }
{ Returns values for a property in a given timespan  }
{< private > }
  PGstControlSource = ^TGstControlSource;
  TGstControlSource = record
      parent : TGstObject;cdecl;
      get_value : TGstControlSourceGetValue;
      get_value_array : TGstControlSourceGetValueArray;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstControlSourceClass:
 * @parent_class: Parent class
 *
 * The class structure of #GstControlSource.
  }
{< private > }
  PGstControlSourceClass = ^TGstControlSourceClass;
  TGstControlSourceClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_control_source_get_type:TGType;cdecl;external libgstreamer;
{ Functions  }
function gst_control_source_get_value(self:PGstControlSource; timestamp:TGstClockTime; value:Pgdouble):Tgboolean;cdecl;external libgstreamer;
function gst_control_source_get_value_array(self:PGstControlSource; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:Pgdouble):Tgboolean;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstControlSource, gst_object_unref) }
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstValueArray, gst_object_unref) }
{$endif}
{ __GST_CONTROL_SOURCE_H__  }

// === Konventiert am: 10-7-26 19:55:43 ===

function GST_TYPE_CONTROL_SOURCE : TGType;
function GST_CONTROL_SOURCE(obj : Pointer) : PGstControlSource;
function GST_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstControlSourceClass;
function GST_IS_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
function GST_IS_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GST_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstControlSourceClass;

implementation

function GST_TYPE_CONTROL_SOURCE : TGType;
  begin
    GST_TYPE_CONTROL_SOURCE:=gst_control_source_get_type;
  end;

function GST_CONTROL_SOURCE(obj : Pointer) : PGstControlSource;
begin
  Result := PGstControlSource(g_type_check_instance_cast(obj, GST_TYPE_CONTROL_SOURCE));
end;

function GST_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstControlSourceClass;
begin
  Result := PGstControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_CONTROL_SOURCE));
end;

function GST_IS_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CONTROL_SOURCE);
end;

function GST_IS_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_CONTROL_SOURCE);
end;

function GST_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstControlSourceClass;
begin
  Result := PGstControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.

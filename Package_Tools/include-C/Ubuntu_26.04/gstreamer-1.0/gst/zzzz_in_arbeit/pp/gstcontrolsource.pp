
unit gstcontrolsource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcontrolsource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcontrolsource.h
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
Pgdouble  = ^gdouble;
PGstControlSource  = ^GstControlSource;
PGstControlSourceClass  = ^GstControlSourceClass;
PGstTimedValue  = ^GstTimedValue;
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

{ was #define dname def_expr }
function GST_TYPE_CONTROL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CONTROL_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE_GET_CLASS(obj : longint) : longint;

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


function gst_control_source_get_type:TGType;cdecl;external;
{ Functions  }
function gst_control_source_get_value(self:PGstControlSource; timestamp:TGstClockTime; value:Pgdouble):Tgboolean;cdecl;external;
function gst_control_source_get_value_array(self:PGstControlSource; timestamp:TGstClockTime; interval:TGstClockTime; n_values:Tguint; values:Pgdouble):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstControlSource, gst_object_unref) }
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstValueArray, gst_object_unref) }
{$endif}
{ __GST_CONTROL_SOURCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_CONTROL_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_CONTROL_SOURCE:=gst_control_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_CONTROL_SOURCE,GstControlSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE_CLASS(klass : longint) : longint;
begin
  GST_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_CONTROL_SOURCE,GstControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_IS_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CONTROL_SOURCE_CLASS(klass : longint) : longint;
begin
  GST_IS_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTROL_SOURCE_GET_CLASS(obj : longint) : longint;
begin
  GST_CONTROL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CONTOL_SOURCE,GstControlSourceClass);
end;


end.

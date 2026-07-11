
unit gsttracerrecord;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttracerrecord.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttracerrecord.h
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
PGstTracerRecord  = ^GstTracerRecord;
PGstTracerValueFlags  = ^GstTracerValueFlags;
PGstTracerValueScope  = ^GstTracerValueScope;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2016 Stefan Sauer <ensonic@users.sf.net>
 *
 * gsttracerrecord.h: tracer log record class
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
{$ifndef __GST_TRACER_RECORD_H__}
{$define __GST_TRACER_RECORD_H__}
{$include <gst/gstobject.h>}
{*
 * GstTracerRecord:
 *
 * The opaque GstTracerRecord instance structure
 *
 * Since: 1.8
  }
type

{ was #define dname def_expr }
function GST_TYPE_TRACER_RECORD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_RECORD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_RECORD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_RECORD_CAST(obj : longint) : PGstTracerRecord;

function gst_tracer_record_get_type:TGType;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTracerRecord, gst_object_unref) }
{*
 * GstTracerValueScope:
 * @GST_TRACER_VALUE_SCOPE_PROCESS: the value is related to the process
 * @GST_TRACER_VALUE_SCOPE_THREAD: the value is related to a thread
 * @GST_TRACER_VALUE_SCOPE_ELEMENT: the value is related to an #GstElement
 * @GST_TRACER_VALUE_SCOPE_PAD: the value is related to a #GstPad
 *
 * Tracing record will contain fields that contain a measured value or extra
 * meta-data. One such meta data are values that tell where a measurement was
 * taken. This enumerating declares to which scope such a meta data field
 * relates to. If it is e.g. %GST_TRACER_VALUE_SCOPE_PAD, then each of the log
 * events may contain values for different #GstPads.
 *
 * Since: 1.8
  }
type
  PGstTracerValueScope = ^TGstTracerValueScope;
  TGstTracerValueScope =  Longint;
  Const
    GST_TRACER_VALUE_SCOPE_PROCESS = 0;
    GST_TRACER_VALUE_SCOPE_THREAD = 1;
    GST_TRACER_VALUE_SCOPE_ELEMENT = 2;
    GST_TRACER_VALUE_SCOPE_PAD = 3;
;
{*
 * GstTracerValueFlags:
 * @GST_TRACER_VALUE_FLAGS_NONE: no flags
 * @GST_TRACER_VALUE_FLAGS_OPTIONAL: the value is optional. When using this flag
 *   one need to have an additional boolean arg before this value in the
 *   var-args list passed to  gst_tracer_record_log().
 * @GST_TRACER_VALUE_FLAGS_AGGREGATED: the value is a combined figure, since the
 *   start of tracing. Examples are averages or timestamps.
 *
 * Flag that describe the value. These flags help applications processing the
 * logs to understand the values.
  }
type
  PGstTracerValueFlags = ^TGstTracerValueFlags;
  TGstTracerValueFlags =  Longint;
  Const
    GST_TRACER_VALUE_FLAGS_NONE = 0;
    GST_TRACER_VALUE_FLAGS_OPTIONAL = 1 shl 0;
    GST_TRACER_VALUE_FLAGS_AGGREGATED = 1 shl 1;
;
(* Const before type ignored *)
(* Const before type ignored *)

function gst_tracer_record_new(name:Pgchar; firstfield:Pgchar; args:array of const):PGstTracerRecord;cdecl;external;
function gst_tracer_record_new(name:Pgchar; firstfield:Pgchar):PGstTracerRecord;cdecl;external;
procedure gst_tracer_record_log(self:PGstTracerRecord; args:array of const);cdecl;external;
procedure gst_tracer_record_log(self:PGstTracerRecord);cdecl;external;
{$endif}
{ __GST_TRACER_RECORD_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TRACER_RECORD : longint; { return type might be wrong }
  begin
    GST_TYPE_TRACER_RECORD:=gst_tracer_record_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD(obj : longint) : longint;
begin
  GST_TRACER_RECORD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TRACER_RECORD,GstTracerRecord);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD_CLASS(klass : longint) : longint;
begin
  GST_TRACER_RECORD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_TRACER_RECORD,GstTracerRecordClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_RECORD(obj : longint) : longint;
begin
  GST_IS_TRACER_RECORD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TRACER_RECORD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRACER_RECORD_CLASS(klass : longint) : longint;
begin
  GST_IS_TRACER_RECORD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_TRACER_RECORD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRACER_RECORD_GET_CLASS(obj : longint) : longint;
begin
  GST_TRACER_RECORD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_TRACER_RECORD,GstTracerRecordClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_RECORD_CAST(obj : longint) : PGstTracerRecord;
begin
  GST_TRACER_RECORD_CAST:=PGstTracerRecord(obj);
end;


end.

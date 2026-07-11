unit gsttracerrecord;

interface

uses
  fp_glib2, fp_gst;

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

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_RECORD_CAST(obj : longint) : PGstTracerRecord;

function gst_tracer_record_get_type:TGType;cdecl;external libgstreamer;
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

function gst_tracer_record_new(name:Pgchar; firstfield:Pgchar; args:array of const):PGstTracerRecord;cdecl;external libgstreamer;
function gst_tracer_record_new(name:Pgchar; firstfield:Pgchar):PGstTracerRecord;cdecl;external libgstreamer;
procedure gst_tracer_record_log(self:PGstTracerRecord; args:array of const);cdecl;external libgstreamer;
procedure gst_tracer_record_log(self:PGstTracerRecord);cdecl;external libgstreamer;
{$endif}
{ __GST_TRACER_RECORD_H__  }

// === Konventiert am: 11-7-26 15:54:37 ===

function GST_TYPE_TRACER_RECORD : TGType;
function GST_TRACER_RECORD(obj : Pointer) : PGstTracerRecord;
function GST_TRACER_RECORD_CLASS(klass : Pointer) : PGstTracerRecordClass;
function GST_IS_TRACER_RECORD(obj : Pointer) : Tgboolean;
function GST_IS_TRACER_RECORD_CLASS(klass : Pointer) : Tgboolean;
function GST_TRACER_RECORD_GET_CLASS(obj : Pointer) : PGstTracerRecordClass;

implementation

function GST_TYPE_TRACER_RECORD : TGType;
  begin
    GST_TYPE_TRACER_RECORD:=gst_tracer_record_get_type;
  end;

function GST_TRACER_RECORD(obj : Pointer) : PGstTracerRecord;
begin
  Result := PGstTracerRecord(g_type_check_instance_cast(obj, GST_TYPE_TRACER_RECORD));
end;

function GST_TRACER_RECORD_CLASS(klass : Pointer) : PGstTracerRecordClass;
begin
  Result := PGstTracerRecordClass(g_type_check_class_cast(klass, GST_TYPE_TRACER_RECORD));
end;

function GST_IS_TRACER_RECORD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TRACER_RECORD);
end;

function GST_IS_TRACER_RECORD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_TRACER_RECORD);
end;

function GST_TRACER_RECORD_GET_CLASS(obj : Pointer) : PGstTracerRecordClass;
begin
  Result := PGstTracerRecordClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_RECORD_CAST(obj : longint) : PGstTracerRecord;
begin
  GST_TRACER_RECORD_CAST:=PGstTracerRecord(obj);
end;


end.

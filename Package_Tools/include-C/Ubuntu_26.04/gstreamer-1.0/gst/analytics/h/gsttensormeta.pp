
unit gsttensormeta;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttensormeta.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttensormeta.h
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
Pgsize  = ^gsize;
PGstBuffer  = ^GstBuffer;
PGstMetaInfo  = ^GstMetaInfo;
PGstTensor  = ^GstTensor;
PGstTensorMeta  = ^GstTensorMeta;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer gstreamer-tensormeta
 * Copyright (C) 2023 Collabora Ltd
 *
 * gsttensormeta.h
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
{$ifdef HAVE_CONFIG_H}
{$include "config.h"}
{$endif}
{$ifndef __GST_TENSOR_META_H__}
{$define __GST_TENSOR_META_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gsttensor.h>}
{*
 * GstTensorMeta:
 * @meta: parent
 * @num_tensors: number of tensors
 * @tensor: (array length=num_tensors): a #GstTensor for each tensor
 *
 * Since: 1.26
  }
type
  PGstTensorMeta = ^TGstTensorMeta;
  TGstTensorMeta = record
      meta : TGstMeta;
      num_tensors : Tgsize;
      tensors : ^PGstTensor;
    end;
{*
 * GST_TENSOR_META_API_TYPE:
 *
 * The Tensor Meta API type
 *
 * Since: 1.26
  }

{ was #define dname def_expr }
function GST_TENSOR_META_API_TYPE : longint; { return type might be wrong }

{*
 * GST_TENSOR_META_INFO: (skip)
 *
 * The Tensor Meta API Info
 *
 * Since: 1.26
  }
{ was #define dname def_expr }
function GST_TENSOR_META_INFO : longint; { return type might be wrong }

function gst_tensor_meta_api_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_tensor_meta_get_info:PGstMetaInfo;cdecl;external;
procedure gst_tensor_meta_set(tmeta:PGstTensorMeta; num_tensors:Tguint; tensors:PPGstTensor);cdecl;external;
(* Const before type ignored *)
function gst_tensor_meta_get_by_id(tmeta:PGstTensorMeta; id:TGQuark):PGstTensor;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tensor_meta_get_typed_tensor(tmeta:PGstTensorMeta; tensor_id:TGQuark; data_type:TGstTensorDataType; order:TGstTensorDimOrder; num_dims:Tgsize; 
           dims:Pgsize):PGstTensor;cdecl;external;
(* Const before type ignored *)
function gst_tensor_meta_get(tmeta:PGstTensorMeta; index:Tgsize):PGstTensor;cdecl;external;
function gst_tensor_meta_get_index_from_id(meta:PGstTensorMeta; id:TGQuark):Tgint;cdecl;external;
function gst_buffer_add_tensor_meta(buffer:PGstBuffer):PGstTensorMeta;cdecl;external;
function gst_buffer_get_tensor_meta(buffer:PGstBuffer):PGstTensorMeta;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_TENSOR_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_TENSOR_META_API_TYPE:=gst_tensor_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_TENSOR_META_INFO : longint; { return type might be wrong }
  begin
    GST_TENSOR_META_INFO:=gst_tensor_meta_get_info;
  end;


end.


unit gsttensor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttensor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttensor
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
Pgsize  = ^gsize;
PGstBuffer  = ^GstBuffer;
PGstTensor  = ^GstTensor;
PGstTensorDataType  = ^GstTensorDataType;
PGstTensorDimOrder  = ^GstTensorDimOrder;
PGstTensorLayout  = ^GstTensorLayout;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer gstreamer-tensor
 * Copyright (C) 2024 Collabora Ltd
 *
 * gsttensor.h
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
{$ifndef __GST_TENSOR_H__}
{$define __GST_TENSOR_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{*
 * GstTensorDataType:
 * @GST_TENSOR_DATA_TYPE_INT4: signed 4 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_INT8: signed 8 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_INT16: signed 16 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_INT32: signed 32 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_INT64: signed 64 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_UINT4: unsigned 4 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_UINT8: unsigned 8 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_UINT16: unsigned 16 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_UINT32: unsigned 32 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_UINT64: unsigned 64 bit integer tensor data
 * @GST_TENSOR_DATA_TYPE_FLOAT16: 16 bit floating point tensor data
 * @GST_TENSOR_DATA_TYPE_FLOAT32: 32 bit floating point tensor data
 * @GST_TENSOR_DATA_TYPE_FLOAT64: 64 bit floating point tensor data
 * @GST_TENSOR_DATA_TYPE_BFLOAT16: "brain" 16 bit floating point tensor data
 *
 * Describe the type of data contain in the tensor.
 *
 * Since: 1.26
  }
{*
   * GST_TENSOR_DATA_TYPE_STRING:
   *
   * UTF-8 string
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_BOOL:
   *
   * A boolean value stored in 1 byte.
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_COMPLEX64:
   *
   * A 64-bit complex number stored in 2 32-bit values.
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_COMPLEX128:
   *
   * A 128-bit complex number stored in 2 64-bit values.
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_FLOAT8E4M3FN:
   *
   * A non-IEEE 8-bit floating point format with 4 exponent bits and 3 mantissa bits, with NaN and no infinite values (FN).
   * See [this paper for more details](https://onnx.ai/onnx/technical/float8.html)
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_FLOAT8E4M3FNUZ:
   *
   * A non-IEEE 8-bit floating point format with 4 exponent bits and 3 mantissa bits, with NaN, no infinite values (FN) and no negative zero (UZ).
   * See [this paper for more details](https://onnx.ai/onnx/technical/float8.html)
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_FLOAT8E5M2:
   *
   * A non-IEEE 8-bit floating point format with 5 exponent bits and 2 mantissa bits.
   * See [this paper for more details](https://onnx.ai/onnx/technical/float8.html)
   *
   * Since: 1.28
    }
{*
   * GST_TENSOR_DATA_TYPE_FLOAT8E5M2FNUZ:
   *
   * A non-IEEE 8-bit floating point format with 5 exponent bits and 2 mantissa bits, with NaN, no infinite values (FN) and no negative zero (UZ).
   * See [this paper for more details](https://onnx.ai/onnx/technical/float8.html)
   *
   * Since: 1.28
    }
type
  PGstTensorDataType = ^TGstTensorDataType;
  TGstTensorDataType =  Longint;
  Const
    GST_TENSOR_DATA_TYPE_INT4 = 0;
    GST_TENSOR_DATA_TYPE_INT8 = 1;
    GST_TENSOR_DATA_TYPE_INT16 = 2;
    GST_TENSOR_DATA_TYPE_INT32 = 3;
    GST_TENSOR_DATA_TYPE_INT64 = 4;
    GST_TENSOR_DATA_TYPE_UINT4 = 5;
    GST_TENSOR_DATA_TYPE_UINT8 = 6;
    GST_TENSOR_DATA_TYPE_UINT16 = 7;
    GST_TENSOR_DATA_TYPE_UINT32 = 8;
    GST_TENSOR_DATA_TYPE_UINT64 = 9;
    GST_TENSOR_DATA_TYPE_FLOAT16 = 10;
    GST_TENSOR_DATA_TYPE_FLOAT32 = 11;
    GST_TENSOR_DATA_TYPE_FLOAT64 = 12;
    GST_TENSOR_DATA_TYPE_BFLOAT16 = 13;
    GST_TENSOR_DATA_TYPE_STRING = 14;
    GST_TENSOR_DATA_TYPE_BOOL = 15;
    GST_TENSOR_DATA_TYPE_COMPLEX64 = 16;
    GST_TENSOR_DATA_TYPE_COMPLEX128 = 17;
    GST_TENSOR_DATA_TYPE_FLOAT8E4M3FN = 18;
    GST_TENSOR_DATA_TYPE_FLOAT8E4M3FNUZ = 19;
    GST_TENSOR_DATA_TYPE_FLOAT8E5M2 = 20;
    GST_TENSOR_DATA_TYPE_FLOAT8E5M2FNUZ = 21;
;
{*
 * GstTensorDimOrder:
 * @GST_TENSOR_DIM_ORDER_ROW_MAJOR: elements along a row are consecutive in memory
 * @GST_TENSOR_DIM_ORDER_COL_MAJOR: elements along a column are consecutive in memory
 *
 * Indicate to read tensor from memory in row-major or column-major order.
 *
 * Since: 1.26
  }
type
  PGstTensorDimOrder = ^TGstTensorDimOrder;
  TGstTensorDimOrder =  Longint;
  Const
    GST_TENSOR_DIM_ORDER_ROW_MAJOR = 0;
    GST_TENSOR_DIM_ORDER_COL_MAJOR = 1;
;
{*
 * GstTensorLayout:
 * @GST_TENSOR_LAYOUT_CONTIGUOUS: indicate the tensor is stored in a dense format in memory
 *
 * Indicate tensor storage in memory.
 *
 * Since: 1.26
  }
type
  PGstTensorLayout = ^TGstTensorLayout;
  TGstTensorLayout =  Longint;
  Const
    GST_TENSOR_LAYOUT_CONTIGUOUS = 0;
;
{*
 * GstTensor:
 * @id: semantically identify the contents of the tensor
 * @layout: Indicate tensor layout
 * @data_type: #GstTensorDataType of tensor data
 * @data: #GstBuffer holding tensor data
 * @dims_order: Indicate tensor elements layout in memory.
 * @num_dims: number of tensor dimensions
 * @dims: (array length=num_dims): number of tensor dimensions
 *
 * Hold tensor data
 *
 * Since: 1.26
  }
type
  PGstTensor = ^TGstTensor;
  TGstTensor = record
      id : TGQuark;
      layout : TGstTensorLayout;
      data_type : TGstTensorDataType;
      data : PGstBuffer;
      dims_order : TGstTensorDimOrder;
      num_dims : Tgsize;
      dims : Pgsize;
    end;

{ was #define dname def_expr }
function GST_TYPE_TENSOR : longint; { return type might be wrong }

function gst_tensor_alloc(num_dims:Tgsize):PGstTensor;cdecl;external;
function gst_tensor_new_simple(id:TGQuark; data_type:TGstTensorDataType; data:PGstBuffer; dims_order:TGstTensorDimOrder; num_dims:Tgsize; 
           dims:Pgsize):PGstTensor;cdecl;external;
function gst_tensor_set_simple(tensor:PGstTensor; id:TGQuark; data_type:TGstTensorDataType; data:PGstBuffer; dims_order:TGstTensorDimOrder; 
           num_dims:Tgsize; dims:Pgsize):Tgboolean;cdecl;external;
procedure gst_tensor_free(tensor:PGstTensor);cdecl;external;
(* Const before type ignored *)
function gst_tensor_copy(tensor:PGstTensor):PGstTensor;cdecl;external;
function gst_tensor_get_dims(tensor:PGstTensor; num_dims:Pgsize):Pgsize;cdecl;external;
function gst_tensor_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_tensor_data_type_get_name(data_type:TGstTensorDataType):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tensor_check_type(tensor:PGstTensor; data_type:TGstTensorDataType; order:TGstTensorDimOrder; num_dims:Tgsize; dims:Pgsize):Tgboolean;cdecl;external;
{$endif}
{ __GST_TENSOR_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TENSOR : longint; { return type might be wrong }
  begin
    GST_TYPE_TENSOR:=gst_tensor_get_type;
  end;


end.

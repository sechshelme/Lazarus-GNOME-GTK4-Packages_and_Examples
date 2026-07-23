{$IFDEF read_interface}


type
  PGstTensorDataType = ^TGstTensorDataType;
  TGstTensorDataType = longint;
const
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

type
  PGstTensorDimOrder = ^TGstTensorDimOrder;
  TGstTensorDimOrder = longint;
const
  GST_TENSOR_DIM_ORDER_ROW_MAJOR = 0;
  GST_TENSOR_DIM_ORDER_COL_MAJOR = 1;

type
  PGstTensorLayout = ^TGstTensorLayout;
  TGstTensorLayout = longint;
const
  GST_TENSOR_LAYOUT_CONTIGUOUS = 0;

type
  PPGstTensor = ^PGstTensor;
  PGstTensor = ^TGstTensor;
  TGstTensor = record
    id: TGQuark;
    layout: TGstTensorLayout;
    data_type: TGstTensorDataType;
    data: PGstBuffer;
    dims_order: TGstTensorDimOrder;
    num_dims: Tgsize;
    dims: Pgsize;
  end;

function gst_tensor_alloc(num_dims: Tgsize): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_new_simple(id: TGQuark; data_type: TGstTensorDataType; data: PGstBuffer; dims_order: TGstTensorDimOrder; num_dims: Tgsize;
  dims: Pgsize): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_set_simple(tensor: PGstTensor; id: TGQuark; data_type: TGstTensorDataType; data: PGstBuffer; dims_order: TGstTensorDimOrder;
  num_dims: Tgsize; dims: Pgsize): Tgboolean; cdecl; external libgstanalytics;
procedure gst_tensor_free(tensor: PGstTensor); cdecl; external libgstanalytics;
function gst_tensor_copy(tensor: PGstTensor): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_get_dims(tensor: PGstTensor; num_dims: Pgsize): Pgsize; cdecl; external libgstanalytics;
function gst_tensor_get_type: TGType; cdecl; external libgstanalytics;
function gst_tensor_data_type_get_name(data_type: TGstTensorDataType): Pgchar; cdecl; external libgstanalytics;
function gst_tensor_check_type(tensor: PGstTensor; data_type: TGstTensorDataType; order: TGstTensorDimOrder; num_dims: Tgsize; dims: Pgsize): Tgboolean; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:36:49 ===

function GST_TYPE_TENSOR: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TENSOR: TGType;
begin
  GST_TYPE_TENSOR := gst_tensor_get_type;
end;



{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  PGstTensorMeta = ^TGstTensorMeta;
  TGstTensorMeta = record
    meta: TGstMeta;
    num_tensors: Tgsize;
    tensors: ^PGstTensor;
  end;

function gst_tensor_meta_api_get_type: TGType; cdecl; external libgstanalytics;
function gst_tensor_meta_get_info: PGstMetaInfo; cdecl; external libgstanalytics;
procedure gst_tensor_meta_set(tmeta: PGstTensorMeta; num_tensors: Tguint; tensors: PPGstTensor); cdecl; external libgstanalytics;
function gst_tensor_meta_get_by_id(tmeta: PGstTensorMeta; id: TGQuark): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_meta_get_typed_tensor(tmeta: PGstTensorMeta; tensor_id: TGQuark; data_type: TGstTensorDataType; order: TGstTensorDimOrder; num_dims: Tgsize;
  dims: Pgsize): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_meta_get(tmeta: PGstTensorMeta; index: Tgsize): PGstTensor; cdecl; external libgstanalytics;
function gst_tensor_meta_get_index_from_id(meta: PGstTensorMeta; id: TGQuark): Tgint; cdecl; external libgstanalytics;
function gst_buffer_add_tensor_meta(buffer: PGstBuffer): PGstTensorMeta; cdecl; external libgstanalytics;
function gst_buffer_get_tensor_meta(buffer: PGstBuffer): PGstTensorMeta; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:36:44 ===

function GST_TENSOR_META_API_TYPE: TGType;
function GST_TENSOR_META_INFO: PGstMetaInfo;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TENSOR_META_API_TYPE: TGType;
begin
  GST_TENSOR_META_API_TYPE := gst_tensor_meta_api_get_type;
end;

function GST_TENSOR_META_INFO: PGstMetaInfo;
begin
  GST_TENSOR_META_INFO := gst_tensor_meta_get_info;
end;

{$ENDIF read_implementation}

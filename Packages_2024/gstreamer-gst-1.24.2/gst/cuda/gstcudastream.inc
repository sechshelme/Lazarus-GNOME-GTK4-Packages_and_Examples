
{$IFDEF read_interface}

type
  TGstCudaStreamPrivate = record
  end;
  PGstCudaStreamPrivate = ^TGstCudaStreamPrivate;

  TGstCudaStream = record
    parent: TGstMiniObject;
    context: PGstCudaContext;
    priv: PGstCudaStreamPrivate;
  end;
  PGstCudaStream = ^TGstCudaStream;
  PPGstCudaStream = ^PGstCudaStream;

function gst_cuda_stream_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_stream_new(context: PGstCudaContext): PGstCudaStream; cdecl; external libgstcuda;
function gst_cuda_stream_get_handle(stream: PGstCudaStream): TCUstream; cdecl; external libgstcuda;
function gst_cuda_stream_ref(stream: PGstCudaStream): PGstCudaStream; cdecl; external libgstcuda;
procedure gst_cuda_stream_unref(stream: PGstCudaStream); cdecl; external libgstcuda;
procedure gst_clear_cuda_stream(stream: PPGstCudaStream); cdecl; external libgstcuda;

function GST_IS_CUDA_STREAM(obj: Pointer): Tgboolean;
function GST_CUDA_STREAM(obj: Pointer): PGstCudaStream;
function GST_TYPE_CUDA_STREAM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_STREAM: TGType;
begin
  GST_TYPE_CUDA_STREAM := gst_cuda_stream_get_type;
end;

function GST_IS_CUDA_STREAM(obj: Pointer): Tgboolean;
begin
  GST_IS_CUDA_STREAM := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_CUDA_STREAM);
end;

function GST_CUDA_STREAM(obj: Pointer): PGstCudaStream;
begin
  GST_CUDA_STREAM := PGstCudaStream(obj);
end;


{$ENDIF read_implementation}

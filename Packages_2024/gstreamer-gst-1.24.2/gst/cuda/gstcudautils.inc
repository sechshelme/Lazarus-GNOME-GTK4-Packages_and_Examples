
{$IFDEF read_interface}

function _gst_cuda_debug(Result: TCUresult; cat: PGstDebugCategory; file_: Pgchar; _function: Pgchar; line: Tgint): Tgboolean; cdecl; external libgstcuda;

type
  PGstCudaQuarkId = ^TGstCudaQuarkId;
  TGstCudaQuarkId = longint;

const
  GST_CUDA_QUARK_GRAPHICS_RESOURCE = 0;
  GST_CUDA_QUARK_MAX = 1;

type
  PGstCudaGraphicsResourceType = ^TGstCudaGraphicsResourceType;
  TGstCudaGraphicsResourceType = longint;

const
  GST_CUDA_GRAPHICS_RESOURCE_NONE = 0;
  GST_CUDA_GRAPHICS_RESOURCE_GL_BUFFER = 1;
  GST_CUDA_GRAPHICS_RESOURCE_D3D11_RESOURCE = 2;

type
  TGstCudaGraphicsResource = record
    cuda_context: PGstCudaContext;
    graphics_context: PGstObject;
    _type: TGstCudaGraphicsResourceType;
    resource: TCUgraphicsResource;
    flags: TCUgraphicsRegisterFlags;
    registered: Tgboolean;
    mapped: Tgboolean;
  end;
  PGstCudaGraphicsResource = ^TGstCudaGraphicsResource;

function gst_cuda_ensure_element_context(element: PGstElement; device_id: Tgint; cuda_ctx: PPGstCudaContext): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_handle_set_context(element: PGstElement; context: PGstContext; device_id: Tgint; cuda_ctx: PPGstCudaContext): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_handle_context_query(element: PGstElement; query: PGstQuery; cuda_ctx: PGstCudaContext): Tgboolean; cdecl; external libgstcuda;
function gst_context_new_cuda_context(cuda_ctx: PGstCudaContext): PGstContext; cdecl; external libgstcuda;
function gst_cuda_quark_from_id(id: TGstCudaQuarkId): TGQuark; cdecl; external libgstcuda;
function gst_cuda_graphics_resource_new(context: PGstCudaContext; graphics_context: PGstObject; _type: TGstCudaGraphicsResourceType): PGstCudaGraphicsResource; cdecl; external libgstcuda;
function gst_cuda_graphics_resource_register_gl_buffer(resource: PGstCudaGraphicsResource; buffer: Tguint; flags: TCUgraphicsRegisterFlags): Tgboolean; cdecl; external libgstcuda;
{$ifdef windows}
function gst_cuda_graphics_resource_register_d3d11_resource(resource: PGstCudaGraphicsResource; d3d11_resource: PID3D11Resource; flags: TCUgraphicsRegisterFlags): Tgboolean; cdecl; external libgstcuda;
{$endif}
procedure gst_cuda_graphics_resource_unregister(resource: PGstCudaGraphicsResource); cdecl; external libgstcuda;
function gst_cuda_graphics_resource_map(resource: PGstCudaGraphicsResource; stream: TCUstream; flags: TCUgraphicsMapResourceFlags): TCUgraphicsResource; cdecl; external libgstcuda;
procedure gst_cuda_graphics_resource_unmap(resource: PGstCudaGraphicsResource; stream: TCUstream); cdecl; external libgstcuda;
procedure gst_cuda_graphics_resource_free(resource: PGstCudaGraphicsResource); cdecl; external libgstcuda;
function gst_cuda_create_user_token: Tgint64; cdecl; external libgstcuda;

// === Konventiert am: 11-10-24 15:03:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}

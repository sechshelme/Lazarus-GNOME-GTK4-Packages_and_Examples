/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   16:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_CUDA_CONTEXT_TYPE = 'gst.cuda.context';

type
  TGstCudaContextPrivate = record
  end;
  PGstCudaContextPrivate = ^TGstCudaContextPrivate;

  TGstCudaContext = record
    _object: TGstObject;
    priv: PGstCudaContextPrivate;
  end;
  PGstCudaContext = ^TGstCudaContext;
  PPGstCudaContext = ^PGstCudaContext;

  TGstCudaContextClass = record
    parent_class: TGstObjectClass;
  end;
  PGstCudaContextClass = ^TGstCudaContextClass;

function gst_cuda_context_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_context_new(device_id: Tguint): PGstCudaContext; cdecl; external libgstcuda;
function gst_cuda_context_new_wrapped(handler: TCUcontext; device: TCUdevice): PGstCudaContext; cdecl; external libgstcuda;
function gst_cuda_context_push(ctx: PGstCudaContext): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_context_pop(cuda_ctx: PCUcontext): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_context_get_handle(ctx: PGstCudaContext): Tgpointer; cdecl; external libgstcuda;
function gst_cuda_context_get_texture_alignment(ctx: PGstCudaContext): Tgint; cdecl; external libgstcuda;
function gst_cuda_context_can_access_peer(ctx: PGstCudaContext; peer: PGstCudaContext): Tgboolean; cdecl; external libgstcuda;

function GST_CUDA_CONTEXT_CAST(obj: Pointer): PGstCudaContext;

// === Konventiert am: 11-10-24 15:02:03 ===

function GST_TYPE_CUDA_CONTEXT: TGType;
function GST_CUDA_CONTEXT(obj: Pointer): PGstCudaContext;
function GST_CUDA_CONTEXT_CLASS(klass: Pointer): PGstCudaContextClass;
function GST_IS_CUDA_CONTEXT(obj: Pointer): Tgboolean;
function GST_IS_CUDA_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GST_CUDA_CONTEXT_GET_CLASS(obj: Pointer): PGstCudaContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_CONTEXT: TGType;
begin
  GST_TYPE_CUDA_CONTEXT := gst_cuda_context_get_type;
end;

function GST_CUDA_CONTEXT(obj: Pointer): PGstCudaContext;
begin
  Result := PGstCudaContext(g_type_check_instance_cast(obj, GST_TYPE_CUDA_CONTEXT));
end;

function GST_CUDA_CONTEXT_CLASS(klass: Pointer): PGstCudaContextClass;
begin
  Result := PGstCudaContextClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_CONTEXT));
end;

function GST_IS_CUDA_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CUDA_CONTEXT);
end;

function GST_IS_CUDA_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CUDA_CONTEXT);
end;

function GST_CUDA_CONTEXT_GET_CLASS(obj: Pointer): PGstCudaContextClass;
begin
  Result := PGstCudaContextClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_CUDA_CONTEXT_CAST(obj: Pointer): PGstCudaContext;
begin
  GST_CUDA_CONTEXT_CAST := PGstCudaContext(obj);
end;


{$ENDIF read_implementation}

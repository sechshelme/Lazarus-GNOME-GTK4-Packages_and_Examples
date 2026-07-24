{$IFDEF read_interface}


function gst_va_pool_get_type: TGType; cdecl; external libgstva;
function gst_va_pool_new: PGstBufferPool; cdecl; external libgstva;
function gst_va_pool_requires_video_meta(pool: PGstBufferPool): Tgboolean; cdecl; external libgstva;
procedure gst_buffer_pool_config_set_va_allocation_params(config: PGstStructure; usage_hint: Tguint; use_derived: TGstVaFeature); cdecl; external libgstva;
procedure gst_buffer_pool_config_set_va_alignment(config: PGstStructure; align: PGstVideoAlignment); cdecl; external libgstva;
function gst_va_pool_new_with_config(caps: PGstCaps; min_buffers: Tguint; max_buffers: Tguint; usage_hint: Tguint; use_derived: TGstVaFeature;
  allocator: PGstAllocator; alloc_params: PGstAllocationParams): PGstBufferPool; cdecl; external libgstva;
function gst_va_pool_get_buffer_size(pool: PGstBufferPool; size: Pguint): Tgboolean; cdecl; external libgstva;

// === Konventiert am: 24-7-26 19:19:00 ===

function GST_TYPE_VA_POOL: TGType;
function GST_IS_VA_POOL(obj: Pointer): Tgboolean;
function GST_IS_VA_POOL_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_VA_POOL: TGType;
begin
  GST_TYPE_VA_POOL := gst_va_pool_get_type;
end;

function GST_IS_VA_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_POOL);
end;

function GST_IS_VA_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_POOL);
end;

{$ENDIF read_implementation}

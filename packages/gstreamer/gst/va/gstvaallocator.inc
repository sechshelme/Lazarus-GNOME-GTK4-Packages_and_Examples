
{$IFDEF read_interface}

type
  TGstVaDmabufAllocator = record
  end;
  PGstVaDmabufAllocator = ^TGstVaDmabufAllocator;

  TGstVaDmabufAllocatorClass = record
  end;
  PGstVaDmabufAllocatorClass = ^TGstVaDmabufAllocatorClass;

  TGstVaAllocator = record
  end;
  PGstVaAllocator = ^TGstVaAllocator;

  TGstVaAllocatorClass = record
  end;
  PGstVaAllocatorClass = ^TGstVaAllocatorClass;

function gst_va_dmabuf_allocator_get_type: TGType; cdecl; external libgstva;
function gst_va_dmabuf_allocator_new(display: PGstVaDisplay): PGstAllocator; cdecl; external libgstva;
function gst_va_dmabuf_allocator_setup_buffer(allocator: PGstAllocator; buffer: PGstBuffer): Tgboolean; cdecl; external libgstva;
function gst_va_dmabuf_allocator_prepare_buffer(allocator: PGstAllocator; buffer: PGstBuffer): Tgboolean; cdecl; external libgstva;
procedure gst_va_dmabuf_allocator_flush(allocator: PGstAllocator); cdecl; external libgstva;
function gst_va_dmabuf_allocator_set_format(allocator: PGstAllocator; info: PGstVideoInfoDmaDrm; usage_hint: Tguint): Tgboolean; cdecl; external libgstva;
function gst_va_dmabuf_allocator_get_format(allocator: PGstAllocator; info: PGstVideoInfoDmaDrm; usage_hint: Pguint): Tgboolean; cdecl; external libgstva;
function gst_va_dmabuf_memories_setup(display: PGstVaDisplay; drm_info: PGstVideoInfoDmaDrm; mem: Tplanes_GstMemory_arr; fds: Tplanes_Tuintptr_t_arr; offset: Tplanes_size_arr; usage_hint: Tguint): Tgboolean; cdecl; external libgstva;
function gst_va_dmabuf_get_modifier_for_format(display: PGstVaDisplay; format: TGstVideoFormat; usage_hint: Tguint): Tguint64; cdecl; external libgstva;

const
  GST_ALLOCATOR_VASURFACE = 'VAMemory';
  GST_MAP_VA = GST_MAP_FLAG_LAST shl 1;

function gst_va_allocator_get_type: TGType; cdecl; external libgstva;
function gst_va_allocator_new(display: PGstVaDisplay; surface_formats: PGArray): PGstAllocator; cdecl; external libgstva;
function gst_va_allocator_alloc(allocator: PGstAllocator): PGstMemory; cdecl; external libgstva;
function gst_va_allocator_setup_buffer(allocator: PGstAllocator; buffer: PGstBuffer): Tgboolean; cdecl; external libgstva;
function gst_va_allocator_prepare_buffer(allocator: PGstAllocator; buffer: PGstBuffer): Tgboolean; cdecl; external libgstva;
procedure gst_va_allocator_flush(allocator: PGstAllocator); cdecl; external libgstva;
function gst_va_allocator_set_format(allocator: PGstAllocator; info: PGstVideoInfo; usage_hint: Tguint; feat_use_derived: TGstVaFeature): Tgboolean; cdecl; external libgstva;
function gst_va_allocator_get_format(allocator: PGstAllocator; info: PGstVideoInfo; usage_hint: Pguint; use_derived: Pgboolean): Tgboolean; cdecl; external libgstva;
procedure gst_va_allocator_set_hacks(allocator: PGstAllocator; hacks: Tguint32); cdecl; external libgstva;
function gst_va_allocator_peek_display(allocator: PGstAllocator): PGstVaDisplay; cdecl; external libgstva;
function gst_va_memory_get_surface(mem: PGstMemory): TVASurfaceID; cdecl; external libgstva;
function gst_va_memory_peek_display(mem: PGstMemory): PGstVaDisplay; cdecl; external libgstva;
function gst_va_buffer_get_surface(buffer: PGstBuffer): TVASurfaceID; cdecl; external libgstva;
function gst_va_buffer_create_aux_surface(buffer: PGstBuffer): Tgboolean; cdecl; external libgstva;
function gst_va_buffer_get_aux_surface(buffer: PGstBuffer): TVASurfaceID; cdecl; external libgstva;
function gst_va_buffer_peek_display(buffer: PGstBuffer): PGstVaDisplay; cdecl; external libgstva;

// === Konventiert am: 8-10-24 16:12:01 ===

function GST_TYPE_VA_DMABUF_ALLOCATOR: TGType;
function GST_VA_DMABUF_ALLOCATOR(obj: Pointer): PGstVaDmabufAllocator;
function GST_VA_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstVaDmabufAllocatorClass;
function GST_IS_VA_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VA_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VA_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVaDmabufAllocatorClass;

function GST_TYPE_VA_ALLOCATOR: TGType;
function GST_VA_ALLOCATOR(obj: Pointer): PGstVaAllocator;
function GST_VA_ALLOCATOR_CLASS(klass: Pointer): PGstVaAllocatorClass;
function GST_IS_VA_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VA_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VA_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVaAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_DMABUF_ALLOCATOR: TGType;
begin
  GST_TYPE_VA_DMABUF_ALLOCATOR := gst_va_dmabuf_allocator_get_type;
end;

function GST_VA_DMABUF_ALLOCATOR(obj: Pointer): PGstVaDmabufAllocator;
begin
  Result := PGstVaDmabufAllocator(g_type_check_instance_cast(obj, GST_TYPE_VA_DMABUF_ALLOCATOR));
end;

function GST_VA_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstVaDmabufAllocatorClass;
begin
  Result := PGstVaDmabufAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VA_DMABUF_ALLOCATOR));
end;

function GST_IS_VA_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_DMABUF_ALLOCATOR);
end;

function GST_IS_VA_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_DMABUF_ALLOCATOR);
end;

function GST_VA_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVaDmabufAllocatorClass;
begin
  Result := PGstVaDmabufAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VA_ALLOCATOR: TGType;
begin
  GST_TYPE_VA_ALLOCATOR := gst_va_allocator_get_type;
end;

function GST_VA_ALLOCATOR(obj: Pointer): PGstVaAllocator;
begin
  Result := PGstVaAllocator(g_type_check_instance_cast(obj, GST_TYPE_VA_ALLOCATOR));
end;

function GST_VA_ALLOCATOR_CLASS(klass: Pointer): PGstVaAllocatorClass;
begin
  Result := PGstVaAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VA_ALLOCATOR));
end;

function GST_IS_VA_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_ALLOCATOR);
end;

function GST_IS_VA_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_ALLOCATOR);
end;

function GST_VA_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVaAllocatorClass;
begin
  Result := PGstVaAllocatorClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}

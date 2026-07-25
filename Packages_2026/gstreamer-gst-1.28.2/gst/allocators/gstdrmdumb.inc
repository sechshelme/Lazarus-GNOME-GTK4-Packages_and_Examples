{$IFDEF read_interface}

type
  PGstTypeDmabufAllocator = type Pointer;
  PGstTypeDmabufAllocatorClass = type Pointer;

function gst_type_dmabuf_allocator_get_type: TGType; cdecl; external libgstallocators;
function gst_is_drm_dumb_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstallocators;
function gst_drm_dumb_memory_get_handle(mem: PGstMemory): Tguint32; cdecl; external libgstallocators;
function gst_drm_dumb_memory_export_dmabuf(mem: PGstMemory): PGstMemory; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_new_with_fd(drm_fd: Tgint): PGstAllocator; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_new_with_device_path(drm_device_path: Pgchar): PGstAllocator; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_alloc(allocator: PGstAllocator; drm_fourcc: Tguint32; width: Tguint32; height: Tguint32; out_pitch: Pguint32): PGstMemory; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_has_prime_export(allocator: PGstAllocator): Tgboolean; cdecl; external libgstallocators;

// === Konventiert am: 25-7-26 17:05:57 ===

function GST_TYPE_TYPE_DMABUF_ALLOCATOR: TGType;
function GST_TYPE_DMABUF_ALLOCATOR(obj: Pointer): PGstTypeDmabufAllocator;
function GST_TYPE_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstTypeDmabufAllocatorClass;
function GST_IS_TYPE_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_TYPE_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_TYPE_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstTypeDmabufAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TYPE_DMABUF_ALLOCATOR: TGType;
begin
  Result := gst_type_dmabuf_allocator_get_type;
end;

function GST_TYPE_DMABUF_ALLOCATOR(obj: Pointer): PGstTypeDmabufAllocator;
begin
  Result := PGstTypeDmabufAllocator(g_type_check_instance_cast(obj, GST_TYPE_TYPE_DMABUF_ALLOCATOR));
end;

function GST_TYPE_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstTypeDmabufAllocatorClass;
begin
  Result := PGstTypeDmabufAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_TYPE_DMABUF_ALLOCATOR));
end;

function GST_IS_TYPE_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TYPE_DMABUF_ALLOCATOR);
end;

function GST_IS_TYPE_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TYPE_DMABUF_ALLOCATOR);
end;

function GST_TYPE_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstTypeDmabufAllocatorClass;
begin
  Result := PGstTypeDmabufAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}

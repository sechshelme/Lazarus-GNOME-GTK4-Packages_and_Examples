
{$IFDEF read_interface}


type
  TGstDRMDumbAllocator = record
  end;
  PGstDRMDumbAllocator = ^TGstDRMDumbAllocator;

  TGstDRMDumbAllocatorClass = record
    parent_class: TGstAllocatorClass;
  end;
  PGstDRMDumbAllocatorClass = ^TGstDRMDumbAllocatorClass;

function gst_drm_dumb_allocator_get_type: TGType; cdecl; external libgstallocators;
function gst_is_drm_dumb_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstallocators;
function gst_drm_dumb_memory_get_handle(mem: PGstMemory): Tguint32; cdecl; external libgstallocators;
function gst_drm_dumb_memory_export_dmabuf(mem: PGstMemory): PGstMemory; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_new_with_fd(drm_fd: Tgint): PGstAllocator; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_new_with_device_path(drm_device_path: Pgchar): PGstAllocator; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_alloc(allocator: PGstAllocator; drm_fourcc: Tguint32; Width: Tguint32; Height: Tguint32; out_pitch: Pguint32): PGstMemory; cdecl; external libgstallocators;
function gst_drm_dumb_allocator_has_prime_export(allocator: PGstAllocator): Tgboolean; cdecl; external libgstallocators;

// === Konventiert am: 1-10-24 16:37:18 ===

function GST_TYPE_DRM_DUMB_ALLOCATOR: TGType;
function GST_DRM_DUMB_ALLOCATOR(obj: Pointer): PGstDRMDumbAllocator;
function GST_IS_DRM_DUMB_ALLOCATOR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DRM_DUMB_ALLOCATOR: TGType;
begin
  Result := gst_drm_dumb_allocator_get_type;
end;

function GST_DRM_DUMB_ALLOCATOR(obj: Pointer): PGstDRMDumbAllocator;
begin
  Result := PGstDRMDumbAllocator(g_type_check_instance_cast(obj, GST_TYPE_DRM_DUMB_ALLOCATOR));
end;

function GST_IS_DRM_DUMB_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DRM_DUMB_ALLOCATOR);
end;




{$ENDIF read_implementation}

{$IFDEF read_interface}


const
  GST_ALLOCATOR_SHM = 'shm';

type
  TGstShmAllocator = record
    parent_instance: TGstFdAllocator;
  end;
  PGstShmAllocator = ^TGstShmAllocator;

  PGstShmAllocatorClass = ^TGstShmAllocatorClass;
  TGstShmAllocatorClass = record
    parent_class: TGstFdAllocatorClass;
  end;

function gst_shm_allocator_get_type: TGType; cdecl; external libgstallocators;
procedure gst_shm_allocator_init_once; cdecl; external libgstallocators;
function gst_shm_allocator_get: PGstAllocator; cdecl; external libgstallocators;

// === Konventiert am: 25-7-26 16:59:50 ===

function GST_TYPE_SHM_ALLOCATOR: TGType;
function GST_SHM_ALLOCATOR(obj: Pointer): PGstShmAllocator;
function GST_IS_SHM_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_SHM_ALLOCATOR_CLASS(klass: Pointer): PGstShmAllocatorClass;
function GST_IS_SHM_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_SHM_ALLOCATOR_GET_CLASS(obj: Pointer): PGstShmAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SHM_ALLOCATOR: TGType;
begin
  Result := gst_shm_allocator_get_type;
end;

function GST_SHM_ALLOCATOR(obj: Pointer): PGstShmAllocator;
begin
  Result := PGstShmAllocator(g_type_check_instance_cast(obj, GST_TYPE_SHM_ALLOCATOR));
end;

function GST_IS_SHM_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SHM_ALLOCATOR);
end;

function GST_SHM_ALLOCATOR_CLASS(klass: Pointer): PGstShmAllocatorClass;
begin
  Result := PGstShmAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_SHM_ALLOCATOR));
end;

function GST_IS_SHM_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_SHM_ALLOCATOR);
end;

function GST_SHM_ALLOCATOR_GET_CLASS(obj: Pointer): PGstShmAllocatorClass;
begin
  Result := PGstShmAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}

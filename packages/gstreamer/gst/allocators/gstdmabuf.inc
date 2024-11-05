/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   19:04                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_CAPS_FEATURE_MEMORY_DMABUF = 'memory:DMABuf';
  GST_ALLOCATOR_DMABUF = 'dmabuf';

type
  PGstDmaBufAllocator = ^TGstDmaBufAllocator;

  TGstDmaBufAllocator = record
    parent: TGstFdAllocator;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstDmaBufAllocatorClass = ^TGstDmaBufAllocatorClass;

  TGstDmaBufAllocatorClass = record
    parent_class: TGstFdAllocatorClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_dmabuf_allocator_get_type: TGType; cdecl; external libgstallocators;
function gst_dmabuf_allocator_new: PGstAllocator; cdecl; external libgstallocators;
function gst_dmabuf_allocator_alloc(allocator: PGstAllocator; fd: Tgint; size: Tgsize): PGstMemory; cdecl; external libgstallocators;
function gst_dmabuf_allocator_alloc_with_flags(allocator: PGstAllocator; fd: Tgint; size: Tgsize; flags: TGstFdMemoryFlags): PGstMemory; cdecl; external libgstallocators;
function gst_dmabuf_memory_get_fd(mem: PGstMemory): Tgint; cdecl; external libgstallocators;
function gst_is_dmabuf_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstallocators;

function GST_DMABUF_ALLOCATOR_CAST(obj: longint): PGstDmaBufAllocator;

// === Konventiert am: 1-10-24 16:36:35 ===

function GST_TYPE_DMABUF_ALLOCATOR: TGType;
function GST_DMABUF_ALLOCATOR(obj: Pointer): PGstDmaBufAllocator;
function GST_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstDmaBufAllocatorClass;
function GST_IS_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstDmaBufAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DMABUF_ALLOCATOR: TGType;
begin
  GST_TYPE_DMABUF_ALLOCATOR := gst_dmabuf_allocator_get_type;
end;

function GST_DMABUF_ALLOCATOR(obj: Pointer): PGstDmaBufAllocator;
begin
  Result := PGstDmaBufAllocator(g_type_check_instance_cast(obj, GST_TYPE_DMABUF_ALLOCATOR));
end;

function GST_DMABUF_ALLOCATOR_CLASS(klass: Pointer): PGstDmaBufAllocatorClass;
begin
  Result := PGstDmaBufAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_DMABUF_ALLOCATOR));
end;

function GST_IS_DMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DMABUF_ALLOCATOR);
end;

function GST_IS_DMABUF_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DMABUF_ALLOCATOR);
end;

function GST_DMABUF_ALLOCATOR_GET_CLASS(obj: Pointer): PGstDmaBufAllocatorClass;
begin
  Result := PGstDmaBufAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_DMABUF_ALLOCATOR_CAST(obj: longint): PGstDmaBufAllocator;
begin
  GST_DMABUF_ALLOCATOR_CAST := PGstDmaBufAllocator(obj);
end;


{$ENDIF read_implementation}

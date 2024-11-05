/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   19:04                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPhysMemoryAllocator = record
  end;
  PGstPhysMemoryAllocator = ^TGstPhysMemoryAllocator;

  TGstPhysMemoryAllocatorInterface = record
    parent_iface: TGTypeInterface;
    get_phys_addr: function(allocator: PGstPhysMemoryAllocator; mem: PGstMemory): Tguintptr; cdecl;
  end;
  PGstPhysMemoryAllocatorInterface = ^TGstPhysMemoryAllocatorInterface;

function gst_phys_memory_allocator_get_type: TGType; cdecl; external libgstallocators;
function gst_is_phys_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstallocators;
function gst_phys_memory_get_phys_addr(mem: PGstMemory): Tguintptr; cdecl; external libgstallocators;

function GST_PHYS_MEMORY_ALLOCATOR_CAST(obj: longint): PGstPhysMemoryAllocator;

// === Konventiert am: 1-10-24 16:52:51 ===

function GST_TYPE_PHYS_MEMORY_ALLOCATOR: TGType;
function GST_PHYS_MEMORY_ALLOCATOR(obj: Pointer): PGstPhysMemoryAllocator;
function GST_IS_PHYS_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_PHYS_MEMORY_ALLOCATOR_GET_IFACE(obj: Pointer): PGstPhysMemoryAllocatorInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PHYS_MEMORY_ALLOCATOR: TGType;
begin
  Result := gst_phys_memory_allocator_get_type;
end;

function GST_PHYS_MEMORY_ALLOCATOR(obj: Pointer): PGstPhysMemoryAllocator;
begin
  Result := PGstPhysMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_PHYS_MEMORY_ALLOCATOR));
end;

function GST_IS_PHYS_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PHYS_MEMORY_ALLOCATOR);
end;

function GST_PHYS_MEMORY_ALLOCATOR_GET_IFACE(obj: Pointer): PGstPhysMemoryAllocatorInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PHYS_MEMORY_ALLOCATOR);
end;

// ====

function GST_PHYS_MEMORY_ALLOCATOR_CAST(obj: longint): PGstPhysMemoryAllocator;
begin
  GST_PHYS_MEMORY_ALLOCATOR_CAST := PGstPhysMemoryAllocator(obj);
end;


{$ENDIF read_implementation}

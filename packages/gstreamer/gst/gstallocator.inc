/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_allocation_params_get_type: TGType; cdecl; external libgstreamer;

var
  gst_memory_alignment: Tgsize; cvar;external libgstreamer;

const
  GST_ALLOCATOR_SYSMEM = 'SystemMemory';

type
  PGstAllocationParams = ^TGstAllocationParams;

  TGstAllocationParams = record
    flags: TGstMemoryFlags;
    align: Tgsize;
    prefix: Tgsize;
    padding: Tgsize;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstAllocatorFlags = ^TGstAllocatorFlags;
  TGstAllocatorFlags = longint;

const
  GST_ALLOCATOR_FLAG_CUSTOM_ALLOC = GST_OBJECT_FLAG_LAST shl 0;
  GST_ALLOCATOR_FLAG_NO_COPY = GST_OBJECT_FLAG_LAST shl 1;
  GST_ALLOCATOR_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 16;

type
  TGstAllocatorPrivate = record
  end;
  PGstAllocatorPrivate = ^TGstAllocatorPrivate;

  TGstAllocator = record
    obj: TGstObject;
    mem_type: Pgchar;
    mem_map: TGstMemoryMapFunction;
    mem_unmap: TGstMemoryUnmapFunction;
    mem_copy: TGstMemoryCopyFunction;
    mem_share: TGstMemoryShareFunction;
    mem_is_span: TGstMemoryIsSpanFunction;
    mem_map_full: TGstMemoryMapFullFunction;
    mem_unmap_full: TGstMemoryUnmapFullFunction;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
    priv: PGstAllocatorPrivate;
  end;
  PGstAllocator = ^TGstAllocator;
  PPGstAllocator = ^PGstAllocator;

  PGstAllocatorClass = ^TGstAllocatorClass;

  TGstAllocatorClass = record
    object_class: TGstObjectClass;
    alloc: function(allocator: PGstAllocator; size: Tgsize; params: PGstAllocationParams): PGstMemory; cdecl;
    Free: procedure(allocator: PGstAllocator; memory: PGstMemory); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_allocator_get_type: TGType; cdecl; external libgstreamer;
procedure gst_allocator_register(Name: Pgchar; allocator: PGstAllocator); cdecl; external libgstreamer;
function gst_allocator_find(Name: Pgchar): PGstAllocator; cdecl; external libgstreamer;
procedure gst_allocator_set_default(allocator: PGstAllocator); cdecl; external libgstreamer;
function gst_allocation_params_new: PGstAllocationParams; cdecl; external libgstreamer;
procedure gst_allocation_params_init(params: PGstAllocationParams); cdecl; external libgstreamer;
function gst_allocation_params_copy(params: PGstAllocationParams): PGstAllocationParams; cdecl; external libgstreamer;
procedure gst_allocation_params_free(params: PGstAllocationParams); cdecl; external libgstreamer;
function gst_allocator_alloc(allocator: PGstAllocator; size: Tgsize; params: PGstAllocationParams): PGstMemory; cdecl; external libgstreamer;
procedure gst_allocator_free(allocator: PGstAllocator; memory: PGstMemory); cdecl; external libgstreamer;
function gst_memory_new_wrapped(flags: TGstMemoryFlags; Data: Tgpointer; maxsize: Tgsize; offset: Tgsize; size: Tgsize;
  user_data: Tgpointer; notify: TGDestroyNotify): PGstMemory; cdecl; external libgstreamer;

// ausgelagert
procedure gst_memory_init(mem: PGstMemory; flags: TGstMemoryFlags; allocator: PGstAllocator; parent: PGstMemory; maxsize: Tgsize; align: Tgsize; offset: Tgsize; size: Tgsize); cdecl; external libgstreamer;
// ----

function GST_ALLOCATOR_CAST(obj: Pointer): PGstAllocator;
function GST_TYPE_ALLOCATION_PARAMS: TGType;

// === Konventiert am: 12-9-24 19:20:54 ===

function GST_TYPE_ALLOCATOR: TGType;
function GST_ALLOCATOR(obj: Pointer): PGstAllocator;
function GST_ALLOCATOR_CLASS(klass: Pointer): PGstAllocatorClass;
function GST_IS_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_ALLOCATOR_GET_CLASS(obj: Pointer): PGstAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ALLOCATOR: TGType;
begin
  GST_TYPE_ALLOCATOR := gst_allocator_get_type;
end;

function GST_ALLOCATOR(obj: Pointer): PGstAllocator;
begin
  Result := PGstAllocator(g_type_check_instance_cast(obj, GST_TYPE_ALLOCATOR));
end;

function GST_ALLOCATOR_CLASS(klass: Pointer): PGstAllocatorClass;
begin
  Result := PGstAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_ALLOCATOR));
end;

function GST_IS_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ALLOCATOR);
end;

function GST_IS_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_ALLOCATOR);
end;

function GST_ALLOCATOR_GET_CLASS(obj: Pointer): PGstAllocatorClass;
begin
  Result := PGstAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_ALLOCATOR_CAST(obj: Pointer): PGstAllocator;
begin
  GST_ALLOCATOR_CAST := PGstAllocator(obj);
end;

function GST_TYPE_ALLOCATION_PARAMS: TGType;
begin
  GST_TYPE_ALLOCATION_PARAMS := gst_allocation_params_get_type;
end;


{$ENDIF read_implementation}

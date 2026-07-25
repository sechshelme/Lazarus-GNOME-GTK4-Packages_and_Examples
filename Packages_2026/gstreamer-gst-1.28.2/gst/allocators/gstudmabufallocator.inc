{$IFDEF read_interface}


const
  GST_ALLOCATOR_UDMABUF = 'udmabuf';

type
  PGstUdmabufAllocator = type Pointer;

  TGstUdmabufAllocatorClass = record
    parent_class: TGstDmaBufAllocatorClass;
  end;
  PGstUdmabufAllocatorClass = ^TGstUdmabufAllocatorClass;

function gst_udmabuf_allocator_get_type: TGType; cdecl; external libgstallocators;
procedure gst_udmabuf_allocator_init_once; cdecl; external libgstallocators;
function gst_udmabuf_allocator_get: PGstAllocator; cdecl; external libgstallocators;

// === Konventiert am: 25-7-26 16:59:44 ===

function GST_TYPE_UDMABUF_ALLOCATOR: TGType;
function GST_UDMABUF_ALLOCATOR(obj: Pointer): PGstUdmabufAllocator;
function GST_IS_UDMABUF_ALLOCATOR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_UDMABUF_ALLOCATOR: TGType;
begin
  Result := gst_udmabuf_allocator_get_type;
end;

function GST_UDMABUF_ALLOCATOR(obj: Pointer): PGstUdmabufAllocator;
begin
  Result := PGstUdmabufAllocator(g_type_check_instance_cast(obj, GST_TYPE_UDMABUF_ALLOCATOR));
end;

function GST_IS_UDMABUF_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_UDMABUF_ALLOCATOR);
end;

{$ENDIF read_implementation}

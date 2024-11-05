/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   19:04                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_ALLOCATOR_SHM = 'shm';

  type
  TGstShmAllocator = record
  end;
  PGstShmAllocator = ^TGstShmAllocator;

  TGstShmAllocatorClass = record
    parent_class: TGstFdAllocatorClass;
  end;
  PGstShmAllocatorClass = ^TGstShmAllocatorClass;

function gst_shm_allocator_get_type: TGType; cdecl; external libgstallocators;

procedure gst_shm_allocator_init_once;cdecl;external libgstallocators;
function gst_shm_allocator_get:PGstAllocator;cdecl;external libgstallocators;

// === Konventiert am: 1-10-24 16:41:38 ===

function GST_TYPE_SHM_ALLOCATOR: TGType;
function GST_SHM_ALLOCATOR(obj: Pointer): PGstShmAllocator;
function GST_IS_SHM_ALLOCATOR(obj: Pointer): Tgboolean;


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

{$ENDIF read_implementation}

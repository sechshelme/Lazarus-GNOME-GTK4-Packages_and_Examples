/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   15:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GstWlVideoBufferPool, gst_wl_video_buffer_pool, GST, WL_VIDEO_BUFFER_POOL, GstVideoBufferPool); }
type
  TGstWlVideoBufferPool = record
  end;
  PGstWlVideoBufferPool = ^TGstWlVideoBufferPool;

  TGstWlVideoBufferPoolClass = record
    parent_class: TGstVideoBufferPoolClass;
  end;
  PGstWlVideoBufferPoolClass = ^TGstWlVideoBufferPoolClass;

function gst_wl_video_buffer_pool_get_type: TGType; cdecl; external libgstwayland;
function gst_wl_video_buffer_pool_new: PGstBufferPool; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:16:10 ===

function GST_TYPE_WL_VIDEO_BUFFER_POOL: TGType;
function GST_WL_VIDEO_BUFFER_POOL(obj: Pointer): PGstWlVideoBufferPool;
function GST_IS_WL_VIDEO_BUFFER_POOL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WL_VIDEO_BUFFER_POOL: TGType;
begin
  Result := gst_wl_video_buffer_pool_get_type;
end;

function GST_WL_VIDEO_BUFFER_POOL(obj: Pointer): PGstWlVideoBufferPool;
begin
  Result := PGstWlVideoBufferPool(g_type_check_instance_cast(obj, GST_TYPE_WL_VIDEO_BUFFER_POOL));
end;

function GST_IS_WL_VIDEO_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_VIDEO_BUFFER_POOL);
end;


{$ENDIF read_implementation}

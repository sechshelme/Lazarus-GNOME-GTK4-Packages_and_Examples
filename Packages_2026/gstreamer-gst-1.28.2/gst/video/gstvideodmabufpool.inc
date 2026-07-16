

  {$IFDEF read_struct}
type
  PGstVideoDmabufPool = type Pointer;

  TGstVideoDmabufPoolClass = record
    parent_class: TGstVideoBufferPoolClass;
  end;
  PGstVideoDmabufPoolClass = ^TGstVideoDmabufPoolClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_dmabuf_pool_get_type: TGType; cdecl; external libgstvideo;
function gst_video_dmabuf_pool_new: PGstBufferPool; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:21:22 ===

function GST_TYPE_VIDEO_DMABUF_POOL: TGType;
function GST_VIDEO_DMABUF_POOL(obj: Pointer): PGstVideoDmabufPool;
function GST_IS_VIDEO_DMABUF_POOL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_DMABUF_POOL: TGType;
begin
  Result := gst_video_dmabuf_pool_get_type;
end;

function GST_VIDEO_DMABUF_POOL(obj: Pointer): PGstVideoDmabufPool;
begin
  Result := PGstVideoDmabufPool(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DMABUF_POOL));
end;

function GST_IS_VIDEO_DMABUF_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_DMABUF_POOL);
end;




{$ENDIF read_implementation}

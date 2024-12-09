
{$IFDEF read_interface}

const
  GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT = 'GstBufferPoolOptionVideoAlignment';

procedure gst_buffer_pool_config_set_video_alignment(config: PGstStructure; align: PGstVideoAlignment); cdecl; external libgstvideo;
function gst_buffer_pool_config_get_video_alignment(config: PGstStructure; align: PGstVideoAlignment): Tgboolean; cdecl; external libgstvideo;

type
  TGstVideoBufferPoolPrivate = record
  end;
  PGstVideoBufferPoolPrivate = ^TGstVideoBufferPoolPrivate;

  TGstVideoBufferPool = record
    bufferpool: TGstBufferPool;
    priv: PGstVideoBufferPoolPrivate;
  end;
  PGstVideoBufferPool = ^TGstVideoBufferPool;

  TGstVideoBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
  end;
  PGstVideoBufferPoolClass = ^TGstVideoBufferPoolClass;


function gst_video_buffer_pool_get_type: TGType; cdecl; external libgstvideo;
function gst_video_buffer_pool_new: PGstBufferPool; cdecl; external libgstvideo;

function GST_VIDEO_BUFFER_POOL_CAST(obj: Pointer): PGstVideoBufferPool;

// === Konventiert am: 1-10-24 15:18:28 ===

function GST_TYPE_VIDEO_BUFFER_POOL: TGType;
function GST_VIDEO_BUFFER_POOL(obj: Pointer): PGstVideoBufferPool;
function GST_IS_VIDEO_BUFFER_POOL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_BUFFER_POOL: TGType;
begin
  GST_TYPE_VIDEO_BUFFER_POOL := gst_video_buffer_pool_get_type;
end;

function GST_VIDEO_BUFFER_POOL(obj: Pointer): PGstVideoBufferPool;
begin
  Result := PGstVideoBufferPool(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_BUFFER_POOL));
end;

function GST_IS_VIDEO_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_BUFFER_POOL);
end;

function GST_VIDEO_BUFFER_POOL_CAST(obj: Pointer): PGstVideoBufferPool;
begin
  GST_VIDEO_BUFFER_POOL_CAST := PGstVideoBufferPool(obj);
end;


{$ENDIF read_implementation}

unit gstvideopool;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_BUFFER_POOL_OPTION_VIDEO_META = 'GstBufferPoolOptionVideoMeta';
  GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT = 'GstBufferPoolOptionVideoAlignment';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoBufferPoolPrivate = type Pointer;

  PGstVideoBufferPool = ^TGstVideoBufferPool;
  TGstVideoBufferPool = record
    bufferpool: TGstBufferPool;
    priv: PGstVideoBufferPoolPrivate;
  end;

  PGstVideoBufferPoolClass = ^TGstVideoBufferPoolClass;
  TGstVideoBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_buffer_pool_config_set_video_alignment(config: PGstStructure; align: PGstVideoAlignment); cdecl; external libgstvideo;
function gst_buffer_pool_config_get_video_alignment(config: PGstStructure; align: PGstVideoAlignment): Tgboolean; cdecl; external libgstvideo;

function gst_video_buffer_pool_get_type: TGType; cdecl; external libgstvideo;
function gst_video_buffer_pool_new: PGstBufferPool; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:20:23 ===

function GST_VIDEO_BUFFER_POOL_CAST(obj: Pointer): PGstVideoBufferPool;
function GST_TYPE_VIDEO_BUFFER_POOL: TGType;
function GST_VIDEO_BUFFER_POOL(obj: Pointer): PGstVideoBufferPool;
function GST_IS_VIDEO_BUFFER_POOL(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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

end.

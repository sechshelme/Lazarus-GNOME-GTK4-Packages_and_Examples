
{$IFDEF read_interface}

function gst_base_camera_src_get_type: TGType; cdecl; external libgstbasecamerabinsrc;

const
  GST_BASE_CAMERA_SRC_VIEWFINDER_PAD_NAME = 'vfsrc';
  GST_BASE_CAMERA_SRC_IMAGE_PAD_NAME = 'imgsrc';
  GST_BASE_CAMERA_SRC_VIDEO_PAD_NAME = 'vidsrc';
  GST_BASE_CAMERA_SRC_PREVIEW_MESSAGE_NAME = 'preview-image';

type
  PGstCameraBinMode = ^TGstCameraBinMode;
  TGstCameraBinMode = longint;

const
  MODE_IMAGE = 1;
  MODE_VIDEO = 2;

type
  TGstBaseCameraSrc = record
    parent: TGstBin;
    mode: TGstCameraBinMode;
    auto_start: Tgboolean;
    capturing: Tgboolean;
    capturing_mutex: TGMutex;
    preview_caps: PGstCaps;
    post_preview: Tgboolean;
    preview_filter: PGstElement;
    preview_pipeline: PGstCameraBinPreviewPipelineData;
    Width: Tgint;
    Height: Tgint;
    zoom: Tgfloat;
    max_zoom: Tgfloat;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseCameraSrc = ^TGstBaseCameraSrc;

  TGstBaseCameraSrcClass = record
    parent: TGstBinClass;
    construct_pipeline: function(self: PGstBaseCameraSrc): Tgboolean; cdecl;
    setup_pipeline: function(self: PGstBaseCameraSrc): Tgboolean; cdecl;
    set_zoom: procedure(self: PGstBaseCameraSrc; zoom: Tgfloat); cdecl;
    set_mode: function(self: PGstBaseCameraSrc; mode: TGstCameraBinMode): Tgboolean; cdecl;
    set_preview: function(self: PGstBaseCameraSrc; preview_caps: PGstCaps): Tgboolean; cdecl;
    start_capture: function(src: PGstBaseCameraSrc): Tgboolean; cdecl;
    stop_capture: procedure(src: PGstBaseCameraSrc); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseCameraSrcClass = ^TGstBaseCameraSrcClass;

const
  MIN_ZOOM = 1.0;
  MAX_ZOOM = 10.0;
  ZOOM_1X = MIN_ZOOM;

function gst_base_camera_src_set_mode(self: PGstBaseCameraSrc; mode: TGstCameraBinMode): Tgboolean; cdecl; external libgstbasecamerabinsrc;
procedure gst_base_camera_src_setup_zoom(self: PGstBaseCameraSrc); cdecl; external libgstbasecamerabinsrc;
procedure gst_base_camera_src_setup_preview(self: PGstBaseCameraSrc; preview_caps: PGstCaps); cdecl; external libgstbasecamerabinsrc;
procedure gst_base_camera_src_finish_capture(self: PGstBaseCameraSrc); cdecl; external libgstbasecamerabinsrc;
procedure gst_base_camera_src_post_preview(self: PGstBaseCameraSrc; sample: PGstSample); cdecl; external libgstbasecamerabinsrc;

function GST_BASE_CAMERA_SRC_CAST(obj: Pointer): PGstBaseCameraSrc;

// === Konventiert am: 12-10-24 17:24:45 ===

function GST_TYPE_BASE_CAMERA_SRC: TGType;
function GST_BASE_CAMERA_SRC(obj: Pointer): PGstBaseCameraSrc;
function GST_BASE_CAMERA_SRC_CLASS(klass: Pointer): PGstBaseCameraSrcClass;
function GST_IS_BASE_CAMERA_SRC(obj: Pointer): Tgboolean;
function GST_IS_BASE_CAMERA_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_BASE_CAMERA_SRC_GET_CLASS(obj: Pointer): PGstBaseCameraSrcClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BASE_CAMERA_SRC: TGType;
begin
  GST_TYPE_BASE_CAMERA_SRC := gst_base_camera_src_get_type;
end;

function GST_BASE_CAMERA_SRC(obj: Pointer): PGstBaseCameraSrc;
begin
  Result := PGstBaseCameraSrc(g_type_check_instance_cast(obj, GST_TYPE_BASE_CAMERA_SRC));
end;

function GST_BASE_CAMERA_SRC_CLASS(klass: Pointer): PGstBaseCameraSrcClass;
begin
  Result := PGstBaseCameraSrcClass(g_type_check_class_cast(klass, GST_TYPE_BASE_CAMERA_SRC));
end;

function GST_IS_BASE_CAMERA_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BASE_CAMERA_SRC);
end;

function GST_IS_BASE_CAMERA_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BASE_CAMERA_SRC);
end;

function GST_BASE_CAMERA_SRC_GET_CLASS(obj: Pointer): PGstBaseCameraSrcClass;
begin
  Result := PGstBaseCameraSrcClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BASE_CAMERA_SRC_CAST(obj: Pointer): PGstBaseCameraSrc;
begin
  GST_BASE_CAMERA_SRC_CAST := PGstBaseCameraSrc(obj);
end;


{$ENDIF read_implementation}

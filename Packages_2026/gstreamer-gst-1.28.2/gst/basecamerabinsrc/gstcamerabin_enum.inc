{$IFDEF read_interface}


const
  MIN_ZOOM = 1.0;
  MAX_ZOOM = 10.0;
  ZOOM_1X = MIN_ZOOM;

const
  DEFAULT_WIDTH = 640;
  DEFAULT_HEIGHT = 480;
  DEFAULT_CAPTURE_WIDTH = 800;
  DEFAULT_CAPTURE_HEIGHT = 600;
  DEFAULT_FPS_N = 0;
  DEFAULT_FPS_D = 1;
  DEFAULT_ZOOM = MIN_ZOOM;

type
  PGstCameraBinMode = ^TGstCameraBinMode;
  TGstCameraBinMode = longint;
const
  MODE_IMAGE = 1;
  MODE_VIDEO = 2;

function gst_camerabin_mode_get_type: TGType; cdecl; external libgstbasecamerabinsrc;

// === Konventiert am: 27-7-26 13:07:22 ===

function GST_TYPE_CAMERABIN_MODE : TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CAMERABIN_MODE: TGType;
begin
  GST_TYPE_CAMERABIN_MODE := gst_camerabin_mode_get_type;
end;

{$ENDIF read_implementation}

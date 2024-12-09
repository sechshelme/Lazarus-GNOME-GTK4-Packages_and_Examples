
{$IFDEF read_interface}

function gst_photography_noise_reduction_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_NOISE_REDUCTION: TGType;

function gst_photography_white_balance_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_WHITE_BALANCE_MODE: TGType;

function gst_photography_color_tone_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_COLOR_TONE_MODE: TGType;

function gst_photography_scene_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_SCENE_MODE: TGType;

function gst_photography_flash_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_FLASH_MODE: TGType;

function gst_photography_focus_status_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_FOCUS_STATUS: TGType;

function gst_photography_caps_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_CAPS: TGType;

function gst_photography_shake_risk_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_SHAKE_RISK: TGType;

function gst_photography_flicker_reduction_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_FLICKER_REDUCTION_MODE: TGType;

function gst_photography_focus_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_FOCUS_MODE: TGType;

function gst_photography_exposure_mode_get_type: TGType; cdecl; external libgstphotography;
function GST_TYPE_PHOTOGRAPHY_EXPOSURE_MODE: TGType;


// === Konventiert am: 2-10-24 19:28:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_PHOTOGRAPHY_NOISE_REDUCTION: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_NOISE_REDUCTION := gst_photography_noise_reduction_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_WHITE_BALANCE_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_WHITE_BALANCE_MODE := gst_photography_white_balance_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_COLOR_TONE_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_COLOR_TONE_MODE := gst_photography_color_tone_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_SCENE_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_SCENE_MODE := gst_photography_scene_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_FLASH_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_FLASH_MODE := gst_photography_flash_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_FOCUS_STATUS: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_FOCUS_STATUS := gst_photography_focus_status_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_CAPS: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_CAPS := gst_photography_caps_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_SHAKE_RISK: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_SHAKE_RISK := gst_photography_shake_risk_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_FLICKER_REDUCTION_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_FLICKER_REDUCTION_MODE := gst_photography_flicker_reduction_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_FOCUS_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_FOCUS_MODE := gst_photography_focus_mode_get_type;
end;

function GST_TYPE_PHOTOGRAPHY_EXPOSURE_MODE: TGType;
begin
  GST_TYPE_PHOTOGRAPHY_EXPOSURE_MODE := gst_photography_exposure_mode_get_type;
end;


{$ENDIF read_implementation}

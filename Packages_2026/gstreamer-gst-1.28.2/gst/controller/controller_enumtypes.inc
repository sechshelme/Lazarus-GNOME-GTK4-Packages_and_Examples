{$IFDEF read_interface}


function gst_interpolation_mode_get_type: TGType; cdecl; external libgstcontroller;
function gst_lfo_waveform_get_type: TGType; cdecl; external libgstcontroller;

// === Konventiert am: 25-7-26 13:22:34 ===

function GST_TYPE_INTERPOLATION_MODE: TGType;
function GST_TYPE_LFO_WAVEFORM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INTERPOLATION_MODE: TGType;
begin
  GST_TYPE_INTERPOLATION_MODE := gst_interpolation_mode_get_type;
end;

function GST_TYPE_LFO_WAVEFORM: TGType;
begin
  GST_TYPE_LFO_WAVEFORM := gst_lfo_waveform_get_type;
end;

{$ENDIF read_implementation}

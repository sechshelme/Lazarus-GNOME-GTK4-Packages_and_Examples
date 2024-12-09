
{$IFDEF read_interface}


function gst_interpolation_mode_get_type: TGType; cdecl; external libgstcontroller;
function gst_lfo_waveform_get_type: TGType; cdecl; external libgstcontroller;

function GST_TYPE_LFO_WAVEFORM: TGType;

// === Konventiert am: 7-10-24 14:51:46 ===

function GST_TYPE_INTERPOLATION_MODE: TGType;

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


{$IFDEF read_interface}

function gst_va_feature_get_type: TGType; cdecl; external libgstva;

// === Konventiert am: 8-10-24 16:14:31 ===

function GST_TYPE_VA_FEATURE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_FEATURE: TGType;
begin
  GST_TYPE_VA_FEATURE := gst_va_feature_get_type;
end;



{$ENDIF read_implementation}

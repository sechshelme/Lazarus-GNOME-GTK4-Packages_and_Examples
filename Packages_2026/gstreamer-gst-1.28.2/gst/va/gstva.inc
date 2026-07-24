{$IFDEF read_interface}


type
  PGstVaFeature = ^TGstVaFeature;
  TGstVaFeature = longint;
const
  GST_VA_FEATURE_DISABLED = 0;
  GST_VA_FEATURE_ENABLED = 1;
  GST_VA_FEATURE_AUTO = 2;

const
  GST_VA_HACK_SURFACE_NO_FOURCC = 1 shl 0;

  // === Konventiert am: 24-7-26 19:20:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

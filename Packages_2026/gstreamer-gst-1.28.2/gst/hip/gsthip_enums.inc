{$IFDEF read_interface}


type
  PGstHipVendor = ^TGstHipVendor;
  TGstHipVendor = longint;
const
  GST_HIP_VENDOR_UNKNOWN = 0;
  GST_HIP_VENDOR_AMD = 1;
  GST_HIP_VENDOR_NVIDIA = 2;

function gst_hip_vendor_get_type: TGType; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:16:27 ===

function GST_TYPE_HIP_VENDOR: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_HIP_VENDOR: TGType;
begin
  GST_TYPE_HIP_VENDOR := gst_hip_vendor_get_type;
end;



{$ENDIF read_implementation}

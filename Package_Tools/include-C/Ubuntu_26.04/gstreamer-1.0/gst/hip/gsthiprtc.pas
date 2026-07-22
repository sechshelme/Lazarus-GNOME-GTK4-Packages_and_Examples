unit gsthiprtc;

interface

uses
  fp_glib2, fp_gst, gsthip_enums, gsthipdevice;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_hip_rtc_load_library(vendor: TGstHipVendor): Tgboolean; cdecl; external libgsthip;
function gst_hip_rtc_compile(device: PGstHipDevice; source: Pgchar; options: PPgchar; num_options: Tguint): Pgchar; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:13 ===


implementation



end.

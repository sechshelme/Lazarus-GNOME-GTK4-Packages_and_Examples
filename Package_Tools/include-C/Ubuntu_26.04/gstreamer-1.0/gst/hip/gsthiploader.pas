unit gsthiploader;

interface

uses
  fp_glib2, fp_gst, gsthip_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_hip_load_library(vendor: TGstHipVendor): Tgboolean; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:28 ===


implementation



end.

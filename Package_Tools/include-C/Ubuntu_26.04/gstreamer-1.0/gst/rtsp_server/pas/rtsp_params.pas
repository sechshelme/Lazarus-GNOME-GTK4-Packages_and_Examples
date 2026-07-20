unit rtsp_params;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, fp_gst_rtsp, rtsp_client, rtsp_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gst_rtsp_params_set(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_params_get(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl; external libgstrtsp;
{$ENDIF read_function}

// === Konventiert am: 20-7-26 13:44:38 ===


implementation



end.

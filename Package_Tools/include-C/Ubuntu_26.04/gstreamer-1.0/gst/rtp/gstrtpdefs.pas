unit gstrtpdefs;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstRTPProfile = ^TGstRTPProfile;
  TGstRTPProfile = longint;
const
  GST_RTP_PROFILE_UNKNOWN = 0;
  GST_RTP_PROFILE_AVP = 1;
  GST_RTP_PROFILE_SAVP = 2;
  GST_RTP_PROFILE_AVPF = 3;
  GST_RTP_PROFILE_SAVPF = 4;

  // === Konventiert am: 21-7-26 12:02:38 ===


implementation



end.


{$IFDEF read_interface}

type
  PGstDsdFormat = ^TGstDsdFormat;
  TGstDsdFormat = longint;

const
  GST_DSD_FORMAT_UNKNOWN = 0;
  GST_DSD_FORMAT_U8 = 1;
  GST_DSD_FORMAT_U16LE = 2;
  GST_DSD_FORMAT_U16BE = 3;
  GST_DSD_FORMAT_U32LE = 4;
  GST_DSD_FORMAT_U32BE = 5;
  GST_NUM_DSD_FORMATS = 6;
  GST_DSD_FORMAT_U16 = GST_DSD_FORMAT_U16LE;
  GST_DSD_FORMAT_U32 = GST_DSD_FORMAT_U32LE;

const
  GST_DSD_FORMATS_ALL = '{ DSDU32BE, DSDU16BE, DSDU8, DSDU32LE, DSDU16LE }';

function gst_dsd_format_from_string(str: Pgchar): TGstDsdFormat; cdecl; external libgstaudio;
function gst_dsd_format_to_string(format: TGstDsdFormat): Pgchar; cdecl; external libgstaudio;
function gst_dsd_format_get_width(format: TGstDsdFormat): Tguint; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 15:16:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

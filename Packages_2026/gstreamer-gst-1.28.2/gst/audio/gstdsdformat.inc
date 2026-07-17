

  {$IFDEF read_enum}
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

  GST_DSD_FORMATS_ALL = '{ DSDU32BE, DSDU16BE, DSDU8, DSDU32LE, DSDU16LE }';
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_dsd_format_from_string(str: Pgchar): TGstDsdFormat; cdecl; external libgstaudio;
function gst_dsd_format_to_string(format: TGstDsdFormat): Pgchar; cdecl; external libgstaudio;
function gst_dsd_format_get_width(format: TGstDsdFormat): Tguint; cdecl; external libgstaudio;
{$ENDIF read_function}

// === Konventiert am: 16-7-26 15:25:41 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  PGstRTSPRangeUnit = ^TGstRTSPRangeUnit;
  TGstRTSPRangeUnit = longint;
const
  GST_RTSP_RANGE_SMPTE = 0;
  GST_RTSP_RANGE_SMPTE_30_DROP = 1;
  GST_RTSP_RANGE_SMPTE_25 = 2;
  GST_RTSP_RANGE_NPT = 3;
  GST_RTSP_RANGE_CLOCK = 4;

type
  PGstRTSPTimeType = ^TGstRTSPTimeType;
  TGstRTSPTimeType = longint;
const
  GST_RTSP_TIME_SECONDS = 0;
  GST_RTSP_TIME_NOW = 1;
  GST_RTSP_TIME_END = 2;
  GST_RTSP_TIME_FRAMES = 3;
  GST_RTSP_TIME_UTC = 4;

type
  PGstRTSPTime = ^TGstRTSPTime;
  TGstRTSPTime = record
    _type: TGstRTSPTimeType;
    seconds: Tgdouble;
  end;

  PGstRTSPTime2 = ^TGstRTSPTime2;
  TGstRTSPTime2 = record
    frames: Tgdouble;
    year: Tguint;
    month: Tguint;
    day: Tguint;
  end;

  PPGstRTSPTimeRange = ^PGstRTSPTimeRange;
  PGstRTSPTimeRange = ^TGstRTSPTimeRange;
  TGstRTSPTimeRange = record
    unit_: TGstRTSPRangeUnit;
    min: TGstRTSPTime;
    max: TGstRTSPTime;
    min2: TGstRTSPTime2;
    max2: TGstRTSPTime2;
  end;

function gst_rtsp_range_parse(rangestr: Pgchar; range: PPGstRTSPTimeRange): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_range_to_string(range: PGstRTSPTimeRange): Pgchar; cdecl; external libgstrtp;
procedure gst_rtsp_range_free(range: PGstRTSPTimeRange); cdecl; external libgstrtp;
function gst_rtsp_range_get_times(range: PGstRTSPTimeRange; min: PGstClockTime; max: PGstClockTime): Tgboolean; cdecl; external libgstrtp;
function gst_rtsp_range_convert_units(range: PGstRTSPTimeRange; unit_: TGstRTSPRangeUnit): Tgboolean; cdecl; external libgstrtp;

// === Konventiert am: 19-7-26 19:30:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

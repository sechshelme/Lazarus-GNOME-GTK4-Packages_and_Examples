/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   12:06                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstRTSPRangeUnit = ^TGstRTSPRangeUnit;
  TGstRTSPRangeUnit =  Longint;
  Const
    GST_RTSP_RANGE_SMPTE = 0;
    GST_RTSP_RANGE_SMPTE_30_DROP = 1;
    GST_RTSP_RANGE_SMPTE_25 = 2;
    GST_RTSP_RANGE_NPT = 3;
    GST_RTSP_RANGE_CLOCK = 4;

type
  PGstRTSPTimeType = ^TGstRTSPTimeType;
  TGstRTSPTimeType =  Longint;
  Const
    GST_RTSP_TIME_SECONDS = 0;
    GST_RTSP_TIME_NOW = 1;
    GST_RTSP_TIME_END = 2;
    GST_RTSP_TIME_FRAMES = 3;
    GST_RTSP_TIME_UTC = 4;
type
  TGstRTSPTime = record
      _type : TGstRTSPTimeType;
      seconds : Tgdouble;
    end;
  PGstRTSPTime = ^TGstRTSPTime;

  TGstRTSPTime2 = record
      frames : Tgdouble;
      year : Tguint;
      month : Tguint;
      day : Tguint;
    end;
  PGstRTSPTime2 = ^TGstRTSPTime2;

  TGstRTSPTimeRange = record
      unit_ : TGstRTSPRangeUnit;
      min : TGstRTSPTime;
      max : TGstRTSPTime;
      min2 : TGstRTSPTime2;
      max2 : TGstRTSPTime2;
    end;
  PGstRTSPTimeRange = ^TGstRTSPTimeRange;
  PPGstRTSPTimeRange = ^PGstRTSPTimeRange;


function gst_rtsp_range_parse(rangestr:Pgchar; range:PPGstRTSPTimeRange):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_range_to_string(range:PGstRTSPTimeRange):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_range_free(range:PGstRTSPTimeRange);cdecl;external libgstrtsp;
function gst_rtsp_range_get_times(range:PGstRTSPTimeRange; min:PGstClockTime; max:PGstClockTime):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_range_convert_units(range:PGstRTSPTimeRange; unit_:TGstRTSPRangeUnit):Tgboolean;cdecl;external libgstrtsp;

// === Konventiert am: 8-10-24 11:22:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

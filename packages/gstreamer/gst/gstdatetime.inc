
{$IFDEF read_interface}

type
  TGstDateTime = record
  end;
  PGstDateTime = ^TGstDateTime;
  PPGstDateTime = ^PGstDateTime;

var
  _gst_date_time_type: TGType; cvar;external libgstreamer;

function gst_date_time_get_type: TGType; cdecl; external libgstreamer;
function gst_date_time_has_year(datetime: PGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_date_time_has_month(datetime: PGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_date_time_has_day(datetime: PGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_date_time_has_time(datetime: PGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_date_time_has_second(datetime: PGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_date_time_get_year(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_month(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_day(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_hour(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_minute(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_second(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_microsecond(datetime: PGstDateTime): Tgint; cdecl; external libgstreamer;
function gst_date_time_get_time_zone_offset(datetime: PGstDateTime): Tgfloat; cdecl; external libgstreamer;
function gst_date_time_new_from_unix_epoch_local_time(secs: Tgint64): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_from_unix_epoch_utc(secs: Tgint64): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_from_unix_epoch_local_time_usecs(usecs: Tgint64): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_from_unix_epoch_utc_usecs(usecs: Tgint64): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_local_time(year: Tgint; month: Tgint; day: Tgint; hour: Tgint; minute: Tgint;
  seconds: Tgdouble): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_y(year: Tgint): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_ym(year: Tgint; month: Tgint): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_ymd(year: Tgint; month: Tgint; day: Tgint): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new(tzoffset: Tgfloat; year: Tgint; month: Tgint; day: Tgint; hour: Tgint;
  minute: Tgint; seconds: Tgdouble): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_now_local_time: PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_new_now_utc: PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_to_iso8601_string(datetime: PGstDateTime): Pgchar; cdecl; external libgstreamer;
function gst_date_time_new_from_iso8601_string(_string: Pgchar): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_to_g_date_time(datetime: PGstDateTime): PGDateTime; cdecl; external libgstreamer;
function gst_date_time_new_from_g_date_time(dt: PGDateTime): PGstDateTime; cdecl; external libgstreamer;
function gst_date_time_ref(datetime: PGstDateTime): PGstDateTime; cdecl; external libgstreamer;
procedure gst_date_time_unref(datetime: PGstDateTime); cdecl; external libgstreamer;

function GST_TYPE_DATE_TIME: TGType;

// === Konventiert am: 11-9-24 16:37:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DATE_TIME: TGType;
begin
  Result := _gst_date_time_type;
end;



{$ENDIF read_implementation}

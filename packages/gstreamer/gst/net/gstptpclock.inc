/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   14:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPtpClockPrivate = record
  end;
  PGstPtpClockPrivate = ^TGstPtpClockPrivate;

  TGstPtpClock = record
    clock: TGstSystemClock;
    priv: PGstPtpClockPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstPtpClock = ^TGstPtpClock;

  TGstPtpClockClass = record
    parent_class: TGstSystemClockClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstPtpClockClass = ^TGstPtpClockClass;

function gst_ptp_clock_get_type: TGType; cdecl; external libgstnet;
function gst_ptp_is_supported: Tgboolean; cdecl; external libgstnet;
function gst_ptp_is_initialized: Tgboolean; cdecl; external libgstnet;
function gst_ptp_init(clock_id: Tguint64; interfaces: PPgchar): Tgboolean; cdecl; external libgstnet;
function gst_ptp_init_full(config: PGstStructure): Tgboolean; cdecl; external libgstnet;
procedure gst_ptp_deinit; cdecl; external libgstnet;

const
  GST_PTP_STATISTICS_NEW_DOMAIN_FOUND = 'GstPtpStatisticsNewDomainFound';
  GST_PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED = 'GstPtpStatisticsBestMasterClockSelected';
  GST_PTP_STATISTICS_PATH_DELAY_MEASURED = 'GstPtpStatisticsPathDelayMeasured';
  GST_PTP_STATISTICS_TIME_UPDATED = 'GstPtpStatisticsTimeUpdated';

type
  TGstPtpStatisticsCallback = function(domain: Tguint8; stats: PGstStructure; user_data: Tgpointer): Tgboolean; cdecl;

function gst_ptp_statistics_callback_add(callback: TGstPtpStatisticsCallback; user_data: Tgpointer; destroy_data: TGDestroyNotify): Tgulong; cdecl; external libgstnet;
procedure gst_ptp_statistics_callback_remove(id: Tgulong); cdecl; external libgstnet;
function gst_ptp_clock_new(Name: Pgchar; domain: Tguint): PGstClock; cdecl; external libgstnet;

const
  GST_PTP_CLOCK_ID_NONE = Tguint64(-(1));

  // === Konventiert am: 11-10-24 14:28:49 ===

function GST_TYPE_PTP_CLOCK: TGType;
function GST_PTP_CLOCK(obj: Pointer): PGstPtpClock;
function GST_PTP_CLOCK_CLASS(klass: Pointer): PGstPtpClockClass;
function GST_IS_PTP_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_PTP_CLOCK_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PTP_CLOCK: TGType;
begin
  GST_TYPE_PTP_CLOCK := gst_ptp_clock_get_type;
end;

function GST_PTP_CLOCK(obj: Pointer): PGstPtpClock;
begin
  Result := PGstPtpClock(g_type_check_instance_cast(obj, GST_TYPE_PTP_CLOCK));
end;

function GST_PTP_CLOCK_CLASS(klass: Pointer): PGstPtpClockClass;
begin
  Result := PGstPtpClockClass(g_type_check_class_cast(klass, GST_TYPE_PTP_CLOCK));
end;

function GST_IS_PTP_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PTP_CLOCK);
end;

function GST_IS_PTP_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PTP_CLOCK);
end;

{$ENDIF read_implementation}

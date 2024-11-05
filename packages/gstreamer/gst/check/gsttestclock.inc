/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 02-10-2024   19:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstTestClockPrivate = record
  end;
  PGstTestClockPrivate = ^TGstTestClockPrivate;

  TGstTestClock = record
    parent: TGstClock;
    priv: PGstTestClockPrivate;
  end;
  PGstTestClock = ^TGstTestClock;

  TGstTestClockClass = record
    parent_class: TGstClockClass;
  end;
  PGstTestClockClass = ^TGstTestClockClass;

function gst_test_clock_get_type: TGType; cdecl; external libgstcheck;
function gst_test_clock_new: PGstClock; cdecl; external libgstcheck;
function gst_test_clock_new_with_start_time(start_time: TGstClockTime): PGstClock; cdecl; external libgstcheck;
procedure gst_test_clock_set_time(test_clock: PGstTestClock; new_time: TGstClockTime); cdecl; external libgstcheck;
procedure gst_test_clock_advance_time(test_clock: PGstTestClock; delta: TGstClockTimeDiff); cdecl; external libgstcheck;
function gst_test_clock_peek_id_count(test_clock: PGstTestClock): Tguint; cdecl; external libgstcheck;
function gst_test_clock_has_id(test_clock: PGstTestClock; id: TGstClockID): Tgboolean; cdecl; external libgstcheck;
function gst_test_clock_peek_next_pending_id(test_clock: PGstTestClock; pending_id: PGstClockID): Tgboolean; cdecl; external libgstcheck;
procedure gst_test_clock_wait_for_next_pending_id(test_clock: PGstTestClock; pending_id: PGstClockID); cdecl; external libgstcheck;
procedure gst_test_clock_wait_for_pending_id_count(test_clock: PGstTestClock; Count: Tguint); cdecl; external libgstcheck;
function gst_test_clock_process_next_clock_id(test_clock: PGstTestClock): TGstClockID; cdecl; external libgstcheck;
function gst_test_clock_get_next_entry_time(test_clock: PGstTestClock): TGstClockTime; cdecl; external libgstcheck;
procedure gst_test_clock_wait_for_multiple_pending_ids(test_clock: PGstTestClock; Count: Tguint; pending_list: PPGList); cdecl; external libgstcheck;
function gst_test_clock_timed_wait_for_multiple_pending_ids(test_clock: PGstTestClock; Count: Tguint; timeout_ms: Tguint; pending_list: PPGList): Tgboolean; cdecl; external libgstcheck;
function gst_test_clock_process_id(test_clock: PGstTestClock; pending_id: TGstClockID): Tgboolean; cdecl; external libgstcheck;
function gst_test_clock_process_id_list(test_clock: PGstTestClock; pending_list: PGList): Tguint; cdecl; external libgstcheck;
function gst_test_clock_id_list_get_latest_time(pending_list: PGList): TGstClockTime; cdecl; external libgstcheck;
function gst_test_clock_crank(test_clock: PGstTestClock): Tgboolean; cdecl; external libgstcheck;

function GST_TEST_CLOCK_CAST(obj: Pointer): PGstTestClock;

// === Konventiert am: 2-10-24 17:20:48 ===

function GST_TYPE_TEST_CLOCK: TGType;
function GST_TEST_CLOCK(obj: Pointer): PGstTestClock;
function GST_TEST_CLOCK_CLASS(klass: Pointer): PGstTestClockClass;
function GST_IS_TEST_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_TEST_CLOCK_CLASS(klass: Pointer): Tgboolean;
function GST_TEST_CLOCK_GET_CLASS(obj: Pointer): PGstTestClockClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TEST_CLOCK: TGType;
begin
  GST_TYPE_TEST_CLOCK := gst_test_clock_get_type;
end;

function GST_TEST_CLOCK(obj: Pointer): PGstTestClock;
begin
  Result := PGstTestClock(g_type_check_instance_cast(obj, GST_TYPE_TEST_CLOCK));
end;

function GST_TEST_CLOCK_CLASS(klass: Pointer): PGstTestClockClass;
begin
  Result := PGstTestClockClass(g_type_check_class_cast(klass, GST_TYPE_TEST_CLOCK));
end;

function GST_IS_TEST_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TEST_CLOCK);
end;

function GST_IS_TEST_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TEST_CLOCK);
end;

function GST_TEST_CLOCK_GET_CLASS(obj: Pointer): PGstTestClockClass;
begin
  Result := PGstTestClockClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TEST_CLOCK_CAST(obj: Pointer): PGstTestClock;
begin
  GST_TEST_CLOCK_CAST := PGstTestClock(obj);
end;


{$ENDIF read_implementation}

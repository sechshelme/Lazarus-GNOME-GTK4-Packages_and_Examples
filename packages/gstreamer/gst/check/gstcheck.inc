
{$IFDEF read_interface}

var
  check_debug: PGstDebugCategory; cvar;external libgstcheck;

var
  _gst_check_threads_running: Tgboolean; cvar;external libgstcheck;
  _gst_check_raised_critical: Tgboolean; cvar;external libgstcheck;
  _gst_check_raised_warning: Tgboolean; cvar;external libgstcheck;
  _gst_check_expecting_log: Tgboolean; cvar;external libgstcheck;
  _gst_check_list_tests: Tgboolean; cvar;external libgstcheck;
  buffers: PGList; cvar;external libgstcheck;
  check_mutex: TGMutex; cvar;external libgstcheck;
  check_cond: TGCond; cvar;external libgstcheck;

type
  TGstCheckABIStruct = record
    Name: pchar;
    size: longint;
    abi_size: longint;
  end;
  PGstCheckABIStruct = ^TGstCheckABIStruct;

  TGstCheckLogFilter = record
  end;
  PGstCheckLogFilter = ^TGstCheckLogFilter;

  TGstCheckLogFilterFunc = function(log_domain: Pgchar; log_level: TGLogLevelFlags; message: Pgchar; user_data: Tgpointer): Tgboolean; cdecl;

procedure gst_check_init(argc: Plongint; argv: PPPchar); cdecl; external libgstcheck;
function gst_check_add_log_filter(log_domain: Pgchar; log_level: TGLogLevelFlags; regex: PGRegex; func: TGstCheckLogFilterFunc; user_data: Tgpointer;
  destroy_data: TGDestroyNotify): PGstCheckLogFilter; cdecl; external libgstcheck;
procedure gst_check_remove_log_filter(filter: PGstCheckLogFilter); cdecl; external libgstcheck;
procedure gst_check_clear_log_filter; cdecl; external libgstcheck;
function gst_check_chain_func(pad: PGstPad; parent: PGstObject; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstcheck;
procedure gst_check_message_error(message: PGstMessage; _type: TGstMessageType; domain: TGQuark; code: Tgint); cdecl; external libgstcheck;
function gst_check_setup_element(factory: Pgchar): PGstElement; cdecl; external libgstcheck;
procedure gst_check_teardown_element(element: PGstElement); cdecl; external libgstcheck;
function gst_check_setup_src_pad(element: PGstElement; tmpl: PGstStaticPadTemplate): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_src_pad_from_template(element: PGstElement; tmpl: PGstPadTemplate): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_src_pad_by_name(element: PGstElement; tmpl: PGstStaticPadTemplate; Name: Pgchar): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_src_pad_by_name_from_template(element: PGstElement; tmpl: PGstPadTemplate; Name: Pgchar): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_sink_pad(element: PGstElement; tmpl: PGstStaticPadTemplate): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_sink_pad_from_template(element: PGstElement; tmpl: PGstPadTemplate): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_sink_pad_by_name(element: PGstElement; tmpl: PGstStaticPadTemplate; Name: Pgchar): PGstPad; cdecl; external libgstcheck;
function gst_check_setup_sink_pad_by_name_from_template(element: PGstElement; tmpl: PGstPadTemplate; Name: Pgchar): PGstPad; cdecl; external libgstcheck;
procedure gst_check_teardown_pad_by_name(element: PGstElement; Name: Pgchar); cdecl; external libgstcheck;
procedure gst_check_teardown_src_pad(element: PGstElement); cdecl; external libgstcheck;
procedure gst_check_drop_buffers; cdecl; external libgstcheck;
procedure gst_check_caps_equal(caps1: PGstCaps; caps2: PGstCaps); cdecl; external libgstcheck;
procedure gst_check_buffer_data(buffer: PGstBuffer; Data: Tgconstpointer; size: Tgsize); cdecl; external libgstcheck;
procedure gst_check_element_push_buffer_list(element_name: Pgchar; buffer_in: PGList; caps_in: PGstCaps; buffer_out: PGList; caps_out: PGstCaps;
  last_flow_return: TGstFlowReturn); cdecl; external libgstcheck;
procedure gst_check_element_push_buffer(element_name: Pgchar; buffer_in: PGstBuffer; caps_in: PGstCaps; buffer_out: PGstBuffer; caps_out: PGstCaps); cdecl; external libgstcheck;
procedure gst_check_teardown_sink_pad(element: PGstElement); cdecl; external libgstcheck;
procedure gst_check_abi_list(list: PGstCheckABIStruct; have_abi_sizes: Tgboolean); cdecl; external libgstcheck;
function gst_check_run_suite(suite: PSuite; Name: Pgchar; fname: Pgchar): Tgint; cdecl; external libgstcheck;
procedure gst_check_setup_events(srcpad: PGstPad; element: PGstElement; caps: PGstCaps; format: TGstFormat); cdecl; external libgstcheck;
procedure gst_check_setup_events_with_stream_id(srcpad: PGstPad; element: PGstElement; caps: PGstCaps; format: TGstFormat; stream_id: Pgchar); cdecl; external libgstcheck;
procedure gst_check_objects_destroyed_on_unref(object_to_unref: Tgpointer; first_object: Tgpointer; args: array of const); cdecl; external libgstcheck;
procedure gst_check_objects_destroyed_on_unref(object_to_unref: Tgpointer; first_object: Tgpointer); cdecl; external libgstcheck;
procedure gst_check_object_destroyed_on_unref(object_to_unref: Tgpointer); cdecl; external libgstcheck;

var
  thread_list: PGList; cvar;external libgstcheck;
  mutex: TGMutex; cvar;external libgstcheck;
  start_cond: TGCond; cvar;external libgstcheck;
  sync_cond: TGCond; cvar;external libgstcheck;

function _gst_check_run_test_func(func_name: Pgchar): Tgboolean; cdecl; external libgstcheck;

function THREAD_TEST_RUNNING: Tgboolean;

// === Konventiert am: 2-10-24 16:59:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function THREAD_TEST_RUNNING: Tgboolean;
begin
  THREAD_TEST_RUNNING := not (not (_gst_check_threads_running));
end;


{$ENDIF read_implementation}

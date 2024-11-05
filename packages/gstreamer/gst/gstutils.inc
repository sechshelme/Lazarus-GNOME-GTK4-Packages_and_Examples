/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

procedure gst_util_set_value_from_string(Value: PGValue; value_str: Pgchar); cdecl; external libgstreamer;
procedure gst_util_set_object_arg(obj: PGObject; Name: Pgchar; Value: Pgchar); cdecl; external libgstreamer;
function gst_util_set_object_array(obj: PGObject; Name: Pgchar; arr: PGValueArray): Tgboolean; cdecl; external libgstreamer;
function gst_util_get_object_array(obj: PGObject; Name: Pgchar; arr: PPGValueArray): Tgboolean; cdecl; external libgstreamer;
procedure gst_util_dump_mem(mem: Pguchar; size: Tguint); cdecl; external libgstreamer;
procedure gst_util_dump_buffer(buf: PGstBuffer); cdecl; external libgstreamer;
function gst_util_gdouble_to_guint64(Value: Tgdouble): Tguint64; cdecl; external libgstreamer;
function gst_util_guint64_to_gdouble(Value: Tguint64): Tgdouble; cdecl; external libgstreamer;

function gst_gdouble_to_guint64(Value: Tgdouble): Tguint64;
function gst_guint64_to_gdouble(Value: Tguint64): Tgdouble;

function gst_util_uint64_scale(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_round(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_ceil(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int_round(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int_ceil(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;

const
  GST_SEQNUM_INVALID = 0;

function gst_util_seqnum_next: Tguint32; cdecl; external libgstreamer;
function gst_util_seqnum_compare(s1: Tguint32; s2: Tguint32): Tgint32; cdecl; external libgstreamer;

const
  GST_GROUP_ID_INVALID = 0;

function gst_util_group_id_next: Tguint; cdecl; external libgstreamer;

procedure gst_object_default_error(Source: PGstObject; error: PGError; debug: Pgchar); cdecl; external libgstreamer;
procedure gst_element_create_all_pads(element: PGstElement); cdecl; external libgstreamer;
function gst_element_get_compatible_pad(element: PGstElement; pad: PGstPad; caps: PGstCaps): PGstPad; cdecl; external libgstreamer;
function gst_element_get_compatible_pad_template(element: PGstElement; compattempl: PGstPadTemplate): PGstPadTemplate; cdecl; external libgstreamer;
function gst_element_state_get_name(state: TGstState): Pgchar; cdecl; external libgstreamer;
function gst_element_state_change_return_get_name(state_ret: TGstStateChangeReturn): Pgchar; cdecl; external libgstreamer;
function gst_state_change_get_name(transition: TGstStateChange): Pgchar; cdecl; external libgstreamer;
function gst_element_link(src: PGstElement; dest: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_many(element_1: PGstElement; element_2: PGstElement): Tgboolean; varargs cdecl; external libgstreamer;
function gst_element_link_filtered(src: PGstElement; dest: PGstElement; filter: PGstCaps): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_unlink(src: PGstElement; dest: PGstElement); cdecl; external libgstreamer;
procedure gst_element_unlink_many(element_1: PGstElement; element_2: PGstElement); varargs cdecl; external libgstreamer;
function gst_element_link_pads(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_pads_full(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar; flags: TGstPadLinkCheck): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_unlink_pads(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar); cdecl; external libgstreamer;
function gst_element_link_pads_filtered(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar; filter: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_seek_simple(element: PGstElement; format: TGstFormat; seek_flags: TGstSeekFlags; seek_pos: Tgint64): Tgboolean; cdecl; external libgstreamer;
function gst_element_decorate_stream_id(element: PGstElement; stream_id: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_element_decorate_stream_id_printf_valist(element: PGstElement; format: Pgchar; var_args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_element_decorate_stream_id_printf(element: PGstElement; format: Pgchar): Pgchar; varargs cdecl; external libgstreamer;
function gst_element_factory_can_sink_all_caps(factory: PGstElementFactory; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_factory_can_src_all_caps(factory: PGstElementFactory; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_factory_can_sink_any_caps(factory: PGstElementFactory; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_factory_can_src_any_caps(factory: PGstElementFactory; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_query_position(element: PGstElement; format: TGstFormat; cur: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_element_query_duration(element: PGstElement; format: TGstFormat; duration: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_element_query_convert(element: PGstElement; src_format: TGstFormat; src_val: Tgint64; dest_format: TGstFormat; dest_val: Pgint64): Tgboolean; cdecl; external libgstreamer;
procedure gst_pad_use_fixed_caps(pad: PGstPad); cdecl; external libgstreamer;
function gst_pad_get_parent_element(pad: PGstPad): PGstElement; cdecl; external libgstreamer;
function gst_pad_proxy_query_accept_caps(pad: PGstPad; query: PGstQuery): Tgboolean; cdecl; external libgstreamer;
function gst_pad_proxy_query_caps(pad: PGstPad; query: PGstQuery): Tgboolean; cdecl; external libgstreamer;
function gst_pad_query_position(pad: PGstPad; format: TGstFormat; cur: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_query_duration(pad: PGstPad; format: TGstFormat; duration: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_query_convert(pad: PGstPad; src_format: TGstFormat; src_val: Tgint64; dest_format: TGstFormat; dest_val: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_query_caps(pad: PGstPad; filter: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_pad_query_accept_caps(pad: PGstPad; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_pad_link_maybe_ghosting(src: PGstPad; sink: PGstPad): Tgboolean; cdecl; external libgstreamer;
function gst_pad_link_maybe_ghosting_full(src: PGstPad; sink: PGstPad; flags: TGstPadLinkCheck): Tgboolean; cdecl; external libgstreamer;
function gst_pad_peer_query_position(pad: PGstPad; format: TGstFormat; cur: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_peer_query_duration(pad: PGstPad; format: TGstFormat; duration: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_peer_query_convert(pad: PGstPad; src_format: TGstFormat; src_val: Tgint64; dest_format: TGstFormat; dest_val: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_pad_peer_query_caps(pad: PGstPad; filter: PGstCaps): PGstCaps; cdecl; external libgstreamer;
function gst_pad_peer_query_accept_caps(pad: PGstPad; caps: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_pad_create_stream_id(pad: PGstPad; parent: PGstElement; stream_id: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_pad_create_stream_id_printf(pad: PGstPad; parent: PGstElement; stream_id: Pgchar): Pgchar; varargs cdecl; external libgstreamer;
function gst_pad_create_stream_id_printf_valist(pad: PGstPad; parent: PGstElement; stream_id: Pgchar; var_args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_pad_get_stream_id(pad: PGstPad): Pgchar; cdecl; external libgstreamer;
function gst_pad_get_stream(pad: PGstPad): PGstStream; cdecl; external libgstreamer;
procedure gst_bin_add_many(bin: PGstBin; element_1: PGstElement); varargs cdecl; external libgstreamer;
procedure gst_bin_remove_many(bin: PGstBin; element_1: PGstElement); varargs cdecl; external libgstreamer;
function gst_bin_find_unlinked_pad(bin: PGstBin; direction: TGstPadDirection): PGstPad; cdecl; external libgstreamer;
function gst_bin_sync_children_states(bin: PGstBin): Tgboolean; cdecl; external libgstreamer;
function gst_parse_bin_from_description(bin_description: Pgchar; ghost_unlinked_pads: Tgboolean; err: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_parse_bin_from_description_full(bin_description: Pgchar; ghost_unlinked_pads: Tgboolean; context: PGstParseContext; flags: TGstParseFlags; err: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_util_get_timestamp: TGstClockTime; cdecl; external libgstreamer;

type
  PGstSearchMode = ^TGstSearchMode;
  TGstSearchMode = longint;

const
  GST_SEARCH_MODE_EXACT = 0;
  GST_SEARCH_MODE_BEFORE = 1;
  GST_SEARCH_MODE_AFTER = 2;

type
  PGstPluginAPIFlags = ^TGstPluginAPIFlags;
  TGstPluginAPIFlags = longint;

const
  GST_PLUGIN_API_FLAG_IGNORE_ENUM_MEMBERS = 1 shl 0;

function gst_util_array_binary_search(arr: Tgpointer; num_elements: Tguint; element_size: Tgsize; search_func: TGCompareDataFunc; mode: TGstSearchMode;
  search_data: Tgconstpointer; user_data: Tgpointer): Tgpointer; cdecl; external libgstreamer;
function gst_util_greatest_common_divisor(a: Tgint; b: Tgint): Tgint; cdecl; external libgstreamer;
function gst_util_greatest_common_divisor_int64(a: Tgint64; b: Tgint64): Tgint64; cdecl; external libgstreamer;
procedure gst_util_simplify_fraction(numerator: Pgint; denominator: Pgint; n_terms: Tguint; threshold: Tguint); cdecl; external libgstreamer;
procedure gst_util_fraction_to_double(src_n: Tgint; src_d: Tgint; dest: Pgdouble); cdecl; external libgstreamer;
procedure gst_util_double_to_fraction(src: Tgdouble; dest_n: Pgint; dest_d: Pgint); cdecl; external libgstreamer;
function gst_util_fraction_multiply(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint; res_n: Pgint;
  res_d: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_util_fraction_add(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint; res_n: Pgint;
  res_d: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_util_fraction_compare(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint): Tgint; cdecl; external libgstreamer;
function gst_calculate_linear_regression(xy: PGstClockTime; temp: PGstClockTime; n: Tguint; m_num: PGstClockTime; m_denom: PGstClockTime;
  b: PGstClockTime; xbase: PGstClockTime; r_squared: Pgdouble): Tgboolean; cdecl; external libgstreamer;
procedure gst_type_mark_as_plugin_api(_type: TGType; flags: TGstPluginAPIFlags); cdecl; external libgstreamer;
function gst_type_is_plugin_api(_type: TGType; flags: PGstPluginAPIFlags): Tgboolean; cdecl; external libgstreamer;
function gst_util_ceil_log2(v: Tguint32): Tguint; cdecl; external libgstreamer;
function gst_util_filename_compare(a: Pgchar; b: Pgchar): Tgint; cdecl; external libgstreamer;

function GST_ROUND_UP_2(num: longint): longint;
function GST_ROUND_UP_4(num: longint): longint;
function GST_ROUND_UP_8(num: longint): longint;
function GST_ROUND_UP_16(num: longint): longint;
function GST_ROUND_UP_32(num: longint): longint;
function GST_ROUND_UP_64(num: longint): longint;
function GST_ROUND_UP_128(num: longint): longint;
function GST_ROUND_UP_N(num, align: longint): longint;
function GST_ROUND_DOWN_2(num: longint): longint;
function GST_ROUND_DOWN_4(num: longint): longint;
function GST_ROUND_DOWN_8(num: longint): longint;
function GST_ROUND_DOWN_16(num: longint): longint;
function GST_ROUND_DOWN_32(num: longint): longint;
function GST_ROUND_DOWN_64(num: longint): longint;
function GST_ROUND_DOWN_128(num: longint): longint;
function GST_ROUND_DOWN_N(num, align: longint): longint;

// === Konventiert am: 16-9-24 16:05:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function gst_gdouble_to_guint64(Value: Tgdouble): Tguint64;
begin
  Result := gst_util_gdouble_to_guint64(Value);
end;

function gst_guint64_to_gdouble(Value: Tguint64): Tgdouble;
begin
  Result := gst_util_guint64_to_gdouble(Value);
end;

function GST_ROUND_UP_2(num: longint): longint;
begin
  GST_ROUND_UP_2 := (num + 1) and not 1;
end;

function GST_ROUND_UP_4(num: longint): longint;
begin
  GST_ROUND_UP_4 := (num + 3) and not 3;
end;

function GST_ROUND_UP_8(num: longint): longint;
begin
  GST_ROUND_UP_8 := (num + 7) and not 7;
end;

function GST_ROUND_UP_16(num: longint): longint;
begin
  GST_ROUND_UP_16 := (num + 15) and not 15;
end;

function GST_ROUND_UP_32(num: longint): longint;
begin
  GST_ROUND_UP_32 := (num + 31) and not 31;
end;

function GST_ROUND_UP_64(num: longint): longint;
begin
  GST_ROUND_UP_64 := (num + 63) and not 63;
end;

function GST_ROUND_UP_128(num: longint): longint;
begin
  GST_ROUND_UP_128 := (num + 127) and not 127;
end;

function GST_ROUND_UP_N(num, align: longint): longint;
begin
  GST_ROUND_UP_N := (num + (align - 1)) and not (align - 1);
end;

function GST_ROUND_DOWN_2(num: longint): longint;
begin
  GST_ROUND_DOWN_2 := num and not 1;
end;

function GST_ROUND_DOWN_4(num: longint): longint;
begin
  GST_ROUND_DOWN_4 := num and not 3;
end;

function GST_ROUND_DOWN_8(num: longint): longint;
begin
  GST_ROUND_DOWN_8 := num and not 7;
end;

function GST_ROUND_DOWN_16(num: longint): longint;
begin
  GST_ROUND_DOWN_16 := num and not 15;
end;

function GST_ROUND_DOWN_32(num: longint): longint;
begin
  GST_ROUND_DOWN_32 := num and not 31;
end;

function GST_ROUND_DOWN_64(num: longint): longint;
begin
  GST_ROUND_DOWN_64 := num and not 63;
end;

function GST_ROUND_DOWN_128(num: longint): longint;
begin
  GST_ROUND_DOWN_128 := num and not 127;
end;

function GST_ROUND_DOWN_N(num, align: longint): longint;
begin
  GST_ROUND_DOWN_N := num and not (align - 1);
end;


{$ENDIF read_implementation}

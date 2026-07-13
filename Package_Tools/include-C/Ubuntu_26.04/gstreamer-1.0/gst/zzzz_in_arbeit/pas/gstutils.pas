unit gstutils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstbuffer, gstobject, gstpad, gstpadtemplate, gstelement, gstelementfactory, gstformat, gstquery, gststreams, gstbin, gstsegment, gstparse;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  GST_SEQNUM_INVALID = 0;
  GST_GROUP_ID_INVALID = 0;

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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGstCallAsyncFunc = procedure(user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_util_set_value_from_string(value: PGValue; value_str: Pgchar); cdecl; external libgstreamer;
procedure gst_util_set_object_arg(obj: PGObject; name: Pgchar; value: Pgchar); cdecl; external libgstreamer;
function gst_util_set_object_array(obj: PGObject; name: Pgchar; arr: PGValueArray): Tgboolean; cdecl; external libgstreamer;
function gst_util_get_object_array(obj: PGObject; name: Pgchar; arr: PPGValueArray): Tgboolean; cdecl; external libgstreamer;
procedure gst_util_dump_mem(mem: Pguchar; size: Tguint); cdecl; external libgstreamer;
procedure gst_util_dump_buffer(buf: PGstBuffer); cdecl; external libgstreamer;
function gst_util_gdouble_to_guint64(value: Tgdouble): Tguint64; cdecl; external libgstreamer;
function gst_util_guint64_to_gdouble(value: Tguint64): Tgdouble; cdecl; external libgstreamer;
function gst_util_uint64_scale(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_round(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_ceil(val: Tguint64; num: Tguint64; denom: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int_round(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;
function gst_util_uint64_scale_int_ceil(val: Tguint64; num: Tgint; denom: Tgint): Tguint64; cdecl; external libgstreamer;

function gst_util_seqnum_next: Tguint32; cdecl; external libgstreamer;
function gst_util_seqnum_compare(s1: Tguint32; s2: Tguint32): Tgint32; cdecl; external libgstreamer;

function gst_util_group_id_next: Tguint; cdecl; external libgstreamer;
procedure gst_object_default_error(source: PGstObject; error: PGError; debug: Pgchar); cdecl; external libgstreamer;
procedure gst_element_create_all_pads(element: PGstElement); cdecl; external libgstreamer;
function gst_element_get_compatible_pad(element: PGstElement; pad: PGstPad; caps: PGstCaps): PGstPad; cdecl; external libgstreamer;
function gst_element_get_compatible_pad_template(element: PGstElement; compattempl: PGstPadTemplate): PGstPadTemplate; cdecl; external libgstreamer;
function gst_element_state_get_name(state: TGstState): Pgchar; cdecl; external libgstreamer; deprecated;
function gst_element_state_change_return_get_name(state_ret: TGstStateChangeReturn): Pgchar; cdecl; external libgstreamer; deprecated;
function gst_state_get_name(state: TGstState): Pgchar; cdecl; external libgstreamer;
function gst_state_change_return_get_name(state_ret: TGstStateChangeReturn): Pgchar; cdecl; external libgstreamer;
function gst_state_change_get_name(transition: TGstStateChange): Pgchar; cdecl; external libgstreamer;
function gst_element_link(src: PGstElement; dest: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_many(element_1: PGstElement; element_2: PGstElement; args: array of const): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_many(element_1: PGstElement; element_2: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_filtered(src: PGstElement; dest: PGstElement; filter: PGstCaps): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_unlink(src: PGstElement; dest: PGstElement); cdecl; external libgstreamer;
procedure gst_element_unlink_many(element_1: PGstElement; element_2: PGstElement; args: array of const); cdecl; external libgstreamer;
procedure gst_element_unlink_many(element_1: PGstElement; element_2: PGstElement); cdecl; external libgstreamer;
function gst_element_link_pads(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_element_link_pads_full(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar; flags: TGstPadLinkCheck): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_unlink_pads(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar); cdecl; external libgstreamer;
function gst_element_link_pads_filtered(src: PGstElement; srcpadname: Pgchar; dest: PGstElement; destpadname: Pgchar; filter: PGstCaps): Tgboolean; cdecl; external libgstreamer;
function gst_element_seek_simple(element: PGstElement; format: TGstFormat; seek_flags: TGstSeekFlags; seek_pos: Tgint64): Tgboolean; cdecl; external libgstreamer;
function gst_element_decorate_stream_id(element: PGstElement; stream_id: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_element_decorate_stream_id_printf_valist(element: PGstElement; format: Pgchar; var_args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_element_decorate_stream_id_printf(element: PGstElement; format: Pgchar): Pgchar; cdecl; varargs; external libgstreamer;
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
function gst_pad_create_stream_id_printf(pad: PGstPad; parent: PGstElement; stream_id: Pgchar): Pgchar; cdecl; varargs; external libgstreamer;
function gst_pad_create_stream_id_printf_valist(pad: PGstPad; parent: PGstElement; stream_id: Pgchar; var_args: Tva_list): Pgchar; cdecl; external libgstreamer;
function gst_pad_get_stream_id(pad: PGstPad): Pgchar; cdecl; external libgstreamer;
function gst_pad_get_stream(pad: PGstPad): PGstStream; cdecl; external libgstreamer;
procedure gst_bin_add_many(bin: PGstBin; element_1: PGstElement); cdecl; varargs; external libgstreamer;
procedure gst_bin_remove_many(bin: PGstBin; element_1: PGstElement); cdecl; varargs; external libgstreamer;
function gst_bin_find_unlinked_pad(bin: PGstBin; direction: TGstPadDirection): PGstPad; cdecl; external libgstreamer;
function gst_bin_sync_children_states(bin: PGstBin): Tgboolean; cdecl; external libgstreamer;
function gst_parse_bin_from_description(bin_description: Pgchar; ghost_unlinked_pads: Tgboolean; err: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_parse_bin_from_description_full(bin_description: Pgchar; ghost_unlinked_pads: Tgboolean; context: PGstParseContext; flags: TGstParseFlags; err: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_util_get_timestamp: TGstClockTime; cdecl; external libgstreamer;

function gst_util_array_binary_search(arr: Tgpointer; num_elements: Tguint; element_size: Tgsize; search_func: TGCompareDataFunc; mode: TGstSearchMode;
  search_data: Tgconstpointer; user_data: Tgpointer): Tgpointer; cdecl; external libgstreamer;
function gst_util_greatest_common_divisor(a: Tgint; b: Tgint): Tgint; cdecl; external libgstreamer;
function gst_util_greatest_common_divisor_int64(a: Tgint64; b: Tgint64): Tgint64; cdecl; external libgstreamer;
procedure gst_util_simplify_fraction(numerator: Pgint; denominator: Pgint; n_terms: Tguint; threshold: Tguint); cdecl; external libgstreamer;
procedure gst_util_fraction_to_double(src_n: Tgint; src_d: Tgint; dest: Pgdouble); cdecl; external libgstreamer;
procedure gst_util_double_to_fraction(src: Tgdouble; dest_n: Pgint; dest_d: Pgint); cdecl; external libgstreamer;
function gst_util_fraction_multiply(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint; res_n: Pgint;
  res_d: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_util_fraction_multiply_int64(a_n: Tgint64; a_d: Tgint64; b_n: Tgint64; b_d: Tgint64; res_n: Pgint64;
  res_d: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_util_fraction_add(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint; res_n: Pgint;
  res_d: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_util_fraction_compare(a_n: Tgint; a_d: Tgint; b_n: Tgint; b_d: Tgint): Tgint; cdecl; external libgstreamer;
function gst_calculate_linear_regression(xy: PGstClockTime; temp: PGstClockTime; n: Tguint; m_num: PGstClockTime; m_denom: PGstClockTime;
  b: PGstClockTime; xbase: PGstClockTime; r_squared: Pgdouble): Tgboolean; cdecl; external libgstreamer;
procedure gst_type_mark_as_plugin_api(_type: TGType; flags: TGstPluginAPIFlags); cdecl; external libgstreamer;
function gst_type_is_plugin_api(_type: TGType; flags: PGstPluginAPIFlags): Tgboolean; cdecl; external libgstreamer;
function gst_util_ceil_log2(v: Tguint32): Tguint; cdecl; external libgstreamer;
function gst_util_floor_log2(v: Tguint32): Tguint; cdecl; external libgstreamer;
function gst_util_filename_compare(a: Pgchar; b: Pgchar): Tgint; cdecl; external libgstreamer;
procedure gst_call_async(func: TGstCallAsyncFunc; user_data: Tgpointer); cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:53:59 ===


implementation



end.

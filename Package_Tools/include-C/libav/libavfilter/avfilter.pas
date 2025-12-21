unit avfilter;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function avfilter_version: dword; cdecl; external libavfilter;
function avfilter_configuration: pchar; cdecl; external libavfilter;
function avfilter_license: pchar; cdecl; external libavfilter;

type
  PAVFilterContext = type Pointer;
  PPAVFilterContext = ^PAVFilterContext;
  PAVFilterLink = type Pointer;
  PPAVFilterLink = ^PAVFilterLink;
  PAVFilterPad = type Pointer;
  PAVFilterFormats = type Pointer;
  PAVFilterChannelLayouts = type Pointer;

function avfilter_pad_get_name(pads: PAVFilterPad; pad_idx: longint): pchar; cdecl; external libavfilter;
function avfilter_pad_get_type(pads: PAVFilterPad; pad_idx: longint): TAVMediaType; cdecl; external libavfilter;

const
  AVFILTER_FLAG_DYNAMIC_INPUTS = 1 shl 0;
  AVFILTER_FLAG_DYNAMIC_OUTPUTS = 1 shl 1;
  AVFILTER_FLAG_SLICE_THREADS = 1 shl 2;
  AVFILTER_FLAG_METADATA_ONLY = 1 shl 3;
  AVFILTER_FLAG_HWDEVICE = 1 shl 4;
  AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC = 1 shl 16;
  AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL = 1 shl 17;
  AVFILTER_FLAG_SUPPORT_TIMELINE = AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC or AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL;

type
  PAVFilter = type Pointer;

function avfilter_filter_pad_count(filter: PAVFilter; is_output: longint): dword; cdecl; external libavfilter;

const
  AVFILTER_THREAD_SLICE = 1 shl 0;

type
  TAVFilterFormatsConfig = record
    formats: PAVFilterFormats;
    samplerates: PAVFilterFormats;
    channel_layouts: PAVFilterChannelLayouts;
  end;
  PAVFilterFormatsConfig = ^TAVFilterFormatsConfig;

const
  AVLINK_UNINIT = 0;
  AVLINK_STARTINIT = 1;
  AVLINK_INIT = 2;

function avfilter_link(src: PAVFilterContext; srcpad: dword; dst: PAVFilterContext; dstpad: dword): longint; cdecl; external libavfilter;
procedure avfilter_link_free(link: PPAVFilterLink); cdecl; external libavfilter;
function avfilter_config_links(filter: PAVFilterContext): longint; cdecl; external libavfilter;

const
  AVFILTER_CMD_FLAG_ONE = 1;
  AVFILTER_CMD_FLAG_FAST = 2;

function avfilter_process_command(filter: PAVFilterContext; cmd: pchar; arg: pchar; res: pchar; res_len: longint;
  flags: longint): longint; cdecl; external libavfilter;
function av_filter_iterate(opaque: Ppointer): PAVFilter; cdecl; external libavfilter;
function avfilter_get_by_name(name: pchar): PAVFilter; cdecl; external libavfilter;
function avfilter_init_str(ctx: PAVFilterContext; args: pchar): longint; cdecl; external libavfilter;
function avfilter_init_dict(ctx: PAVFilterContext; options: PPAVDictionary): longint; cdecl; external libavfilter;
procedure avfilter_free(filter: PAVFilterContext); cdecl; external libavfilter;
function avfilter_insert_filter(link: PAVFilterLink; filt: PAVFilterContext; filt_srcpad_idx: dword; filt_dstpad_idx: dword): longint; cdecl; external libavfilter;
function avfilter_get_class: PAVClass; cdecl; external libavfilter;

type
  PAVFilterGraph = type Pointer;
  PPAVFilterGraph = ^PAVFilterGraph;

function avfilter_graph_alloc: PAVFilterGraph; cdecl; external libavfilter;
function avfilter_graph_alloc_filter(graph: PAVFilterGraph; filter: PAVFilter; name: pchar): PAVFilterContext; cdecl; external libavfilter;
function avfilter_graph_get_filter(graph: PAVFilterGraph; name: pchar): PAVFilterContext; cdecl; external libavfilter;
function avfilter_graph_create_filter(filt_ctx: PPAVFilterContext; filt: PAVFilter; name: pchar; args: pchar; opaque: pointer;
  graph_ctx: PAVFilterGraph): longint; cdecl; external libavfilter;
procedure avfilter_graph_set_auto_convert(graph: PAVFilterGraph; flags: dword); cdecl; external libavfilter;

const
  AVFILTER_AUTO_CONVERT_ALL = 0;
  AVFILTER_AUTO_CONVERT_NONE = -(1);

function avfilter_graph_config(graphctx: PAVFilterGraph; log_ctx: pointer): longint; cdecl; external libavfilter;
procedure avfilter_graph_free(graph: PPAVFilterGraph); cdecl; external libavfilter;

type
  PPAVFilterInOut = ^PAVFilterInOut;
  PAVFilterInOut = ^TAVFilterInOut;

  TAVFilterInOut = record
    name: pchar;
    filter_ctx: PAVFilterContext;
    pad_idx: longint;
    next: PAVFilterInOut;
  end;

function avfilter_inout_alloc: PAVFilterInOut; cdecl; external libavfilter;
procedure avfilter_inout_free(inout: PPAVFilterInOut); cdecl; external libavfilter;
function avfilter_graph_parse(graph: PAVFilterGraph; filters: pchar; inputs: PAVFilterInOut; outputs: PAVFilterInOut; log_ctx: pointer): longint; cdecl; external libavfilter;
function avfilter_graph_parse_ptr(graph: PAVFilterGraph; filters: pchar; inputs: PPAVFilterInOut; outputs: PPAVFilterInOut; log_ctx: pointer): longint; cdecl; external libavfilter;
function avfilter_graph_parse2(graph: PAVFilterGraph; filters: pchar; inputs: PPAVFilterInOut; outputs: PPAVFilterInOut): longint; cdecl; external libavfilter;

type
  TAVFilterPadParams = record
    _label: pchar;
  end;
  PAVFilterPadParams = ^TAVFilterPadParams;

  TAVFilterParams = record
    filter: PAVFilterContext;
    filter_name: pchar;
    instance_name: pchar;
    opts: PAVDictionary;
    inputs: ^PAVFilterPadParams;
    nb_inputs: dword;
    outputs: ^PAVFilterPadParams;
    nb_outputs: dword;
  end;
  PAVFilterParams = ^TAVFilterParams;

  TAVFilterChain = record
    filters: ^PAVFilterParams;
    nb_filters: Tsize_t;
  end;
  PAVFilterChain = ^TAVFilterChain;

  TAVFilterGraphSegment = record
    graph: PAVFilterGraph;
    chains: ^PAVFilterChain;
    nb_chains: Tsize_t;
    scale_sws_opts: pchar;
  end;
  PAVFilterGraphSegment = ^TAVFilterGraphSegment;
  PPAVFilterGraphSegment = ^PAVFilterGraphSegment;

function avfilter_graph_segment_parse(graph: PAVFilterGraph; graph_str: pchar; flags: longint; seg: PPAVFilterGraphSegment): longint; cdecl; external libavfilter;
function avfilter_graph_segment_create_filters(seg: PAVFilterGraphSegment; flags: longint): longint; cdecl; external libavfilter;
function avfilter_graph_segment_apply_opts(seg: PAVFilterGraphSegment; flags: longint): longint; cdecl; external libavfilter;
function avfilter_graph_segment_init(seg: PAVFilterGraphSegment; flags: longint): longint; cdecl; external libavfilter;
function avfilter_graph_segment_link(seg: PAVFilterGraphSegment; flags: longint; inputs: PPAVFilterInOut; outputs: PPAVFilterInOut): longint; cdecl; external libavfilter;
function avfilter_graph_segment_apply(seg: PAVFilterGraphSegment; flags: longint; inputs: PPAVFilterInOut; outputs: PPAVFilterInOut): longint; cdecl; external libavfilter;
procedure avfilter_graph_segment_free(seg: PPAVFilterGraphSegment); cdecl; external libavfilter;
function avfilter_graph_send_command(graph: PAVFilterGraph; target: pchar; cmd: pchar; arg: pchar; res: pchar;
  res_len: longint; flags: longint): longint; cdecl; external libavfilter;
function avfilter_graph_queue_command(graph: PAVFilterGraph; target: pchar; cmd: pchar; arg: pchar; flags: longint;
  ts: double): longint; cdecl; external libavfilter;
function avfilter_graph_dump(graph: PAVFilterGraph; options: pchar): pchar; cdecl; external libavfilter;
function avfilter_graph_request_oldest(graph: PAVFilterGraph): longint; cdecl; external libavfilter;

// === Konventiert am: 21-12-25 19:36:05 ===


implementation



end.

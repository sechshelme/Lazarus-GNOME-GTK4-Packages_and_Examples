

  {$IFDEF read_enum}
type
  PGstParseError = ^TGstParseError;
  TGstParseError = longint;
const
  GST_PARSE_ERROR_SYNTAX = 0;
  GST_PARSE_ERROR_NO_SUCH_ELEMENT = 1;
  GST_PARSE_ERROR_NO_SUCH_PROPERTY = 2;
  GST_PARSE_ERROR_LINK = 3;
  GST_PARSE_ERROR_COULD_NOT_SET_PROPERTY = 4;
  GST_PARSE_ERROR_EMPTY_BIN = 5;
  GST_PARSE_ERROR_EMPTY = 6;
  GST_PARSE_ERROR_DELAYED_LINK = 7;

type
  PGstParseFlags = ^TGstParseFlags;
  TGstParseFlags = longint;
const
  GST_PARSE_FLAG_NONE = 0;
  GST_PARSE_FLAG_FATAL_ERRORS = 1 shl 0;
  GST_PARSE_FLAG_NO_SINGLE_ELEMENT_BINS = 1 shl 1;
  GST_PARSE_FLAG_PLACE_IN_BIN = 1 shl 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstParseContext = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_parse_error_quark: TGQuark; cdecl; external libgstreamer;
function gst_parse_context_get_type: TGType; cdecl; external libgstreamer;
function gst_parse_context_new: PGstParseContext; cdecl; external libgstreamer;
function gst_parse_context_get_missing_elements(context: PGstParseContext): PPgchar; cdecl; external libgstreamer;
procedure gst_parse_context_free(context: PGstParseContext); cdecl; external libgstreamer;
function gst_parse_context_copy(context: PGstParseContext): PGstParseContext; cdecl; external libgstreamer;

function gst_parse_launch(pipeline_description: Pgchar; error: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_parse_launchv(argv: PPgchar; error: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_parse_launch_full(pipeline_description: Pgchar; context: PGstParseContext; flags: TGstParseFlags; error: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_parse_launchv_full(argv: PPgchar; context: PGstParseContext; flags: TGstParseFlags; error: PPGError): PGstElement; cdecl; external libgstreamer;

function GST_PARSE_ERROR: TGQuark;
function GST_TYPE_PARSE_CONTEXT: TGType;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:17:28 ===


{$IFDEF read_implementation}


function GST_PARSE_ERROR: TGQuark;
begin
  GST_PARSE_ERROR := gst_parse_error_quark;
end;

function GST_TYPE_PARSE_CONTEXT: TGType;
begin
  GST_TYPE_PARSE_CONTEXT := gst_parse_context_get_type;
end;


{$ENDIF read_implementation}

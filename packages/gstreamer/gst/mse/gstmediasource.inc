
{$IFDEF read_interface}

type
  PGstMediaSourceReadyState = ^TGstMediaSourceReadyState;
  TGstMediaSourceReadyState = longint;

const
  GST_MEDIA_SOURCE_READY_STATE_CLOSED = 0;
  GST_MEDIA_SOURCE_READY_STATE_OPEN = 1;
  GST_MEDIA_SOURCE_READY_STATE_ENDED = 2;

type
  PGstMediaSourceError = ^TGstMediaSourceError;
  TGstMediaSourceError = longint;

const
  GST_MEDIA_SOURCE_ERROR_INVALID_STATE = 0;
  GST_MEDIA_SOURCE_ERROR_TYPE = 1;
  GST_MEDIA_SOURCE_ERROR_NOT_SUPPORTED = 2;
  GST_MEDIA_SOURCE_ERROR_NOT_FOUND = 3;
  GST_MEDIA_SOURCE_ERROR_QUOTA_EXCEEDED = 4;

type
  PGstMediaSourceEOSError = ^TGstMediaSourceEOSError;
  TGstMediaSourceEOSError = longint;

const
  GST_MEDIA_SOURCE_EOS_ERROR_NONE = 0;
  GST_MEDIA_SOURCE_EOS_ERROR_NETWORK = 1;
  GST_MEDIA_SOURCE_EOS_ERROR_DECODE = 2;

type
  PGstMediaSourceRange = ^TGstMediaSourceRange;

  TGstMediaSourceRange = record
    start: TGstClockTime;
    end_: TGstClockTime;
  end;

function gst_media_source_is_type_supported(_type: Pgchar): Tgboolean; cdecl; external libgstmse;

function gst_media_source_error_quark: TGQuark; cdecl; external libgstmse;
{G_DECLARE_FINAL_TYPE (GstMediaSource, gst_media_source, GST, MEDIA_SOURCE, GstObject); }
type
  TGstMediaSource = record
  end;
  PGstMediaSource = ^TGstMediaSource;

  TGstMediaSourceClass = record
    parent_class: TGstObjectClass;
  end;
  PGstMediaSourceClass = ^TGstMediaSourceClass;

function gst_media_source_get_type: TGType; cdecl; external libgstmse;
function gst_media_source_new: PGstMediaSource; cdecl; external libgstmse;
procedure gst_media_source_attach(self: PGstMediaSource; element: PGstMseSrc); cdecl; external libgstmse;
procedure gst_media_source_detach(self: PGstMediaSource); cdecl; external libgstmse;
function gst_media_source_get_source_buffers(self: PGstMediaSource): PGstSourceBufferList; cdecl; external libgstmse;
function gst_media_source_get_active_source_buffers(self: PGstMediaSource): PGstSourceBufferList; cdecl; external libgstmse;
function gst_media_source_get_ready_state(self: PGstMediaSource): TGstMediaSourceReadyState; cdecl; external libgstmse;
function gst_media_source_get_position(self: PGstMediaSource): TGstClockTime; cdecl; external libgstmse;
function gst_media_source_get_duration(self: PGstMediaSource): TGstClockTime; cdecl; external libgstmse;
function gst_media_source_set_duration(self: PGstMediaSource; duration: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_media_source_add_source_buffer(self: PGstMediaSource; _type: Pgchar; error: PPGError): PGstSourceBuffer; cdecl; external libgstmse;
function gst_media_source_remove_source_buffer(self: PGstMediaSource; buffer: PGstSourceBuffer; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_media_source_end_of_stream(self: PGstMediaSource; eos_error: TGstMediaSourceEOSError; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_media_source_set_live_seekable_range(self: PGstMediaSource; start: TGstClockTime; end_: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_media_source_clear_live_seekable_range(self: PGstMediaSource; error: PPGError): Tgboolean; cdecl; external libgstmse;
procedure gst_media_source_get_live_seekable_range(self: PGstMediaSource; range: PGstMediaSourceRange); cdecl; external libgstmse;

function GST_MEDIA_SOURCE_ERROR: TGQuark;

// === Konventiert am: 3-10-24 17:28:42 ===

function GST_TYPE_MEDIA_SOURCE: TGType;
function GST_MEDIA_SOURCE(obj: Pointer): PGstMediaSource;
function GST_IS_MEDIA_SOURCE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_MEDIA_SOURCE: TGType;
begin
  Result := gst_media_source_get_type;
end;

function GST_MEDIA_SOURCE(obj: Pointer): PGstMediaSource;
begin
  Result := PGstMediaSource(g_type_check_instance_cast(obj, GST_TYPE_MEDIA_SOURCE));
end;

function GST_IS_MEDIA_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_MEDIA_SOURCE);
end;

// ====

function GST_MEDIA_SOURCE_ERROR: TGQuark;
begin
  GST_MEDIA_SOURCE_ERROR := gst_media_source_error_quark;
end;


{$ENDIF read_implementation}

unit sokol_audio;

interface

uses
  fp_sokol;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsaudio_logger = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psaudio_logger = ^Tsaudio_logger;

  Tsaudio_allocator = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psaudio_allocator = ^Tsaudio_allocator;

type
  Psaudio_n3ds_ndspinterptype = ^Tsaudio_n3ds_ndspinterptype;
  Tsaudio_n3ds_ndspinterptype = longint;

const
  SAUDIO_N3DS_DSP_INTERP_POLYPHASE = 0;
  SAUDIO_N3DS_DSP_INTERP_LINEAR = 1;
  SAUDIO_N3DS_DSP_INTERP_NONE = 2;

type
  Tsaudio_n3ds_desc = record
    queue_count: longint;
    interpolation_type: Tsaudio_n3ds_ndspinterptype;
    channel_id: longint;
  end;
  Psaudio_n3ds_desc = ^Tsaudio_n3ds_desc;

  Tsaudio_desc = record
    sample_rate: longint;
    num_channels: longint;
    buffer_frames: longint;
    packet_frames: longint;
    num_packets: longint;
    stream_cb: procedure(buffer: Psingle; num_frames: longint; num_channels: longint); cdecl;
    stream_userdata_cb: procedure(buffer: Psingle; num_frames: longint; num_channels: longint; user_data: pointer); cdecl;
    user_data: pointer;
    n3ds: Tsaudio_n3ds_desc;
    allocator: Tsaudio_allocator;
    logger: Tsaudio_logger;
  end;
  Psaudio_desc = ^Tsaudio_desc;

procedure saudio_setup(desc: Psaudio_desc); cdecl; external libsokol;
procedure saudio_shutdown; cdecl; external libsokol;
function saudio_isvalid: Boolean; cdecl; external libsokol;
function saudio_userdata: pointer; cdecl; external libsokol;
function saudio_query_desc: Tsaudio_desc; cdecl; external libsokol;
function saudio_sample_rate: longint; cdecl; external libsokol;
function saudio_buffer_frames: longint; cdecl; external libsokol;
function saudio_channels: longint; cdecl; external libsokol;
function saudio_suspended: Boolean; cdecl; external libsokol;
function saudio_expect: longint; cdecl; external libsokol;
function saudio_push(frames: Psingle; num_frames: longint): longint; cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:40 ===


implementation



end.

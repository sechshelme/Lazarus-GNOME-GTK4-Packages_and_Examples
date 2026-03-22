
unit sokol_audio;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_audio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_audio.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Psaudio_allocator  = ^saudio_allocator;
Psaudio_desc  = ^saudio_desc;
Psaudio_logger  = ^saudio_logger;
Psaudio_n3ds_desc  = ^saudio_n3ds_desc;
Psaudio_n3ds_ndspinterptype  = ^saudio_n3ds_ndspinterptype;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
{ always "saudio" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SAUDIO_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_audio.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }
type
  Psaudio_logger = ^Tsaudio_logger;
  Tsaudio_logger = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    saudio_allocator

    Used in saudio_desc to provide custom memory-alloc and -free functions
    to sokol_audio.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psaudio_allocator = ^Tsaudio_allocator;
  Tsaudio_allocator = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;

  Psaudio_n3ds_ndspinterptype = ^Tsaudio_n3ds_ndspinterptype;
  Tsaudio_n3ds_ndspinterptype =  Longint;
  Const
    SAUDIO_N3DS_DSP_INTERP_POLYPHASE = 0;
    SAUDIO_N3DS_DSP_INTERP_LINEAR = 1;
    SAUDIO_N3DS_DSP_INTERP_NONE = 2;
;
{ the 3DS requires multiple queues that it alternates between.  }
{ a single buffer will "work" but is choppy due to a slight     }
{ delay when it changes queues.                                 }
{ default value = 2  }
{ NDSP_INTERP_POLYPHASE = 0 (high quality, slower)  }
{ NDSP_INTERP_LINEAR    = 1 (med quality, medium)   }
{ NDSP_INTERP_NONE      = 2 (low quality, fast)     }
{ default value = 0  }
{ 3DS supports different audio channels. they can be used  }
{ in a variety of ways as independent streams etc.         }
{ this implementation in sokol does NOT allow multiple     }
{ due to calling the global ndspInit/ndspExit functions.   }
{ valid range 0-23                                         }
{ default value = 0  }
type
  Psaudio_n3ds_desc = ^Tsaudio_n3ds_desc;
  Tsaudio_n3ds_desc = record
      queue_count : longint;
      interpolation_type : Tsaudio_n3ds_ndspinterptype;
      channel_id : longint;
    end;
{ requested sample rate }
{ number of channels, default: 1 (mono) }
{ number of frames in streaming buffer }
{ number of frames in a packet }
{ number of packets in packet queue }
{ optional streaming callback (no user data) }
{... and with user data }
{ optional user data argument for stream_userdata_cb }
{ optional data for use on n3ds }
{ optional allocation override functions }
{ optional logging function (default: NO LOGGING!) }

  Psaudio_desc = ^Tsaudio_desc;
  Tsaudio_desc = record
      sample_rate : longint;
      num_channels : longint;
      buffer_frames : longint;
      packet_frames : longint;
      num_packets : longint;
      stream_cb : procedure (buffer:Psingle; num_frames:longint; num_channels:longint);cdecl;
      stream_userdata_cb : procedure (buffer:Psingle; num_frames:longint; num_channels:longint; user_data:pointer);cdecl;
      user_data : pointer;
      n3ds : Tsaudio_n3ds_desc;
      allocator : Tsaudio_allocator;
      logger : Tsaudio_logger;
    end;
{ setup sokol-audio  }
(* Const before type ignored *)

procedure saudio_setup(desc:Psaudio_desc);cdecl;external;
{ shutdown sokol-audio  }
procedure saudio_shutdown;cdecl;external;
{ true after setup if audio backend was successfully initialized  }
function saudio_isvalid:Tbool;cdecl;external;
{ return the saudio_desc.user_data pointer  }
function saudio_userdata:pointer;cdecl;external;
{ return a copy of the original saudio_desc struct  }
function saudio_query_desc:Tsaudio_desc;cdecl;external;
{ actual sample rate  }
function saudio_sample_rate:longint;cdecl;external;
{ return actual backend buffer size in number of frames  }
function saudio_buffer_frames:longint;cdecl;external;
{ actual number of channels  }
function saudio_channels:longint;cdecl;external;
{ return true if audio context is currently suspended (only in WebAudio backend, all other backends return false)  }
function saudio_suspended:Tbool;cdecl;external;
{ get current number of frames to fill packet queue  }
function saudio_expect:longint;cdecl;external;
{ push sample frames from main thread, returns number of frames actually pushed  }
(* Const before type ignored *)
function saudio_push(frames:Psingle; num_frames:longint):longint;cdecl;external;

implementation


end.

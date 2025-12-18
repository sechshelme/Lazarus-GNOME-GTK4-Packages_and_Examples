unit avformat;

interface

uses
  fp_ffmpeg;

type
  PAVFormatContext = type Pointer;
  PAVFrame = type Pointer;
  PAVDeviceInfoList= type Pointer;


function av_get_packet(s:PAVIOContext; pkt:PAVPacket; size:longint):longint;cdecl;external libavformat;
function av_append_packet(s:PAVIOContext; pkt:PAVPacket; size:longint):longint;cdecl;external libavformat;
type
  PAVCodecTag= type Pointer;

  TAVProbeData = record
      filename : Pchar;
      buf : Pbyte;
      buf_size : longint;
      mime_type : Pchar;
    end;
  PAVProbeData = ^TAVProbeData;

const
  AVPROBE_SCORE_RETRY = AVPROBE_SCORE_MAX/4;  
  AVPROBE_SCORE_STREAM_RETRY = (AVPROBE_SCORE_MAX/4)-1;  
  AVPROBE_SCORE_EXTENSION = 50;
  AVPROBE_SCORE_MIME = 75;
  AVPROBE_SCORE_MAX = 100;
  AVPROBE_PADDING_SIZE = 32;
  AVFMT_NOFILE = $0001;
  AVFMT_NEEDNUMBER = $0002;
  AVFMT_EXPERIMENTAL = $0004;
  AVFMT_SHOW_IDS = $0008;
  AVFMT_GLOBALHEADER = $0040;
  AVFMT_NOTIMESTAMPS = $0080;
  AVFMT_GENERIC_INDEX = $0100;
  AVFMT_TS_DISCONT = $0200;
  AVFMT_VARIABLE_FPS = $0400;
  AVFMT_NODIMENSIONS = $0800;
  AVFMT_NOSTREAMS = $1000;
  AVFMT_NOBINSEARCH = $2000;
  AVFMT_NOGENSEARCH = $4000;
  AVFMT_NO_BYTE_SEEK = $8000;

const
  AVFMT_ALLOW_FLUSH = $10000;  

const
  AVFMT_TS_NONSTRICT = $20000;  
  AVFMT_TS_NEGATIVE = $40000;
  AVFMT_SEEK_TO_PTS = $4000000;
type
  TAVOutputFormat = record
      name : Pchar;
      long_name : Pchar;
      mime_type : Pchar;
      extensions : Pchar;
      audio_codec : TAVCodecID;
      video_codec : TAVCodecID;
      subtitle_codec : TAVCodecID;
      flags : longint;
      codec_tag : ^PAVCodecTag;
      priv_class : PAVClass;
    end;
  PAVOutputFormat = ^TAVOutputFormat;
{*
 * @
  }
{*
 * @addtogroup lavf_decoding
 * @
  }
{*
     * A comma separated list of short names for the format. New names
     * may be appended with a minor bump.
      }
{*
     * Descriptive name for the format, meant to be more human-readable
     * than name. You should use the NULL_IF_CONFIG_SMALL() macro
     * to define it.
      }
{*
     * Can use flags: AVFMT_NOFILE, AVFMT_NEEDNUMBER, AVFMT_SHOW_IDS,
     * AVFMT_NOTIMESTAMPS, AVFMT_GENERIC_INDEX, AVFMT_TS_DISCONT, AVFMT_NOBINSEARCH,
     * AVFMT_NOGENSEARCH, AVFMT_NO_BYTE_SEEK, AVFMT_SEEK_TO_PTS.
      }
{*
     * If extensions are defined, then no probe is done. You should
     * usually not use extension format guessing because it is not
     * reliable enough
      }
{/< AVClass for the private context }
{*
     * Comma-separated list of mime types.
     * It is used check for matching mime types while probing.
     * @see av_probe_input_format2
      }
{****************************************************************
     * No fields below this line are part of the public API. They
     * may not be used outside of libavformat and can be changed and
     * removed at will.
     * New public fields should be added right above.
     *****************************************************************
      }
{*
     * Raw demuxers store their codec ID here.
      }
{*
     * Size of private data so that it can be allocated in the wrapper.
      }
{*
     * Internal flags. See FF_FMT_FLAG_* in internal.h.
      }
{*
     * Tell if a given file has a chance of being parsed as this format.
     * The buffer provided is guaranteed to be AVPROBE_PADDING_SIZE bytes
     * big so you do not have to check for that unless you need more.
      }
{*
     * Read the format header and initialize the AVFormatContext
     * structure. Return 0 if OK. 'avformat_new_stream' should be
     * called to create new streams.
      }
{*
     * Read one packet and put it in 'pkt'. pts and flags are also
     * set. 'avformat_new_stream' can be called only if the flag
     * AVFMTCTX_NOHEADER is used and only in the calling thread (not in a
     * background thread).
     * @return 0 on success, < 0 on error.
     *         Upon returning an error, pkt must be unreferenced by the caller.
      }
{*
     * Close the stream. The AVFormatContext and AVStreams are not
     * freed by this function
      }
{*
     * Seek to a given timestamp relative to the frames in
     * stream component stream_index.
     * @param stream_index Must not be -1.
     * @param flags Selects which direction should be preferred if no exact
     *              match is available.
     * @return >= 0 on success (but not necessarily the new offset)
      }
{*
     * Get the next timestamp in stream[stream_index].time_base units.
     * @return the timestamp or AV_NOPTS_VALUE if an error occurred
      }
{*
     * Start/resume playing - only meaningful if using a network-based format
     * (RTSP).
      }
{*
     * Pause playing - only meaningful if using a network-based format
     * (RTSP).
      }
{*
     * Seek to timestamp ts.
     * Seeking will be done so that the point from which all active streams
     * can be presented successfully will be closest to ts and within min/max_ts.
     * Active streams are all streams that have AVStream.discard < AVDISCARD_ALL.
      }
{*
     * Returns device list with it properties.
     * @see avdevice_list_devices() for more details.
      }

  PAVInputFormat = ^TAVInputFormat;
  TAVInputFormat = record
      name : Pchar;
      long_name : Pchar;
      flags : longint;
      extensions : Pchar;
      codec_tag : ^PAVCodecTag;
      priv_class : PAVClass;
      mime_type : Pchar;
      raw_codec_id : longint;
      priv_data_size : longint;
      flags_internal : longint;
      read_probe : function (para1:PAVProbeData):longint;cdecl;
      read_header : function (para1:PAVFormatContext):longint;cdecl;
      read_packet : function (para1:PAVFormatContext; pkt:PAVPacket):longint;cdecl;
      read_close : function (para1:PAVFormatContext):longint;cdecl;
      read_seek : function (para1:PAVFormatContext; stream_index:longint; timestamp:Tint64_t; flags:longint):longint;cdecl;
      read_timestamp : function (s:PAVFormatContext; stream_index:longint; pos:Pint64_t; pos_limit:Tint64_t):Tint64_t;cdecl;
      read_play : function (para1:PAVFormatContext):longint;cdecl;
      read_pause : function (para1:PAVFormatContext):longint;cdecl;
      read_seek2 : function (s:PAVFormatContext; stream_index:longint; min_ts:Tint64_t; ts:Tint64_t; max_ts:Tint64_t; 
                   flags:longint):longint;cdecl;
      get_device_list : function (s:PAVFormatContext; device_list:PAVDeviceInfoList):longint;cdecl;
    end;
{*
 * @
  }
{*< full parsing and repack  }
{*< Only parse headers, do not repack.  }
{*< full parsing and interpolation of timestamps for frames not starting on a packet boundary  }
{*< full parsing and repack of the first frame only, only implemented for H.264 currently  }
{*< full parsing and repack with timestamp and position generation by parser for raw
                                    this assumes that each packet in the file contains no demuxer level headers and
                                    just codec level data, otherwise position generation would fail  }
  TAVStreamParseType =  Longint;
  Const
    AVSTREAM_PARSE_NONE = 0;
    AVSTREAM_PARSE_FULL = 1;
    AVSTREAM_PARSE_HEADERS = 2;
    AVSTREAM_PARSE_TIMESTAMPS = 3;
    AVSTREAM_PARSE_FULL_ONCE = 4;
    AVSTREAM_PARSE_FULL_RAW = 5;

{*<
                               * Timestamp in AVStream.time_base units, preferably the time from which on correctly decoded frames are available
                               * when seeking to this entry. That means preferable PTS on keyframe based formats.
                               * But demuxers can choose to store a different timestamp, if it is more convenient for the implementation or nothing better
                               * is known
                                }
{Yeah, trying to keep the size of this small to reduce memory requirements (it is 24 vs. 32 bytes due to possible 8-byte alignment). }
{*< Minimum distance between this and the previous keyframe, used to avoid unneeded searching.  }
type
  PAVIndexEntry = ^TAVIndexEntry;
  TAVIndexEntry = record
      pos : Tint64_t;
      timestamp : Tint64_t;
      flag0 : longint;
      min_distance : longint;
    end;

const
  bm_AVIndexEntry_flags = $3;
  bp_AVIndexEntry_flags = 0;
  bm_AVIndexEntry_size = $FFFFFFFC;
  bp_AVIndexEntry_size = 2;

function flags(var a : AVIndexEntry) : longint;
procedure set_flags(var a : AVIndexEntry; __flags : longint);
function size(var a : AVIndexEntry) : longint;
procedure set_size(var a : AVIndexEntry; __size : longint);

const
  AVINDEX_KEYFRAME = $0001;  
{*
                                          * Flag is used to indicate which frame should be discarded after decoding.
                                           }
  AVINDEX_DISCARD_FRAME = $0002;  
{*
 * The stream should be chosen by default among other streams of the same type,
 * unless the user has explicitly specified otherwise.
  }
  AV_DISPOSITION_DEFAULT = 1 shl 0;  
{*
 * The stream is not in original language.
 *
 * @note AV_DISPOSITION_ORIGINAL is the inverse of this disposition. At most
 *       one of them should be set in properly tagged streams.
 * @note This disposition may apply to any stream type, not just audio.
  }
  AV_DISPOSITION_DUB = 1 shl 1;  
{*
 * The stream is in original language.
 *
 * @see the notes for AV_DISPOSITION_DUB
  }
  AV_DISPOSITION_ORIGINAL = 1 shl 2;  
{*
 * The stream is a commentary track.
  }
  AV_DISPOSITION_COMMENT = 1 shl 3;  
{*
 * The stream contains song lyrics.
  }
  AV_DISPOSITION_LYRICS = 1 shl 4;  
{*
 * The stream contains karaoke audio.
  }
  AV_DISPOSITION_KARAOKE = 1 shl 5;  
{*
 * Track should be used during playback by default.
 * Useful for subtitle track that should be displayed
 * even when user did not explicitly ask for subtitles.
  }
  AV_DISPOSITION_FORCED = 1 shl 6;  
{*
 * The stream is intended for hearing impaired audiences.
  }
  AV_DISPOSITION_HEARING_IMPAIRED = 1 shl 7;  
{*
 * The stream is intended for visually impaired audiences.
  }
  AV_DISPOSITION_VISUAL_IMPAIRED = 1 shl 8;  
{*
 * The audio stream contains music and sound effects without voice.
  }
  AV_DISPOSITION_CLEAN_EFFECTS = 1 shl 9;  
{*
 * The stream is stored in the file as an attached picture/"cover art" (e.g.
 * APIC frame in ID3v2). The first (usually only) packet associated with it
 * will be returned among the first few packets read from the file unless
 * seeking takes place. It can also be accessed at any time in
 * AVStream.attached_pic.
  }
  AV_DISPOSITION_ATTACHED_PIC = 1 shl 10;  
{*
 * The stream is sparse, and contains thumbnail images, often corresponding
 * to chapter markers. Only ever used with AV_DISPOSITION_ATTACHED_PIC.
  }
  AV_DISPOSITION_TIMED_THUMBNAILS = 1 shl 11;  
{*
 * The stream is intended to be mixed with a spatial audio track. For example,
 * it could be used for narration or stereo music, and may remain unchanged by
 * listener head rotation.
  }
  AV_DISPOSITION_NON_DIEGETIC = 1 shl 12;  
{*
 * The subtitle stream contains captions, providing a transcription and possibly
 * a translation of audio. Typically intended for hearing-impaired audiences.
  }
  AV_DISPOSITION_CAPTIONS = 1 shl 16;  
{*
 * The subtitle stream contains a textual description of the video content.
 * Typically intended for visually-impaired audiences or for the cases where the
 * video cannot be seen.
  }
  AV_DISPOSITION_DESCRIPTIONS = 1 shl 17;  
{*
 * The subtitle stream contains time-aligned metadata that is not intended to be
 * directly presented to the user.
  }
  AV_DISPOSITION_METADATA = 1 shl 18;  
{*
 * The audio stream is intended to be mixed with another stream before
 * presentation.
 * Corresponds to mix_type=0 in mpegts.
  }
  AV_DISPOSITION_DEPENDENT = 1 shl 19;  
{*
 * The video stream contains still images.
  }
  AV_DISPOSITION_STILL_IMAGE = 1 shl 20;  
{*
 * @return The AV_DISPOSITION_* flag corresponding to disp or a negative error
 *         code if disp does not correspond to a known stream disposition.
  }

function av_disposition_from_string(disp:Pchar):longint;cdecl;external libavformat;
{*
 * @param disposition a combination of AV_DISPOSITION_* values
 * @return The string description corresponding to the lowest set bit in
 *         disposition. NULL when the lowest set bit does not correspond
 *         to a known disposition or when disposition is 0.
  }
function av_disposition_to_string(disposition:longint):Pchar;cdecl;external libavformat;
{*
 * Options for behavior on timestamp wrap detection.
  }
const
  AV_PTS_WRAP_IGNORE = 0;  {/< ignore the wrap }
  AV_PTS_WRAP_ADD_OFFSET = 1;  {/< add the format specific offset on wrap detection }
  AV_PTS_WRAP_SUB_OFFSET = -(1);  {/< subtract the format specific offset on wrap detection }
{*
 * Stream structure.
 * New fields can be added to the end with minor version bumps.
 * Removal, reordering and changes to existing fields require a major
 * version bump.
 * sizeof(AVStream) must not be used outside libav*.
  }
{*
     * A class for @ref avoptions. Set on stream creation.
      }
{*< stream index in AVFormatContext  }
{*
     * Format-specific stream ID.
     * decoding: set by libavformat
     * encoding: set by the user, replaced by libavformat if left unset
      }
{*
     * Codec parameters associated with this stream. Allocated and freed by
     * libavformat in avformat_new_stream() and avformat_free_context()
     * respectively.
     *
     * - demuxing: filled by libavformat on stream creation or in
     *             avformat_find_stream_info()
     * - muxing: filled by the caller before avformat_write_header()
      }
{*
     * This is the fundamental unit of time (in seconds) in terms
     * of which frame timestamps are represented.
     *
     * decoding: set by libavformat
     * encoding: May be set by the caller before avformat_write_header() to
     *           provide a hint to the muxer about the desired timebase. In
     *           avformat_write_header(), the muxer will overwrite this field
     *           with the timebase that will actually be used for the timestamps
     *           written into the file (which may or may not be related to the
     *           user-provided one, depending on the format).
      }
{*
     * Decoding: pts of the first frame of the stream in presentation order, in stream time base.
     * Only set this if you are absolutely 100% sure that the value you set
     * it to really is the pts of the first frame.
     * This may be undefined (AV_NOPTS_VALUE).
     * @note The ASF header does NOT contain a correct start_time the ASF
     * demuxer must NOT set this.
      }
{*
     * Decoding: duration of the stream, in stream time base.
     * If a source file does not specify a duration, but does specify
     * a bitrate, this value will be estimated from bitrate and file size.
     *
     * Encoding: May be set by the caller before avformat_write_header() to
     * provide a hint to the muxer about the estimated duration.
      }
{/< number of frames in this stream if known or 0 }
{*
     * Stream disposition - a combination of AV_DISPOSITION_* flags.
     * - demuxing: set by libavformat when creating the stream or in
     *             avformat_find_stream_info().
     * - muxing: may be set by the caller before avformat_write_header().
      }
{/< Selects which packets can be discarded at will and do not need to be demuxed. }
{*
     * sample aspect ratio (0 if unknown)
     * - encoding: Set by user.
     * - decoding: Set by libavformat.
      }
{*
     * Average framerate
     *
     * - demuxing: May be set by libavformat when creating the stream or in
     *             avformat_find_stream_info().
     * - muxing: May be set by the caller before avformat_write_header().
      }
{*
     * For streams with AV_DISPOSITION_ATTACHED_PIC disposition, this packet
     * will contain the attached picture.
     *
     * decoding: set by libavformat, must not be modified by the caller.
     * encoding: unused
      }
{*
     * Flags indicating events happening on the stream, a combination of
     * AVSTREAM_EVENT_FLAG_*.
     *
     * - demuxing: may be set by the demuxer in avformat_open_input(),
     *   avformat_find_stream_info() and av_read_frame(). Flags must be cleared
     *   by the user once the event has been handled.
     * - muxing: may be set by the user after avformat_write_header(). to
     *   indicate a user-triggered event.  The muxer will clear the flags for
     *   events it has handled in av_[interleaved]_write_frame().
      }
{*
 * - demuxing: the demuxer read new metadata from the file and updated
 *     AVStream.metadata accordingly
 * - muxing: the user updated AVStream.metadata and wishes the muxer to write
 *     it into the file
  }
{*
     * Real base framerate of the stream.
     * This is the lowest framerate with which all timestamps can be
     * represented accurately (it is the least common multiple of all
     * framerates in the stream). Note, this value is just a guess!
     * For example, if the time base is 1/90000 and all frames have either
     * approximately 3600 or 1800 timer ticks, then r_frame_rate will be 50/1.
      }
{*
     * Number of bits in timestamps. Used for wrapping control.
     *
     * - demuxing: set by libavformat
     * - muxing: set by libavformat
     *
      }
type
  PAVStream = ^TAVStream;
  TAVStream = record
      av_class : PAVClass;
      index : longint;
      id : longint;
      codecpar : PAVCodecParameters;
      priv_data : pointer;
      time_base : TAVRational;
      start_time : Tint64_t;
      duration : Tint64_t;
      nb_frames : Tint64_t;
      disposition : longint;
      discard : TAVDiscard;
      sample_aspect_ratio : TAVRational;
      metadata : PAVDictionary;
      avg_frame_rate : TAVRational;
      attached_pic : TAVPacket;
      event_flags : longint;
      r_frame_rate : TAVRational;
      pts_wrap_bits : longint;
    end;

const
  AVSTREAM_EVENT_FLAG_METADATA_UPDATED = $0001;  
{*
 * - demuxing: new packets for this stream were read from the file. This
 *   event is informational only and does not guarantee that new packets
 *   for this stream will necessarily be returned from av_read_frame().
  }
  AVSTREAM_EVENT_FLAG_NEW_PACKETS = 1 shl 1;  

function av_stream_get_parser(s:PAVStream):PAVCodecParserContext;cdecl;external libavformat;
{$if FF_API_GET_END_PTS}
{*
 * Returns the pts of the last muxed packet + its duration
 *
 * the retuned value is undefined when used with a demuxer.
  }
{xxxxxxxxx attribute_deprecated }

function av_stream_get_end_pts(st:PAVStream):Tint64_t;cdecl;external libavformat;
{$endif}

const
  AV_PROGRAM_RUNNING = 1;  
{*
 * New fields can be added to the end with minor version bumps.
 * Removal, reordering and changes to existing fields require a major
 * version bump.
 * sizeof(AVProgram) must not be used outside libav*.
  }
{/< selects which program to discard and which to feed to the caller }
{****************************************************************
     * All fields below this line are not part of the public API. They
     * may not be used outside of libavformat and can be changed and
     * removed at will.
     * New public fields should be added right above.
     *****************************************************************
      }
{/< reference dts for wrap detection }
{/< behavior on wrap detection }
type
  PAVProgram = ^TAVProgram;
  TAVProgram = record
      id : longint;
      flags : longint;
      discard : TAVDiscard;
      stream_index : Pdword;
      nb_stream_indexes : dword;
      metadata : PAVDictionary;
      program_num : longint;
      pmt_pid : longint;
      pcr_pid : longint;
      pmt_version : longint;
      start_time : Tint64_t;
      end_time : Tint64_t;
      pts_wrap_reference : Tint64_t;
      pts_wrap_behavior : longint;
    end;
{*< signal that no header is present
                                         (streams are added dynamically)  }

const
  AVFMTCTX_NOHEADER = $0001;  
{*< signal that the stream is definitely
                                         not seekable, and attempts to call the
                                         seek function will fail. For some
                                         network protocols (e.g. HLS), this can
                                         change dynamically at runtime.  }
  AVFMTCTX_UNSEEKABLE = $0002;  
{/< unique ID to identify the chapter }
{/< time base in which the start/end timestamps are specified }
{/< chapter start/end time in time_base units }
type
  PAVChapter = ^TAVChapter;
  TAVChapter = record
      id : Tint64_t;
      time_base : TAVRational;
      start : Tint64_t;
      end : Tint64_t;
      metadata : PAVDictionary;
    end;
{*
 * Callback used by devices to communicate with application.
  }

  Tav_format_control_message = function (s:PAVFormatContext; _type:longint; data:pointer; data_size:Tsize_t):longint;cdecl;

  TAVOpenCallback = function (s:PAVFormatContext; pb:PPAVIOContext; url:Pchar; flags:longint; int_cb:PAVIOInterruptCB; 
               options:PPAVDictionary):longint;cdecl;
{*
 * The duration of a video can be estimated through various ways, and this enum can be used
 * to know how the duration was estimated.
  }
{/< Duration accurately estimated from PTSes }
{/< Duration estimated from a stream with a known duration }
{/< Duration estimated from bitrate (less accurate) }
  TAVDurationEstimationMethod =  Longint;
  Const
    AVFMT_DURATION_FROM_PTS = 0;
    AVFMT_DURATION_FROM_STREAM = 1;
    AVFMT_DURATION_FROM_BITRATE = 2;

{*
 * Format I/O context.
 * New fields can be added to the end with minor version bumps.
 * Removal, reordering and changes to existing fields require a major
 * version bump.
 * sizeof(AVFormatContext) must not be used outside libav*, use
 * avformat_alloc_context() to create an AVFormatContext.
 *
 * Fields can be accessed through AVOptions (av_opt*),
 * the name string used matches the associated command line parameter name and
 * can be found in libavformat/options_table.h.
 * The AVOption/command line parameter names differ in some cases from the C
 * structure field names for historic reasons or brevity.
  }
  AVFMT_FLAG_GENPTS = $0001;  {/< Generate missing pts even if it requires parsing future frames. }
  AVFMT_FLAG_IGNIDX = $0002;  {/< Ignore index. }
  AVFMT_FLAG_NONBLOCK = $0004;  {/< Do not block when reading packets from input. }
  AVFMT_FLAG_IGNDTS = $0008;  {/< Ignore DTS on frames that contain both DTS & PTS }
  AVFMT_FLAG_NOFILLIN = $0010;  {/< Do not infer any values from other values, just return what is stored in the container }
  AVFMT_FLAG_NOPARSE = $0020;  {/< Do not use AVParsers, you also must set AVFMT_FLAG_NOFILLIN as the fillin code works on frames and no parsing -> no frames. Also seeking to frames can not work if parsing to find frame boundaries has been disabled }
  AVFMT_FLAG_NOBUFFER = $0040;  {/< Do not buffer frames when possible }
  AVFMT_FLAG_CUSTOM_IO = $0080;  {/< The caller has supplied a custom AVIOContext, don't avio_close() it. }
  AVFMT_FLAG_DISCARD_CORRUPT = $0100;  {/< Discard frames marked corrupted }
  AVFMT_FLAG_FLUSH_PACKETS = $0200;  {/< Flush the AVIOContext every packet. }
{*
 * When muxing, try to avoid writing any random/volatile data to the output.
 * This includes any random IDs, real-time timestamps/dates, muxer version, etc.
 *
 * This flag is mainly intended for testing.
  }
  AVFMT_FLAG_BITEXACT = $0400;  
  AVFMT_FLAG_SORT_DTS = $10000;  {/< try to interleave outputted packets by dts (using this flag can slow demuxing down) }
  AVFMT_FLAG_FAST_SEEK = $80000;  {/< Enable fast, but inaccurate seeks for some formats }
{$if FF_API_LAVF_SHORTEST}

const
  AVFMT_FLAG_SHORTEST = $100000;  {/< Stop muxing when the shortest stream stops. }
{$endif}

const
  AVFMT_FLAG_AUTO_BSF = $200000;  {/< Add bitstream filters as requested by the muxer }
  FF_FDEBUG_TS = $0001;  
  AVFMT_EVENT_FLAG_METADATA_UPDATED = $0001;  
  AVFMT_AVOID_NEG_TS_AUTO = -(1);  {/< Enabled when required by target format }
  AVFMT_AVOID_NEG_TS_DISABLED = 0;  {/< Do not shift timestamps even when they are negative. }
  AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE = 1;  {/< Shift timestamps so they are non negative }
  AVFMT_AVOID_NEG_TS_MAKE_ZERO = 2;  {/< Shift timestamps so that they start at 0 }
{*
     * A class for logging and @ref avoptions. Set by avformat_alloc_context().
     * Exports (de)muxer private options if they exist.
      }
{*
     * The input container format.
     *
     * Demuxing only, set by avformat_open_input().
      }
{*
     * The output container format.
     *
     * Muxing only, must be set by the caller before avformat_write_header().
      }
{*
     * Format private data. This is an AVOptions-enabled struct
     * if and only if iformat/oformat.priv_class is not NULL.
     *
     * - muxing: set by avformat_write_header()
     * - demuxing: set by avformat_open_input()
      }
{*
     * I/O context.
     *
     * - demuxing: either set by the user before avformat_open_input() (then
     *             the user must close it manually) or set by avformat_open_input().
     * - muxing: set by the user before avformat_write_header(). The caller must
     *           take care of closing / freeing the IO context.
     *
     * Do NOT set this field if AVFMT_NOFILE flag is set in
     * iformat/oformat.flags. In such a case, the (de)muxer will handle
     * I/O in some other way and this field will be NULL.
      }
{ stream info  }
{*
     * Flags signalling stream properties. A combination of AVFMTCTX_*.
     * Set by libavformat.
      }
{*
     * Number of elements in AVFormatContext.streams.
     *
     * Set by avformat_new_stream(), must not be modified by any other code.
      }
{*
     * A list of all streams in the file. New streams are created with
     * avformat_new_stream().
     *
     * - demuxing: streams are created by libavformat in avformat_open_input().
     *             If AVFMTCTX_NOHEADER is set in ctx_flags, then new streams may also
     *             appear in av_read_frame().
     * - muxing: streams are created by the user before avformat_write_header().
     *
     * Freed by libavformat in avformat_free_context().
      }
{*
     * input or output URL. Unlike the old filename field, this field has no
     * length restriction.
     *
     * - demuxing: set by avformat_open_input(), initialized to an empty
     *             string if url parameter was NULL in avformat_open_input().
     * - muxing: may be set by the caller before calling avformat_write_header()
     *           (or avformat_init_output() if that is called first) to a string
     *           which is freeable by av_free(). Set to an empty string if it
     *           was NULL in avformat_init_output().
     *
     * Freed by libavformat in avformat_free_context().
      }
{*
     * Position of the first frame of the component, in
     * AV_TIME_BASE fractional seconds. NEVER set this value directly:
     * It is deduced from the AVStream values.
     *
     * Demuxing only, set by libavformat.
      }
{*
     * Duration of the stream, in AV_TIME_BASE fractional
     * seconds. Only set this value if you know none of the individual stream
     * durations and also do not set any of them. This is deduced from the
     * AVStream values if not set.
     *
     * Demuxing only, set by libavformat.
      }
{*
     * Total stream bitrate in bit/s, 0 if not
     * available. Never set it directly if the file_size and the
     * duration are known as FFmpeg can compute it automatically.
      }
{*
     * Flags modifying the (de)muxer behaviour. A combination of AVFMT_FLAG_*.
     * Set by the user before avformat_open_input() / avformat_write_header().
      }
{*
     * Maximum number of bytes read from input in order to determine stream
     * properties. Used when reading the global header and in
     * avformat_find_stream_info().
     *
     * Demuxing only, set by the caller before avformat_open_input().
     *
     * @note this is \e not  used for determining the \ref AVInputFormat
     *       "input format"
     * @sa format_probesize
      }
{*
     * Maximum duration (in AV_TIME_BASE units) of the data read
     * from input in avformat_find_stream_info().
     * Demuxing only, set by the caller before avformat_find_stream_info().
     * Can be set to 0 to let avformat choose using a heuristic.
      }
{*
     * Forced video codec_id.
     * Demuxing: Set by user.
      }
{*
     * Forced audio codec_id.
     * Demuxing: Set by user.
      }
{*
     * Forced subtitle codec_id.
     * Demuxing: Set by user.
      }
{*
     * Maximum amount of memory in bytes to use for the index of each stream.
     * If the index exceeds this size, entries will be discarded as
     * needed to maintain a smaller size. This can lead to slower or less
     * accurate seeking (depends on demuxer).
     * Demuxers for which a full in-memory index is mandatory will ignore
     * this.
     * - muxing: unused
     * - demuxing: set by user
      }
{*
     * Maximum amount of memory in bytes to use for buffering frames
     * obtained from realtime capture devices.
      }
{*
     * Number of chapters in AVChapter array.
     * When muxing, chapters are normally written in the file header,
     * so nb_chapters should normally be initialized before write_header
     * is called. Some muxers (e.g. mov and mkv) can also write chapters
     * in the trailer.  To write chapters in the trailer, nb_chapters
     * must be zero when write_header is called and non-zero when
     * write_trailer is called.
     * - muxing: set by user
     * - demuxing: set by libavformat
      }
{*
     * Metadata that applies to the whole file.
     *
     * - demuxing: set by libavformat in avformat_open_input()
     * - muxing: may be set by the caller before avformat_write_header()
     *
     * Freed by libavformat in avformat_free_context().
      }
{*
     * Start time of the stream in real world time, in microseconds
     * since the Unix epoch (00:00 1st January 1970). That is, pts=0 in the
     * stream was captured at this real world time.
     * - muxing: Set by the caller before avformat_write_header(). If set to
     *           either 0 or AV_NOPTS_VALUE, then the current wall-time will
     *           be used.
     * - demuxing: Set by libavformat. AV_NOPTS_VALUE if unknown. Note that
     *             the value may become known after some number of frames
     *             have been received.
      }
{*
     * The number of frames used for determining the framerate in
     * avformat_find_stream_info().
     * Demuxing only, set by the caller before avformat_find_stream_info().
      }
{*
     * Error recognition; higher values will detect more errors but may
     * misdetect some more or less valid parts as errors.
     * Demuxing only, set by the caller before avformat_open_input().
      }
{*
     * Custom interrupt callbacks for the I/O layer.
     *
     * demuxing: set by the user before avformat_open_input().
     * muxing: set by the user before avformat_write_header()
     * (mainly useful for AVFMT_NOFILE formats). The callback
     * should also be passed to avio_open2() if it's used to
     * open the file.
      }
{*
     * Flags to enable debugging.
      }
{*
     * Maximum buffering duration for interleaving.
     *
     * To ensure all the streams are interleaved correctly,
     * av_interleaved_write_frame() will wait until it has at least one packet
     * for each stream before actually writing any packets to the output file.
     * When some streams are "sparse" (i.e. there are large gaps between
     * successive packets), this can result in excessive buffering.
     *
     * This field specifies the maximum difference between the timestamps of the
     * first and the last packet in the muxing queue, above which libavformat
     * will output a packet regardless of whether it has queued a packet for all
     * the streams.
     *
     * Muxing only, set by the caller before avformat_write_header().
      }
{*
     * Allow non-standard and experimental extension
     * @see AVCodecContext.strict_std_compliance
      }
{*
     * Flags indicating events happening on the file, a combination of
     * AVFMT_EVENT_FLAG_*.
     *
     * - demuxing: may be set by the demuxer in avformat_open_input(),
     *   avformat_find_stream_info() and av_read_frame(). Flags must be cleared
     *   by the user once the event has been handled.
     * - muxing: may be set by the user after avformat_write_header() to
     *   indicate a user-triggered event.  The muxer will clear the flags for
     *   events it has handled in av_[interleaved]_write_frame().
      }
{*
 * - demuxing: the demuxer read new metadata from the file and updated
 *   AVFormatContext.metadata accordingly
 * - muxing: the user updated AVFormatContext.metadata and wishes the muxer to
 *   write it into the file
  }
{*
     * Maximum number of packets to read while waiting for the first timestamp.
     * Decoding only.
      }
{*
     * Avoid negative timestamps during muxing.
     * Any value of the AVFMT_AVOID_NEG_TS_* constants.
     * Note, this works better when using av_interleaved_write_frame().
     * - muxing: Set by user
     * - demuxing: unused
      }
{*
     * Transport stream id.
     * This will be moved into demuxer private options. Thus no API/ABI compatibility
      }
{*
     * Audio preload in microseconds.
     * Note, not all formats support this and unpredictable things may happen if it is used when not supported.
     * - encoding: Set by user
     * - decoding: unused
      }
{*
     * Max chunk time in microseconds.
     * Note, not all formats support this and unpredictable things may happen if it is used when not supported.
     * - encoding: Set by user
     * - decoding: unused
      }
{*
     * Max chunk size in bytes
     * Note, not all formats support this and unpredictable things may happen if it is used when not supported.
     * - encoding: Set by user
     * - decoding: unused
      }
{*
     * forces the use of wallclock timestamps as pts/dts of packets
     * This has undefined results in the presence of B frames.
     * - encoding: unused
     * - decoding: Set by user
      }
{*
     * avio flags, used to force AVIO_FLAG_DIRECT.
     * - encoding: unused
     * - decoding: Set by user
      }
{*
     * The duration field can be estimated through various ways, and this field can be used
     * to know how the duration was estimated.
     * - encoding: unused
     * - decoding: Read by user
      }
{*
     * Skip initial bytes when opening stream
     * - encoding: unused
     * - decoding: Set by user
      }
{*
     * Correct single timestamp overflows
     * - encoding: unused
     * - decoding: Set by user
      }
{*
     * Force seeking to any (also non key) frames.
     * - encoding: unused
     * - decoding: Set by user
      }
{*
     * Flush the I/O context after each packet.
     * - encoding: Set by user
     * - decoding: unused
      }
{*
     * format probing score.
     * The maximal score is AVPROBE_SCORE_MAX, its set when the demuxer probes
     * the format.
     * - encoding: unused
     * - decoding: set by avformat, read by user
      }
{*
     * Maximum number of bytes read from input in order to identify the
     * \ref AVInputFormat "input format". Only used when the format is not set
     * explicitly by the caller.
     *
     * Demuxing only, set by the caller before avformat_open_input().
     *
     * @sa probesize
      }
{*
     * ',' separated list of allowed decoders.
     * If NULL then all are allowed
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * ',' separated list of allowed demuxers.
     * If NULL then all are allowed
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * IO repositioned flag.
     * This is set by avformat when the underlaying IO context read pointer
     * is repositioned, for example when doing byte based seeking.
     * Demuxers can use the flag to detect such changes.
      }
{*
     * Forced video codec.
     * This allows forcing a specific decoder, even when there are multiple with
     * the same codec_id.
     * Demuxing: Set by user
      }
{*
     * Forced audio codec.
     * This allows forcing a specific decoder, even when there are multiple with
     * the same codec_id.
     * Demuxing: Set by user
      }
{*
     * Forced subtitle codec.
     * This allows forcing a specific decoder, even when there are multiple with
     * the same codec_id.
     * Demuxing: Set by user
      }
{*
     * Forced data codec.
     * This allows forcing a specific decoder, even when there are multiple with
     * the same codec_id.
     * Demuxing: Set by user
      }
{*
     * Number of bytes to be written as padding in a metadata header.
     * Demuxing: Unused.
     * Muxing: Set by user via av_format_set_metadata_header_padding.
      }
{*
     * User data.
     * This is a place for some private data of the user.
      }
{*
     * Callback used by devices to communicate with application.
      }
{*
     * Output timestamp offset, in microseconds.
     * Muxing: set by user
      }
{*
     * dump format separator.
     * can be ", " or "\n      " or anything else
     * - muxing: Set by user.
     * - demuxing: Set by user.
      }
{*
     * Forced Data codec_id.
     * Demuxing: Set by user.
      }
{*
     * ',' separated list of allowed protocols.
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * A callback for opening new IO streams.
     *
     * Whenever a muxer or a demuxer needs to open an IO stream (typically from
     * avformat_open_input() for demuxers, but for certain formats can happen at
     * other times as well), it will call this callback to obtain an IO context.
     *
     * @param s the format context
     * @param pb on success, the newly opened IO context should be returned here
     * @param url the url to open
     * @param flags a combination of AVIO_FLAG_*
     * @param options a dictionary of additional options, with the same
     *                semantics as in avio_open2()
     * @return 0 on success, a negative AVERROR code on failure
     *
     * @note Certain muxers and demuxers do nesting, i.e. they open one or more
     * additional internal format contexts. Thus the AVFormatContext pointer
     * passed to this callback may be different from the one facing the caller.
     * It will, however, have the same 'opaque' field.
      }
{*
     * ',' separated list of disallowed protocols.
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * The maximum number of streams.
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * Skip duration calcuation in estimate_timings_from_pts.
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * Maximum number of packets that can be probed
     * - encoding: unused
     * - decoding: set by user
      }
{*
     * A callback for closing the streams opened with AVFormatContext.io_open().
     *
     * Using this is preferred over io_close, because this can return an error.
     * Therefore this callback is used instead of io_close by the generic
     * libavformat code if io_close is NULL or the default.
     *
     * @param s the format context
     * @param pb IO context to be closed and freed
     * @return 0 on success, a negative AVERROR code on failure
      }
type
  PAVFormatContext = ^TAVFormatContext;
  TAVFormatContext = record
      av_class : PAVClass;
      iformat : PAVInputFormat;
      oformat : PAVOutputFormat;
      priv_data : pointer;
      pb : PAVIOContext;
      ctx_flags : longint;
      nb_streams : dword;
      streams : ^PAVStream;
      url : Pchar;
      start_time : Tint64_t;
      duration : Tint64_t;
      bit_rate : Tint64_t;
      packet_size : dword;
      max_delay : longint;
      flags : longint;
      probesize : Tint64_t;
      max_analyze_duration : Tint64_t;
      key : Puint8_t;
      keylen : longint;
      nb_programs : dword;
      programs : ^PAVProgram;
      video_codec_id : TAVCodecID;
      audio_codec_id : TAVCodecID;
      subtitle_codec_id : TAVCodecID;
      max_index_size : dword;
      max_picture_buffer : dword;
      nb_chapters : dword;
      chapters : ^PAVChapter;
      metadata : PAVDictionary;
      start_time_realtime : Tint64_t;
      fps_probe_size : longint;
      error_recognition : longint;
      interrupt_callback : TAVIOInterruptCB;
      debug : longint;
      max_interleave_delta : Tint64_t;
      strict_std_compliance : longint;
      event_flags : longint;
      max_ts_probe : longint;
      avoid_negative_ts : longint;
      ts_id : longint;
      audio_preload : longint;
      max_chunk_duration : longint;
      max_chunk_size : longint;
      use_wallclock_as_timestamps : longint;
      avio_flags : longint;
      duration_estimation_method : TAVDurationEstimationMethod;
      skip_initial_bytes : Tint64_t;
      correct_ts_overflow : dword;
      seek2any : longint;
      flush_packets : longint;
      probe_score : longint;
      format_probesize : longint;
      codec_whitelist : Pchar;
      format_whitelist : Pchar;
      io_repositioned : longint;
      video_codec : PAVCodec;
      audio_codec : PAVCodec;
      subtitle_codec : PAVCodec;
      data_codec : PAVCodec;
      metadata_header_padding : longint;
      opaque : pointer;
      control_message_cb : Tav_format_control_message;
      output_ts_offset : Tint64_t;
      dump_separator : Puint8_t;
      data_codec_id : TAVCodecID;
      protocol_whitelist : Pchar;
      io_open : function (s:PAVFormatContext; pb:PPAVIOContext; url:Pchar; flags:longint; options:PPAVDictionary):longint;cdecl;
      protocol_blacklist : Pchar;
      max_streams : longint;
      skip_estimate_duration_from_pts : longint;
      max_probe_packets : longint;
      io_close2 : function (s:PAVFormatContext; pb:PAVIOContext):longint;cdecl;
    end;
{*
 * This function will cause global side data to be injected in the next packet
 * of each stream as well as after any subsequent seek.
 *
 * @note global side data is always available in every AVStream's
 *       @ref AVCodecParameters.coded_side_data "codecpar side data" array, and
 *       in a @ref AVCodecContext.coded_side_data "decoder's side data" array if
 *       initialized with said stream's codecpar.
 * @see av_packet_side_data_get()
  }

procedure av_format_inject_global_side_data(s:PAVFormatContext);cdecl;external libavformat;
{*
 * Returns the method used to set ctx->duration.
 *
 * @return AVFMT_DURATION_FROM_PTS, AVFMT_DURATION_FROM_STREAM, or AVFMT_DURATION_FROM_BITRATE.
  }
function av_fmt_ctx_get_duration_estimation_method(ctx:PAVFormatContext):TAVDurationEstimationMethod;cdecl;external libavformat;
{*
 * @defgroup lavf_core Core functions
 * @ingroup libavf
 *
 * Functions for querying libavformat capabilities, allocating core structures,
 * etc.
 * @
  }
{*
 * Return the LIBAVFORMAT_VERSION_INT constant.
  }
function avformat_version:dword;cdecl;external libavformat;
{*
 * Return the libavformat build-time configuration.
  }
function avformat_configuration:Pchar;cdecl;external libavformat;
{*
 * Return the libavformat license.
  }
function avformat_license:Pchar;cdecl;external libavformat;
{*
 * Do global initialization of network libraries. This is optional,
 * and not recommended anymore.
 *
 * This functions only exists to work around thread-safety issues
 * with older GnuTLS or OpenSSL libraries. If libavformat is linked
 * to newer versions of those libraries, or if you do not use them,
 * calling this function is unnecessary. Otherwise, you need to call
 * this function before any other threads using them are started.
 *
 * This function will be deprecated once support for older GnuTLS and
 * OpenSSL libraries is removed, and this function has no purpose
 * anymore.
  }
function avformat_network_init:longint;cdecl;external libavformat;
{*
 * Undo the initialization done by avformat_network_init. Call it only
 * once for each time you called avformat_network_init.
  }
function avformat_network_deinit:longint;cdecl;external libavformat;
{*
 * Iterate over all registered muxers.
 *
 * @param opaque a pointer where libavformat will store the iteration state. Must
 *               point to NULL to start the iteration.
 *
 * @return the next registered muxer or NULL when the iteration is
 *         finished
  }
function av_muxer_iterate(opaque:Ppointer):PAVOutputFormat;cdecl;external libavformat;
{*
 * Iterate over all registered demuxers.
 *
 * @param opaque a pointer where libavformat will store the iteration state.
 *               Must point to NULL to start the iteration.
 *
 * @return the next registered demuxer or NULL when the iteration is
 *         finished
  }
function av_demuxer_iterate(opaque:Ppointer):PAVInputFormat;cdecl;external libavformat;
{*
 * Allocate an AVFormatContext.
 * avformat_free_context() can be used to free the context and everything
 * allocated by the framework within it.
  }
function avformat_alloc_context:PAVFormatContext;cdecl;external libavformat;
{*
 * Free an AVFormatContext and all its streams.
 * @param s context to free
  }
procedure avformat_free_context(s:PAVFormatContext);cdecl;external libavformat;
{*
 * Get the AVClass for AVFormatContext. It can be used in combination with
 * AV_OPT_SEARCH_FAKE_OBJ for examining options.
 *
 * @see av_opt_find().
  }
function avformat_get_class:PAVClass;cdecl;external libavformat;
{*
 * Get the AVClass for AVStream. It can be used in combination with
 * AV_OPT_SEARCH_FAKE_OBJ for examining options.
 *
 * @see av_opt_find().
  }
function av_stream_get_class:PAVClass;cdecl;external libavformat;
{*
 * Add a new stream to a media file.
 *
 * When demuxing, it is called by the demuxer in read_header(). If the
 * flag AVFMTCTX_NOHEADER is set in s.ctx_flags, then it may also
 * be called in read_packet().
 *
 * When muxing, should be called by the user before avformat_write_header().
 *
 * User is required to call avformat_free_context() to clean up the allocation
 * by avformat_new_stream().
 *
 * @param s media file handle
 * @param c unused, does nothing
 *
 * @return newly created stream or NULL on error.
  }
function avformat_new_stream(s:PAVFormatContext; c:PAVCodec):PAVStream;cdecl;external libavformat;
{$if FF_API_AVSTREAM_SIDE_DATA}
{*
 * Wrap an existing array as stream side data.
 *
 * @param st   stream
 * @param type side information type
 * @param data the side data array. It must be allocated with the av_malloc()
 *             family of functions. The ownership of the data is transferred to
 *             st.
 * @param size side information size
 *
 * @return zero on success, a negative AVERROR code on failure. On failure,
 *         the stream is unchanged and the data remains owned by the caller.
 * @deprecated use av_packet_side_data_add() with the stream's
 *             @ref AVCodecParameters.coded_side_data "codecpar side data"
  }
{xxxxxxxxx attribute_deprecated }

function av_stream_add_side_data(st:PAVStream; _type:TAVPacketSideDataType; data:Puint8_t; size:Tsize_t):longint;cdecl;external libavformat;
{*
 * Allocate new information from stream.
 *
 * @param stream stream
 * @param type   desired side information type
 * @param size   side information size
 *
 * @return pointer to fresh allocated data or NULL otherwise
 * @deprecated use av_packet_side_data_new() with the stream's
 *             @ref AVCodecParameters.coded_side_data "codecpar side data"
  }
{xxxxxxxxx attribute_deprecated }
function av_stream_new_side_data(stream:PAVStream; _type:TAVPacketSideDataType; size:Tsize_t):Puint8_t;cdecl;external libavformat;
{*
 * Get side information from stream.
 *
 * @param stream stream
 * @param type   desired side information type
 * @param size   If supplied, *size will be set to the size of the side data
 *               or to zero if the desired side data is not present.
 *
 * @return pointer to data if present or NULL otherwise
 * @deprecated use av_packet_side_data_get() with the stream's
 *             @ref AVCodecParameters.coded_side_data "codecpar side data"
  }
{xxxxxxxxx attribute_deprecated }
function av_stream_get_side_data(stream:PAVStream; _type:TAVPacketSideDataType; size:Psize_t):Puint8_t;cdecl;external libavformat;
{$endif}

function av_new_program(s:PAVFormatContext; id:longint):PAVProgram;cdecl;external libavformat;
{*
 * @
  }
{*
 * Allocate an AVFormatContext for an output format.
 * avformat_free_context() can be used to free the context and
 * everything allocated by the framework within it.
 *
 * @param ctx           pointee is set to the created format context,
 *                      or to NULL in case of failure
 * @param oformat       format to use for allocating the context, if NULL
 *                      format_name and filename are used instead
 * @param format_name   the name of output format to use for allocating the
 *                      context, if NULL filename is used instead
 * @param filename      the name of the filename to use for allocating the
 *                      context, may be NULL
 *
 * @return  >= 0 in case of success, a negative AVERROR code in case of
 *          failure
  }
function avformat_alloc_output_context2(ctx:PPAVFormatContext; oformat:PAVOutputFormat; format_name:Pchar; filename:Pchar):longint;cdecl;external libavformat;
{*
 * @addtogroup lavf_decoding
 * @
  }
{*
 * Find AVInputFormat based on the short name of the input format.
  }
function av_find_input_format(short_name:Pchar):PAVInputFormat;cdecl;external libavformat;
{*
 * Guess the file format.
 *
 * @param pd        data to be probed
 * @param is_opened Whether the file is already opened; determines whether
 *                  demuxers with or without AVFMT_NOFILE are probed.
  }
function av_probe_input_format(pd:PAVProbeData; is_opened:longint):PAVInputFormat;cdecl;external libavformat;
{*
 * Guess the file format.
 *
 * @param pd        data to be probed
 * @param is_opened Whether the file is already opened; determines whether
 *                  demuxers with or without AVFMT_NOFILE are probed.
 * @param score_max A probe score larger that this is required to accept a
 *                  detection, the variable is set to the actual detection
 *                  score afterwards.
 *                  If the score is <= AVPROBE_SCORE_MAX / 4 it is recommended
 *                  to retry with a larger probe buffer.
  }
function av_probe_input_format2(pd:PAVProbeData; is_opened:longint; score_max:Plongint):PAVInputFormat;cdecl;external libavformat;
{*
 * Guess the file format.
 *
 * @param is_opened Whether the file is already opened; determines whether
 *                  demuxers with or without AVFMT_NOFILE are probed.
 * @param score_ret The score of the best detection.
  }
function av_probe_input_format3(pd:PAVProbeData; is_opened:longint; score_ret:Plongint):PAVInputFormat;cdecl;external libavformat;
{*
 * Probe a bytestream to determine the input format. Each time a probe returns
 * with a score that is too low, the probe buffer size is increased and another
 * attempt is made. When the maximum probe size is reached, the input format
 * with the highest score is returned.
 *
 * @param pb             the bytestream to probe
 * @param fmt            the input format is put here
 * @param url            the url of the stream
 * @param logctx         the log context
 * @param offset         the offset within the bytestream to probe from
 * @param max_probe_size the maximum probe buffer size (zero for default)
 *
 * @return the score in case of success, a negative value corresponding to an
 *         the maximal score is AVPROBE_SCORE_MAX
 *         AVERROR code otherwise
  }
function av_probe_input_buffer2(pb:PAVIOContext; fmt:PPAVInputFormat; url:Pchar; logctx:pointer; offset:dword; 
           max_probe_size:dword):longint;cdecl;external libavformat;
{*
 * Like av_probe_input_buffer2() but returns 0 on success
  }
function av_probe_input_buffer(pb:PAVIOContext; fmt:PPAVInputFormat; url:Pchar; logctx:pointer; offset:dword; 
           max_probe_size:dword):longint;cdecl;external libavformat;
{*
 * Open an input stream and read the header. The codecs are not opened.
 * The stream must be closed with avformat_close_input().
 *
 * @param ps       Pointer to user-supplied AVFormatContext (allocated by
 *                 avformat_alloc_context). May be a pointer to NULL, in
 *                 which case an AVFormatContext is allocated by this
 *                 function and written into ps.
 *                 Note that a user-supplied AVFormatContext will be freed
 *                 on failure.
 * @param url      URL of the stream to open.
 * @param fmt      If non-NULL, this parameter forces a specific input format.
 *                 Otherwise the format is autodetected.
 * @param options  A dictionary filled with AVFormatContext and demuxer-private
 *                 options.
 *                 On return this parameter will be destroyed and replaced with
 *                 a dict containing options that were not found. May be NULL.
 *
 * @return 0 on success, a negative AVERROR on failure.
 *
 * @note If you want to use custom IO, preallocate the format context and set its pb field.
  }
function avformat_open_input(ps:PPAVFormatContext; url:Pchar; fmt:PAVInputFormat; options:PPAVDictionary):longint;cdecl;external libavformat;
{*
 * Read packets of a media file to get stream information. This
 * is useful for file formats with no headers such as MPEG. This
 * function also computes the real framerate in case of MPEG-2 repeat
 * frame mode.
 * The logical file position is not changed by this function;
 * examined packets may be buffered for later processing.
 *
 * @param ic media file handle
 * @param options  If non-NULL, an ic.nb_streams long array of pointers to
 *                 dictionaries, where i-th member contains options for
 *                 codec corresponding to i-th stream.
 *                 On return each dictionary will be filled with options that were not found.
 * @return >=0 if OK, AVERROR_xxx on error
 *
 * @note this function isn't guaranteed to open all the codecs, so
 *       options being non-empty at return is a perfectly normal behavior.
 *
 * @todo Let the user decide somehow what information is needed so that
 *       we do not waste time getting stuff the user does not need.
  }
function avformat_find_stream_info(ic:PAVFormatContext; options:PPAVDictionary):longint;cdecl;external libavformat;
{*
 * Find the programs which belong to a given stream.
 *
 * @param ic    media file handle
 * @param last  the last found program, the search will start after this
 *              program, or from the beginning if it is NULL
 * @param s     stream index
 *
 * @return the next program which belongs to s, NULL if no program is found or
 *         the last program is not among the programs of ic.
  }
function av_find_program_from_stream(ic:PAVFormatContext; last:PAVProgram; s:longint):PAVProgram;cdecl;external libavformat;
procedure av_program_add_stream_index(ac:PAVFormatContext; progid:longint; idx:dword);cdecl;external libavformat;
{*
 * Find the "best" stream in the file.
 * The best stream is determined according to various heuristics as the most
 * likely to be what the user expects.
 * If the decoder parameter is non-NULL, av_find_best_stream will find the
 * default decoder for the stream's codec; streams for which no decoder can
 * be found are ignored.
 *
 * @param ic                media file handle
 * @param type              stream type: video, audio, subtitles, etc.
 * @param wanted_stream_nb  user-requested stream number,
 *                          or -1 for automatic selection
 * @param related_stream    try to find a stream related (eg. in the same
 *                          program) to this one, or -1 if none
 * @param decoder_ret       if non-NULL, returns the decoder for the
 *                          selected stream
 * @param flags             flags; none are currently defined
 *
 * @return  the non-negative stream number in case of success,
 *          AVERROR_STREAM_NOT_FOUND if no stream with the requested type
 *          could be found,
 *          AVERROR_DECODER_NOT_FOUND if streams were found but no decoder
 *
 * @note  If av_find_best_stream returns successfully and decoder_ret is not
 *        NULL, then *decoder_ret is guaranteed to be set to a valid AVCodec.
  }
function av_find_best_stream(ic:PAVFormatContext; _type:TAVMediaType; wanted_stream_nb:longint; related_stream:longint; decoder_ret:PPAVCodec; 
           flags:longint):longint;cdecl;external libavformat;
{*
 * Return the next frame of a stream.
 * This function returns what is stored in the file, and does not validate
 * that what is there are valid frames for the decoder. It will split what is
 * stored in the file into frames and return one for each call. It will not
 * omit invalid data between valid frames so as to give the decoder the maximum
 * information possible for decoding.
 *
 * On success, the returned packet is reference-counted (pkt->buf is set) and
 * valid indefinitely. The packet must be freed with av_packet_unref() when
 * it is no longer needed. For video, the packet contains exactly one frame.
 * For audio, it contains an integer number of frames if each frame has
 * a known fixed size (e.g. PCM or ADPCM data). If the audio frames have
 * a variable size (e.g. MPEG audio), then it contains one frame.
 *
 * pkt->pts, pkt->dts and pkt->duration are always set to correct
 * values in AVStream.time_base units (and guessed if the format cannot
 * provide them). pkt->pts can be AV_NOPTS_VALUE if the video format
 * has B-frames, so it is better to rely on pkt->dts if you do not
 * decompress the payload.
 *
 * @return 0 if OK, < 0 on error or end of file. On error, pkt will be blank
 *         (as if it came from av_packet_alloc()).
 *
 * @note pkt will be initialized, so it may be uninitialized, but it must not
 *       contain data that needs to be freed.
  }
function av_read_frame(s:PAVFormatContext; pkt:PAVPacket):longint;cdecl;external libavformat;
{*
 * Seek to the keyframe at timestamp.
 * 'timestamp' in 'stream_index'.
 *
 * @param s            media file handle
 * @param stream_index If stream_index is (-1), a default stream is selected,
 *                     and timestamp is automatically converted from
 *                     AV_TIME_BASE units to the stream specific time_base.
 * @param timestamp    Timestamp in AVStream.time_base units or, if no stream
 *                     is specified, in AV_TIME_BASE units.
 * @param flags        flags which select direction and seeking mode
 *
 * @return >= 0 on success
  }
function av_seek_frame(s:PAVFormatContext; stream_index:longint; timestamp:Tint64_t; flags:longint):longint;cdecl;external libavformat;
{*
 * Seek to timestamp ts.
 * Seeking will be done so that the point from which all active streams
 * can be presented successfully will be closest to ts and within min/max_ts.
 * Active streams are all streams that have AVStream.discard < AVDISCARD_ALL.
 *
 * If flags contain AVSEEK_FLAG_BYTE, then all timestamps are in bytes and
 * are the file position (this may not be supported by all demuxers).
 * If flags contain AVSEEK_FLAG_FRAME, then all timestamps are in frames
 * in the stream with stream_index (this may not be supported by all demuxers).
 * Otherwise all timestamps are in units of the stream selected by stream_index
 * or if stream_index is -1, in AV_TIME_BASE units.
 * If flags contain AVSEEK_FLAG_ANY, then non-keyframes are treated as
 * keyframes (this may not be supported by all demuxers).
 * If flags contain AVSEEK_FLAG_BACKWARD, it is ignored.
 *
 * @param s            media file handle
 * @param stream_index index of the stream which is used as time base reference
 * @param min_ts       smallest acceptable timestamp
 * @param ts           target timestamp
 * @param max_ts       largest acceptable timestamp
 * @param flags        flags
 * @return >=0 on success, error code otherwise
 *
 * @note This is part of the new seek API which is still under construction.
  }
function avformat_seek_file(s:PAVFormatContext; stream_index:longint; min_ts:Tint64_t; ts:Tint64_t; max_ts:Tint64_t; 
           flags:longint):longint;cdecl;external libavformat;
{*
 * Discard all internally buffered data. This can be useful when dealing with
 * discontinuities in the byte stream. Generally works only with formats that
 * can resync. This includes headerless formats like MPEG-TS/TS but should also
 * work with NUT, Ogg and in a limited way AVI for example.
 *
 * The set of streams, the detected duration, stream parameters and codecs do
 * not change when calling this function. If you want a complete reset, it's
 * better to open a new AVFormatContext.
 *
 * This does not flush the AVIOContext (s->pb). If necessary, call
 * avio_flush(s->pb) before calling this function.
 *
 * @param s media file handle
 * @return >=0 on success, error code otherwise
  }
function avformat_flush(s:PAVFormatContext):longint;cdecl;external libavformat;
{*
 * Start playing a network-based stream (e.g. RTSP stream) at the
 * current position.
  }
function av_read_play(s:PAVFormatContext):longint;cdecl;external libavformat;
{*
 * Pause a network-based stream (e.g. RTSP stream).
 *
 * Use av_read_play() to resume it.
  }
function av_read_pause(s:PAVFormatContext):longint;cdecl;external libavformat;
{*
 * Close an opened input AVFormatContext. Free it and all its contents
 * and set *s to NULL.
  }
procedure avformat_close_input(s:PPAVFormatContext);cdecl;external libavformat;
{*
 * @
  }
const
  AVSEEK_FLAG_BACKWARD = 1;  {/< seek backward }
  AVSEEK_FLAG_BYTE = 2;  {/< seeking based on position in bytes }
  AVSEEK_FLAG_ANY = 4;  {/< seek to any frame, even non-keyframes }
  AVSEEK_FLAG_FRAME = 8;  {/< seeking based on frame number }
{*
 * @addtogroup lavf_encoding
 * @
  }
  AVSTREAM_INIT_IN_WRITE_HEADER = 0;  {/< stream parameters initialized in avformat_write_header }
  AVSTREAM_INIT_IN_INIT_OUTPUT = 1;  {/< stream parameters initialized in avformat_init_output }
{*
 * Allocate the stream private data and write the stream header to
 * an output media file.
 *
 * @param s        Media file handle, must be allocated with
 *                 avformat_alloc_context().
 *                 Its \ref AVFormatContext.oformat "oformat" field must be set
 *                 to the desired output format;
 *                 Its \ref AVFormatContext.pb "pb" field must be set to an
 *                 already opened ::AVIOContext.
 * @param options  An ::AVDictionary filled with AVFormatContext and
 *                 muxer-private options.
 *                 On return this parameter will be destroyed and replaced with
 *                 a dict containing options that were not found. May be NULL.
 *
 * @retval AVSTREAM_INIT_IN_WRITE_HEADER On success, if the codec had not already been
 *                                       fully initialized in avformat_init_output().
 * @retval AVSTREAM_INIT_IN_INIT_OUTPUT  On success, if the codec had already been fully
 *                                       initialized in avformat_init_output().
 * @retval AVERROR                       A negative AVERROR on failure.
 *
 * @see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_init_output.
  }

function avformat_write_header(s:PAVFormatContext; options:PPAVDictionary):longint;cdecl;external libavformat;
{*
 * Allocate the stream private data and initialize the codec, but do not write the header.
 * May optionally be used before avformat_write_header() to initialize stream parameters
 * before actually writing the header.
 * If using this function, do not pass the same options to avformat_write_header().
 *
 * @param s        Media file handle, must be allocated with
 *                 avformat_alloc_context().
 *                 Its \ref AVFormatContext.oformat "oformat" field must be set
 *                 to the desired output format;
 *                 Its \ref AVFormatContext.pb "pb" field must be set to an
 *                 already opened ::AVIOContext.
 * @param options  An ::AVDictionary filled with AVFormatContext and
 *                 muxer-private options.
 *                 On return this parameter will be destroyed and replaced with
 *                 a dict containing options that were not found. May be NULL.
 *
 * @retval AVSTREAM_INIT_IN_WRITE_HEADER On success, if the codec requires
 *                                       avformat_write_header to fully initialize.
 * @retval AVSTREAM_INIT_IN_INIT_OUTPUT  On success, if the codec has been fully
 *                                       initialized.
 * @retval AVERROR                       Anegative AVERROR on failure.
 *
 * @see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_write_header.
  }
function avformat_init_output(s:PAVFormatContext; options:PPAVDictionary):longint;cdecl;external libavformat;
{*
 * Write a packet to an output media file.
 *
 * This function passes the packet directly to the muxer, without any buffering
 * or reordering. The caller is responsible for correctly interleaving the
 * packets if the format requires it. Callers that want libavformat to handle
 * the interleaving should call av_interleaved_write_frame() instead of this
 * function.
 *
 * @param s media file handle
 * @param pkt The packet containing the data to be written. Note that unlike
 *            av_interleaved_write_frame(), this function does not take
 *            ownership of the packet passed to it (though some muxers may make
 *            an internal reference to the input packet).
 *            <br>
 *            This parameter can be NULL (at any time, not just at the end), in
 *            order to immediately flush data buffered within the muxer, for
 *            muxers that buffer up data internally before writing it to the
 *            output.
 *            <br>
 *            Packet's @ref AVPacket.stream_index "stream_index" field must be
 *            set to the index of the corresponding stream in @ref
 *            AVFormatContext.streams "s->streams".
 *            <br>
 *            The timestamps (@ref AVPacket.pts "pts", @ref AVPacket.dts "dts")
 *            must be set to correct values in the stream's timebase (unless the
 *            output format is flagged with the AVFMT_NOTIMESTAMPS flag, then
 *            they can be set to AV_NOPTS_VALUE).
 *            The dts for subsequent packets passed to this function must be strictly
 *            increasing when compared in their respective timebases (unless the
 *            output format is flagged with the AVFMT_TS_NONSTRICT, then they
 *            merely have to be nondecreasing).  @ref AVPacket.duration
 *            "duration") should also be set if known.
 * @return < 0 on error, = 0 if OK, 1 if flushed and there is no more data to flush
 *
 * @see av_interleaved_write_frame()
  }
function av_write_frame(s:PAVFormatContext; pkt:PAVPacket):longint;cdecl;external libavformat;
{*
 * Write a packet to an output media file ensuring correct interleaving.
 *
 * This function will buffer the packets internally as needed to make sure the
 * packets in the output file are properly interleaved, usually ordered by
 * increasing dts. Callers doing their own interleaving should call
 * av_write_frame() instead of this function.
 *
 * Using this function instead of av_write_frame() can give muxers advance
 * knowledge of future packets, improving e.g. the behaviour of the mp4
 * muxer for VFR content in fragmenting mode.
 *
 * @param s media file handle
 * @param pkt The packet containing the data to be written.
 *            <br>
 *            If the packet is reference-counted, this function will take
 *            ownership of this reference and unreference it later when it sees
 *            fit. If the packet is not reference-counted, libavformat will
 *            make a copy.
 *            The returned packet will be blank (as if returned from
 *            av_packet_alloc()), even on error.
 *            <br>
 *            This parameter can be NULL (at any time, not just at the end), to
 *            flush the interleaving queues.
 *            <br>
 *            Packet's @ref AVPacket.stream_index "stream_index" field must be
 *            set to the index of the corresponding stream in @ref
 *            AVFormatContext.streams "s->streams".
 *            <br>
 *            The timestamps (@ref AVPacket.pts "pts", @ref AVPacket.dts "dts")
 *            must be set to correct values in the stream's timebase (unless the
 *            output format is flagged with the AVFMT_NOTIMESTAMPS flag, then
 *            they can be set to AV_NOPTS_VALUE).
 *            The dts for subsequent packets in one stream must be strictly
 *            increasing (unless the output format is flagged with the
 *            AVFMT_TS_NONSTRICT, then they merely have to be nondecreasing).
 *            @ref AVPacket.duration "duration" should also be set if known.
 *
 * @return 0 on success, a negative AVERROR on error.
 *
 * @see av_write_frame(), AVFormatContext.max_interleave_delta
  }
function av_interleaved_write_frame(s:PAVFormatContext; pkt:PAVPacket):longint;cdecl;external libavformat;
{*
 * Write an uncoded frame to an output media file.
 *
 * The frame must be correctly interleaved according to the container
 * specification; if not, av_interleaved_write_uncoded_frame() must be used.
 *
 * See av_interleaved_write_uncoded_frame() for details.
  }
function av_write_uncoded_frame(s:PAVFormatContext; stream_index:longint; frame:PAVFrame):longint;cdecl;external libavformat;
{*
 * Write an uncoded frame to an output media file.
 *
 * If the muxer supports it, this function makes it possible to write an AVFrame
 * structure directly, without encoding it into a packet.
 * It is mostly useful for devices and similar special muxers that use raw
 * video or PCM data and will not serialize it into a byte stream.
 *
 * To test whether it is possible to use it with a given muxer and stream,
 * use av_write_uncoded_frame_query().
 *
 * The caller gives up ownership of the frame and must not access it
 * afterwards.
 *
 * @return  >=0 for success, a negative code on error
  }
function av_interleaved_write_uncoded_frame(s:PAVFormatContext; stream_index:longint; frame:PAVFrame):longint;cdecl;external libavformat;
{*
 * Test whether a muxer supports uncoded frame.
 *
 * @return  >=0 if an uncoded frame can be written to that muxer and stream,
 *          <0 if not
  }
function av_write_uncoded_frame_query(s:PAVFormatContext; stream_index:longint):longint;cdecl;external libavformat;
{*
 * Write the stream trailer to an output media file and free the
 * file private data.
 *
 * May only be called after a successful call to avformat_write_header.
 *
 * @param s media file handle
 * @return 0 if OK, AVERROR_xxx on error
  }
function av_write_trailer(s:PAVFormatContext):longint;cdecl;external libavformat;
{*
 * Return the output format in the list of registered output formats
 * which best matches the provided parameters, or return NULL if
 * there is no match.
 *
 * @param short_name if non-NULL checks if short_name matches with the
 *                   names of the registered formats
 * @param filename   if non-NULL checks if filename terminates with the
 *                   extensions of the registered formats
 * @param mime_type  if non-NULL checks if mime_type matches with the
 *                   MIME type of the registered formats
  }
function av_guess_format(short_name:Pchar; filename:Pchar; mime_type:Pchar):PAVOutputFormat;cdecl;external libavformat;
{*
 * Guess the codec ID based upon muxer and filename.
  }
function av_guess_codec(fmt:PAVOutputFormat; short_name:Pchar; filename:Pchar; mime_type:Pchar; _type:TAVMediaType):TAVCodecID;cdecl;external libavformat;
{*
 * Get timing information for the data currently output.
 * The exact meaning of "currently output" depends on the format.
 * It is mostly relevant for devices that have an internal buffer and/or
 * work in real time.
 * @param s          media file handle
 * @param stream     stream in the media file
 * @param[out] dts   DTS of the last packet output for the stream, in stream
 *                   time_base units
 * @param[out] wall  absolute time when that packet whas output,
 *                   in microsecond
 * @retval  0               Success
 * @retval  AVERROR(ENOSYS) The format does not support it
 *
 * @note Some formats or devices may not allow to measure dts and wall
 *       atomically.
  }
function av_get_output_timestamp(s:PAVFormatContext; stream:longint; dts:Pint64_t; wall:Pint64_t):longint;cdecl;external libavformat;
{*
 * @
  }
{*
 * @defgroup lavf_misc Utility functions
 * @ingroup libavf
 * @
 *
 * Miscellaneous utility functions related to both muxing and demuxing
 * (or neither).
  }
{*
 * Send a nice hexadecimal dump of a buffer to the specified file stream.
 *
 * @param f The file stream pointer where the dump should be sent to.
 * @param buf buffer
 * @param size buffer size
 *
 * @see av_hex_dump_log, av_pkt_dump2, av_pkt_dump_log2
  }
procedure av_hex_dump(f:PFILE; buf:Puint8_t; size:longint);cdecl;external libavformat;
{*
 * Send a nice hexadecimal dump of a buffer to the log.
 *
 * @param avcl A pointer to an arbitrary struct of which the first field is a
 * pointer to an AVClass struct.
 * @param level The importance level of the message, lower values signifying
 * higher importance.
 * @param buf buffer
 * @param size buffer size
 *
 * @see av_hex_dump, av_pkt_dump2, av_pkt_dump_log2
  }
procedure av_hex_dump_log(avcl:pointer; level:longint; buf:Puint8_t; size:longint);cdecl;external libavformat;
{*
 * Send a nice dump of a packet to the specified file stream.
 *
 * @param f The file stream pointer where the dump should be sent to.
 * @param pkt packet to dump
 * @param dump_payload True if the payload must be displayed, too.
 * @param st AVStream that the packet belongs to
  }
procedure av_pkt_dump2(f:PFILE; pkt:PAVPacket; dump_payload:longint; st:PAVStream);cdecl;external libavformat;
{*
 * Send a nice dump of a packet to the log.
 *
 * @param avcl A pointer to an arbitrary struct of which the first field is a
 * pointer to an AVClass struct.
 * @param level The importance level of the message, lower values signifying
 * higher importance.
 * @param pkt packet to dump
 * @param dump_payload True if the payload must be displayed, too.
 * @param st AVStream that the packet belongs to
  }
procedure av_pkt_dump_log2(avcl:pointer; level:longint; pkt:PAVPacket; dump_payload:longint; st:PAVStream);cdecl;external libavformat;
{*
 * Get the AVCodecID for the given codec tag tag.
 * If no codec id is found returns AV_CODEC_ID_NONE.
 *
 * @param tags list of supported codec_id-codec_tag pairs, as stored
 * in AVInputFormat.codec_tag and AVOutputFormat.codec_tag
 * @param tag  codec tag to match to a codec ID
  }
function av_codec_get_id(tags:PPAVCodecTag; tag:dword):TAVCodecID;cdecl;external libavformat;
{*
 * Get the codec tag for the given codec id id.
 * If no codec tag is found returns 0.
 *
 * @param tags list of supported codec_id-codec_tag pairs, as stored
 * in AVInputFormat.codec_tag and AVOutputFormat.codec_tag
 * @param id   codec ID to match to a codec tag
  }
function av_codec_get_tag(tags:PPAVCodecTag; id:TAVCodecID):dword;cdecl;external libavformat;
{*
 * Get the codec tag for the given codec id.
 *
 * @param tags list of supported codec_id - codec_tag pairs, as stored
 * in AVInputFormat.codec_tag and AVOutputFormat.codec_tag
 * @param id codec id that should be searched for in the list
 * @param tag A pointer to the found tag
 * @return 0 if id was not found in tags, > 0 if it was found
  }
function av_codec_get_tag2(tags:PPAVCodecTag; id:TAVCodecID; tag:Pdword):longint;cdecl;external libavformat;
function av_find_default_stream_index(s:PAVFormatContext):longint;cdecl;external libavformat;
{*
 * Get the index for a specific timestamp.
 *
 * @param st        stream that the timestamp belongs to
 * @param timestamp timestamp to retrieve the index for
 * @param flags if AVSEEK_FLAG_BACKWARD then the returned index will correspond
 *                 to the timestamp which is <= the requested one, if backward
 *                 is 0, then it will be >=
 *              if AVSEEK_FLAG_ANY seek to any frame, only keyframes otherwise
 * @return < 0 if no such timestamp could be found
  }
function av_index_search_timestamp(st:PAVStream; timestamp:Tint64_t; flags:longint):longint;cdecl;external libavformat;
{*
 * Get the index entry count for the given AVStream.
 *
 * @param st stream
 * @return the number of index entries in the stream
  }
function avformat_index_get_entries_count(st:PAVStream):longint;cdecl;external libavformat;
{*
 * Get the AVIndexEntry corresponding to the given index.
 *
 * @param st          Stream containing the requested AVIndexEntry.
 * @param idx         The desired index.
 * @return A pointer to the requested AVIndexEntry if it exists, NULL otherwise.
 *
 * @note The pointer returned by this function is only guaranteed to be valid
 *       until any function that takes the stream or the parent AVFormatContext
 *       as input argument is called.
  }
function avformat_index_get_entry(st:PAVStream; idx:longint):PAVIndexEntry;cdecl;external libavformat;
{*
 * Get the AVIndexEntry corresponding to the given timestamp.
 *
 * @param st          Stream containing the requested AVIndexEntry.
 * @param wanted_timestamp   Timestamp to retrieve the index entry for.
 * @param flags       If AVSEEK_FLAG_BACKWARD then the returned entry will correspond
 *                    to the timestamp which is <= the requested one, if backward
 *                    is 0, then it will be >=
 *                    if AVSEEK_FLAG_ANY seek to any frame, only keyframes otherwise.
 * @return A pointer to the requested AVIndexEntry if it exists, NULL otherwise.
 *
 * @note The pointer returned by this function is only guaranteed to be valid
 *       until any function that takes the stream or the parent AVFormatContext
 *       as input argument is called.
  }
function avformat_index_get_entry_from_timestamp(st:PAVStream; wanted_timestamp:Tint64_t; flags:longint):PAVIndexEntry;cdecl;external libavformat;
{*
 * Add an index entry into a sorted list. Update the entry if the list
 * already contains it.
 *
 * @param timestamp timestamp in the time base of the given stream
  }
function av_add_index_entry(st:PAVStream; pos:Tint64_t; timestamp:Tint64_t; size:longint; distance:longint; 
           flags:longint):longint;cdecl;external libavformat;
{*
 * Split a URL string into components.
 *
 * The pointers to buffers for storing individual components may be null,
 * in order to ignore that component. Buffers for components not found are
 * set to empty strings. If the port is not found, it is set to a negative
 * value.
 *
 * @param proto the buffer for the protocol
 * @param proto_size the size of the proto buffer
 * @param authorization the buffer for the authorization
 * @param authorization_size the size of the authorization buffer
 * @param hostname the buffer for the host name
 * @param hostname_size the size of the hostname buffer
 * @param port_ptr a pointer to store the port number in
 * @param path the buffer for the path
 * @param path_size the size of the path buffer
 * @param url the URL to split
  }
procedure av_url_split(proto:Pchar; proto_size:longint; authorization:Pchar; authorization_size:longint; hostname:Pchar; 
            hostname_size:longint; port_ptr:Plongint; path:Pchar; path_size:longint; url:Pchar);cdecl;external libavformat;
{*
 * Print detailed information about the input or output format, such as
 * duration, bitrate, streams, container, programs, metadata, side data,
 * codec and time base.
 *
 * @param ic        the context to analyze
 * @param index     index of the stream to dump information about
 * @param url       the URL to print, such as source or destination file
 * @param is_output Select whether the specified context is an input(0) or output(1)
  }
procedure av_dump_format(ic:PAVFormatContext; index:longint; url:Pchar; is_output:longint);cdecl;external libavformat;
const
  AV_FRAME_FILENAME_FLAGS_MULTIPLE = 1;  {/< Allow multiple %d }
{*
 * Return in 'buf' the path with '%d' replaced by a number.
 *
 * Also handles the '%0nd' format where 'n' is the total number
 * of digits and '%%'.
 *
 * @param buf destination buffer
 * @param buf_size destination buffer size
 * @param path numbered sequence string
 * @param number frame number
 * @param flags AV_FRAME_FILENAME_FLAGS_*
 * @return 0 if OK, -1 on format error
  }

function av_get_frame_filename2(buf:Pchar; buf_size:longint; path:Pchar; number:longint; flags:longint):longint;cdecl;external libavformat;
function av_get_frame_filename(buf:Pchar; buf_size:longint; path:Pchar; number:longint):longint;cdecl;external libavformat;
{*
 * Check whether filename actually is a numbered sequence generator.
 *
 * @param filename possible numbered sequence string
 * @return 1 if a valid numbered sequence string, 0 otherwise
  }
function av_filename_number_test(filename:Pchar):longint;cdecl;external libavformat;
{*
 * Generate an SDP for an RTP session.
 *
 * Note, this overwrites the id values of AVStreams in the muxer contexts
 * for getting unique dynamic payload types.
 *
 * @param ac array of AVFormatContexts describing the RTP streams. If the
 *           array is composed by only one context, such context can contain
 *           multiple AVStreams (one AVStream per RTP stream). Otherwise,
 *           all the contexts in the array (an AVCodecContext per RTP stream)
 *           must contain only one AVStream.
 * @param n_files number of AVCodecContexts contained in ac
 * @param buf buffer where the SDP will be stored (must be allocated by
 *            the caller)
 * @param size the size of the buffer
 * @return 0 if OK, AVERROR_xxx on error
  }
function av_sdp_create(ac:PPAVFormatContext; n_files:longint; buf:Pchar; size:longint):longint;cdecl;external libavformat;
{*
 * Return a positive value if the given filename has one of the given
 * extensions, 0 otherwise.
 *
 * @param filename   file name to check against the given extensions
 * @param extensions a comma-separated list of filename extensions
  }
function av_match_ext(filename:Pchar; extensions:Pchar):longint;cdecl;external libavformat;
{*
 * Test if the given container can store a codec.
 *
 * @param ofmt           container to check for compatibility
 * @param codec_id       codec to potentially store in container
 * @param std_compliance standards compliance level, one of FF_COMPLIANCE_*
 *
 * @return 1 if codec with ID codec_id can be stored in ofmt, 0 if it cannot.
 *         A negative number if this information is not available.
  }
function avformat_query_codec(ofmt:PAVOutputFormat; codec_id:TAVCodecID; std_compliance:longint):longint;cdecl;external libavformat;
{*
 * @defgroup riff_fourcc RIFF FourCCs
 * @
 * Get the tables mapping RIFF FourCCs to libavcodec AVCodecIDs. The tables are
 * meant to be passed to av_codec_get_id()/av_codec_get_tag() as in the
 * following code:
 * @code
 * uint32_t tag = MKTAG('H', '2', '6', '4');
 * const struct AVCodecTag *table[] =  avformat_get_riff_video_tags(), 0 ;
 * enum AVCodecID id = av_codec_get_id(table, tag);
 * @endcode
  }
{*
 * @return the table mapping RIFF FourCCs for video to libavcodec AVCodecID.
  }
function avformat_get_riff_video_tags:PAVCodecTag;cdecl;external libavformat;
{*
 * @return the table mapping RIFF FourCCs for audio to AVCodecID.
  }
function avformat_get_riff_audio_tags:PAVCodecTag;cdecl;external libavformat;
{*
 * @return the table mapping MOV FourCCs for video to libavcodec AVCodecID.
  }
function avformat_get_mov_video_tags:PAVCodecTag;cdecl;external libavformat;
{*
 * @return the table mapping MOV FourCCs for audio to AVCodecID.
  }
function avformat_get_mov_audio_tags:PAVCodecTag;cdecl;external libavformat;
{*
 * @
  }
{*
 * Guess the sample aspect ratio of a frame, based on both the stream and the
 * frame aspect ratio.
 *
 * Since the frame aspect ratio is set by the codec but the stream aspect ratio
 * is set by the demuxer, these two may not be equal. This function tries to
 * return the value that you should use if you would like to display the frame.
 *
 * Basic logic is to use the stream aspect ratio if it is set to something sane
 * otherwise use the frame aspect ratio. This way a container setting, which is
 * usually easy to modify can override the coded value in the frames.
 *
 * @param format the format context which the stream is part of
 * @param stream the stream which the frame is part of
 * @param frame the frame with the aspect ratio to be determined
 * @return the guessed (valid) sample_aspect_ratio, 0/1 if no idea
  }
function av_guess_sample_aspect_ratio(format:PAVFormatContext; stream:PAVStream; frame:PAVFrame):TAVRational;cdecl;external libavformat;
{*
 * Guess the frame rate, based on both the container and codec information.
 *
 * @param ctx the format context which the stream is part of
 * @param stream the stream which the frame is part of
 * @param frame the frame for which the frame rate should be determined, may be NULL
 * @return the guessed (valid) frame rate, 0/1 if no idea
  }
function av_guess_frame_rate(ctx:PAVFormatContext; stream:PAVStream; frame:PAVFrame):TAVRational;cdecl;external libavformat;
{*
 * Check if the stream st contained in s is matched by the stream specifier
 * spec.
 *
 * See the "stream specifiers" chapter in the documentation for the syntax
 * of spec.
 *
 * @return  >0 if st is matched by spec;
 *          0  if st is not matched by spec;
 *          AVERROR code if spec is invalid
 *
 * @note  A stream specifier can match several streams in the format.
  }
function avformat_match_stream_specifier(s:PAVFormatContext; st:PAVStream; spec:Pchar):longint;cdecl;external libavformat;
function avformat_queue_attached_pictures(s:PAVFormatContext):longint;cdecl;external libavformat;
{$if FF_API_R_FRAME_RATE}
{$endif}
type
  TAVTimebaseSource =  Longint;
  Const
    AVFMT_TBCF_AUTO = -(1);
    AVFMT_TBCF_DECODER = (-(1))+1;
    AVFMT_TBCF_DEMUXER = (-(1))+2;
    AVFMT_TBCF_R_FRAMERATE = (-(1))+3;

{*
 * Transfer internal timing information from one stream to another.
 *
 * This function is useful when doing stream copy.
 *
 * @param ofmt     target output format for ost
 * @param ost      output stream which needs timings copy and adjustments
 * @param ist      reference input stream to copy timings from
 * @param copy_tb  define from where the stream codec timebase needs to be imported
  }

function avformat_transfer_internal_stream_timing_info(ofmt:PAVOutputFormat; ost:PAVStream; ist:PAVStream; copy_tb:TAVTimebaseSource):longint;cdecl;external libavformat;
{*
 * Get the internal codec timebase from a stream.
 *
 * @param st  input stream to extract the timebase from
  }
function av_stream_get_codec_timebase(st:PAVStream):TAVRational;cdecl;external libavformat;
{*
 * @
  }
{$endif}
{ AVFORMAT_AVFORMAT_H  }

// === Konventiert am: 14-12-25 15:21:18 ===


implementation


function flags(var a : AVIndexEntry) : longint;
begin
  flags:=(a.flag0 and bm_AVIndexEntry_flags) shr bp_AVIndexEntry_flags;
end;

procedure set_flags(var a : AVIndexEntry; __flags : longint);
begin
  a.flag0:=a.flag0 or ((__flags shl bp_AVIndexEntry_flags) and bm_AVIndexEntry_flags);
end;

function size(var a : AVIndexEntry) : longint;
begin
  size:=(a.flag0 and bm_AVIndexEntry_size) shr bp_AVIndexEntry_size;
end;

procedure set_size(var a : AVIndexEntry; __size : longint);
begin
  a.flag0:=a.flag0 or ((__size shl bp_AVIndexEntry_size) and bm_AVIndexEntry_size);
end;


end.

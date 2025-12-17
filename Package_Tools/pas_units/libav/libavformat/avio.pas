unit avio;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  AVIO_SEEKABLE_NORMAL = 1 shl 0;  
  AVIO_SEEKABLE_TIME = 1 shl 1;
type
  TAVIOInterruptCB = record
      callback : function (para1:pointer):longint;cdecl;
      opaque : pointer;
    end;
  PAVIOInterruptCB = ^TAVIOInterruptCB;
type  TAVIODirEntryType =  Longint;
  Const
    AVIO_ENTRY_UNKNOWN = 0;
    AVIO_ENTRY_BLOCK_DEVICE = 1;
    AVIO_ENTRY_CHARACTER_DEVICE = 2;
    AVIO_ENTRY_DIRECTORY = 3;
    AVIO_ENTRY_NAMED_PIPE = 4;
    AVIO_ENTRY_SYMBOLIC_LINK = 5;
    AVIO_ENTRY_SOCKET = 6;
    AVIO_ENTRY_FILE = 7;
    AVIO_ENTRY_SERVER = 8;
    AVIO_ENTRY_SHARE = 9;
    AVIO_ENTRY_WORKGROUP = 10;

type
  TAVIODirEntry = record
      name : Pchar;
      _type : longint;
      utf8 : longint;
      size : Tint64_t;
      modification_timestamp : Tint64_t;
      access_timestamp : Tint64_t;
      status_change_timestamp : Tint64_t;
      user_id : Tint64_t;
      group_id : Tint64_t;
      filemode : Tint64_t;
    end;
  PAVIODirEntry = ^TAVIODirEntry;
  PPAVIODirEntry = ^PAVIODirEntry;

type
  PAVIODirContext = type Pointer;
  PPAVIODirContext=^PAVIODirContext;
type
  TAVIODataMarkerType =  Longint;
  Const
    AVIO_DATA_MARKER_HEADER = 0;
    AVIO_DATA_MARKER_SYNC_POINT = 1;
    AVIO_DATA_MARKER_BOUNDARY_POINT = 2;
    AVIO_DATA_MARKER_UNKNOWN = 3;
    AVIO_DATA_MARKER_TRAILER = 4;
    AVIO_DATA_MARKER_FLUSH_POINT = 5;

type
  PAVIOContext = ^TAVIOContext;
  PPAVIOContext = ^PAVIOContext;
  TAVIOContext = record
      av_class : PAVClass;
      buffer : Pbyte;
      buffer_size : longint;
      buf_ptr : Pbyte;
      buf_end : Pbyte;
      opaque : pointer;
      read_packet : function (opaque:pointer; buf:Puint8_t; buf_size:longint):longint;cdecl;
      write_packet : function (opaque:pointer; buf:Puint8_t; buf_size:longint):longint;cdecl;
      seek : function (opaque:pointer; offset:Tint64_t; whence:longint):Tint64_t;cdecl;
      pos : Tint64_t;
      eof_reached : longint;
      error : longint;
      write_flag : longint;
      max_packet_size : longint;
      min_packet_size : longint;
      checksum : dword;
      checksum_ptr : Pbyte;
      update_checksum : function (checksum:dword; buf:Puint8_t; size:dword):dword;cdecl;
      read_pause : function (opaque:pointer; pause:longint):longint;cdecl;
      read_seek : function (opaque:pointer; stream_index:longint; timestamp:Tint64_t; flags:longint):Tint64_t;cdecl;
      seekable : longint;
      direct : longint;
      protocol_whitelist : Pchar;
      protocol_blacklist : Pchar;
      write_data_type : function (opaque:pointer; buf:Puint8_t; buf_size:longint; _type:TAVIODataMarkerType; time:Tint64_t):longint;cdecl;
      ignore_boundary_point : longint;
      buf_ptr_max : Pbyte;
      bytes_read : Tint64_t;
      bytes_written : Tint64_t;
    end;

function avio_find_protocol_name(url:Pchar):Pchar;cdecl;external libavformat;
function avio_check(url:Pchar; flags:longint):longint;cdecl;external libavformat;
function avio_open_dir(s:PPAVIODirContext; url:Pchar; options:PPAVDictionary):longint;cdecl;external libavformat;
function avio_read_dir(s:PAVIODirContext; next:PPAVIODirEntry):longint;cdecl;external libavformat;
function avio_close_dir(s:PPAVIODirContext):longint;cdecl;external libavformat;
procedure avio_free_directory_entry(entry:PPAVIODirEntry);cdecl;external libavformat;

function avio_alloc_context(buffer:Pbyte; buffer_size:longint; write_flag:longint; opaque:pointer; read_packet:function (opaque:pointer; buf:Puint8_t; buf_size:longint):longint; 
           write_packet:function (opaque:pointer; buf:Puint8_t; buf_size:longint):longint; write_packet:function (opaque:pointer; buf:Puint8_t; buf_size:longint):longint; seek:function (opaque:pointer; offset:Tint64_t; whence:longint):Tint64_t):PAVIOContext;cdecl;external libavformat;
{*
 * Free the supplied IO context and everything associated with it.
 *
 * @param s Double pointer to the IO context. This function will write NULL
 * into s.
  }
procedure avio_context_free(s:PPAVIOContext);cdecl;external libavformat;
procedure avio_w8(s:PAVIOContext; b:longint);cdecl;external libavformat;
procedure avio_write(s:PAVIOContext; buf:Pbyte; size:longint);cdecl;external libavformat;
procedure avio_wl64(s:PAVIOContext; val:Tuint64_t);cdecl;external libavformat;
procedure avio_wb64(s:PAVIOContext; val:Tuint64_t);cdecl;external libavformat;
procedure avio_wl32(s:PAVIOContext; val:dword);cdecl;external libavformat;
procedure avio_wb32(s:PAVIOContext; val:dword);cdecl;external libavformat;
procedure avio_wl24(s:PAVIOContext; val:dword);cdecl;external libavformat;
procedure avio_wb24(s:PAVIOContext; val:dword);cdecl;external libavformat;
procedure avio_wl16(s:PAVIOContext; val:dword);cdecl;external libavformat;
procedure avio_wb16(s:PAVIOContext; val:dword);cdecl;external libavformat;
{*
 * Write a NULL-terminated string.
 * @return number of bytes written.
  }
function avio_put_str(s:PAVIOContext; str:Pchar):longint;cdecl;external libavformat;
{*
 * Convert an UTF-8 string to UTF-16LE and write it.
 * @param s the AVIOContext
 * @param str NULL-terminated UTF-8 string
 *
 * @return number of bytes written.
  }
function avio_put_str16le(s:PAVIOContext; str:Pchar):longint;cdecl;external libavformat;
{*
 * Convert an UTF-8 string to UTF-16BE and write it.
 * @param s the AVIOContext
 * @param str NULL-terminated UTF-8 string
 *
 * @return number of bytes written.
  }
function avio_put_str16be(s:PAVIOContext; str:Pchar):longint;cdecl;external libavformat;
{*
 * Mark the written bytestream as a specific type.
 *
 * Zero-length ranges are omitted from the output.
 *
 * @param s    the AVIOContext
 * @param time the stream time the current bytestream pos corresponds to
 *             (in AV_TIME_BASE units), or AV_NOPTS_VALUE if unknown or not
 *             applicable
 * @param type the kind of data written starting at the current pos
  }
procedure avio_write_marker(s:PAVIOContext; time:Tint64_t; _type:TAVIODataMarkerType);cdecl;external libavformat;
{*
 * ORing this as the "whence" parameter to a seek function causes it to
 * return the filesize without seeking anywhere. Supporting this is optional.
 * If it is not supported then the seek function will return <0.
  }
const
  AVSEEK_SIZE = $10000;  
{*
 * Passing this flag as the "whence" parameter to a seek function causes it to
 * seek by any means (like reopening and linear reading) or other normally unreasonable
 * means that can be extremely slow.
 * This may be ignored by the seek code.
  }
  AVSEEK_FORCE = $20000;  
{*
 * fseek() equivalent for AVIOContext.
 * @return new position or AVERROR.
  }

function avio_seek(s:PAVIOContext; offset:Tint64_t; whence:longint):Tint64_t;cdecl;external libavformat;
{*
 * Skip given number of bytes forward
 * @return new position or AVERROR.
  }
function avio_skip(s:PAVIOContext; offset:Tint64_t):Tint64_t;cdecl;external libavformat;
{*
 * ftell() equivalent for AVIOContext.
 * @return position or AVERROR.
  }
{xxxxxxxxxxxx
static av_always_inline int64_t avio_tell(AVIOContext *s)

    return avio_seek(s, 0, SEEK_CUR);

 }
{*
 * Get the filesize.
 * @return filesize or AVERROR
  }
function avio_size(s:PAVIOContext):Tint64_t;cdecl;external libavformat;
{*
 * Similar to feof() but also returns nonzero on read errors.
 * @return non zero if and only if at end of file or a read error happened when reading.
  }
function avio_feof(s:PAVIOContext):longint;cdecl;external libavformat;
{*
 * Writes a formatted string to the context taking a va_list.
 * @return number of bytes written, < 0 on error.
  }
function avio_vprintf(s:PAVIOContext; fmt:Pchar; ap:Tva_list):longint;cdecl;external libavformat;
{*
 * Writes a formatted string to the context.
 * @return number of bytes written, < 0 on error.
  }
function avio_printf(s:PAVIOContext; fmt:Pchar; args:array of const):longint;cdecl;external libavformat;
function avio_printf(s:PAVIOContext; fmt:Pchar):longint;cdecl;external libavformat;
{*
 * Write a NULL terminated array of strings to the context.
 * Usually you don't need to use this function directly but its macro wrapper,
 * avio_print.
  }
procedure avio_print_string_array(s:PAVIOContext; strings:PPchar);cdecl;external libavformat;
{*
 * Write strings (const char *) to the context.
 * This is a convenience macro around avio_print_string_array and it
 * automatically creates the string array from the variable argument list.
 * For simple string concatenations this function is more performant than using
 * avio_printf since it does not need a temporary buffer.
  }
{ xxxxxxxxxx #define avio_print(s, ...) avio_print_string_array(s, (const char*[])__VA_ARGS__, NULL) }
{*
 * Force flushing of buffered data.
 *
 * For write streams, force the buffered data to be immediately written to the output,
 * without to wait to fill the internal buffer.
 *
 * For read streams, discard all currently buffered data, and advance the
 * reported file position to that of the underlying stream. This does not
 * read new data, and does not perform any seeks.
  }
procedure avio_flush(s:PAVIOContext);cdecl;external libavformat;
{*
 * Read size bytes from AVIOContext into buf.
 * @return number of bytes read or AVERROR
  }
function avio_read(s:PAVIOContext; buf:Pbyte; size:longint):longint;cdecl;external libavformat;
{*
 * Read size bytes from AVIOContext into buf. Unlike avio_read(), this is allowed
 * to read fewer bytes than requested. The missing bytes can be read in the next
 * call. This always tries to read at least 1 byte.
 * Useful to reduce latency in certain cases.
 * @return number of bytes read or AVERROR
  }
function avio_read_partial(s:PAVIOContext; buf:Pbyte; size:longint):longint;cdecl;external libavformat;
{*
 * @name Functions for reading from AVIOContext
 * @
 *
 * @note return 0 if EOF, so you cannot use it if EOF handling is
 *       necessary
  }
function avio_r8(s:PAVIOContext):longint;cdecl;external libavformat;
function avio_rl16(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rl24(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rl32(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rl64(s:PAVIOContext):Tuint64_t;cdecl;external libavformat;
function avio_rb16(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rb24(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rb32(s:PAVIOContext):dword;cdecl;external libavformat;
function avio_rb64(s:PAVIOContext):Tuint64_t;cdecl;external libavformat;
{*
 * @
  }
{*
 * Read a string from pb into buf. The reading will terminate when either
 * a NULL character was encountered, maxlen bytes have been read, or nothing
 * more can be read from pb. The result is guaranteed to be NULL-terminated, it
 * will be truncated if buf is too small.
 * Note that the string is not interpreted or validated in any way, it
 * might get truncated in the middle of a sequence for multi-byte encodings.
 *
 * @return number of bytes read (is always <= maxlen).
 * If reading ends on EOF or error, the return value will be one more than
 * bytes actually read.
  }
function avio_get_str(pb:PAVIOContext; maxlen:longint; buf:Pchar; buflen:longint):longint;cdecl;external libavformat;
{*
 * Read a UTF-16 string from pb and convert it to UTF-8.
 * The reading will terminate when either a null or invalid character was
 * encountered or maxlen bytes have been read.
 * @return number of bytes read (is always <= maxlen)
  }
function avio_get_str16le(pb:PAVIOContext; maxlen:longint; buf:Pchar; buflen:longint):longint;cdecl;external libavformat;
function avio_get_str16be(pb:PAVIOContext; maxlen:longint; buf:Pchar; buflen:longint):longint;cdecl;external libavformat;
{*
 * @name URL open modes
 * The flags argument to avio_open must be one of the following
 * constants, optionally ORed with other flags.
 * @
  }
{*< read-only  }
const
  AVIO_FLAG_READ = 1;  
{*< write-only  }
  AVIO_FLAG_WRITE = 2;  
{*< read-write pseudo flag  }
  AVIO_FLAG_READ_WRITE = AVIO_FLAG_READ or AVIO_FLAG_WRITE;  
{*
 * @
  }
{*
 * Use non-blocking mode.
 * If this flag is set, operations on the context will return
 * AVERROR(EAGAIN) if they can not be performed immediately.
 * If this flag is not set, operations on the context will never return
 * AVERROR(EAGAIN).
 * Note that this flag does not affect the opening/connecting of the
 * context. Connecting a protocol will always block if necessary (e.g. on
 * network protocols) but never hang (e.g. on busy devices).
 * Warning: non-blocking protocols is work-in-progress; this flag may be
 * silently ignored.
  }
  AVIO_FLAG_NONBLOCK = 8;  
{*
 * Use direct mode.
 * avio_read and avio_write should if possible be satisfied directly
 * instead of going through a buffer, and avio_seek will always
 * call the underlying seek function directly.
  }
  AVIO_FLAG_DIRECT = $8000;  
{*
 * Create and initialize a AVIOContext for accessing the
 * resource indicated by url.
 * @note When the resource indicated by url has been opened in
 * read+write mode, the AVIOContext can be used only for writing.
 *
 * @param s Used to return the pointer to the created AVIOContext.
 * In case of failure the pointed to value is set to NULL.
 * @param url resource to access
 * @param flags flags which control how the resource indicated by url
 * is to be opened
 * @return >= 0 in case of success, a negative value corresponding to an
 * AVERROR code in case of failure
  }

function avio_open(s:PPAVIOContext; url:Pchar; flags:longint):longint;cdecl;external libavformat;
{*
 * Create and initialize a AVIOContext for accessing the
 * resource indicated by url.
 * @note When the resource indicated by url has been opened in
 * read+write mode, the AVIOContext can be used only for writing.
 *
 * @param s Used to return the pointer to the created AVIOContext.
 * In case of failure the pointed to value is set to NULL.
 * @param url resource to access
 * @param flags flags which control how the resource indicated by url
 * is to be opened
 * @param int_cb an interrupt callback to be used at the protocols level
 * @param options  A dictionary filled with protocol-private options. On return
 * this parameter will be destroyed and replaced with a dict containing options
 * that were not found. May be NULL.
 * @return >= 0 in case of success, a negative value corresponding to an
 * AVERROR code in case of failure
  }
function avio_open2(s:PPAVIOContext; url:Pchar; flags:longint; int_cb:PAVIOInterruptCB; options:PPAVDictionary):longint;cdecl;external libavformat;
{*
 * Close the resource accessed by the AVIOContext s and free it.
 * This function can only be used if s was opened by avio_open().
 *
 * The internal buffer is automatically flushed before closing the
 * resource.
 *
 * @return 0 on success, an AVERROR < 0 on error.
 * @see avio_closep
  }
function avio_close(s:PAVIOContext):longint;cdecl;external libavformat;
{*
 * Close the resource accessed by the AVIOContext *s, free it
 * and set the pointer pointing to it to NULL.
 * This function can only be used if s was opened by avio_open().
 *
 * The internal buffer is automatically flushed before closing the
 * resource.
 *
 * @return 0 on success, an AVERROR < 0 on error.
 * @see avio_close
  }
function avio_closep(s:PPAVIOContext):longint;cdecl;external libavformat;
{*
 * Open a write only memory stream.
 *
 * @param s new IO context
 * @return zero if no error.
  }
function avio_open_dyn_buf(s:PPAVIOContext):longint;cdecl;external libavformat;
{*
 * Return the written size and a pointer to the buffer.
 * The AVIOContext stream is left intact.
 * The buffer must NOT be freed.
 * No padding is added to the buffer.
 *
 * @param s IO context
 * @param pbuffer pointer to a byte buffer
 * @return the length of the byte buffer
  }
function avio_get_dyn_buf(s:PAVIOContext; pbuffer:PPuint8_t):longint;cdecl;external libavformat;
{*
 * Return the written size and a pointer to the buffer. The buffer
 * must be freed with av_free().
 * Padding of AV_INPUT_BUFFER_PADDING_SIZE is added to the buffer.
 *
 * @param s IO context
 * @param pbuffer pointer to a byte buffer
 * @return the length of the byte buffer
  }
function avio_close_dyn_buf(s:PAVIOContext; pbuffer:PPuint8_t):longint;cdecl;external libavformat;
{*
 * Iterate through names of available protocols.
 *
 * @param opaque A private pointer representing current protocol.
 *        It must be a pointer to NULL on first iteration and will
 *        be updated by successive calls to avio_enum_protocols.
 * @param output If set to 1, iterate over output protocols,
 *               otherwise over input protocols.
 *
 * @return A static string containing the name of current protocol or NULL
  }
function avio_enum_protocols(opaque:Ppointer; output:longint):Pchar;cdecl;external libavformat;
{*
 * Get AVClass by names of available protocols.
 *
 * @return A AVClass of input protocol name or NULL
  }
function avio_protocol_get_class(name:Pchar):PAVClass;cdecl;external libavformat;
{*
 * Pause and resume playing - only meaningful if using a network streaming
 * protocol (e.g. MMS).
 *
 * @param h     IO context from which to call the read_pause function pointer
 * @param pause 1 for pause, 0 for resume
  }
function avio_pause(h:PAVIOContext; pause:longint):longint;cdecl;external libavformat;
{*
 * Seek to a given timestamp relative to some component stream.
 * Only meaningful if using a network streaming protocol (e.g. MMS.).
 *
 * @param h IO context from which to call the seek function pointers
 * @param stream_index The stream index that the timestamp is relative to.
 *        If stream_index is (-1) the timestamp should be in AV_TIME_BASE
 *        units from the beginning of the presentation.
 *        If a stream_index >= 0 is used and the protocol does not support
 *        seeking based on component streams, the call will fail.
 * @param timestamp timestamp in AVStream.time_base units
 *        or if there is no stream specified then in AV_TIME_BASE units.
 * @param flags Optional combination of AVSEEK_FLAG_BACKWARD, AVSEEK_FLAG_BYTE
 *        and AVSEEK_FLAG_ANY. The protocol may silently ignore
 *        AVSEEK_FLAG_BACKWARD and AVSEEK_FLAG_ANY, but AVSEEK_FLAG_BYTE will
 *        fail if used and not supported.
 * @return >= 0 on success
 * @see AVInputFormat::read_seek
  }
function avio_seek_time(h:PAVIOContext; stream_index:longint; timestamp:Tint64_t; flags:longint):Tint64_t;cdecl;external libavformat;
{ Avoid a warning. The header can not be included because it breaks c++.  }
type
  PAVBPrint = ^TAVBPrint;
  TAVBPrint = record
      {undefined structure}
    end;

{*
 * Read contents of h into print buffer, up to max_size bytes, or up to EOF.
 *
 * @return 0 for success (max_size bytes read or EOF reached), negative error
 * code otherwise
  }

function avio_read_to_bprint(h:PAVIOContext; pb:PAVBPrint; max_size:Tsize_t):longint;cdecl;external libavformat;
{*
 * Accept and allocate a client context on a server context.
 * @param  s the server context
 * @param  c the client context, must be unallocated
 * @return   >= 0 on success or a negative value corresponding
 *           to an AVERROR on failure
  }
function avio_accept(s:PAVIOContext; c:PPAVIOContext):longint;cdecl;external libavformat;
{*
 * Perform one step of the protocol handshake to accept a new client.
 * This function must be called on a client returned by avio_accept() before
 * using it as a read/write context.
 * It is separate from avio_accept() because it may block.
 * A step of the handshake is defined by places where the application may
 * decide to change the proceedings.
 * For example, on a protocol with a request header and a reply header, each
 * one can constitute a step because the application may use the parameters
 * from the request to change parameters in the reply; or each individual
 * chunk of the request can constitute a step.
 * If the handshake is already finished, avio_handshake() does nothing and
 * returns 0 immediately.
 *
 * @param  c the client context to perform the handshake on
 * @return   0   on a complete and successful handshake
 *           > 0 if the handshake progressed, but is not complete
 *           < 0 for an AVERROR code
  }
function avio_handshake(c:PAVIOContext):longint;cdecl;external libavformat;
{$endif}
{ AVFORMAT_AVIO_H  }

// === Konventiert am: 14-12-25 15:21:21 ===


implementation



end.

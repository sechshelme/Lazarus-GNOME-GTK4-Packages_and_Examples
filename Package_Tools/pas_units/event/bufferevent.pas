unit bufferevent;

interface

uses
  fp_event;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2000-2007 Niels Provos <provos@citi.umich.edu>
 * Copyright (c) 2007-2012 Niels Provos and Nick Mathewson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef EVENT2_BUFFEREVENT_H_INCLUDED_}
{$define EVENT2_BUFFEREVENT_H_INCLUDED_}
{*
   @file event2/bufferevent.h

  Functions for buffering data for network sending or receiving.  Bufferevents
  are higher level than evbuffers: each has an underlying evbuffer for reading
  and one for writing, and callbacks that are invoked under certain
  circumstances.

  A bufferevent provides input and output buffers that get filled and
  drained automatically.  The user of a bufferevent no longer deals
  directly with the I/O, but instead is reading from input and writing
  to output buffers.

  Once initialized, the bufferevent structure can be used repeatedly
  with bufferevent_enable() and bufferevent_disable().

  When reading is enabled, the bufferevent will try to read from the
  file descriptor onto its input buffer, and call the read callback.
  When writing is enabled, the bufferevent will try to write data onto its
  file descriptor when the output buffer has enough data, and call the write
  callback when the output buffer is sufficiently drained.

  Bufferevents come in several flavors, including:

  <dl>
    <dt>Socket-based bufferevents</dt>
      <dd>A bufferevent that reads and writes data onto a network
          socket. Created with bufferevent_socket_new().</dd>

    <dt>Paired bufferevents</dt>
      <dd>A pair of bufferevents that send and receive data to one
          another without touching the network.  Created with
          bufferevent_pair_new().</dd>

    <dt>Filtering bufferevents</dt>
       <dd>A bufferevent that transforms data, and sends or receives it
          over another underlying bufferevent.  Created with
          bufferevent_filter_new().</dd>

    <dt>SSL-backed bufferevents</dt>
      <dd>A bufferevent that uses the openssl library to send and
          receive data over an encrypted connection. Created with
	  bufferevent_openssl_socket_new() or
	  bufferevent_openssl_filter_new().</dd>
  </dl>
  }
{$include <event2/visibility.h>}
{ C++ extern C conditionnal removed }
{$include <event2/event-config.h>}
{$ifdef EVENT__HAVE_SYS_TYPES_H}
{$include <sys/types.h>}
{$endif}
{$ifdef EVENT__HAVE_SYS_TIME_H}
{$include <sys/time.h>}
{$endif}
{ For int types.  }
{$include <event2/util.h>}
{* @name Bufferevent event codes

    These flags are passed as arguments to a bufferevent's event callback.

    @
 }
{*< error encountered while reading  }

const
  BEV_EVENT_READING = $01;  
{*< error encountered while writing  }
  BEV_EVENT_WRITING = $02;  
{*< eof file reached  }
  BEV_EVENT_EOF = $10;  
{*< unrecoverable error encountered  }
  BEV_EVENT_ERROR = $20;  
{*< user-specified timeout reached  }
  BEV_EVENT_TIMEOUT = $40;  
{*< connect operation finished.  }
  BEV_EVENT_CONNECTED = $80;  
{*@ }
{*
   An opaque type for handling buffered IO

   @see event2/bufferevent.h
  }
type
  Pbufferevent = ^Tbufferevent;
  Tbufferevent = record
      {undefined structure}
    end;

  Pevent_base = ^Tevent_base;
  Tevent_base = record
      {undefined structure}
    end;

  Pevbuffer = ^Tevbuffer;
  Tevbuffer = record
      {undefined structure}
    end;

  Psockaddr = ^Tsockaddr;
  Tsockaddr = record
      {undefined structure}
    end;

{*
   A read or write callback for a bufferevent.

   The read callback is triggered when new data arrives in the input
   buffer and the amount of readable data exceed the low watermark
   which is 0 by default.

   The write callback is triggered if the write buffer has been
   exhausted or fell below its low watermark.

   @param bev the bufferevent that triggered the callback
   @param ctx the user-specified context for this bufferevent
  }

  Tbufferevent_data_cb = procedure (bev:Pbufferevent; ctx:pointer);cdecl;
{*
   An event/error callback for a bufferevent.

   The event callback is triggered if either an EOF condition or another
   unrecoverable error was encountered.

   For bufferevents with deferred callbacks, this is a bitwise OR of all errors
   that have happened on the bufferevent since the last callback invocation.

   @param bev the bufferevent for which the error condition was reached
   @param what a conjunction of flags: BEV_EVENT_READING or BEV_EVENT_WRITING
	  to indicate if the error was encountered on the read or write path,
	  and one of the following flags: BEV_EVENT_EOF, BEV_EVENT_ERROR,
	  BEV_EVENT_TIMEOUT, BEV_EVENT_CONNECTED.

   @param ctx the user-specified context for this bufferevent
 }

  Tbufferevent_event_cb = procedure (bev:Pbufferevent; what:smallint; ctx:pointer);cdecl;
{* Options that can be specified when creating a bufferevent  }
{* If set, we close the underlying file
	 * descriptor/bufferevent/whatever when this bufferevent is freed.  }
{* If set, and threading is enabled, operations on this bufferevent
	 * are protected by a lock  }
{* If set, callbacks are run deferred in the event loop.  }
{* If set, callbacks are executed without locks being held on the
	* bufferevent.  This option currently requires that
	* BEV_OPT_DEFER_CALLBACKS also be set; a future version of Libevent
	* might remove the requirement. }
  Tbufferevent_options =  Longint;
  Const
    BEV_OPT_CLOSE_ON_FREE = 1 shl 0;
    BEV_OPT_THREADSAFE = 1 shl 1;
    BEV_OPT_DEFER_CALLBACKS = 1 shl 2;
    BEV_OPT_UNLOCK_CALLBACKS = 1 shl 3;

{*
  Create a new socket bufferevent over an existing socket.

  @param base the event base to associate with the new bufferevent.
  @param fd the file descriptor from which data is read and written to.
	    This file descriptor is not allowed to be a pipe(2).
	    It is safe to set the fd to -1, so long as you later
	    set it with bufferevent_setfd or bufferevent_socket_connect().
  @param options Zero or more BEV_OPT_* flags
  @return a pointer to a newly allocated bufferevent struct, or NULL if an
	  error occurred
  @see bufferevent_free()
   }

function bufferevent_socket_new(base:Pevent_base; fd:Tevutil_socket_t; options:longint):Pbufferevent;cdecl;external libevent;
{*
   Launch a connect() attempt with a socket-based bufferevent.

   When the connect succeeds, the eventcb will be invoked with
   BEV_EVENT_CONNECTED set.

   If the bufferevent does not already have a socket set, we allocate a new
   socket here and make it nonblocking before we begin.

   If no address is provided, we assume that the socket is already connecting,
   and configure the bufferevent so that a BEV_EVENT_CONNECTED event will be
   yielded when it is done connecting.

   @param bufev an existing bufferevent allocated with
       bufferevent_socket_new().
   @param addr the address we should connect to
   @param socklen The length of the address
   @return 0 on success, -1 on failure.
  }
function bufferevent_socket_connect(para1:Pbufferevent; para2:Psockaddr; para3:longint):longint;cdecl;external libevent;
type
  Pevdns_base = ^Tevdns_base;
  Tevdns_base = record
      {undefined structure}
    end;

{*
   Resolve the hostname 'hostname' and connect to it as with
   bufferevent_socket_connect().

   @param bufev An existing bufferevent allocated with bufferevent_socket_new()
   @param evdns_base Optionally, an evdns_base to use for resolving hostnames
      asynchronously. May be set to NULL for a blocking resolve.
   @param family A preferred address family to resolve addresses to, or
      AF_UNSPEC for no preference.  Only AF_INET, AF_INET6, and AF_UNSPEC are
      supported.
   @param hostname The hostname to resolve; see below for notes on recognized
      formats
   @param port The port to connect to on the resolved address.
   @return 0 if successful, -1 on failure.

   Recognized hostname formats are:

       www.example.com	(hostname)
       1.2.3.4		(ipv4address)
       ::1		(ipv6address)
       [::1]		([ipv6address])

   Performance note: If you do not provide an evdns_base, this function
   may block while it waits for a DNS response.	 This is probably not
   what you want.
  }

function bufferevent_socket_connect_hostname(para1:Pbufferevent; para2:Pevdns_base; para3:longint; para4:Pchar; para5:longint):longint;cdecl;external libevent;
{*
   Return the error code for the last failed DNS lookup attempt made by
   bufferevent_socket_connect_hostname().

   @param bev The bufferevent object.
   @return DNS error code.
   @see evutil_gai_strerror()
 }
function bufferevent_socket_get_dns_error(bev:Pbufferevent):longint;cdecl;external libevent;
{*
  Assign a bufferevent to a specific event_base.

  NOTE that only socket bufferevents support this function.

  @param base an event_base returned by event_init()
  @param bufev a bufferevent struct returned by bufferevent_new()
     or bufferevent_socket_new()
  @return 0 if successful, or -1 if an error occurred
  @see bufferevent_new()
  }
function bufferevent_base_set(base:Pevent_base; bufev:Pbufferevent):longint;cdecl;external libevent;
{*
   Return the event_base used by a bufferevent
 }
function bufferevent_get_base(bev:Pbufferevent):Pevent_base;cdecl;external libevent;
{*
  Assign a priority to a bufferevent.

  Only supported for socket bufferevents.

  @param bufev a bufferevent struct
  @param pri the priority to be assigned
  @return 0 if successful, or -1 if an error occurred
   }
function bufferevent_priority_set(bufev:Pbufferevent; pri:longint):longint;cdecl;external libevent;
{*
   Return the priority of a bufferevent.

   Only supported for socket bufferevents
  }
function bufferevent_get_priority(bufev:Pbufferevent):longint;cdecl;external libevent;
{*
  Deallocate the storage associated with a bufferevent structure.

  If there is pending data to write on the bufferevent, it probably won't be
  flushed before the bufferevent is freed.

  @param bufev the bufferevent structure to be freed.
   }
procedure bufferevent_free(bufev:Pbufferevent);cdecl;external libevent;
{*
  Changes the callbacks for a bufferevent.

  @param bufev the bufferevent object for which to change callbacks
  @param readcb callback to invoke when there is data to be read, or NULL if
	 no callback is desired
  @param writecb callback to invoke when the file descriptor is ready for
	 writing, or NULL if no callback is desired
  @param eventcb callback to invoke when there is an event on the file
	 descriptor
  @param cbarg an argument that will be supplied to each of the callbacks
	 (readcb, writecb, and errorcb)
  @see bufferevent_new()
   }
procedure bufferevent_setcb(bufev:Pbufferevent; readcb:Tbufferevent_data_cb; writecb:Tbufferevent_data_cb; eventcb:Tbufferevent_event_cb; cbarg:pointer);cdecl;external libevent;
{*
 Retrieves the callbacks for a bufferevent.

 @param bufev the bufferevent to examine.
 @param readcb_ptr if readcb_ptr is nonnull, *readcb_ptr is set to the current
    read callback for the bufferevent.
 @param writecb_ptr if writecb_ptr is nonnull, *writecb_ptr is set to the
    current write callback for the bufferevent.
 @param eventcb_ptr if eventcb_ptr is nonnull, *eventcb_ptr is set to the
    current event callback for the bufferevent.
 @param cbarg_ptr if cbarg_ptr is nonnull, *cbarg_ptr is set to the current
    callback argument for the bufferevent.
 @see buffervent_setcb()
 }
procedure bufferevent_getcb(bufev:Pbufferevent; readcb_ptr:Pbufferevent_data_cb; writecb_ptr:Pbufferevent_data_cb; eventcb_ptr:Pbufferevent_event_cb; cbarg_ptr:Ppointer);cdecl;external libevent;
{*
  Changes the file descriptor on which the bufferevent operates.
  Not supported for all bufferevent types.

  @param bufev the bufferevent object for which to change the file descriptor
  @param fd the file descriptor to operate on
 }
function bufferevent_setfd(bufev:Pbufferevent; fd:Tevutil_socket_t):longint;cdecl;external libevent;
{*
   Returns the file descriptor associated with a bufferevent, or -1 if
   no file descriptor is associated with the bufferevent.
  }
function bufferevent_getfd(bufev:Pbufferevent):Tevutil_socket_t;cdecl;external libevent;
{*
   Returns the underlying bufferevent associated with a bufferevent (if
   the bufferevent is a wrapper), or NULL if there is no underlying bufferevent.
  }
function bufferevent_get_underlying(bufev:Pbufferevent):Pbufferevent;cdecl;external libevent;
{*
  Write data to a bufferevent buffer.

  The bufferevent_write() function can be used to write data to the file
  descriptor.  The data is appended to the output buffer and written to the
  descriptor automatically as it becomes available for writing.

  @param bufev the bufferevent to be written to
  @param data a pointer to the data to be written
  @param size the length of the data, in bytes
  @return 0 if successful, or -1 if an error occurred
  @see bufferevent_write_buffer()
   }
function bufferevent_write(bufev:Pbufferevent; data:pointer; size:Tsize_t):longint;cdecl;external libevent;
{*
  Write data from an evbuffer to a bufferevent buffer.	The evbuffer is
  being drained as a result.

  @param bufev the bufferevent to be written to
  @param buf the evbuffer to be written
  @return 0 if successful, or -1 if an error occurred
  @see bufferevent_write()
  }
function bufferevent_write_buffer(bufev:Pbufferevent; buf:Pevbuffer):longint;cdecl;external libevent;
{*
  Read data from a bufferevent buffer.

  The bufferevent_read() function is used to read data from the input buffer.

  @param bufev the bufferevent to be read from
  @param data pointer to a buffer that will store the data
  @param size the size of the data buffer, in bytes
  @return the amount of data read, in bytes.
  }
function bufferevent_read(bufev:Pbufferevent; data:pointer; size:Tsize_t):Tsize_t;cdecl;external libevent;
{*
  Read data from a bufferevent buffer into an evbuffer.	 This avoids
  memory copies.

  @param bufev the bufferevent to be read from
  @param buf the evbuffer to which to add data
  @return 0 if successful, or -1 if an error occurred.
  }
function bufferevent_read_buffer(bufev:Pbufferevent; buf:Pevbuffer):longint;cdecl;external libevent;
{*
   Returns the input buffer.

   The user MUST NOT set the callback on this buffer.

   @param bufev the bufferevent from which to get the evbuffer
   @return the evbuffer object for the input buffer
  }
function bufferevent_get_input(bufev:Pbufferevent):Pevbuffer;cdecl;external libevent;
{*
   Returns the output buffer.

   The user MUST NOT set the callback on this buffer.

   When filters are being used, the filters need to be manually
   triggered if the output buffer was manipulated.

   @param bufev the bufferevent from which to get the evbuffer
   @return the evbuffer object for the output buffer
  }
function bufferevent_get_output(bufev:Pbufferevent):Pevbuffer;cdecl;external libevent;
{*
  Enable a bufferevent.

  @param bufev the bufferevent to be enabled
  @param event any combination of EV_READ | EV_WRITE.
  @return 0 if successful, or -1 if an error occurred
  @see bufferevent_disable()
  }
function bufferevent_enable(bufev:Pbufferevent; event:smallint):longint;cdecl;external libevent;
{*
  Disable a bufferevent.

  @param bufev the bufferevent to be disabled
  @param event any combination of EV_READ | EV_WRITE.
  @return 0 if successful, or -1 if an error occurred
  @see bufferevent_enable()
  }
function bufferevent_disable(bufev:Pbufferevent; event:smallint):longint;cdecl;external libevent;
{*
   Return the events that are enabled on a given bufferevent.

   @param bufev the bufferevent to inspect
   @return A combination of EV_READ | EV_WRITE
  }
function bufferevent_get_enabled(bufev:Pbufferevent):smallint;cdecl;external libevent;
{*
  Set the read and write timeout for a bufferevent.

  A bufferevent's timeout will fire the first time that the indicated
  amount of time has elapsed since a successful read or write operation,
  during which the bufferevent was trying to read or write.

  (In other words, if reading or writing is disabled, or if the
  bufferevent's read or write operation has been suspended because
  there's no data to write, or not enough bandwidth, or so on, the
  timeout isn't active.  The timeout only becomes active when we we're
  willing to actually read or write.)

  Calling bufferevent_enable or setting a timeout for a bufferevent
  whose timeout is already pending resets its timeout.

  If the timeout elapses, the corresponding operation (EV_READ or
  EV_WRITE) becomes disabled until you re-enable it again.  The
  bufferevent's event callback is called with the
  BEV_EVENT_TIMEOUT|BEV_EVENT_READING or
  BEV_EVENT_TIMEOUT|BEV_EVENT_WRITING.

  @param bufev the bufferevent to be modified
  @param timeout_read the read timeout, or NULL
  @param timeout_write the write timeout, or NULL
  }
function bufferevent_set_timeouts(bufev:Pbufferevent; timeout_read:Ptimeval; timeout_write:Ptimeval):longint;cdecl;external libevent;
{*
  Sets the watermarks for read and write events.

  On input, a bufferevent does not invoke the user read callback unless
  there is at least low watermark data in the buffer.	If the read buffer
  is beyond the high watermark, the bufferevent stops reading from the network.
  But be aware that bufferevent input/read buffer can overrun high watermark
  limit (typical example is openssl bufferevent), so you should not relay in
  this.

  On output, the user write callback is invoked whenever the buffered data
  falls below the low watermark.  Filters that write to this bufev will try
  not to write more bytes to this buffer than the high watermark would allow,
  except when flushing.

  @param bufev the bufferevent to be modified
  @param events EV_READ, EV_WRITE or both
  @param lowmark the lower watermark to set
  @param highmark the high watermark to set
 }
procedure bufferevent_setwatermark(bufev:Pbufferevent; events:smallint; lowmark:Tsize_t; highmark:Tsize_t);cdecl;external libevent;
{*
  Retrieves the watermarks for read or write events.
  Returns non-zero if events contains not only EV_READ or EV_WRITE.
  Returns zero if events equal EV_READ or EV_WRITE

  @param bufev the bufferevent to be examined
  @param events EV_READ or EV_WRITE
  @param lowmark receives the lower watermark if not NULL
  @param highmark receives the high watermark if not NULL
 }
function bufferevent_getwatermark(bufev:Pbufferevent; events:smallint; lowmark:Psize_t; highmark:Psize_t):longint;cdecl;external libevent;
{*
   Acquire the lock on a bufferevent.  Has no effect if locking was not
   enabled with BEV_OPT_THREADSAFE.
  }
procedure bufferevent_lock(bufev:Pbufferevent);cdecl;external libevent;
{*
   Release the lock on a bufferevent.  Has no effect if locking was not
   enabled with BEV_OPT_THREADSAFE.
  }
procedure bufferevent_unlock(bufev:Pbufferevent);cdecl;external libevent;
{*
 * Public interface to manually increase the reference count of a bufferevent
 * this is useful in situations where a user may reference the bufferevent
 * somewhere else (unknown to libevent)
 *
 * @param bufev the bufferevent to increase the refcount on
 *
  }
procedure bufferevent_incref(bufev:Pbufferevent);cdecl;external libevent;
{*
 * Public interface to manually decrement the reference count of a bufferevent
 *
 * Warning: make sure you know what you're doing. This is mainly used in
 * conjunction with bufferevent_incref(). This will free up all data associated
 * with a bufferevent if the reference count hits 0.
 *
 * @param bufev the bufferevent to decrement the refcount on
 *
 * @return 1 if the bufferevent was freed, otherwise 0 (still referenced)
  }
function bufferevent_decref(bufev:Pbufferevent):longint;cdecl;external libevent;
{*
   Flags that can be passed into filters to let them know how to
   deal with the incoming data.
 }
{* usually set when processing data  }
{* want to checkpoint all data sent.  }
{* encountered EOF on read or done sending data  }
type
  Tbufferevent_flush_mode =  Longint;
  Const
    BEV_NORMAL = 0;
    BEV_FLUSH = 1;
    BEV_FINISHED = 2;

{*
   Triggers the bufferevent to produce more data if possible.

   @param bufev the bufferevent object
   @param iotype either EV_READ or EV_WRITE or both.
   @param mode either BEV_NORMAL or BEV_FLUSH or BEV_FINISHED
   @return -1 on failure, 0 if no data was produces, 1 if data was produced
  }

function bufferevent_flush(bufev:Pbufferevent; iotype:smallint; mode:Tbufferevent_flush_mode):longint;cdecl;external libevent;
{*
   Flags for bufferevent_trigger(_event) that modify when and how to trigger
   the callback.
 }
{* trigger the callback regardless of the watermarks  }
{* defer even if the callbacks are not  }
{ (Note: for internal reasons, these need to be disjoint from
	 * bufferevent_options, except when they mean the same thing.  }
type
  Tbufferevent_trigger_options =  Longint;
  Const
    BEV_TRIG_IGNORE_WATERMARKS = 1 shl 16;
    BEV_TRIG_DEFER_CALLBACKS = BEV_OPT_DEFER_CALLBACKS;

{*
   Triggers bufferevent data callbacks.

   The function will honor watermarks unless options contain
   BEV_TRIG_IGNORE_WATERMARKS. If the options contain BEV_OPT_DEFER_CALLBACKS,
   the callbacks are deferred.

   @param bufev the bufferevent object
   @param iotype either EV_READ or EV_WRITE or both.
   @param options
  }

procedure bufferevent_trigger(bufev:Pbufferevent; iotype:smallint; options:longint);cdecl;external libevent;
{*
   Triggers the bufferevent event callback.

   If the options contain BEV_OPT_DEFER_CALLBACKS, the callbacks are deferred.

   @param bufev the bufferevent object
   @param what the flags to pass onto the event callback
   @param options
  }
procedure bufferevent_trigger_event(bufev:Pbufferevent; what:smallint; options:longint);cdecl;external libevent;
{*
   @name Filtering support

   @
 }
{*
   Values that filters can return.
  }
{* everything is okay  }
{* the filter needs to read more data before output  }
{* the filter encountered a critical error, no further data
	    can be processed.  }
type
  Tbufferevent_filter_result =  Longint;
  Const
    BEV_OK = 0;
    BEV_NEED_MORE = 1;
    BEV_ERROR = 2;

{* A callback function to implement a filter for a bufferevent.

    @param src An evbuffer to drain data from.
    @param dst An evbuffer to add data to.
    @param limit A suggested upper bound of bytes to write to dst.
       The filter may ignore this value, but doing so means that
       it will overflow the high-water mark associated with dst.
       -1 means "no limit".
    @param mode Whether we should write data as may be convenient
       (BEV_NORMAL), or flush as much data as we can (BEV_FLUSH),
       or flush as much as we can, possibly including an end-of-stream
       marker (BEV_FINISH).
    @param ctx A user-supplied pointer.

    @return BEV_OK if we wrote some data; BEV_NEED_MORE if we can't
       produce any more output until we get some input; and BEV_ERROR
       on an error.
  }
type

  Tbufferevent_filter_cb = function (src:Pevbuffer; dst:Pevbuffer; dst_limit:Tev_ssize_t; mode:Tbufferevent_flush_mode; ctx:pointer):Tbufferevent_filter_result;cdecl;
{*
   Allocate a new filtering bufferevent on top of an existing bufferevent.

   @param underlying the underlying bufferevent.
   @param input_filter The filter to apply to data we read from the underlying
     bufferevent
   @param output_filter The filer to apply to data we write to the underlying
     bufferevent
   @param options A bitfield of bufferevent options.
   @param free_context A function to use to free the filter context when
     this bufferevent is freed.
   @param ctx A context pointer to pass to the filter functions.
  }

function bufferevent_filter_new(underlying:Pbufferevent; input_filter:Tbufferevent_filter_cb; output_filter:Tbufferevent_filter_cb; options:longint; free_context:procedure (para1:pointer); 
           ctx:pointer):Pbufferevent;cdecl;external libevent;
{*@ }
{*
   Allocate a pair of linked bufferevents.  The bufferevents behave as would
   two bufferevent_sock instances connected to opposite ends of a
   socketpair(), except that no internal socketpair is allocated.

   @param base The event base to associate with the socketpair.
   @param options A set of options for this bufferevent
   @param pair A pointer to an array to hold the two new bufferevent objects.
   @return 0 on success, -1 on failure.
  }
function bufferevent_pair_new(base:Pevent_base; options:longint; pair:array[0..1] of Pbufferevent):longint;cdecl;external libevent;
{*
   Given one bufferevent returned by bufferevent_pair_new(), returns the
   other one if it still exists.  Otherwise returns NULL.
  }
function bufferevent_pair_get_partner(bev:Pbufferevent):Pbufferevent;cdecl;external libevent;
{*
   Abstract type used to configure rate-limiting on a bufferevent or a group
   of bufferevents.
  }
type
  Pev_token_bucket_cfg = ^Tev_token_bucket_cfg;
  Tev_token_bucket_cfg = record
      {undefined structure}
    end;

{*
   A group of bufferevents which are configured to respect the same rate
   limit.
 }
  Pbufferevent_rate_limit_group = ^Tbufferevent_rate_limit_group;
  Tbufferevent_rate_limit_group = record
      {undefined structure}
    end;

{* Maximum configurable rate- or burst-limit.  }

const
  EV_RATE_LIMIT_MAX = EV_SSIZE_MAX;  
{*
   Initialize and return a new object to configure the rate-limiting behavior
   of bufferevents.

   @param read_rate The maximum number of bytes to read per tick on
     average.
   @param read_burst The maximum number of bytes to read in any single tick.
   @param write_rate The maximum number of bytes to write per tick on
     average.
   @param write_burst The maximum number of bytes to write in any single tick.
   @param tick_len The length of a single tick.	 Defaults to one second.
     Any fractions of a millisecond are ignored.

   Note that all rate-limits hare are currently best-effort: future versions
   of Libevent may implement them more tightly.
  }

function ev_token_bucket_cfg_new(read_rate:Tsize_t; read_burst:Tsize_t; write_rate:Tsize_t; write_burst:Tsize_t; tick_len:Ptimeval):Pev_token_bucket_cfg;cdecl;external libevent;
{* Free all storage held in 'cfg'.

    Note: 'cfg' is not currently reference-counted; it is not safe to free it
    until no bufferevent is using it.
  }
procedure ev_token_bucket_cfg_free(cfg:Pev_token_bucket_cfg);cdecl;external libevent;
{*
   Set the rate-limit of a the bufferevent 'bev' to the one specified in
   'cfg'.  If 'cfg' is NULL, disable any per-bufferevent rate-limiting on
   'bev'.

   Note that only some bufferevent types currently respect rate-limiting.
   They are: socket-based bufferevents (normal and IOCP-based), and SSL-based
   bufferevents.

   Return 0 on success, -1 on failure.
  }
function bufferevent_set_rate_limit(bev:Pbufferevent; cfg:Pev_token_bucket_cfg):longint;cdecl;external libevent;
{*
   Create a new rate-limit group for bufferevents.  A rate-limit group
   constrains the maximum number of bytes sent and received, in toto,
   by all of its bufferevents.

   @param base An event_base to run any necessary timeouts for the group.
      Note that all bufferevents in the group do not necessarily need to share
      this event_base.
   @param cfg The rate-limit for this group.

   Note that all rate-limits hare are currently best-effort: future versions
   of Libevent may implement them more tightly.

   Note also that only some bufferevent types currently respect rate-limiting.
   They are: socket-based bufferevents (normal and IOCP-based), and SSL-based
   bufferevents.
  }
function bufferevent_rate_limit_group_new(base:Pevent_base; cfg:Pev_token_bucket_cfg):Pbufferevent_rate_limit_group;cdecl;external libevent;
{*
   Change the rate-limiting settings for a given rate-limiting group.

   Return 0 on success, -1 on failure.
 }
function bufferevent_rate_limit_group_set_cfg(para1:Pbufferevent_rate_limit_group; para2:Pev_token_bucket_cfg):longint;cdecl;external libevent;
{*
   Change the smallest quantum we're willing to allocate to any single
   bufferevent in a group for reading or writing at a time.

   The rationale is that, because of TCP/IP protocol overheads and kernel
   behavior, if a rate-limiting group is so tight on bandwidth that you're
   only willing to send 1 byte per tick per bufferevent, you might instead
   want to batch up the reads and writes so that you send N bytes per
   1/N of the bufferevents (chosen at random) each tick, so you still wind
   up send 1 byte per tick per bufferevent on average, but you don't send
   so many tiny packets.

   The default min-share is currently 64 bytes.

   Returns 0 on success, -1 on failure.
  }
function bufferevent_rate_limit_group_set_min_share(para1:Pbufferevent_rate_limit_group; para2:Tsize_t):longint;cdecl;external libevent;
{*
   Free a rate-limiting group.  The group must have no members when
   this function is called.
 }
procedure bufferevent_rate_limit_group_free(para1:Pbufferevent_rate_limit_group);cdecl;external libevent;
{*
   Add 'bev' to the list of bufferevents whose aggregate reading and writing
   is restricted by 'g'.  If 'g' is NULL, remove 'bev' from its current group.

   A bufferevent may belong to no more than one rate-limit group at a time.
   If 'bev' is already a member of a group, it will be removed from its old
   group before being added to 'g'.

   Return 0 on success and -1 on failure.
  }
function bufferevent_add_to_rate_limit_group(bev:Pbufferevent; g:Pbufferevent_rate_limit_group):longint;cdecl;external libevent;
{* Remove 'bev' from its current rate-limit group (if any).  }
function bufferevent_remove_from_rate_limit_group(bev:Pbufferevent):longint;cdecl;external libevent;
{*
   Set the size limit for single read operation.

   Set to 0 for a reasonable default.

   Return 0 on success and -1 on failure.
  }
function bufferevent_set_max_single_read(bev:Pbufferevent; size:Tsize_t):longint;cdecl;external libevent;
{*
   Set the size limit for single write operation.

   Set to 0 for a reasonable default.

   Return 0 on success and -1 on failure.
  }
function bufferevent_set_max_single_write(bev:Pbufferevent; size:Tsize_t):longint;cdecl;external libevent;
{* Get the current size limit for single read operation.  }
function bufferevent_get_max_single_read(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
{* Get the current size limit for single write operation.  }
function bufferevent_get_max_single_write(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
{*
   @name Rate limit inspection

   Return the current read or write bucket size for a bufferevent.
   If it is not configured with a per-bufferevent ratelimit, return
   EV_SSIZE_MAX.  This function does not inspect the group limit, if any.
   Note that it can return a negative value if the bufferevent has been
   made to read or write more than its limit.

   @
  }
function bufferevent_get_read_limit(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
function bufferevent_get_write_limit(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
{@ }
function bufferevent_get_max_to_read(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
function bufferevent_get_max_to_write(bev:Pbufferevent):Tev_ssize_t;cdecl;external libevent;
function bufferevent_get_token_bucket_cfg(bev:Pbufferevent):Pev_token_bucket_cfg;cdecl;external libevent;
{*
   @name Group Rate limit inspection

   Return the read or write bucket size for a bufferevent rate limit
   group.  Note that it can return a negative value if bufferevents in
   the group have been made to read or write more than their limits.

   @
  }
function bufferevent_rate_limit_group_get_read_limit(para1:Pbufferevent_rate_limit_group):Tev_ssize_t;cdecl;external libevent;
function bufferevent_rate_limit_group_get_write_limit(para1:Pbufferevent_rate_limit_group):Tev_ssize_t;cdecl;external libevent;
{@ }
{*
   @name Rate limit manipulation

   Subtract a number of bytes from a bufferevent's read or write bucket.
   The decrement value can be negative, if you want to manually refill
   the bucket.	If the change puts the bucket above or below zero, the
   bufferevent will resume or suspend reading writing as appropriate.
   These functions make no change in the buckets for the bufferevent's
   group, if any.

   Returns 0 on success, -1 on internal error.

   @
  }
function bufferevent_decrement_read_limit(bev:Pbufferevent; decr:Tev_ssize_t):longint;cdecl;external libevent;
function bufferevent_decrement_write_limit(bev:Pbufferevent; decr:Tev_ssize_t):longint;cdecl;external libevent;
{@ }
{*
   @name Group rate limit manipulation

   Subtract a number of bytes from a bufferevent rate-limiting group's
   read or write bucket.  The decrement value can be negative, if you
   want to manually refill the bucket.	If the change puts the bucket
   above or below zero, the bufferevents in the group will resume or
   suspend reading writing as appropriate.

   Returns 0 on success, -1 on internal error.

   @
  }
function bufferevent_rate_limit_group_decrement_read(para1:Pbufferevent_rate_limit_group; para2:Tev_ssize_t):longint;cdecl;external libevent;
function bufferevent_rate_limit_group_decrement_write(para1:Pbufferevent_rate_limit_group; para2:Tev_ssize_t):longint;cdecl;external libevent;
{@ }
{*
 * Inspect the total bytes read/written on a group.
 *
 * Set the variable pointed to by total_read_out to the total number of bytes
 * ever read on grp, and the variable pointed to by total_written_out to the
 * total number of bytes ever written on grp.  }
procedure bufferevent_rate_limit_group_get_totals(grp:Pbufferevent_rate_limit_group; total_read_out:Pev_uint64_t; total_written_out:Pev_uint64_t);cdecl;external libevent;
{*
 * Reset the total bytes read/written on a group.
 *
 * Reset the number of bytes read or written on grp as given by
 * bufferevent_rate_limit_group_reset_totals().  }
procedure bufferevent_rate_limit_group_reset_totals(grp:Pbufferevent_rate_limit_group);cdecl;external libevent;
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_BUFFEREVENT_H_INCLUDED_  }

// === Konventiert am: 26-8-25 17:43:37 ===


implementation



end.

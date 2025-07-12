
unit multi;
interface

{
  Automatically converted by H2Pas 1.0.0 from multi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    multi.h
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
PCURL  = ^CURL;
Pcurl_pushheaders  = ^curl_pushheaders;
Pcurl_waitfd  = ^curl_waitfd;
PCURLM  = ^CURLM;
PCURLMcode  = ^CURLMcode;
PCURLMoption  = ^CURLMoption;
PCURLMSG  = ^CURLMSG;
Pfd_set  = ^fd_set;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_MULTI_H}
{$define CURLINC_MULTI_H}
{**************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 * SPDX-License-Identifier: curl
 *
 ************************************************************************** }
{
  This is an "external" header file. Don't give away any internals here!

  GOALS

  o Enable a "pull" interface. The application that uses libcurl decides where
    and when to ask libcurl to get/send data.

  o Enable multiple simultaneous transfers in the same thread without making it
    complicated for the application.

  o Enable the application to select() on its own file descriptors and curl's
    file descriptors simultaneous easily.

 }
{
 * This header file should not really need to include "curl.h" since curl.h
 * itself includes this file and we expect user applications to do #include
 * <curl/curl.h> without the need for especially including multi.h.
 *
 * For some reason we added this include here at one point, and rather than to
 * break existing (wrongly written) libcurl applications, we leave it as-is
 * but with this warning attached.
  }
{$include "curl.h"}
{ C++ extern C conditionnal removed }
{$if defined(BUILDING_LIBCURL) || defined(CURL_STRICTER)}
type
  TCurl_multi = TCURLM;
{$else}
type
  PCURLM = ^TCURLM;
  TCURLM = pointer;
{$endif}
{ please call curl_multi_perform() or
                                    curl_multi_socket*() soon  }
{ the passed-in handle is not a valid CURLM handle  }
{ an easy handle was not good/valid  }
{ if you ever get this, you're in deep sh*t  }
{ this is a libcurl bug  }
{ the passed in socket argument did not match  }
{ curl_multi_setopt() with unsupported option  }
{ an easy handle already added to a multi handle was
                            attempted to get added - again  }
{ an api function was called from inside a
                               callback  }
{ wakeup is unavailable or failed  }
{ function called with a bad parameter  }
type
  PCURLMcode = ^TCURLMcode;
  TCURLMcode =  Longint;
  Const
    CURLM_CALL_MULTI_PERFORM = -(1);
    CURLM_OK = (-(1))+1;
    CURLM_BAD_HANDLE = (-(1))+2;
    CURLM_BAD_EASY_HANDLE = (-(1))+3;
    CURLM_OUT_OF_MEMORY = (-(1))+4;
    CURLM_INTERNAL_ERROR = (-(1))+5;
    CURLM_BAD_SOCKET = (-(1))+6;
    CURLM_UNKNOWN_OPTION = (-(1))+7;
    CURLM_ADDED_ALREADY = (-(1))+8;
    CURLM_RECURSIVE_API_CALL = (-(1))+9;
    CURLM_WAKEUP_FAILURE = (-(1))+10;
    CURLM_BAD_FUNCTION_ARGUMENT = (-(1))+11;
    CURLM_ABORTED_BY_CALLBACK = (-(1))+12;
    CURLM_UNRECOVERABLE_POLL = (-(1))+13;
    CURLM_LAST = (-(1))+14;
;
{ just to make code nicer when using curl_multi_socket() you can now check
   for CURLM_CALL_MULTI_SOCKET too in the same style it works for
   curl_multi_perform() and CURLM_CALL_MULTI_PERFORM  }
  CURLM_CALL_MULTI_SOCKET = CURLM_CALL_MULTI_PERFORM;  
{ bitmask bits for CURLMOPT_PIPELINING  }
  CURLPIPE_NOTHING = 0;  
  CURLPIPE_HTTP1 = 1;  
  CURLPIPE_MULTIPLEX = 2;  
{ first, not used  }
{ This easy handle has completed. 'result' contains
                   the CURLcode of the transfer  }
{ last, not used  }
type
  PCURLMSG = ^TCURLMSG;
  TCURLMSG =  Longint;
  Const
    CURLMSG_NONE = 0;
    CURLMSG_DONE = 1;
    CURLMSG_LAST = 2;
;
{ what this message means  }
{ the handle it concerns  }
{ message-specific data  }
{ return code for transfer  }
type
  PCURLMsg = ^TCURLMsg;
  TCURLMsg = record
      msg : TCURLMSG;
      easy_handle : PCURL;
      data : record
          case longint of
            0 : ( whatever : pointer );
            1 : ( result : TCURLcode );
          end;
    end;

{ Based on poll(2) structure and values.
 * We don't use pollfd and POLL* constants explicitly
 * to cover platforms without poll().  }

const
  CURL_WAIT_POLLIN = $0001;  
  CURL_WAIT_POLLPRI = $0002;  
  CURL_WAIT_POLLOUT = $0004;  
type
  Pcurl_waitfd = ^Tcurl_waitfd;
  Tcurl_waitfd = record
      fd : Tcurl_socket_t;
      events : smallint;
      revents : smallint;
    end;

{
 * Name:    curl_multi_init()
 *
 * Desc:    initialize multi-style curl usage
 *
 * Returns: a new CURLM handle to use in all 'curl_multi' functions.
  }

function curl_multi_init:PCURLM;cdecl;external;
{
 * Name:    curl_multi_add_handle()
 *
 * Desc:    add a standard curl handle to the multi stack
 *
 * Returns: CURLMcode type, general multi error code.
  }
function curl_multi_add_handle(multi_handle:PCURLM; curl_handle:PCURL):TCURLMcode;cdecl;external;
{
  * Name:    curl_multi_remove_handle()
  *
  * Desc:    removes a curl handle from the multi stack again
  *
  * Returns: CURLMcode type, general multi error code.
   }
function curl_multi_remove_handle(multi_handle:PCURLM; curl_handle:PCURL):TCURLMcode;cdecl;external;
{
  * Name:    curl_multi_fdset()
  *
  * Desc:    Ask curl for its fd_set sets. The app can use these to select() or
  *          poll() on. We want curl_multi_perform() called as soon as one of
  *          them are ready.
  *
  * Returns: CURLMcode type, general multi error code.
   }
function curl_multi_fdset(multi_handle:PCURLM; read_fd_set:Pfd_set; write_fd_set:Pfd_set; exc_fd_set:Pfd_set; max_fd:Plongint):TCURLMcode;cdecl;external;
{
 * Name:     curl_multi_wait()
 *
 * Desc:     Poll on all fds within a CURLM set as well as any
 *           additional fds passed to the function.
 *
 * Returns:  CURLMcode type, general multi error code.
  }
function curl_multi_wait(multi_handle:PCURLM; extra_fds:Pcurl_waitfd; extra_nfds:dword; timeout_ms:longint; ret:Plongint):TCURLMcode;cdecl;external;
{
 * Name:     curl_multi_poll()
 *
 * Desc:     Poll on all fds within a CURLM set as well as any
 *           additional fds passed to the function.
 *
 * Returns:  CURLMcode type, general multi error code.
  }
function curl_multi_poll(multi_handle:PCURLM; extra_fds:Pcurl_waitfd; extra_nfds:dword; timeout_ms:longint; ret:Plongint):TCURLMcode;cdecl;external;
{
 * Name:     curl_multi_wakeup()
 *
 * Desc:     wakes up a sleeping curl_multi_poll call.
 *
 * Returns:  CURLMcode type, general multi error code.
  }
function curl_multi_wakeup(multi_handle:PCURLM):TCURLMcode;cdecl;external;
{
  * Name:    curl_multi_perform()
  *
  * Desc:    When the app thinks there's data available for curl it calls this
  *          function to read/write whatever there is right now. This returns
  *          as soon as the reads and writes are done. This function does not
  *          require that there actually is data available for reading or that
  *          data can be written, it can be called just in case. It returns
  *          the number of handles that still transfer data in the second
  *          argument's integer-pointer.
  *
  * Returns: CURLMcode type, general multi error code. *NOTE* that this only
  *          returns errors etc regarding the whole multi stack. There might
  *          still have occurred problems on individual transfers even when
  *          this returns OK.
   }
function curl_multi_perform(multi_handle:PCURLM; running_handles:Plongint):TCURLMcode;cdecl;external;
{
  * Name:    curl_multi_cleanup()
  *
  * Desc:    Cleans up and removes a whole multi stack. It does not free or
  *          touch any individual easy handles in any way. We need to define
  *          in what state those handles will be if this function is called
  *          in the middle of a transfer.
  *
  * Returns: CURLMcode type, general multi error code.
   }
function curl_multi_cleanup(multi_handle:PCURLM):TCURLMcode;cdecl;external;
{
 * Name:    curl_multi_info_read()
 *
 * Desc:    Ask the multi handle if there's any messages/informationals from
 *          the individual transfers. Messages include informationals such as
 *          error code from the transfer or just the fact that a transfer is
 *          completed. More details on these should be written down as well.
 *
 *          Repeated calls to this function will return a new struct each
 *          time, until a special "end of msgs" struct is returned as a signal
 *          that there is no more to get at this point.
 *
 *          The data the returned pointer points to will not survive calling
 *          curl_multi_cleanup().
 *
 *          The 'CURLMsg' struct is meant to be very simple and only contain
 *          very basic information. If more involved information is wanted,
 *          we will provide the particular "transfer handle" in that struct
 *          and that should/could/would be used in subsequent
 *          curl_easy_getinfo() calls (or similar). The point being that we
 *          must never expose complex structs to applications, as then we'll
 *          undoubtably get backwards compatibility problems in the future.
 *
 * Returns: A pointer to a filled-in struct, or NULL if it failed or ran out
 *          of structs. It also writes the number of messages left in the
 *          queue (after this read) in the integer the second argument points
 *          to.
  }
function curl_multi_info_read(multi_handle:PCURLM; msgs_in_queue:Plongint):PCURLMsg;cdecl;external;
{
 * Name:    curl_multi_strerror()
 *
 * Desc:    The curl_multi_strerror function may be used to turn a CURLMcode
 *          value into the equivalent human readable error string.  This is
 *          useful for printing meaningful error messages.
 *
 * Returns: A pointer to a null-terminated error message.
  }
(* Const before type ignored *)
function curl_multi_strerror(para1:TCURLMcode):Pchar;cdecl;external;
{
 * Name:    curl_multi_socket() and
 *          curl_multi_socket_all()
 *
 * Desc:    An alternative version of curl_multi_perform() that allows the
 *          application to pass in one of the file descriptors that have been
 *          detected to have "action" on them and let libcurl perform.
 *          See man page for details.
  }
const
  CURL_POLL_NONE = 0;  
  CURL_POLL_IN = 1;  
  CURL_POLL_OUT = 2;  
  CURL_POLL_INOUT = 3;  
  CURL_POLL_REMOVE = 4;  
  CURL_SOCKET_TIMEOUT = CURL_SOCKET_BAD;  
  CURL_CSELECT_IN = $01;  
  CURL_CSELECT_OUT = $02;  
  CURL_CSELECT_ERR = $04;  
{ easy handle  }
{ socket  }
{ see above  }
{ private callback
                                                        pointer  }
type

  Tcurl_socket_callback = function (easy:PCURL; s:Tcurl_socket_t; what:longint; userp:pointer; socketp:pointer):longint;cdecl;
{ private socket
                                                        pointer  }
{
 * Name:    curl_multi_timer_callback
 *
 * Desc:    Called by libcurl whenever the library detects a change in the
 *          maximum number of milliseconds the app is allowed to wait before
 *          curl_multi_socket() or curl_multi_perform() must be called
 *          (to allow libcurl's timed events to take place).
 *
 * Returns: The callback should return zero.
  }
{ multi handle  }
{ see above  }

  Tcurl_multi_timer_callback = function (multi:PCURLM; timeout_ms:longint; userp:pointer):longint;cdecl;
{ private callback
                                                             pointer  }
{ CURL_DEPRECATED(7.19.5, "Use curl_multi_socket_action()") }

function curl_multi_socket(multi_handle:PCURLM; s:Tcurl_socket_t; running_handles:Plongint):TCURLMcode;cdecl;external;
function curl_multi_socket_action(multi_handle:PCURLM; s:Tcurl_socket_t; ev_bitmask:longint; running_handles:Plongint):TCURLMcode;cdecl;external;
{CURL_DEPRECATED(7.19.5, "Use curl_multi_socket_action()") }
function curl_multi_socket_all(multi_handle:PCURLM; running_handles:Plongint):TCURLMcode;cdecl;external;
{$ifndef CURL_ALLOW_OLD_MULTI_SOCKET}
{ This macro below was added in 7.16.3 to push users who recompile to use
   the new curl_multi_socket_action() instead of the old curl_multi_socket()
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function curl_multi_socket(x,y,z : longint) : longint;

{$endif}
{
 * Name:    curl_multi_timeout()
 *
 * Desc:    Returns the maximum number of milliseconds the app is allowed to
 *          wait before curl_multi_socket() or curl_multi_perform() must be
 *          called (to allow libcurl's timed events to take place).
 *
 * Returns: CURLM error code.
  }

function curl_multi_timeout(multi_handle:PCURLM; milliseconds:Plongint):TCURLMcode;cdecl;external;
type
  PCURLMoption = ^TCURLMoption;
  TCURLMoption =  Longint;
  Const
    CURLMOPT_SOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+1;
    CURLMOPT_SOCKETDATA = CURLOPTTYPE_OBJECTPOINT+2;
    CURLMOPT_PIPELINING = CURLOPTTYPE_LONG+3;
    CURLMOPT_TIMERFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+4;
    CURLMOPT_TIMERDATA = CURLOPTTYPE_OBJECTPOINT+5;
    CURLMOPT_MAXCONNECTS = CURLOPTTYPE_LONG+6;
    CURLMOPT_MAX_HOST_CONNECTIONS = CURLOPTTYPE_LONG+7;
    CURLMOPT_MAX_PIPELINE_LENGTH = CURLOPTTYPE_LONG+8;
    CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE = CURLOPTTYPE_OFF_T+9;
    CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE = CURLOPTTYPE_OFF_T+10;
    CURLMOPT_PIPELINING_SITE_BL = CURLOPTTYPE_OBJECTPOINT+11;
    CURLMOPT_PIPELINING_SERVER_BL = CURLOPTTYPE_OBJECTPOINT+12;
    CURLMOPT_MAX_TOTAL_CONNECTIONS = CURLOPTTYPE_LONG+13;
    CURLMOPT_PUSHFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+14;
    CURLMOPT_PUSHDATA = CURLOPTTYPE_OBJECTPOINT+15;
    CURLMOPT_MAX_CONCURRENT_STREAMS = CURLOPTTYPE_LONG+16;
    CURLMOPT_LASTENTRY = (CURLOPTTYPE_LONG+16)+1;
;
{
 * Name:    curl_multi_setopt()
 *
 * Desc:    Sets options for the multi handle.
 *
 * Returns: CURLM error code.
  }

function curl_multi_setopt(multi_handle:PCURLM; option:TCURLMoption; args:array of const):TCURLMcode;cdecl;external;
function curl_multi_setopt(multi_handle:PCURLM; option:TCURLMoption):TCURLMcode;cdecl;external;
{
 * Name:    curl_multi_assign()
 *
 * Desc:    This function sets an association in the multi handle between the
 *          given socket and a private pointer of the application. This is
 *          (only) useful for curl_multi_socket uses.
 *
 * Returns: CURLM error code.
  }
function curl_multi_assign(multi_handle:PCURLM; sockfd:Tcurl_socket_t; sockp:pointer):TCURLMcode;cdecl;external;
{
 * Name:    curl_multi_get_handles()
 *
 * Desc:    Returns an allocated array holding all handles currently added to
 *          the multi handle. Marks the final entry with a NULL pointer. If
 *          there is no easy handle added to the multi handle, this function
 *          returns an array with the first entry as a NULL pointer.
 *
 * Returns: NULL on failure, otherwise a CURL **array pointer
  }
function curl_multi_get_handles(multi_handle:PCURLM):^PCURL;cdecl;external;
{
 * Name: curl_push_callback
 *
 * Desc: This callback gets called when a new stream is being pushed by the
 *       server. It approves or denies the new stream. It can also decide
 *       to completely fail the connection.
 *
 * Returns: CURL_PUSH_OK, CURL_PUSH_DENY or CURL_PUSH_ERROROUT
  }
const
  CURL_PUSH_OK = 0;  
  CURL_PUSH_DENY = 1;  
{ added in 7.72.0  }
  CURL_PUSH_ERROROUT = 2;  
type
  Pcurl_pushheaders = ^Tcurl_pushheaders;
  Tcurl_pushheaders = record
      {undefined structure}
    end;

{ forward declaration only  }

function curl_pushheader_bynum(h:Pcurl_pushheaders; num:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function curl_pushheader_byname(h:Pcurl_pushheaders; name:Pchar):Pchar;cdecl;external;
type

  Tcurl_push_callback = function (parent:PCURL; easy:PCURL; num_headers:Tsize_t; headers:Pcurl_pushheaders; userp:pointer):longint;cdecl;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_multi_socket(x,y,z : longint) : longint;
begin
  curl_multi_socket:=curl_multi_socket_action(x,y,0,z);
end;


end.

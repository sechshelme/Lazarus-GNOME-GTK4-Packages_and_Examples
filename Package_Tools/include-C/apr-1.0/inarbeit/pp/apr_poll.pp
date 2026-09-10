
unit apr_poll;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_poll.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_poll.h
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
Papr_datatype_e  = ^apr_datatype_e;
Papr_descriptor  = ^apr_descriptor;
Papr_file_t  = ^apr_file_t;
Papr_int32_t  = ^apr_int32_t;
Papr_pollcb_t  = ^apr_pollcb_t;
Papr_pollfd_t  = ^apr_pollfd_t;
Papr_pollset_method_e  = ^apr_pollset_method_e;
Papr_pollset_t  = ^apr_pollset_t;
Papr_pool_t  = ^apr_pool_t;
Papr_socket_t  = ^apr_socket_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_POLL_H}
{$define APR_POLL_H}
{*
 * @file apr_poll.h
 * @brief APR Poll interface
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_inherit.h" }
{$include "apr_file_io.h" }
{$include "apr_network_io.h" }
{$if APR_HAVE_NETINET_IN_H}
{$include <netinet/in.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_poll Poll Routines
 * @ingroup APR 
 * @
  }
{*
 * @defgroup pollopts Poll options
 * @ingroup apr_poll
 * @
  }
{*< Can read without blocking  }

const
  APR_POLLIN = $001;  
{*< Priority data available  }
  APR_POLLPRI = $002;  
{*< Can write without blocking  }
  APR_POLLOUT = $004;  
{*< Pending error  }
  APR_POLLERR = $010;  
{*< Hangup occurred  }
  APR_POLLHUP = $020;  
{*< Descriptor invalid  }
  APR_POLLNVAL = $040;  
{* @  }
{*
 * @defgroup pollflags Pollset Flags
 * @ingroup apr_poll
 * @
  }
{*< Adding or removing a descriptor is
                                      * thread-safe
                                       }
  APR_POLLSET_THREADSAFE = $001;  
{*< Descriptors passed to apr_pollset_add()
                                      * are not copied
                                       }
  APR_POLLSET_NOCOPY = $002;  
{*< Poll operations are interruptable by
                                      * apr_pollset_wakeup() or apr_pollcb_wakeup()
                                       }
  APR_POLLSET_WAKEABLE = $004;  
{*< Do not try to use the default method if
                                      * the specified non-default method cannot be
                                      * used
                                       }
  APR_POLLSET_NODEFAULT = $010;  
{* @  }
{*
 * Pollset Methods
  }
{*< Platform default poll method  }
{*< Poll uses select method  }
{*< Poll uses kqueue method  }
{*< Poll uses Solaris event port method  }
{*< Poll uses epoll method  }
{*< Poll uses poll method  }
{*< Poll uses z/OS asio method  }
type
  Papr_pollset_method_e = ^Tapr_pollset_method_e;
  Tapr_pollset_method_e =  Longint;
  Const
    APR_POLLSET_DEFAULT = 0;
    APR_POLLSET_SELECT = 1;
    APR_POLLSET_KQUEUE = 2;
    APR_POLLSET_PORT = 3;
    APR_POLLSET_EPOLL = 4;
    APR_POLLSET_POLL = 5;
    APR_POLLSET_AIO_MSGQ = 6;
;
{* Used in apr_pollfd_t to determine what the apr_descriptor is  }
{*< nothing here  }
{*< descriptor refers to a socket  }
{*< descriptor refers to a file  }
{*< @deprecated descriptor is the last one in the list  }
type
  Papr_datatype_e = ^Tapr_datatype_e;
  Tapr_datatype_e =  Longint;
  Const
    APR_NO_DESC = 0;
    APR_POLL_SOCKET = 1;
    APR_POLL_FILE = 2;
    APR_POLL_LASTDESC = 3;
;
{* Union of either an APR file or socket.  }
{*< file  }
{*< socket  }
type
  Papr_descriptor = ^Tapr_descriptor;
  Tapr_descriptor = record
      case longint of
        0 : ( f : Papr_file_t );
        1 : ( s : Papr_socket_t );
      end;
{* @see apr_pollfd_t  }
{* Poll descriptor set.  }
{*< associated pool  }
{*< descriptor type  }
{*< requested events  }
{*< returned events  }
{*< @see apr_descriptor  }
{*< allows app to associate context  }
  Papr_pollfd_t = ^Tapr_pollfd_t;
  Tapr_pollfd_t = record
      p : Papr_pool_t;
      desc_type : Tapr_datatype_e;
      reqevents : Tapr_int16_t;
      rtnevents : Tapr_int16_t;
      desc : Tapr_descriptor;
      client_data : pointer;
    end;

{ General-purpose poll API for arbitrarily large numbers of
 * file descriptors
  }
{* Opaque structure used for pollset API  }
{*
 * Set up a pollset object
 * @param pollset  The pointer in which to return the newly created object 
 * @param size The maximum number of descriptors that this pollset can hold
 * @param p The pool from which to allocate the pollset
 * @param flags Optional flags to modify the operation of the pollset.
 *
 * @remark If flags contains APR_POLLSET_THREADSAFE, then a pollset is
 *         created on which it is safe to make concurrent calls to
 *         apr_pollset_add(), apr_pollset_remove() and apr_pollset_poll()
 *         from separate threads.  This feature is only supported on some
 *         platforms; the apr_pollset_create() call will fail with
 *         APR_ENOTIMPL on platforms where it is not supported.
 * @remark If flags contains APR_POLLSET_WAKEABLE, then a pollset is
 *         created with an additional internal pipe object used for the
 *         apr_pollset_wakeup() call. The actual size of pollset is
 *         in that case @a size + 1. This feature is only supported on some
 *         platforms; the apr_pollset_create() call will fail with
 *         APR_ENOTIMPL on platforms where it is not supported.
 * @remark If flags contains APR_POLLSET_NOCOPY, then the apr_pollfd_t
 *         structures passed to apr_pollset_add() are not copied and
 *         must have a lifetime at least as long as the pollset.
 * @remark Some poll methods (including APR_POLLSET_KQUEUE,
 *         APR_POLLSET_PORT, and APR_POLLSET_EPOLL) do not have a
 *         fixed limit on the size of the pollset. For these methods,
 *         the size parameter controls the maximum number of
 *         descriptors that will be returned by a single call to
 *         apr_pollset_poll().
  }

function apr_pollset_create(pollset:PPapr_pollset_t; size:Tapr_uint32_t; p:Papr_pool_t; flags:Tapr_uint32_t):Tapr_status_t;cdecl;external;
{*
 * Set up a pollset object
 * @param pollset  The pointer in which to return the newly created object 
 * @param size The maximum number of descriptors that this pollset can hold
 * @param p The pool from which to allocate the pollset
 * @param flags Optional flags to modify the operation of the pollset.
 * @param method Poll method to use. See #apr_pollset_method_e.  If this
 *         method cannot be used, the default method will be used unless the
 *         APR_POLLSET_NODEFAULT flag has been specified.
 *
 * @remark If flags contains APR_POLLSET_THREADSAFE, then a pollset is
 *         created on which it is safe to make concurrent calls to
 *         apr_pollset_add(), apr_pollset_remove() and apr_pollset_poll()
 *         from separate threads.  This feature is only supported on some
 *         platforms; the apr_pollset_create_ex() call will fail with
 *         APR_ENOTIMPL on platforms where it is not supported.
 * @remark If flags contains APR_POLLSET_WAKEABLE, then a pollset is
 *         created with additional internal pipe object used for the
 *         apr_pollset_wakeup() call. The actual size of pollset is
 *         in that case size + 1. This feature is only supported on some
 *         platforms; the apr_pollset_create_ex() call will fail with
 *         APR_ENOTIMPL on platforms where it is not supported.
 * @remark If flags contains APR_POLLSET_NOCOPY, then the apr_pollfd_t
 *         structures passed to apr_pollset_add() are not copied and
 *         must have a lifetime at least as long as the pollset.
 * @remark Some poll methods (including APR_POLLSET_KQUEUE,
 *         APR_POLLSET_PORT, and APR_POLLSET_EPOLL) do not have a
 *         fixed limit on the size of the pollset. For these methods,
 *         the size parameter controls the maximum number of
 *         descriptors that will be returned by a single call to
 *         apr_pollset_poll().
  }
function apr_pollset_create_ex(pollset:PPapr_pollset_t; size:Tapr_uint32_t; p:Papr_pool_t; flags:Tapr_uint32_t; method:Tapr_pollset_method_e):Tapr_status_t;cdecl;external;
{*
 * Destroy a pollset object
 * @param pollset The pollset to destroy
  }
function apr_pollset_destroy(pollset:Papr_pollset_t):Tapr_status_t;cdecl;external;
{*
 * Add a socket or file descriptor to a pollset
 * @param pollset The pollset to which to add the descriptor
 * @param descriptor The descriptor to add
 * @remark If you set client_data in the descriptor, that value
 *         will be returned in the client_data field whenever this
 *         descriptor is signalled in apr_pollset_poll().
 * @remark If the pollset has been created with APR_POLLSET_THREADSAFE
 *         and thread T1 is blocked in a call to apr_pollset_poll() for
 *         this same pollset that is being modified via apr_pollset_add()
 *         in thread T2, the currently executing apr_pollset_poll() call in
 *         T1 will either: (1) automatically include the newly added descriptor
 *         in the set of descriptors it is watching or (2) return immediately
 *         with APR_EINTR.  Option (1) is recommended, but option (2) is
 *         allowed for implementations where option (1) is impossible
 *         or impractical.
 * @remark If the pollset has been created with APR_POLLSET_NOCOPY, the 
 *         apr_pollfd_t structure referenced by descriptor will not be copied
 *         and must have a lifetime at least as long as the pollset.
 * @remark Do not add the same socket or file descriptor to the same pollset
 *         multiple times, even if the requested events differ for the 
 *         different calls to apr_pollset_add().  If the events of interest
 *         for a descriptor change, you must first remove the descriptor 
 *         from the pollset with apr_pollset_remove(), then add it again 
 *         specifying all requested events.
  }
(* Const before type ignored *)
function apr_pollset_add(pollset:Papr_pollset_t; descriptor:Papr_pollfd_t):Tapr_status_t;cdecl;external;
{*
 * Remove a descriptor from a pollset
 * @param pollset The pollset from which to remove the descriptor
 * @param descriptor The descriptor to remove
 * @remark If the descriptor is not found, APR_NOTFOUND is returned.
 * @remark If the pollset has been created with APR_POLLSET_THREADSAFE
 *         and thread T1 is blocked in a call to apr_pollset_poll() for
 *         this same pollset that is being modified via apr_pollset_remove()
 *         in thread T2, the currently executing apr_pollset_poll() call in
 *         T1 will either: (1) automatically exclude the newly added descriptor
 *         in the set of descriptors it is watching or (2) return immediately
 *         with APR_EINTR.  Option (1) is recommended, but option (2) is
 *         allowed for implementations where option (1) is impossible
 *         or impractical.
 * @remark apr_pollset_remove() cannot be used to remove a subset of requested
 *         events for a descriptor.  The reqevents field in the apr_pollfd_t
 *         parameter must contain the same value when removing as when adding.
  }
(* Const before type ignored *)
function apr_pollset_remove(pollset:Papr_pollset_t; descriptor:Papr_pollfd_t):Tapr_status_t;cdecl;external;
{*
 * Block for activity on the descriptor(s) in a pollset
 * @param pollset The pollset to use
 * @param timeout The amount of time in microseconds to wait.  This is a
 *                maximum, not a minimum.  If a descriptor is signalled, the
 *                function will return before this time.  If timeout is
 *                negative, the function will block until a descriptor is
 *                signalled or until apr_pollset_wakeup() has been called.
 * @param num Number of signalled descriptors (output parameter)
 * @param descriptors Array of signalled descriptors (output parameter)
 * @remark APR_EINTR will be returned if the pollset has been created with
 *         APR_POLLSET_WAKEABLE, apr_pollset_wakeup() has been called while
 *         waiting for activity, and there were no signalled descriptors at the
 *         time of the wakeup call.
 * @remark Multiple signalled conditions for the same descriptor may be reported
 *         in one or more returned apr_pollfd_t structures, depending on the
 *         implementation.
  }
(* Const before type ignored *)
function apr_pollset_poll(pollset:Papr_pollset_t; timeout:Tapr_interval_time_t; num:Papr_int32_t; descriptors:PPapr_pollfd_t):Tapr_status_t;cdecl;external;
{*
 * Interrupt the blocked apr_pollset_poll() call.
 * @param pollset The pollset to use
 * @remark If the pollset was not created with APR_POLLSET_WAKEABLE the
 *         return value is APR_EINIT.
  }
function apr_pollset_wakeup(pollset:Papr_pollset_t):Tapr_status_t;cdecl;external;
{*
 * Poll the descriptors in the poll structure
 * @param aprset The poll structure we will be using. 
 * @param numsock The number of descriptors we are polling
 * @param nsds The number of descriptors signalled (output parameter)
 * @param timeout The amount of time in microseconds to wait.  This is a
 *                maximum, not a minimum.  If a descriptor is signalled, the
 *                function will return before this time.  If timeout is
 *                negative, the function will block until a descriptor is
 *                signalled or until apr_pollset_wakeup() has been called.
 * @remark The number of descriptors signalled is returned in the third argument. 
 *         This is a blocking call, and it will not return until either a 
 *         descriptor has been signalled or the timeout has expired. 
 * @remark The rtnevents field in the apr_pollfd_t array will only be filled-
 *         in if the return value is APR_SUCCESS.
  }
function apr_poll(aprset:Papr_pollfd_t; numsock:Tapr_int32_t; nsds:Papr_int32_t; timeout:Tapr_interval_time_t):Tapr_status_t;cdecl;external;
{*
 * Return a printable representation of the pollset method.
 * @param pollset The pollset to use
  }
(* Const before type ignored *)
function apr_pollset_method_name(pollset:Papr_pollset_t):Pchar;cdecl;external;
{*
 * Return a printable representation of the default pollset method
 * (APR_POLLSET_DEFAULT).
  }
(* Const before type ignored *)
function apr_poll_method_defname:Pchar;cdecl;external;
{* Opaque structure used for pollcb API  }
type
{*
 * Set up a pollcb object
 * @param pollcb  The pointer in which to return the newly created object 
 * @param size The maximum number of descriptors that a single _poll can return.
 * @param p The pool from which to allocate the pollcb
 * @param flags Optional flags to modify the operation of the pollcb.
 *
 * @remark If flags contains APR_POLLSET_WAKEABLE, then a pollcb is
 *         created with an additional internal pipe object used for the
 *         apr_pollcb_wakeup() call. The actual size of pollcb is
 *         in that case @a size + 1.
 * @remark Pollcb is only supported on some platforms; the apr_pollcb_create()
 *         call will fail with APR_ENOTIMPL on platforms where it is not supported.
  }

function apr_pollcb_create(pollcb:PPapr_pollcb_t; size:Tapr_uint32_t; p:Papr_pool_t; flags:Tapr_uint32_t):Tapr_status_t;cdecl;external;
{*
 * Set up a pollcb object
 * @param pollcb  The pointer in which to return the newly created object 
 * @param size The maximum number of descriptors that a single _poll can return.
 * @param p The pool from which to allocate the pollcb
 * @param flags Optional flags to modify the operation of the pollcb.
 * @param method Poll method to use. See #apr_pollset_method_e.  If this
 *         method cannot be used, the default method will be used unless the
 *         APR_POLLSET_NODEFAULT flag has been specified.
 *
 * @remark If flags contains APR_POLLSET_WAKEABLE, then a pollcb is
 *         created with an additional internal pipe object used for the
 *         apr_pollcb_wakeup() call. The actual size of pollcb is
 *         in that case @a size + 1.
 * @remark Pollcb is only supported on some platforms; the apr_pollcb_create_ex()
 *         call will fail with APR_ENOTIMPL on platforms where it is not supported.
  }
function apr_pollcb_create_ex(pollcb:PPapr_pollcb_t; size:Tapr_uint32_t; p:Papr_pool_t; flags:Tapr_uint32_t; method:Tapr_pollset_method_e):Tapr_status_t;cdecl;external;
{*
 * Add a socket or file descriptor to a pollcb
 * @param pollcb The pollcb to which to add the descriptor
 * @param descriptor The descriptor to add
 * @remark If you set client_data in the descriptor, that value will be
 *         returned in the client_data field whenever this descriptor is
 *         signalled in apr_pollcb_poll().
 * @remark Unlike the apr_pollset API, the descriptor is not copied, and users 
 *         must retain the memory used by descriptor, as the same pointer will
 *         be returned to them from apr_pollcb_poll.
 * @remark Do not add the same socket or file descriptor to the same pollcb
 *         multiple times, even if the requested events differ for the 
 *         different calls to apr_pollcb_add().  If the events of interest
 *         for a descriptor change, you must first remove the descriptor 
 *         from the pollcb with apr_pollcb_remove(), then add it again 
 *         specifying all requested events.
  }
function apr_pollcb_add(pollcb:Papr_pollcb_t; descriptor:Papr_pollfd_t):Tapr_status_t;cdecl;external;
{*
 * Remove a descriptor from a pollcb
 * @param pollcb The pollcb from which to remove the descriptor
 * @param descriptor The descriptor to remove
 * @remark If the descriptor is not found, APR_NOTFOUND is returned.
 * @remark apr_pollcb_remove() cannot be used to remove a subset of requested
 *         events for a descriptor.  The reqevents field in the apr_pollfd_t
 *         parameter must contain the same value when removing as when adding.
  }
function apr_pollcb_remove(pollcb:Papr_pollcb_t; descriptor:Papr_pollfd_t):Tapr_status_t;cdecl;external;
{*
 * Function prototype for pollcb handlers 
 * @param baton Opaque baton passed into apr_pollcb_poll()
 * @param descriptor Contains the notification for an active descriptor. 
 *                   The @a rtnevents member describes which events were triggered
 *                   for this descriptor.
 * @remark If the pollcb handler does not return APR_SUCCESS, the apr_pollcb_poll()
 *         call returns with the handler's return value.
  }
type

  Tapr_pollcb_cb_t = function (baton:pointer; descriptor:Papr_pollfd_t):Tapr_status_t;cdecl;
{*
 * Block for activity on the descriptor(s) in a pollcb
 * @param pollcb The pollcb to use
 * @param timeout The amount of time in microseconds to wait.  This is a
 *                maximum, not a minimum.  If a descriptor is signalled, the
 *                function will return before this time.  If timeout is
 *                negative, the function will block until a descriptor is
 *                signalled or until apr_pollcb_wakeup() has been called.
 * @param func Callback function to call for each active descriptor.
 * @param baton Opaque baton passed to the callback function.
 * @remark Multiple signalled conditions for the same descriptor may be reported
 *         in one or more calls to the callback function, depending on the
 *         implementation.
 * @remark APR_EINTR will be returned if the pollset has been created with
 *         APR_POLLSET_WAKEABLE and apr_pollcb_wakeup() has been called while
 *         waiting for activity.
  }

function apr_pollcb_poll(pollcb:Papr_pollcb_t; timeout:Tapr_interval_time_t; func:Tapr_pollcb_cb_t; baton:pointer):Tapr_status_t;cdecl;external;
{*
 * Interrupt the blocked apr_pollcb_poll() call.
 * @param pollcb The pollcb to use
 * @remark If the pollcb was not created with APR_POLLSET_WAKEABLE the
 *         return value is APR_EINIT.
  }
function apr_pollcb_wakeup(pollcb:Papr_pollcb_t):Tapr_status_t;cdecl;external;
{*
 * Return a printable representation of the pollcb method.
 * @param pollcb The pollcb to use
  }
(* Const before type ignored *)
function apr_pollcb_method_name(pollcb:Papr_pollcb_t):Pchar;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_POLL_H  }

implementation


end.

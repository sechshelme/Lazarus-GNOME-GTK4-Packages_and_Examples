
unit gmain;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmain.h
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
PGCond  = ^GCond;
Pgint  = ^gint;
PGMainContext  = ^GMainContext;
PGMainContextFlags  = ^GMainContextFlags;
PGMainContextPusher  = ^GMainContextPusher;
PGMainLoop  = ^GMainLoop;
PGMutex  = ^GMutex;
Pgpointer  = ^gpointer;
PGPollFD  = ^GPollFD;
PGSList  = ^GSList;
PGSource  = ^GSource;
PGSourceCallbackFuncs  = ^GSourceCallbackFuncs;
PGSourceFunc  = ^GSourceFunc;
PGSourceFuncs  = ^GSourceFuncs;
PGSourcePrivate  = ^GSourcePrivate;
PGTimeVal  = ^GTimeVal;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gmain.h - the GLib Main loop
 * Copyright (C) 1998-2000 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_MAIN_H__}
{$define __G_MAIN_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gpoll.h>}
{$include <glib/gslist.h>}
{$include <glib/gthread.h>}
{$include <stdint.h>}
{ xxxxxxxxxxxxxxx
typedef enum 

  G_IO_IN	GLIB_SYSDEF_POLLIN,
  G_IO_OUT	GLIB_SYSDEF_POLLOUT,
  G_IO_PRI	GLIB_SYSDEF_POLLPRI,
  G_IO_ERR	GLIB_SYSDEF_POLLERR,
  G_IO_HUP	GLIB_SYSDEF_POLLHUP,
  G_IO_NVAL	GLIB_SYSDEF_POLLNVAL
 GIOCondition;
 }
{*
 * GMainContextFlags:
 * @G_MAIN_CONTEXT_FLAGS_NONE: Default behaviour.
 * @G_MAIN_CONTEXT_FLAGS_OWNERLESS_POLLING: Assume that polling for events will
 * free the thread to process other jobs. That's useful if you're using
 * `g_main_context_prepare,query,check,dispatch` to integrate GMainContext in
 * other event loops.
 *
 * Flags to pass to [ctor@GLib.MainContext.new_with_flags] which affect the
 * behaviour of a [struct@GLib.MainContext].
 *
 * Since: 2.72
  }
{< flags > }
type
  PGMainContextFlags = ^TGMainContextFlags;
  TGMainContextFlags =  Longint;
  Const
    G_MAIN_CONTEXT_FLAGS_NONE = 0;
    G_MAIN_CONTEXT_FLAGS_OWNERLESS_POLLING = 1;
;
{*
 * GMainContext:
 *
 * The `GMainContext` struct is an opaque data
 * type representing a set of sources to be handled in a main loop.
  }
type
{*
 * GMainLoop:
 *
 * The `GMainLoop` struct is an opaque data type
 * representing the main event loop of a GLib or GTK application.
  }
{*
 * GSource:
 *
 * The `GSource` struct is an opaque data type
 * representing an event source.
  }
{*
 * GSourceCallbackFuncs:
 * @ref: Called when a reference is added to the callback object
 * @unref: Called when a reference to the callback object is dropped
 * @get: Called to extract the callback function and data from the
 *     callback object.
 *
 * The `GSourceCallbackFuncs` struct contains
 * functions for managing callback objects.
  }
{*
 * GSourceFuncs:
 * @prepare: (nullable): Called before all the file descriptors are polled. If
 *     the source can determine that it is ready here (without waiting for the
 *     results of the poll() call) it should return %TRUE. It can also return
 *     a @timeout_ value which should be the maximum timeout (in milliseconds)
 *     which should be passed to the poll() call. The actual timeout used will
 *     be -1 if all sources returned -1, or it will be the minimum of all
 *     the @timeout_ values returned which were >= 0.  Since 2.36 this may
 *     be %NULL, in which case the effect is as if the function always returns
 *     %FALSE with a timeout of -1.  If @prepare returns a
 *     timeout and the source also has a ready time set, then the
 *     lower of the two will be used.
 * @check: (nullable): Called after all the file descriptors are polled. The
 *     source should return %TRUE if it is ready to be dispatched. Note that
 *     some time may have passed since the previous prepare function was called,
 *     so the source should be checked again here.  Since 2.36 this may
 *     be %NULL, in which case the effect is as if the function always returns
 *     %FALSE.
 * @dispatch: Called to dispatch the event source, after it has returned
 *     %TRUE in either its @prepare or its @check function, or if a ready time
 *     has been reached. The @dispatch function receives a callback function and
 *     user data. The callback function may be %NULL if the source was never
 *     connected to a callback using [method@GLib.Source.set_callback]. The
 *     @dispatch function should call the callback function with @user_data and
 *     whatever additional parameters are needed for this type of event source.
 *     The return value of the @dispatch function should be
 *     [const@GLib.SOURCE_REMOVE] if the source should be removed or
 *     [const@GLib.SOURCE_CONTINUE] to keep it.
 * @finalize: (nullable): Called when the source is finalized. At this point,
 *     the source will have been destroyed, had its callback cleared, and have
 *     been removed from its [struct@GLib.MainContext], but it will still have
 *     its final reference count, so methods can be called on it from within
 *     this function. This may be %NULL, in which case the effect is as if the
 *     function does nothing and returns.
 *
 * The `GSourceFuncs` struct contains a table of
 * functions used to handle event sources in a generic manner.
 *
 * For idle sources, the prepare and check functions always return %TRUE
 * to indicate that the source is always ready to be processed. The prepare
 * function also returns a timeout value of 0 to ensure that the poll() call
 * doesn't block (since that would be time wasted which could have been spent
 * running the idle function).
 *
 * For timeout sources, the prepare and check functions both return %TRUE
 * if the timeout interval has expired. The prepare function also returns
 * a timeout value to ensure that the poll() call doesn't block too long
 * and miss the next timeout.
 *
 * For file descriptor sources, the prepare function typically returns %FALSE,
 * since it must wait until poll() has been called before it knows whether
 * any events need to be processed. It sets the returned timeout to -1 to
 * indicate that it doesn't mind how long the poll() call blocks. In the
 * check function, it tests the results of the poll() call to see if the
 * required condition has been met, and returns %TRUE if so.
  }
{*
 * GPid:
 *
 * A type which is used to hold a process identification.
 *
 * On UNIX, processes are identified by a process id (an integer),
 * while Windows uses process handles (which are pointers).
 *
 * GPid is used in GLib only for descendant processes spawned with
 * the g_spawn functions.
  }
{ defined in glibconfig.h  }
{*
 * G_PID_FORMAT:
 *
 * A format specifier that can be used in printf()-style format strings
 * when printing a #GPid.
 *
 * Since: 2.50
  }
{ defined in glibconfig.h  }
{*
 * GSourceFunc:
 * @user_data: data passed to the function, set when the source was
 *     created with one of the above functions
 *
 * Specifies the type of function passed to [func@GLib.timeout_add],
 * [func@GLib.timeout_add_full], [func@GLib.idle_add], and
 * [func@GLib.idle_add_full].
 *
 * When calling [method@GLib.Source.set_callback], you may need to cast a
 * function of a different type to this type. Use [func@GLib.SOURCE_FUNC] to
 * avoid warnings about incompatible function types.
 *
 * Returns: %FALSE if the source should be removed.
 * [const@GLib.SOURCE_CONTINUE] and [const@GLib.SOURCE_REMOVE] are more
 * memorable names for the return value.
  }

  TGSourceFunc = function (user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GSourceOnceFunc:
 * @user_data: data passed to the function, set when the source was
 *   created
 *
 * A source function that is only called once before being removed from the main
 * context automatically.
 *
 * See: [func@GLib.idle_add_once], [func@GLib.timeout_add_once]
 *
 * Since: 2.74
  }

  TGSourceOnceFunc = procedure (user_data:Tgpointer);cdecl;
{*
 * G_SOURCE_FUNC:
 * @f: a function pointer.
 *
 * Cast a function pointer to a [callback@GLib.SourceFunc], suppressing
 * warnings from GCC 8 onwards with `-Wextra` or `-Wcast-function-type` enabled
 * about the function types being incompatible.
 *
 * For example, the correct type of callback for a source created by
 * [func@GLib.child_watch_source_new] is #GChildWatchFunc, which accepts more
 * arguments than [callback@GLib.SourceFunc]. Casting the function with
 * `(GSourceFunc)` to call [method@GLib.Source.set_callback] will trigger a
 * warning, even though it will be cast back to the correct type before it is
 * called by the source.
 *
 * Since: 2.58
  }
{xxxxxxxxxxxxxx#define G_SOURCE_FUNC(f) ((GSourceFunc) (void (*)(void)) (f)) GLIB_AVAILABLE_MACRO_IN_2_58 }
{*
 * GChildWatchFunc:
 * @pid: the process id of the child process
 * @wait_status: Status information about the child process, encoded
 *               in a platform-specific manner
 * @user_data: user data passed to [func@GLib.child_watch_add]
 *
 * Prototype of a #GChildWatchSource callback, called when a child
 * process has exited.
 *
 * To interpret @wait_status, see the documentation for
 * [func@GLib.spawn_check_wait_status]. In particular,
 * on Unix platforms, note that it is usually not equal
 * to the integer passed to `exit()` or returned from `main()`.
  }

  TGChildWatchFunc = procedure (pid:TGPid; wait_status:Tgint; user_data:Tgpointer);cdecl;
{*
 * GSourceDisposeFunc:
 * @source: #GSource that is currently being disposed
 *
 * Dispose function for @source. See [method@GLib.Source.set_dispose_function]
 * for details.
 *
 * Since: 2.64
  }

  TGSourceDisposeFunc = procedure (source:PGSource);cdecl;
{< private > }
(* Const before type ignored *)
{ (atomic)  }
  PGSource = ^TGSource;
  TGSource = record
      callback_data : Tgpointer;cdecl;
      callback_funcs : PGSourceCallbackFuncs;
      source_funcs : PGSourceFuncs;
      ref_count : Tguint;
      context : PGMainContext;
      priority : Tgint;
      flags : Tguint;
      source_id : Tguint;
      poll_fds : PGSList;
      prev : PGSource;
      next : PGSource;
      name : Pchar;
      priv : PGSourcePrivate;
    end;

  PGSourceCallbackFuncs = ^TGSourceCallbackFuncs;
  TGSourceCallbackFuncs = record
      ref : procedure (cb_data:Tgpointer);cdecl;
      unref : procedure (cb_data:Tgpointer);cdecl;
      get : procedure (cb_data:Tgpointer; source:PGSource; func:PGSourceFunc; data:Pgpointer);cdecl;
    end;

{*
 * GSourceDummyMarshal:
 *
 * This is just a placeholder for #GClosureMarshal,
 * which cannot be used here for dependency reasons.
  }

  TGSourceDummyMarshal = procedure (para1:pointer);cdecl;
{*
 * GSourceFuncsPrepareFunc:
 * @source: The #GSource
 * @timeout_: (out) (optional): the maximum timeout (in milliseconds) which should be passed to the poll call
 *
 * Checks the source for readiness.
 *
 * Called before all the file descriptors are polled. If the
 * source can determine that it is ready here (without waiting for the
 * results of the poll call) it should return %TRUE. It can also return
 * a @timeout_ value which should be the maximum timeout (in milliseconds)
 * which should be passed to the poll call. The actual timeout used will
 * be `-1` if all sources returned `-1`, or it will be the minimum of all
 * the @timeout_ values returned which were greater than or equal to `0`.
 * If the prepare function returns a timeout and the source also has a
 * ready time set, then the lower of the two will be used.
 * 
 * Since 2.36 this may be `NULL`, in which case the effect is as if the
 * function always returns `FALSE` with a timeout of `-1`.
 *
 * Returns: %TRUE if the source is ready, %FALSE otherwise
 *
 * Since: 2.82
  }

  TGSourceFuncsPrepareFunc = function (source:PGSource; timeout_:Pgint):Tgboolean;cdecl;
{*
 * GSourceFuncsCheckFunc:
 * @source: The #GSource
 *
 * Checks if the source is ready to be dispatched.
 *
 * Called after all the file descriptors are polled. The source
 * should return %TRUE if it is ready to be dispatched. Note that some
 * time may have passed since the previous prepare function was called,
 * so the source should be checked again here.
 * 
 * Since 2.36 this may be `NULL`, in which case the effect is
 * as if the function always returns `FALSE`.
 *
 * Returns: %TRUE if ready to be dispatched, %FALSE otherwise
 *
 * Since: 2.82
  }

  TGSourceFuncsCheckFunc = function (source:PGSource):Tgboolean;cdecl;
{*
 * GSourceFuncsDispatchFunc:
 * @source: The #GSource
 * @callback: (nullable): The #GSourceFunc to call
 * @user_data: (nullable): data to pass to @callback
 *
 * Dispatches the source callback.
 *
 * Called to dispatch the event source, after it has returned
 * `TRUE` in either its prepare or its check function, or if a ready time
 * has been reached. The dispatch function receives a callback function and
 * user data. The callback function may be `NULL` if the source was never
 * connected to a callback using [method@GLib.Source.set_callback]. The dispatch
 * function should call the callback function with @user_data and whatever
 * additional parameters are needed for this type of event source. The
 * return value of the dispatch function should be [const@GLib.SOURCE_REMOVE]
 * if the source should be removed or [const@GLib.SOURCE_CONTINUE] to keep it.
 *
 * Returns: [const@GLib.SOURCE_REMOVE] if the source should be removed,
 *   [const@GLib.SOURCE_CONTINUE] otherwise.
 *
 * Since: 2.82
  }

  TGSourceFuncsDispatchFunc = function (source:PGSource; callback:TGSourceFunc; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GSourceFuncsFinalizeFunc:
 * @source: The #GSource
 *
 * Finalizes the source.
 *
 * Called when the source is finalized. At this point, the source
 * will have been destroyed, had its callback cleared, and have been removed
 * from its [type@GLib.MainContext], but it will still have its final reference
 * count, so methods can be called on it from within this function.
 *
 * Since: 2.82
  }

  TGSourceFuncsFinalizeFunc = procedure (source:PGSource);cdecl;
{ Can be NULL  }
{ Can be NULL  }
{ Can be NULL  }
{< private > }
{ For use by g_source_set_closure  }
{ Really is of type GClosureMarshal  }
  PGSourceFuncs = ^TGSourceFuncs;
  TGSourceFuncs = record
      prepare : TGSourceFuncsPrepareFunc;cdecl;
      check : TGSourceFuncsCheckFunc;
      dispatch : TGSourceFuncsDispatchFunc;
      finalize : TGSourceFuncsFinalizeFunc;
      closure_callback : TGSourceFunc;
      closure_marshal : TGSourceDummyMarshal;
    end;

{ Standard priorities  }
{*
 * G_PRIORITY_HIGH:
 *
 * Use this for high priority event sources.
 *
 * It is not used within GLib or GTK.
  }

const
  G_PRIORITY_HIGH = -(100);  
{*
 * G_PRIORITY_DEFAULT:
 *
 * Use this for default priority event sources.
 *
 * In GLib this priority is used when adding timeout functions
 * with [func@GLib.timeout_add]. In GDK this priority is used for events
 * from the X server.
  }
  G_PRIORITY_DEFAULT = 0;  
{*
 * G_PRIORITY_HIGH_IDLE:
 *
 * Use this for high priority idle functions.
 *
 * GTK uses %G_PRIORITY_HIGH_IDLE + 10 for resizing operations,
 * and %G_PRIORITY_HIGH_IDLE + 20 for redrawing operations. (This is
 * done to ensure that any pending resizes are processed before any
 * pending redraws, so that widgets are not redrawn twice unnecessarily.)
  }
  G_PRIORITY_HIGH_IDLE = 100;  
{*
 * G_PRIORITY_DEFAULT_IDLE:
 *
 * Use this for default priority idle functions.
 *
 * In GLib this priority is used when adding idle functions with
 * [func@GLib.idle_add].
  }
  G_PRIORITY_DEFAULT_IDLE = 200;  
{*
 * G_PRIORITY_LOW:
 *
 * Use this for very low priority background tasks.
 *
 * It is not used within GLib or GTK.
  }
  G_PRIORITY_LOW = 300;  
{*
 * G_SOURCE_REMOVE:
 *
 * Use this macro as the return value of a [callback@GLib.SourceFunc] to remove
 * the [struct@GLib.Source] from the main loop.
 *
 * Since: 2.32
  }
  G_SOURCE_REMOVE = _FALSE;  
{*
 * G_SOURCE_CONTINUE:
 *
 * Use this macro as the return value of a [callback@GLib.SourceFunc] to leave
 * the [struct@GLib.Source] in the main loop.
 *
 * Since: 2.32
  }
  G_SOURCE_CONTINUE = _TRUE;  
{ GMainContext:  }

function g_main_context_new:PGMainContext;cdecl;external;
function g_main_context_new_with_flags(flags:TGMainContextFlags):PGMainContext;cdecl;external;
function g_main_context_ref(context:PGMainContext):PGMainContext;cdecl;external;
procedure g_main_context_unref(context:PGMainContext);cdecl;external;
function g_main_context_default:PGMainContext;cdecl;external;
function g_main_context_iteration(context:PGMainContext; may_block:Tgboolean):Tgboolean;cdecl;external;
function g_main_context_pending(context:PGMainContext):Tgboolean;cdecl;external;
{ For implementation of legacy interfaces
  }
function g_main_context_find_source_by_id(context:PGMainContext; source_id:Tguint):PGSource;cdecl;external;
function g_main_context_find_source_by_user_data(context:PGMainContext; user_data:Tgpointer):PGSource;cdecl;external;
function g_main_context_find_source_by_funcs_user_data(context:PGMainContext; funcs:PGSourceFuncs; user_data:Tgpointer):PGSource;cdecl;external;
{ Low level functions for implementing custom main loops.
  }
procedure g_main_context_wakeup(context:PGMainContext);cdecl;external;
function g_main_context_acquire(context:PGMainContext):Tgboolean;cdecl;external;
procedure g_main_context_release(context:PGMainContext);cdecl;external;
function g_main_context_is_owner(context:PGMainContext):Tgboolean;cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_58_FOR(g_main_context_is_owner) }
function g_main_context_wait(context:PGMainContext; cond:PGCond; mutex:PGMutex):Tgboolean;cdecl;external;
function g_main_context_prepare(context:PGMainContext; priority:Pgint):Tgboolean;cdecl;external;
function g_main_context_query(context:PGMainContext; max_priority:Tgint; timeout_:Pgint; fds:PGPollFD; n_fds:Tgint):Tgint;cdecl;external;
function g_main_context_check(context:PGMainContext; max_priority:Tgint; fds:PGPollFD; n_fds:Tgint):Tgboolean;cdecl;external;
procedure g_main_context_dispatch(context:PGMainContext);cdecl;external;
procedure g_main_context_set_poll_func(context:PGMainContext; func:TGPollFunc);cdecl;external;
function g_main_context_get_poll_func(context:PGMainContext):TGPollFunc;cdecl;external;
{ Low level functions for use by source implementations
  }
procedure g_main_context_add_poll(context:PGMainContext; fd:PGPollFD; priority:Tgint);cdecl;external;
procedure g_main_context_remove_poll(context:PGMainContext; fd:PGPollFD);cdecl;external;
function g_main_depth:Tgint;cdecl;external;
function g_main_current_source:PGSource;cdecl;external;
{ GMainContexts for other threads
  }
procedure g_main_context_push_thread_default(context:PGMainContext);cdecl;external;
procedure g_main_context_pop_thread_default(context:PGMainContext);cdecl;external;
function g_main_context_get_thread_default:PGMainContext;cdecl;external;
function g_main_context_ref_thread_default:PGMainContext;cdecl;external;
type
  PGMainContextPusher = ^TGMainContextPusher;
  TGMainContextPusher = pointer;
{*xxxxxxxxxxxxx

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline GMainContextPusher *g_main_context_pusher_new (GMainContext *main_context);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline GMainContextPusher *
g_main_context_pusher_new (GMainContext *main_context)

  g_main_context_push_thread_default (main_context);
  return (GMainContextPusher *) main_context;




GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline void g_main_context_pusher_free (GMainContextPusher *pusher);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline void
g_main_context_pusher_free (GMainContextPusher *pusher)

  g_main_context_pop_thread_default ((GMainContext *) pusher);


  }
{ GMainLoop:  }

function g_main_loop_new(context:PGMainContext; is_running:Tgboolean):PGMainLoop;cdecl;external;
procedure g_main_loop_run(loop:PGMainLoop);cdecl;external;
procedure g_main_loop_quit(loop:PGMainLoop);cdecl;external;
function g_main_loop_ref(loop:PGMainLoop):PGMainLoop;cdecl;external;
procedure g_main_loop_unref(loop:PGMainLoop);cdecl;external;
function g_main_loop_is_running(loop:PGMainLoop):Tgboolean;cdecl;external;
function g_main_loop_get_context(loop:PGMainLoop):PGMainContext;cdecl;external;
{ GSource:  }
function g_source_new(source_funcs:PGSourceFuncs; struct_size:Tguint):PGSource;cdecl;external;
procedure g_source_set_dispose_function(source:PGSource; _dispose:TGSourceDisposeFunc);cdecl;external;
function g_source_ref(source:PGSource):PGSource;cdecl;external;
procedure g_source_unref(source:PGSource);cdecl;external;
function g_source_attach(source:PGSource; context:PGMainContext):Tguint;cdecl;external;
procedure g_source_destroy(source:PGSource);cdecl;external;
procedure g_source_set_priority(source:PGSource; priority:Tgint);cdecl;external;
function g_source_get_priority(source:PGSource):Tgint;cdecl;external;
procedure g_source_set_can_recurse(source:PGSource; can_recurse:Tgboolean);cdecl;external;
function g_source_get_can_recurse(source:PGSource):Tgboolean;cdecl;external;
function g_source_get_id(source:PGSource):Tguint;cdecl;external;
function g_source_get_context(source:PGSource):PGMainContext;cdecl;external;
function g_source_dup_context(source:PGSource):PGMainContext;cdecl;external;
procedure g_source_set_callback(source:PGSource; func:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure g_source_set_funcs(source:PGSource; funcs:PGSourceFuncs);cdecl;external;
function g_source_is_destroyed(source:PGSource):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_source_set_name(source:PGSource; name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_source_set_static_name(source:PGSource; name:Pchar);cdecl;external;
(* Const before type ignored *)
function g_source_get_name(source:PGSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_source_set_name_by_id(tag:Tguint; name:Pchar);cdecl;external;
procedure g_source_set_ready_time(source:PGSource; ready_time:Tgint64);cdecl;external;
function g_source_get_ready_time(source:PGSource):Tgint64;cdecl;external;
{$ifdef G_OS_UNIX}
function g_source_add_unix_fd(source:PGSource; fd:Tgint; events:TGIOCondition):Tgpointer;cdecl;external;
procedure g_source_modify_unix_fd(source:PGSource; tag:Tgpointer; new_events:TGIOCondition);cdecl;external;
procedure g_source_remove_unix_fd(source:PGSource; tag:Tgpointer);cdecl;external;
function g_source_query_unix_fd(source:PGSource; tag:Tgpointer):TGIOCondition;cdecl;external;
{$endif}
{ Used to implement g_source_connect_closure and internally }

procedure g_source_set_callback_indirect(source:PGSource; callback_data:Tgpointer; callback_funcs:PGSourceCallbackFuncs);cdecl;external;
procedure g_source_add_poll(source:PGSource; fd:PGPollFD);cdecl;external;
procedure g_source_remove_poll(source:PGSource; fd:PGPollFD);cdecl;external;
procedure g_source_add_child_source(source:PGSource; child_source:PGSource);cdecl;external;
procedure g_source_remove_child_source(source:PGSource; child_source:PGSource);cdecl;external;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_28_FOR(g_source_get_time) }
procedure g_source_get_current_time(source:PGSource; timeval:PGTimeVal);cdecl;external;
function g_source_get_time(source:PGSource):Tgint64;cdecl;external;
{ void g_source_connect_closure (GSource        *source,
                                  GClosure       *closure);
  }
{ Specific source types
  }
function g_idle_source_new:PGSource;cdecl;external;
function g_child_watch_source_new(pid:TGPid):PGSource;cdecl;external;
function g_timeout_source_new(interval:Tguint):PGSource;cdecl;external;
function g_timeout_source_new_seconds(interval:Tguint):PGSource;cdecl;external;
{ Miscellaneous functions
  }
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_get_real_time) }
procedure g_get_current_time(result:PGTimeVal);cdecl;external;
function g_get_monotonic_time:Tgint64;cdecl;external;
function g_get_monotonic_time_ns:Tuint64_t;cdecl;external;
function g_get_real_time:Tgint64;cdecl;external;
{ Source manipulation by ID  }
function g_source_remove(tag:Tguint):Tgboolean;cdecl;external;
function g_source_remove_by_user_data(user_data:Tgpointer):Tgboolean;cdecl;external;
function g_source_remove_by_funcs_user_data(funcs:PGSourceFuncs; user_data:Tgpointer):Tgboolean;cdecl;external;
{*
 * GClearHandleFunc:
 * @handle_id: the handle ID to clear
 *
 * Specifies the type of function passed to [func@GLib.clear_handle_id] The
 * implementation is expected to free the resource identified by @handle_id;
 * for instance, if @handle_id is a [struct@GLib.Source] ID,
 * [func@GLib.Source.remove] can be used.
 *
 * Since: 2.56
  }
type

  TGClearHandleFunc = procedure (handle_id:Tguint);cdecl;

procedure g_clear_handle_id(tag_ptr:Pguint; clear_func:TGClearHandleFunc);cdecl;external;
{* xxxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline unsigned int g_steal_handle_id (unsigned int *handle_pointer);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline unsigned int
g_steal_handle_id (unsigned int *handle_pointer)

  unsigned int handle;

  handle = *handle_pointer;
  *handle_pointer = 0;

  return handle;

  }
function g_timeout_add_full(priority:Tgint; interval:Tguint; _function:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function g_timeout_add(interval:Tguint; _function:TGSourceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_timeout_add_once(interval:Tguint; _function:TGSourceOnceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_timeout_add_seconds_full(priority:Tgint; interval:Tguint; _function:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function g_timeout_add_seconds(interval:Tguint; _function:TGSourceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_timeout_add_seconds_once(interval:Tguint; _function:TGSourceOnceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_child_watch_add_full(priority:Tgint; pid:TGPid; _function:TGChildWatchFunc; data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function g_child_watch_add(pid:TGPid; _function:TGChildWatchFunc; data:Tgpointer):Tguint;cdecl;external;
function g_idle_add(_function:TGSourceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_idle_add_full(priority:Tgint; _function:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function g_idle_add_once(_function:TGSourceOnceFunc; data:Tgpointer):Tguint;cdecl;external;
function g_idle_remove_by_data(data:Tgpointer):Tgboolean;cdecl;external;
procedure g_main_context_invoke_full(context:PGMainContext; priority:Tgint; _function:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure g_main_context_invoke(context:PGMainContext; _function:TGSourceFunc; data:Tgpointer);cdecl;external;
{*xxxxxxxxxxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_70
static inline int g_steal_fd (int *fd_ptr);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_70
static inline int
g_steal_fd (int *fd_ptr)

  int fd = *fd_ptr;
  *fd_ptr = -1;
  return fd;

  }
{ Hook for GClosure / GSource integration. Don't touch  }
  var
    g_timeout_funcs : TGSourceFuncs;cvar;external;
    g_child_watch_funcs : TGSourceFuncs;cvar;external;
    g_idle_funcs : TGSourceFuncs;cvar;external;
{$ifdef G_OS_UNIX}
    g_unix_signal_funcs : TGSourceFuncs;cvar;external;
    g_unix_fd_source_funcs : TGSourceFuncs;cvar;external;
{$endif}
{$endif}
{ __G_MAIN_H__  }

implementation


end.

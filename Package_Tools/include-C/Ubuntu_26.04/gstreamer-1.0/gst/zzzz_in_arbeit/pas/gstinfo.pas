unit gstinfo;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gstinfo.h: debugging functions
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GSTINFO_H__}
{$define __GSTINFO_H__}
{$include "gstclock.h"}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstconfig.h>}
{$include <gst/gstsegment.h>}
{ add more  }
{ add more  }
type
  PGstDebugLevel = ^TGstDebugLevel;
  TGstDebugLevel =  Longint;
  Const
    GST_LEVEL_NONE = 0;
    GST_LEVEL_ERROR = 1;
    GST_LEVEL_WARNING = 2;
    GST_LEVEL_FIXME = 3;
    GST_LEVEL_INFO = 4;
    GST_LEVEL_DEBUG = 5;
    GST_LEVEL_LOG = 6;
    GST_LEVEL_TRACE = 7;
    GST_LEVEL_MEMDUMP = 9;
    GST_LEVEL_COUNT = 10;
;
{< flags > }
{ colors  }
{ background colors  }
{ other formats  }
type
  PGstDebugColorFlags = ^TGstDebugColorFlags;
  TGstDebugColorFlags =  Longint;
  Const
    GST_DEBUG_FG_BLACK = $0000;
    GST_DEBUG_FG_RED = $0001;
    GST_DEBUG_FG_GREEN = $0002;
    GST_DEBUG_FG_YELLOW = $0003;
    GST_DEBUG_FG_BLUE = $0004;
    GST_DEBUG_FG_MAGENTA = $0005;
    GST_DEBUG_FG_CYAN = $0006;
    GST_DEBUG_FG_WHITE = $0007;
    GST_DEBUG_BG_BLACK = $0000;
    GST_DEBUG_BG_RED = $0010;
    GST_DEBUG_BG_GREEN = $0020;
    GST_DEBUG_BG_YELLOW = $0030;
    GST_DEBUG_BG_BLUE = $0040;
    GST_DEBUG_BG_MAGENTA = $0050;
    GST_DEBUG_BG_CYAN = $0060;
    GST_DEBUG_BG_WHITE = $0070;
    GST_DEBUG_BOLD = $0100;
    GST_DEBUG_UNDERLINE = $0200;
;
type
  PGstStackTraceFlags = ^TGstStackTraceFlags;
  TGstStackTraceFlags =  Longint;
  Const
    GST_STACK_TRACE_SHOW_NONE = 0;
    GST_STACK_TRACE_SHOW_FULL = 1 shl 0;
;
type
  PGstDebugColorMode = ^TGstDebugColorMode;
  TGstDebugColorMode =  Longint;
  Const
    GST_DEBUG_COLOR_MODE_OFF = 0;
    GST_DEBUG_COLOR_MODE_ON = 1;
    GST_DEBUG_COLOR_MODE_UNIX = 2;
;
  GST_DEBUG_FG_MASK = $000F;  
  GST_DEBUG_BG_MASK = $00F0;  
  GST_DEBUG_FORMAT_MASK = $FF00;  
type
{*
 * GstDebugCategory:
 *
 * This is the struct that describes the categories. Once initialized with
 * #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
  }
{< private > }
{ see defines above  }
  PGstDebugCategory = ^TGstDebugCategory;
  TGstDebugCategory = record
      threshold : Tgint;
      color : Tguint;
      name : Pgchar;
      description : Pgchar;
    end;

{********* some convenience macros for debugging ********* }

const
  GST_PTR_FORMAT = 'p\aA';  
{*
 * GST_SEGMENT_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer segments. You can use this in
 * combination with GStreamer's debug logging system as well as the functions
 * gst_info_vasprintf(), gst_info_strdup_vprintf() and gst_info_strdup_printf()
 * to pretty-print #GstSegment structures.
 * This can only be used on pointers to GstSegment structures.
  }
  GST_SEGMENT_FORMAT = 'p\aB';  
{*
 * GST_TIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer ClockTime pointers. You can use
 * this in combination with GStreamer's debug logging system as well as the
 * functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print #GstClockTime pointers. This can
 * only be used on pointers to GstClockTime values.
 *
 * Since: 1.18
  }
  GST_TIMEP_FORMAT = 'p\aT';  
{*
 * GST_STIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer signed time value pointers. You
 * can use this in combination with GStreamer's debug logging system as well as
 * the functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print signed time (pointers to
 * #GstClockTimeDiff or #gint64).
 *
 * Since: 1.18
  }
  GST_STIMEP_FORMAT = 'p\aS';  
type
{*
 * GstLogFunction:
 * @category: a #GstDebugCategory
 * @level: a #GstDebugLevel
 * @file: file name
 * @function: function name
 * @line: line number
 * @object: a #GObject
 * @message: the message
 * @user_data: user data for the log function
 *
 * Function prototype for a logging function that can be registered with
 * gst_debug_add_log_function().
 * Use  on that function.
  }

  TGstLogFunction = procedure (category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
                object:PGObject; message:PGstDebugMessage; user_data:Tgpointer);cdecl;

procedure gst_debug_log(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_debug_log(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar);cdecl;external libgstreamer;
{ (7, 8) ; }
procedure gst_debug_log_valist(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar; args:Tva_list);cdecl;external libgstreamer;
procedure gst_debug_log_literal(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; message_string:Pgchar);cdecl;external libgstreamer;
procedure gst_debug_log_id(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_debug_log_id(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar);cdecl;external libgstreamer;
{ (7, 8) ; }
procedure gst_debug_log_id_valist(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar; args:Tva_list);cdecl;external libgstreamer;
procedure gst_debug_log_id_literal(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; message_string:Pgchar);cdecl;external libgstreamer;
{ do not use this function, use the GST_DEBUG_CATEGORY_INIT macro  }
function _gst_debug_category_new(name:Pgchar; color:Tguint; description:Pgchar):PGstDebugCategory;cdecl;external libgstreamer;
{ do not use this function, use the GST_DEBUG_CATEGORY_GET macro  }
function _gst_debug_get_category(name:Pgchar):PGstDebugCategory;cdecl;external libgstreamer;
{ do not use these functions, use the GST_CAT_MEMDUMP_* macros  }
procedure _gst_debug_dump_mem(cat:PGstDebugCategory; file:Pgchar; func:Pgchar; line:Tgint; obj:PGObject; 
            msg:Pgchar; data:Pguint8; length:Tguint);cdecl;external libgstreamer;
procedure _gst_debug_dump_mem_id(cat:PGstDebugCategory; file:Pgchar; func:Pgchar; line:Tgint; object_id:Pgchar; 
            msg:Pgchar; data:Pguint8; length:Tguint);cdecl;external libgstreamer;
{*
 * GstDebugFuncPtr: (attributes doc.skip=true)
 * we define this to avoid a compiler warning regarding a cast from a function
 * pointer to a void pointer
 * (see https://bugzilla.gnome.org/show_bug.cgi?id=309253)
  }
type

  TGstDebugFuncPtr = procedure (para1:pointer);cdecl;
{ do no use these functions, use the GST_DEBUG*_FUNCPTR macros  }

procedure _gst_debug_register_funcptr(func:TGstDebugFuncPtr; ptrname:Pgchar);cdecl;external libgstreamer;
function _gst_debug_nameof_funcptr(func:TGstDebugFuncPtr):Pgchar;cdecl;external libgstreamer;
function gst_debug_message_get(message:PGstDebugMessage):Pgchar;cdecl;external libgstreamer;
function gst_debug_message_get_id(message:PGstDebugMessage):Pgchar;cdecl;external libgstreamer;
function gst_debug_log_get_line(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
           object:PGObject; message:PGstDebugMessage):Pgchar;cdecl;external libgstreamer;
procedure gst_debug_log_default(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; message:PGstDebugMessage; user_data:Tgpointer);cdecl;external libgstreamer;
function gst_debug_level_get_name(level:TGstDebugLevel):Pgchar;cdecl;external libgstreamer;
procedure gst_debug_add_log_function(func:TGstLogFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstreamer;
function gst_debug_remove_log_function(func:TGstLogFunction):Tguint;cdecl;external libgstreamer;
function gst_debug_remove_log_function_by_data(data:Tgpointer):Tguint;cdecl;external libgstreamer;
procedure gst_debug_set_active(active:Tgboolean);cdecl;external libgstreamer;
function gst_debug_is_active:Tgboolean;cdecl;external libgstreamer;
procedure gst_debug_set_colored(colored:Tgboolean);cdecl;external libgstreamer;
procedure gst_debug_set_color_mode(mode:TGstDebugColorMode);cdecl;external libgstreamer;
procedure gst_debug_set_color_mode_from_string(mode:Pgchar);cdecl;external libgstreamer;
function gst_debug_is_colored:Tgboolean;cdecl;external libgstreamer;
function gst_debug_get_color_mode:TGstDebugColorMode;cdecl;external libgstreamer;
procedure gst_debug_set_default_threshold(level:TGstDebugLevel);cdecl;external libgstreamer;
function gst_debug_get_default_threshold:TGstDebugLevel;cdecl;external libgstreamer;
procedure gst_debug_set_threshold_for_name(name:Pgchar; level:TGstDebugLevel);cdecl;external libgstreamer;
procedure gst_debug_set_threshold_from_string(list:Pgchar; reset:Tgboolean);cdecl;external libgstreamer;
procedure gst_debug_unset_threshold_for_name(name:Pgchar);cdecl;external libgstreamer;
{xxxxxxxxxxxGST_DEPRECATED }
procedure gst_debug_category_free(category:PGstDebugCategory);cdecl;external libgstreamer;
procedure gst_debug_category_set_threshold(category:PGstDebugCategory; level:TGstDebugLevel);cdecl;external libgstreamer;
procedure gst_debug_category_reset_threshold(category:PGstDebugCategory);cdecl;external libgstreamer;
function gst_debug_category_get_threshold(category:PGstDebugCategory):TGstDebugLevel;cdecl;external libgstreamer;
function gst_debug_category_get_name(category:PGstDebugCategory):Pgchar;cdecl;external libgstreamer;
function gst_debug_category_get_color(category:PGstDebugCategory):Tguint;cdecl;external libgstreamer;
function gst_debug_category_get_description(category:PGstDebugCategory):Pgchar;cdecl;external libgstreamer;
function gst_debug_get_all_categories:PGSList;cdecl;external libgstreamer;
function gst_debug_print_object(ptr:Tgconstpointer):Pgchar;cdecl;external libgstreamer;
function gst_debug_print_segment(segment:PGstSegment):Pgchar;cdecl;external libgstreamer;
function gst_debug_construct_term_color(colorinfo:Tguint):Pgchar;cdecl;external libgstreamer;
function gst_debug_construct_win_color(colorinfo:Tguint):Tgint;cdecl;external libgstreamer;
function gst_info_vasprintf(result:PPgchar; format:Pgchar; args:Tva_list):Tgint;cdecl;external libgstreamer;
{ (2, 0); }
function gst_info_strdup_vprintf(format:Pgchar; args:Tva_list):Pgchar;cdecl;external libgstreamer;
{ (1, 0); }
function gst_info_strdup_printf(format:Pgchar; args:array of const):Pgchar;cdecl;external libgstreamer;
function gst_info_strdup_printf(format:Pgchar):Pgchar;cdecl;external libgstreamer;
{ (1, 2); }
procedure gst_print(format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_print(format:Pgchar);cdecl;external libgstreamer;
{ (1, 2); }
procedure gst_println(format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_println(format:Pgchar);cdecl;external libgstreamer;
{ (1, 2); }
procedure gst_printerr(format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_printerr(format:Pgchar);cdecl;external libgstreamer;
{ (1, 2); }
procedure gst_printerrln(format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_printerrln(format:Pgchar);cdecl;external libgstreamer;
{ (1, 2); }
  var
    GST_CAT_DEFAULT : PGstDebugCategory;cvar;external libgstreamer;
{ this symbol may not be used  }
    _gst_debug_enabled : Tgboolean;cvar;external libgstreamer;
{ the min debug level, used for quickly discarding debug
 * messages that fall under the threshold.  }
    _gst_debug_min : TGstDebugLevel;cvar;external libgstreamer;

procedure gst_debug_print_stack_trace;cdecl;external libgstreamer;
function gst_debug_get_stack_trace(flags:TGstStackTraceFlags):Pgchar;cdecl;external libgstreamer;
procedure gst_debug_add_ring_buffer_logger(max_size_per_thread:Tguint; thread_timeout:Tguint);cdecl;external libgstreamer;
procedure gst_debug_remove_ring_buffer_logger;cdecl;external libgstreamer;
function gst_debug_ring_buffer_logger_get_logs:^Pgchar;cdecl;external libgstreamer;
{*
 * GstLogContextHashFlags:
 * @GST_LOG_CONTEXT_DEFAULT: Default behavior for logging context
 *                          (uses object, format, file but not line number or string args)
 * @GST_LOG_CONTEXT_IGNORE_OBJECT: Ignore object pointer or object ID when calculating message hash
 * @GST_LOG_CONTEXT_IGNORE_FORMAT: Ignore the "format" part of the debug
 * log message
 * @GST_LOG_CONTEXT_IGNORE_FILE: Ignore file name when calculating message hash
 * @GST_LOG_CONTEXT_USE_LINE_NUMBER: Use line number when calculating message hash (not used by default)
 * @GST_LOG_CONTEXT_USE_STRING_ARGS: Use the arguments part of the string message (not used by default)
 *
 * Flags to control how the message hash is calculated in a #GstLogContext.
 * The message hash is used to determine if a message is a duplicate of a previously
 * logged message.
 *
 * Since: 1.28
  }
type
  PGstLogContextHashFlags = ^TGstLogContextHashFlags;
  TGstLogContextHashFlags =  Longint;
  Const
    GST_LOG_CONTEXT_DEFAULT = 0;
    GST_LOG_CONTEXT_IGNORE_OBJECT = 1 shl 0;
    GST_LOG_CONTEXT_IGNORE_FORMAT = 1 shl 1;
    GST_LOG_CONTEXT_IGNORE_FILE = 1 shl 2;
    GST_LOG_CONTEXT_USE_LINE_NUMBER = 1 shl 3;
    GST_LOG_CONTEXT_USE_STRING_ARGS = 1 shl 4;
;
{*
 * GstLogContextFlags:
 * @GST_LOG_CONTEXT_FLAG_NONE: No special behavior (empty flags)
 * @GST_LOG_CONTEXT_FLAG_THROTTLE: Enable message throttling/deduplication. This
 *  makes the context track which messages have been logged already based on
 *  their message hash, and only log them once (or periodically if an
 *  interval is set). Without this flag, all messages will be logged regardless
 *  of whether they've been logged before.
 *
 * Flags to control the behavior of a #GstLogContext.
 *
 * Since: 1.28
  }
type
  PGstLogContextFlags = ^TGstLogContextFlags;
  TGstLogContextFlags =  Longint;
  Const
    GST_LOG_CONTEXT_FLAG_NONE = 0;
    GST_LOG_CONTEXT_FLAG_THROTTLE = 1 shl 0;
;
{*
 * GstLogContext:
 *
 * A context for controlling logging behavior, for example to handle
 * logging once or periodic logging, avoiding to
 * spam the terminal with the same log message multiple times.
 *
 * ## Simple log context using static macros
 *
 * ``` c
 * // At global/file scope:
 * GST_LOG_CONTEXT_STATIC_DEFINE(my_context, GST_LOG_CONTEXT_FLAG_THROTTLE, );
 * #define MY_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_context)
 *
 * // Then in code:
 * GST_CTX_INFO(MY_CONTEXT, "This will only appear once per file/line");
 * ```
 *
 * ## Periodic logging
 *
 * For messages that should be logged periodically (e.g., maximum once per minute):
 *
 * ``` c
 * // At global/file scope:
 * GST_LOG_CONTEXT_STATIC_DEFINE(my_periodic_context, GST_LOG_CONTEXT_FLAG_THROTTLE,
 *   GST_LOG_CONTEXT_BUILDER_SET_INTERVAL(60 * GST_SECOND);
 * );
 * #define MY_PERIODIC_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_periodic_context)
 *
 * // Then in code:
 * GST_CTX_INFO(MY_PERIODIC_CONTEXT, "This appears once per minute");
 * ```
 *
 * ## Customizing Message hash with custom flags and category
 *
 * By default, a message's hash is determined by the file name, object pointer,
 * and format string. You can customize this with builder operations:
 *
 * ``` c
 * // Ignore the object pointer when determining message hash (with throttling)
 * GST_LOG_CONTEXT_STATIC_DEFINE(obj_independent_ctx, GST_LOG_CONTEXT_FLAG_THROTTLE,
 *   GST_LOG_CONTEXT_BUILDER_SET_HASH_FLAGS(GST_LOG_CONTEXT_IGNORE_OBJECT);
 * );
 *
 * // Use a custom category (without throttling)
 * GST_LOG_CONTEXT_STATIC_DEFINE(custom_cat_ctx, GST_LOG_CONTEXT_FLAG_NONE,
 *   GST_LOG_CONTEXT_BUILDER_SET_CATEGORY(my_category);
 * );
 * ```
 *
 * Since: 1.28
  }
type
{*
 * GstLogContextBuilder:
 *
 * A builder for creating a #GstLogContext. This provides a flexible way to
 * configure a log context with various options while maintaining immutability
 * of the resulting context.
 *
 * Since: 1.28
  }

function gst_log_context_get_category(context:PGstLogContext):PGstDebugCategory;cdecl;external libgstreamer;
procedure gst_log_context_reset(ctx:PGstLogContext);cdecl;external libgstreamer;
procedure gst_log_context_free(ctx:PGstLogContext);cdecl;external libgstreamer;
procedure gst_debug_log_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_debug_log_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar);cdecl;external libgstreamer;
{(7, 8); }
procedure gst_debug_log_with_context_valist(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar; args:Tva_list);cdecl;external libgstreamer;
{ (7, 0) ; }
procedure gst_debug_log_literal_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; message:Pgchar);cdecl;external libgstreamer;
procedure gst_debug_log_id_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure gst_debug_log_id_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar);cdecl;external libgstreamer;
{(7, 8); }
procedure gst_debug_log_id_with_context_valist(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar; args:Tva_list);cdecl;external libgstreamer;
{(7, 0); }
procedure gst_debug_log_id_literal_with_context(ctx:PGstLogContext; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; message:Pgchar);cdecl;external libgstreamer;
procedure _gst_debug_log_once(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure _gst_debug_log_once(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            object:PGObject; format:Pgchar);cdecl;external libgstreamer;
{(7, 8); }
procedure _gst_debug_log_once_id(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar; args:array of const);cdecl;external libgstreamer;
procedure _gst_debug_log_once_id(category:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; line:Tgint; 
            id:Pgchar; format:Pgchar);cdecl;external libgstreamer;
{(7, 8); }
{ Builder pattern API  }
function gst_log_context_builder_new(category:PGstDebugCategory; flags:TGstLogContextFlags):PGstLogContextBuilder;cdecl;external libgstreamer;
function gst_log_context_builder_set_hash_flags(builder:PGstLogContextBuilder; flags:TGstLogContextHashFlags):PGstLogContextBuilder;cdecl;external libgstreamer;
function gst_log_context_builder_set_category(builder:PGstLogContextBuilder; category:PGstDebugCategory):PGstLogContextBuilder;cdecl;external libgstreamer;
function gst_log_context_builder_set_interval(builder:PGstLogContextBuilder; interval:TGstClockTime):PGstLogContextBuilder;cdecl;external libgstreamer;
function gst_log_context_builder_build(builder:PGstLogContextBuilder):PGstLogContext;cdecl;external libgstreamer;

// === Konventiert am: 11-7-26 11:30:45 ===


implementation



end.

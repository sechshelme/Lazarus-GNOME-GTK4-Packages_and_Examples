unit gmessages;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __G_MESSAGES_H__}
{$define __G_MESSAGES_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <stdarg.h>}
{$include <glib/gatomic.h>}
{$include <glib/gtypes.h>}
{$include <glib/gmacros.h>}
{$include <glib/gvariant.h>}
{ calculate a string size, guaranteed to fit format + args.
  }

function g_printf_string_upper_bound(format:Pgchar; args:Tva_list):Tgsize;cdecl;external libglib2;
{ Log level shift offset for user defined
 * log levels (0-7 are used by GLib).
  }
const
  G_LOG_LEVEL_USER_SHIFT = 8;  
{ Glib log levels and flags.
  }
{ log flags  }
{ GLib log levels  }
{ always fatal  }
type
  PGLogLevelFlags = ^TGLogLevelFlags;
  TGLogLevelFlags =  Longint;
  Const
    G_LOG_FLAG_RECURSION = 1 shl 0;
    G_LOG_FLAG_FATAL = 1 shl 1;
    G_LOG_LEVEL_ERROR = 1 shl 2;
    G_LOG_LEVEL_CRITICAL = 1 shl 3;
    G_LOG_LEVEL_WARNING = 1 shl 4;
    G_LOG_LEVEL_MESSAGE = 1 shl 5;
    G_LOG_LEVEL_INFO = 1 shl 6;
    G_LOG_LEVEL_DEBUG = 1 shl 7;
    G_LOG_LEVEL_MASK =  not (G_LOG_FLAG_RECURSION or G_LOG_FLAG_FATAL);
;
{ GLib log levels that are considered fatal by default  }
{xxxxxxxxxxxx
Makros und inline entfernt
 }
  G_LOG_FATAL_MASK = G_LOG_FLAG_RECURSION or G_LOG_LEVEL_ERROR;  
type

  TGLogFunc = procedure (log_domain:Pgchar; log_level:TGLogLevelFlags; message:Pgchar; user_data:Tgpointer);cdecl;
{ Logging mechanism
  }

function g_log_set_handler(log_domain:Pgchar; log_levels:TGLogLevelFlags; log_func:TGLogFunc; user_data:Tgpointer):Tguint;cdecl;external libglib2;
function g_log_set_handler_full(log_domain:Pgchar; log_levels:TGLogLevelFlags; log_func:TGLogFunc; user_data:Tgpointer; destroy:TGDestroyNotify):Tguint;cdecl;external libglib2;
procedure g_log_remove_handler(log_domain:Pgchar; handler_id:Tguint);cdecl;external libglib2;
procedure g_log_default_handler(log_domain:Pgchar; log_level:TGLogLevelFlags; message:Pgchar; unused_data:Tgpointer);cdecl;external libglib2;
function g_log_set_default_handler(log_func:TGLogFunc; user_data:Tgpointer):TGLogFunc;cdecl;external libglib2;
procedure g_log(log_domain:Pgchar; log_level:TGLogLevelFlags; format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_log(log_domain:Pgchar; log_level:TGLogLevelFlags; format:Pgchar);cdecl;external libglib2;
procedure g_logv(log_domain:Pgchar; log_level:TGLogLevelFlags; format:Pgchar; args:Tva_list);cdecl;external libglib2;
function g_log_set_fatal_mask(log_domain:Pgchar; fatal_mask:TGLogLevelFlags):TGLogLevelFlags;cdecl;external libglib2;
function g_log_set_always_fatal(fatal_mask:TGLogLevelFlags):TGLogLevelFlags;cdecl;external libglib2;
function g_log_get_always_fatal:TGLogLevelFlags;cdecl;external libglib2;
{ Structured logging mechanism.  }
{*
 * GLogWriterOutput:
 * @G_LOG_WRITER_HANDLED: Log writer has handled the log entry.
 * @G_LOG_WRITER_UNHANDLED: Log writer could not handle the log entry.
 *
 * Return values from #GLogWriterFuncs to indicate whether the given log entry
 * was successfully handled by the writer, or whether there was an error in
 * handling it (and hence a fallback writer should be used).
 *
 * If a #GLogWriterFunc ignores a log entry, it should return
 * %G_LOG_WRITER_HANDLED.
 *
 * Since: 2.50
  }
type
  PGLogWriterOutput = ^TGLogWriterOutput;
  TGLogWriterOutput =  Longint;
  Const
    G_LOG_WRITER_HANDLED = 1;
    G_LOG_WRITER_UNHANDLED = 0;
;
{*
 * GLogField:
 * @key: field name (UTF-8 string)
 * @value: field value (arbitrary bytes)
 * @length: length of @value, in bytes, or -1 if it is nul-terminated
 *
 * Structure representing a single field in a structured log entry. See
 * g_log_structured() for details.
 *
 * Log fields may contain arbitrary values, including binary with embedded nul
 * bytes. If the field contains a string, the string must be UTF-8 encoded and
 * have a trailing nul byte. Otherwise, @length must be set to a non-negative
 * value.
 *
 * Since: 2.50
  }
type
  PGLogField = ^TGLogField;
  TGLogField = record
      key : Pgchar;
      value : Tgconstpointer;
      length : Tgssize;
    end;

{*
 * GLogWriterFunc:
 * @log_level: log level of the message
 * @fields: (array length=n_fields): fields forming the message
 * @n_fields: number of @fields
 * @user_data: user data passed to g_log_set_writer_func()
 *
 * Writer function for log entries. A log entry is a collection of one or more
 * #GLogFields, using the standard [field names from journal
 * specification](https://www.freedesktop.org/software/systemd/man/systemd.journal-fields.html).
 * See g_log_structured() for more information.
 *
 * Writer functions must ignore fields which they do not recognise, unless they
 * can write arbitrary binary output, as field values may be arbitrary binary.
 *
 * @log_level is guaranteed to be included in @fields as the `PRIORITY` field,
 * but is provided separately for convenience of deciding whether or where to
 * output the log entry.
 *
 * Writer functions should return %G_LOG_WRITER_HANDLED if they handled the log
 * message successfully or if they deliberately ignored it. If there was an
 * error handling the message (for example, if the writer function is meant to
 * send messages to a remote logging server and there is a network error), it
 * should return %G_LOG_WRITER_UNHANDLED. This allows writer functions to be
 * chained and fall back to simpler handlers in case of failure.
 *
 * Returns: %G_LOG_WRITER_HANDLED if the log entry was handled successfully;
 *   %G_LOG_WRITER_UNHANDLED otherwise
 *
 * Since: 2.50
  }

  TGLogWriterFunc = function (log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; user_data:Tgpointer):TGLogWriterOutput;cdecl;

procedure g_log_structured(log_domain:Pgchar; log_level:TGLogLevelFlags; args:array of const);cdecl;external libglib2;
procedure g_log_structured(log_domain:Pgchar; log_level:TGLogLevelFlags);cdecl;external libglib2;
procedure g_log_structured_array(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize);cdecl;external libglib2;
procedure g_log_variant(log_domain:Pgchar; log_level:TGLogLevelFlags; fields:PGVariant);cdecl;external libglib2;
procedure g_log_set_writer_func(func:TGLogWriterFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify);cdecl;external libglib2;
function g_log_writer_supports_color(output_fd:Tgint):Tgboolean;cdecl;external libglib2;
function g_log_writer_is_journald(output_fd:Tgint):Tgboolean;cdecl;external libglib2;
function g_log_writer_format_fields(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; use_color:Tgboolean):Pgchar;cdecl;external libglib2;
function g_log_writer_syslog(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; user_data:Tgpointer):TGLogWriterOutput;cdecl;external libglib2;
function g_log_writer_journald(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; user_data:Tgpointer):TGLogWriterOutput;cdecl;external libglib2;
function g_log_writer_standard_streams(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; user_data:Tgpointer):TGLogWriterOutput;cdecl;external libglib2;
function g_log_writer_default(log_level:TGLogLevelFlags; fields:PGLogField; n_fields:Tgsize; user_data:Tgpointer):TGLogWriterOutput;cdecl;external libglib2;
procedure g_log_writer_default_set_use_stderr(use_stderr:Tgboolean);cdecl;external libglib2;
function g_log_writer_default_would_drop(log_level:TGLogLevelFlags; log_domain:Pchar):Tgboolean;cdecl;external libglib2;
procedure g_log_writer_default_set_debug_domains(domains:PPgchar);cdecl;external libglib2;
{ G_MESSAGES_DEBUG enablement  }
function g_log_get_debug_enabled:Tgboolean;cdecl;external libglib2;
procedure g_log_set_debug_enabled(enabled:Tgboolean);cdecl;external libglib2;
{*
 * G_DEBUG_HERE:
 *
 * A convenience form of g_log_structured(), recommended to be added to
 * functions when debugging. It prints the current monotonic time and the code
 * location using %G_STRLOC.
 *
 * Since: 2.50
  }
{ internal  }
procedure _g_log_fallback_handler(log_domain:Pgchar; log_level:TGLogLevelFlags; message:Pgchar; unused_data:Tgpointer);cdecl;external libglib2;
{ Internal functions, used to implement the following macros  }
procedure g_return_if_fail_warning(log_domain:Pchar; pretty_function:Pchar; expression:Pchar);cdecl;external libglib2;
procedure g_warn_message(domain:Pchar; file:Pchar; line:longint; func:Pchar; warnexpr:Pchar);cdecl;external libglib2;
{ xxxxxxxxx GLIB_DEPRECATED }
procedure g_assert_warning(log_domain:Pchar; file:Pchar; line:longint; pretty_function:Pchar; expression:Pchar);cdecl;external libglib2;
procedure g_log_structured_standard(log_domain:Pgchar; log_level:TGLogLevelFlags; file:Pgchar; line:Pgchar; func:Pgchar; 
            message_format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_log_structured_standard(log_domain:Pgchar; log_level:TGLogLevelFlags; file:Pgchar; line:Pgchar; func:Pgchar; 
            message_format:Pgchar);cdecl;external libglib2;
{$ifndef G_LOG_DOMAIN}

{ was #define dname def_expr }
function G_LOG_DOMAIN : Pgchar;  

{$endif}
{ G_LOG_DOMAIN  }
{*
 * GPrintFunc:
 * @string: the message to output
 *
 * Specifies the type of the print handler functions.
 * These are called with the complete formatted string to output.
  }
type

  TGPrintFunc = procedure (_string:Pgchar);cdecl;

procedure g_print(format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_print(format:Pgchar);cdecl;external libglib2;
function g_set_print_handler(func:TGPrintFunc):TGPrintFunc;cdecl;external libglib2;
procedure g_printerr(format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_printerr(format:Pgchar);cdecl;external libglib2;
function g_set_printerr_handler(func:TGPrintFunc):TGPrintFunc;cdecl;external libglib2;
{*
 * g_warn_if_reached:
 *
 * Logs a warning.
 *
 * Since: 2.16
  }

// === Konventiert am: 22-6-26 17:11:14 ===


implementation


{ was #define dname def_expr }
function G_LOG_DOMAIN : Pgchar;
  begin
    G_LOG_DOMAIN:=Pgchar(0);
  end;


end.

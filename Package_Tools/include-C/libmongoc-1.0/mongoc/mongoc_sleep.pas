unit mongoc_sleep;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "mongoc-prelude.h"}
{$ifndef MONGOC_SLEEP_H}
{$define MONGOC_SLEEP_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{*
 * mongoc_usleep_func_t:
 * @usec: Number of microseconds to sleep for.
 * @user_data: User data provided to mongoc_client_set_usleep_impl().
  }
type

  Tmongoc_usleep_func_t = procedure (usec:Tint64_t; user_data:pointer);cdecl;
{*
 * mongoc_client_set_usleep_impl:
 * @usleep_func: A function to perform microsecond sleep.
 *
 * Sets the function to be called to perform sleep during scanning.
 * Returns the old function.
 * If old_user_data is not NULL, *old_user_data is set to the old user_data.
 * Not thread-safe.
 * Providing a `usleep_func` that does not sleep (e.g. coroutine suspension) is
 * not supported. Doing so is at the user's own risk.
  }

procedure mongoc_client_set_usleep_impl(client:Pmongoc_client_t; usleep_func:Tmongoc_usleep_func_t; user_data:pointer);cdecl;external libmongoc;
procedure mongoc_usleep_default_impl(usec:Tint64_t; user_data:pointer);cdecl;external libmongoc;
{$endif}
{ MONGOC_SLEEP_H  }

// === Konventiert am: 15-5-26 15:14:53 ===


implementation



end.

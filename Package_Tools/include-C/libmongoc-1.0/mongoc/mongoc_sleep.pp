
unit mongoc_sleep;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_sleep.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_sleep.h
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
Pmongoc_client_t  = ^mongoc_client_t;
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

procedure mongoc_client_set_usleep_impl(client:Pmongoc_client_t; usleep_func:Tmongoc_usleep_func_t; user_data:pointer);cdecl;external;
procedure mongoc_usleep_default_impl(usec:Tint64_t; user_data:pointer);cdecl;external;
{$endif}
{ MONGOC_SLEEP_H  }

implementation


end.

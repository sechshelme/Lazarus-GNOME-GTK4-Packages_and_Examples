
unit gpathbuf;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpathbuf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpathbuf.h
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
PGPathBuf  = ^GPathBuf;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gpathbuf.h: A mutable path builder
 *
 * SPDX-FileCopyrightText: 2023  Emmanuele Bassi
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
{< private > }
  PGPathBuf = ^TGPathBuf;
  TGPathBuf = record
      dummy : array[0..7] of Tgpointer;
    end;

{* xxxxxxxxxxxxx
#define G_PATH_BUF_INIT   NULL,   \
  GLIB_AVAILABLE_MACRO_IN_2_76
  }

function g_path_buf_new:PGPathBuf;cdecl;external;
(* Const before type ignored *)
function g_path_buf_new_from_path(path:Pchar):PGPathBuf;cdecl;external;
function g_path_buf_init(buf:PGPathBuf):PGPathBuf;cdecl;external;
(* Const before type ignored *)
function g_path_buf_init_from_path(buf:PGPathBuf; path:Pchar):PGPathBuf;cdecl;external;
procedure g_path_buf_clear(buf:PGPathBuf);cdecl;external;
function g_path_buf_clear_to_path(buf:PGPathBuf):Pchar;cdecl;external;
procedure g_path_buf_free(buf:PGPathBuf);cdecl;external;
function g_path_buf_free_to_path(buf:PGPathBuf):Pchar;cdecl;external;
function g_path_buf_copy(buf:PGPathBuf):PGPathBuf;cdecl;external;
(* Const before type ignored *)
function g_path_buf_push(buf:PGPathBuf; path:Pchar):PGPathBuf;cdecl;external;
function g_path_buf_pop(buf:PGPathBuf):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_path_buf_set_filename(buf:PGPathBuf; file_name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_path_buf_set_extension(buf:PGPathBuf; extension:Pchar):Tgboolean;cdecl;external;
function g_path_buf_to_path(buf:PGPathBuf):Pchar;cdecl;external;
function g_path_buf_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external;

implementation


end.

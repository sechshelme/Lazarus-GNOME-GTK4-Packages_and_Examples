unit gpathbuf;

interface

uses
  common_GLIB, gtypes;

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

function g_path_buf_new:PGPathBuf;cdecl;external libglib2;
function g_path_buf_new_from_path(path:Pchar):PGPathBuf;cdecl;external libglib2;
function g_path_buf_init(buf:PGPathBuf):PGPathBuf;cdecl;external libglib2;
function g_path_buf_init_from_path(buf:PGPathBuf; path:Pchar):PGPathBuf;cdecl;external libglib2;
procedure g_path_buf_clear(buf:PGPathBuf);cdecl;external libglib2;
function g_path_buf_clear_to_path(buf:PGPathBuf):Pchar;cdecl;external libglib2;
procedure g_path_buf_free(buf:PGPathBuf);cdecl;external libglib2;
function g_path_buf_free_to_path(buf:PGPathBuf):Pchar;cdecl;external libglib2;
function g_path_buf_copy(buf:PGPathBuf):PGPathBuf;cdecl;external libglib2;
function g_path_buf_push(buf:PGPathBuf; path:Pchar):PGPathBuf;cdecl;external libglib2;
function g_path_buf_pop(buf:PGPathBuf):Tgboolean;cdecl;external libglib2;
function g_path_buf_set_filename(buf:PGPathBuf; file_name:Pchar):Tgboolean;cdecl;external libglib2;
function g_path_buf_set_extension(buf:PGPathBuf; extension:Pchar):Tgboolean;cdecl;external libglib2;
function g_path_buf_to_path(buf:PGPathBuf):Pchar;cdecl;external libglib2;
function g_path_buf_equal(v1:Tgconstpointer; v2:Tgconstpointer):Tgboolean;cdecl;external libglib2;

// === Konventiert am: 22-6-26 17:11:23 ===


implementation



end.

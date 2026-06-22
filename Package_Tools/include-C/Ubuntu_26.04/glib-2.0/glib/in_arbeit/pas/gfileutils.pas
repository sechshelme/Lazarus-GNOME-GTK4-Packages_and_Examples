unit gfileutils;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gfileutils.h - File utility functions
 *
 *  Copyright 2000 Red Hat, Inc.
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
{$ifndef __G_FILEUTILS_H__}
{$define __G_FILEUTILS_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glibconfig.h>}
{$include <glib/gerror.h>}

{ was #define dname def_expr }
function G_FILE_ERROR : longint; { return type might be wrong }

type
  PGFileError = ^TGFileError;
  TGFileError =  Longint;
  Const
    G_FILE_ERROR_EXIST = 0;
    G_FILE_ERROR_ISDIR = 1;
    G_FILE_ERROR_ACCES = 2;
    G_FILE_ERROR_NAMETOOLONG = 3;
    G_FILE_ERROR_NOENT = 4;
    G_FILE_ERROR_NOTDIR = 5;
    G_FILE_ERROR_NXIO = 6;
    G_FILE_ERROR_NODEV = 7;
    G_FILE_ERROR_ROFS = 8;
    G_FILE_ERROR_TXTBSY = 9;
    G_FILE_ERROR_FAULT = 10;
    G_FILE_ERROR_LOOP = 11;
    G_FILE_ERROR_NOSPC = 12;
    G_FILE_ERROR_NOMEM = 13;
    G_FILE_ERROR_MFILE = 14;
    G_FILE_ERROR_NFILE = 15;
    G_FILE_ERROR_BADF = 16;
    G_FILE_ERROR_INVAL = 17;
    G_FILE_ERROR_PIPE = 18;
    G_FILE_ERROR_AGAIN = 19;
    G_FILE_ERROR_INTR = 20;
    G_FILE_ERROR_IO = 21;
    G_FILE_ERROR_PERM = 22;
    G_FILE_ERROR_NOSYS = 23;
    G_FILE_ERROR_FAILED = 24;
;
{ For backward-compat reasons, these are synced to an old
 * anonymous enum in libgnome. But don't use that enum
 * in new code.
  }
type
  PGFileTest = ^TGFileTest;
  TGFileTest =  Longint;
  Const
    G_FILE_TEST_IS_REGULAR = 1 shl 0;
    G_FILE_TEST_IS_SYMLINK = 1 shl 1;
    G_FILE_TEST_IS_DIR = 1 shl 2;
    G_FILE_TEST_IS_EXECUTABLE = 1 shl 3;
    G_FILE_TEST_EXISTS = 1 shl 4;
;
{*
 * GFileSetContentsFlags:
 * @G_FILE_SET_CONTENTS_NONE: No guarantees about file consistency or durability.
 *   The most dangerous setting, which is slightly faster than other settings.
 * @G_FILE_SET_CONTENTS_CONSISTENT: Guarantee file consistency: after a crash,
 *   either the old version of the file or the new version of the file will be
 *   available, but not a mixture. On Unix systems this equates to an `fsync()`
 *   on the file and use of an atomic `rename()` of the new version of the file
 *   over the old.
 * @G_FILE_SET_CONTENTS_DURABLE: Guarantee file durability: after a crash, the
 *   new version of the file will be available. On Unix systems this equates to
 *   an `fsync()` on the file (if %G_FILE_SET_CONTENTS_CONSISTENT is unset), or
 *   the effects of %G_FILE_SET_CONTENTS_CONSISTENT plus an `fsync()` on the
 *   directory containing the file after calling `rename()`.
 * @G_FILE_SET_CONTENTS_ONLY_EXISTING: Only apply consistency and durability
 *   guarantees if the file already exists. This may speed up file operations
 *   if the file doesn’t currently exist, but may result in a corrupted version
 *   of the new file if the system crashes while writing it.
 *
 * Flags to pass to g_file_set_contents_full() to affect its safety and
 * performance.
 *
 * Since: 2.66
  }
type
  PGFileSetContentsFlags = ^TGFileSetContentsFlags;
  TGFileSetContentsFlags =  Longint;
  Const
    G_FILE_SET_CONTENTS_NONE = 0;
    G_FILE_SET_CONTENTS_CONSISTENT = 1 shl 0;
    G_FILE_SET_CONTENTS_DURABLE = 1 shl 1;
    G_FILE_SET_CONTENTS_ONLY_EXISTING = 1 shl 2;
;

function g_file_error_quark:TGQuark;cdecl;external libglib2;
{ So other code can generate a GFileError  }
function g_file_error_from_errno(err_no:Tgint):TGFileError;cdecl;external libglib2;
function g_file_test(filename:Pgchar; test:TGFileTest):Tgboolean;cdecl;external libglib2;
function g_file_get_contents(filename:Pgchar; contents:PPgchar; length:Pgsize; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_file_set_contents(filename:Pgchar; contents:Pgchar; length:Tgssize; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_file_set_contents_full(filename:Pgchar; contents:Pgchar; length:Tgssize; flags:TGFileSetContentsFlags; mode:longint; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
function g_file_read_link(filename:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
{ Wrapper / workalike for mkdtemp()  }
function g_mkdtemp(tmpl:Pgchar):Pgchar;cdecl;external libglib2;
function g_mkdtemp_full(tmpl:Pgchar; mode:Tgint):Pgchar;cdecl;external libglib2;
{ Wrapper / workalike for mkstemp()  }
function g_mkstemp(tmpl:Pgchar):Tgint;cdecl;external libglib2;
function g_mkstemp_full(tmpl:Pgchar; flags:Tgint; mode:Tgint):Tgint;cdecl;external libglib2;
{ Wrappers for g_mkstemp and g_mkdtemp()  }
function g_file_open_tmp(tmpl:Pgchar; name_used:PPgchar; error:PPGError):Tgint;cdecl;external libglib2;
function g_dir_make_tmp(tmpl:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
function g_build_path(separator:Pgchar; first_element:Pgchar; args:array of const):Pgchar;cdecl;external libglib2;
function g_build_path(separator:Pgchar; first_element:Pgchar):Pgchar;cdecl;external libglib2;
function g_build_pathv(separator:Pgchar; args:PPgchar):Pgchar;cdecl;external libglib2;
function g_build_filename(first_element:Pgchar; args:array of const):Pgchar;cdecl;external libglib2;
function g_build_filename(first_element:Pgchar):Pgchar;cdecl;external libglib2;
function g_build_filenamev(args:PPgchar):Pgchar;cdecl;external libglib2;
function g_build_filename_valist(first_element:Pgchar; args:Pva_list):Pgchar;cdecl;external libglib2;
function g_mkdir_with_parents(pathname:Pgchar; mode:Tgint):Tgint;cdecl;external libglib2;
function g_path_is_absolute(file_name:Pgchar):Tgboolean;cdecl;external libglib2;
function g_path_skip_root(file_name:Pgchar):Pgchar;cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_FOR(g_path_get_basename) }
function g_basename(file_name:Pgchar):Pgchar;cdecl;external libglib2;
function g_get_current_dir:Pgchar;cdecl;external libglib2;
function g_path_get_basename(file_name:Pgchar):Pgchar;cdecl;external libglib2;
function g_path_get_dirname(file_name:Pgchar):Pgchar;cdecl;external libglib2;
function g_canonicalize_filename(filename:Pgchar; relative_to:Pgchar):Pgchar;cdecl;external libglib2;
{$endif}
{ __G_FILEUTILS_H__  }

// === Konventiert am: 22-6-26 16:17:25 ===


implementation


{ was #define dname def_expr }
function G_FILE_ERROR : longint; { return type might be wrong }
  begin
    G_FILE_ERROR:=g_file_error_quark;
  end;


end.

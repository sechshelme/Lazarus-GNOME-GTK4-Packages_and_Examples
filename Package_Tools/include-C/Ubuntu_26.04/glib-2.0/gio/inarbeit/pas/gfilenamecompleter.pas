unit gfilenamecompleter;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_FILENAME_COMPLETER_H__}
{$define __G_FILENAME_COMPLETER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< public > }
{ signals  }
{< private > }
{ Padding for future expansion  }
  PGFilenameCompleterClass = ^TGFilenameCompleterClass;
  TGFilenameCompleterClass = record
      parent_class : TGObjectClass;
      got_completion_data : procedure (filename_completer:PGFilenameCompleter);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
    end;


function g_filename_completer_get_type:TGType;cdecl;external libgio2;
function g_filename_completer_new:PGFilenameCompleter;cdecl;external libgio2;
function g_filename_completer_get_completion_suffix(completer:PGFilenameCompleter; initial_text:Pchar):Pchar;cdecl;external libgio2;
function g_filename_completer_get_completions(completer:PGFilenameCompleter; initial_text:Pchar):^Pchar;cdecl;external libgio2;
procedure g_filename_completer_set_dirs_only(completer:PGFilenameCompleter; dirs_only:Tgboolean);cdecl;external libgio2;
{$endif}
{ __G_FILENAME_COMPLETER_H__  }

// === Konventiert am: 26-6-26 19:27:47 ===

function G_TYPE_FILENAME_COMPLETER : TGType;
function G_FILENAME_COMPLETER(obj : Pointer) : PGFilenameCompleter;
function G_FILENAME_COMPLETER_CLASS(klass : Pointer) : PGFilenameCompleterClass;
function G_FILENAME_COMPLETER_GET_CLASS(obj : Pointer) : Tgboolean;
function G_IS_FILENAME_COMPLETER(obj : Tgboolean) : longint;
function G_IS_FILENAME_COMPLETER_CLASS(klass : PGFilenameCompleterClass) : longint;

implementation

function G_TYPE_FILENAME_COMPLETER : TGType;
  begin
    G_TYPE_FILENAME_COMPLETER:=g_filename_completer_get_type;
  end;

function G_FILENAME_COMPLETER(obj : Pointer) : PGFilenameCompleter;
begin
  Result := PGFilenameCompleter(g_type_check_instance_cast(obj, G_TYPE_FILENAME_COMPLETER));
end;

function G_FILENAME_COMPLETER_CLASS(klass : Pointer) : PGFilenameCompleterClass;
begin
  Result := PGFilenameCompleterClass(g_type_check_class_cast(klass, G_TYPE_FILENAME_COMPLETER));
end;

function G_FILENAME_COMPLETER_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILENAME_COMPLETER);
end;

function G_IS_FILENAME_COMPLETER(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILENAME_COMPLETER);
end;

function G_IS_FILENAME_COMPLETER_CLASS(klass : PGFilenameCompleterClass) : longint;
begin
  Result := PGFilenameCompleterClass(PGTypeInstance(obj)^.g_class);
end;



end.

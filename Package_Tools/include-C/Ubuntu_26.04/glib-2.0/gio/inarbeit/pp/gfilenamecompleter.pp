
unit gfilenamecompleter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfilenamecompleter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfilenamecompleter.h
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
PGFilenameCompleter  = ^GFilenameCompleter;
PGFilenameCompleterClass  = ^GFilenameCompleterClass;
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

{ was #define dname def_expr }
function G_TYPE_FILENAME_COMPLETER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER_GET_CLASS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILENAME_COMPLETER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILENAME_COMPLETER_CLASS(k : longint) : longint;

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


function g_filename_completer_get_type:TGType;cdecl;external;
function g_filename_completer_new:PGFilenameCompleter;cdecl;external;
(* Const before type ignored *)
function g_filename_completer_get_completion_suffix(completer:PGFilenameCompleter; initial_text:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_filename_completer_get_completions(completer:PGFilenameCompleter; initial_text:Pchar):^Pchar;cdecl;external;
procedure g_filename_completer_set_dirs_only(completer:PGFilenameCompleter; dirs_only:Tgboolean);cdecl;external;
{$endif}
{ __G_FILENAME_COMPLETER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILENAME_COMPLETER : longint; { return type might be wrong }
  begin
    G_TYPE_FILENAME_COMPLETER:=g_filename_completer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER(o : longint) : longint;
begin
  G_FILENAME_COMPLETER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_FILENAME_COMPLETER,GFilenameCompleter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER_CLASS(k : longint) : longint;
begin
  G_FILENAME_COMPLETER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_FILENAME_COMPLETER,GFilenameCompleterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILENAME_COMPLETER_GET_CLASS(o : longint) : longint;
begin
  G_FILENAME_COMPLETER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_FILENAME_COMPLETER,GFilenameCompleterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILENAME_COMPLETER(o : longint) : longint;
begin
  G_IS_FILENAME_COMPLETER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_FILENAME_COMPLETER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILENAME_COMPLETER_CLASS(k : longint) : longint;
begin
  G_IS_FILENAME_COMPLETER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_FILENAME_COMPLETER);
end;


end.

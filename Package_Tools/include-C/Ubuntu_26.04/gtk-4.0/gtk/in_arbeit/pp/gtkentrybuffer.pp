
unit gtkentrybuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkentrybuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkentrybuffer.h
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
Pgsize  = ^gsize;
PGtkEntryBuffer  = ^GtkEntryBuffer;
PGtkEntryBufferClass  = ^GtkEntryBufferClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkentrybuffer.h
 * Copyright (C) 2009  Stefan Walter <stef@memberwebs.com>
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gdk/gdk.h>}
{ Maximum size of text buffer, in bytes  }

const
  GTK_ENTRY_BUFFER_MAX_SIZE = G_MAXUSHORT;  

{ was #define dname def_expr }
function GTK_TYPE_ENTRY_BUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_BUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER_GET_CLASS(obj : longint) : longint;

type
  PGtkEntryBuffer = ^TGtkEntryBuffer;
  TGtkEntryBuffer = record
      parent_instance : TGObject;
    end;

{ Signals  }
(* Const before type ignored *)
{ Virtual Methods  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Padding for future expansion  }
  PGtkEntryBufferClass = ^TGtkEntryBufferClass;
  TGtkEntryBufferClass = record
      parent_class : TGObjectClass;
      inserted_text : procedure (buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:Tguint);cdecl;
      deleted_text : procedure (buffer:PGtkEntryBuffer; position:Tguint; n_chars:Tguint);cdecl;
      get_text : function (buffer:PGtkEntryBuffer; n_bytes:Pgsize):Pchar;cdecl;
      get_length : function (buffer:PGtkEntryBuffer):Tguint;cdecl;
      insert_text : function (buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:Tguint):Tguint;cdecl;
      delete_text : function (buffer:PGtkEntryBuffer; position:Tguint; n_chars:Tguint):Tguint;cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
      _gtk_reserved5 : procedure ;cdecl;
      _gtk_reserved6 : procedure ;cdecl;
      _gtk_reserved7 : procedure ;cdecl;
      _gtk_reserved8 : procedure ;cdecl;
    end;


function gtk_entry_buffer_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gtk_entry_buffer_new(initial_chars:Pchar; n_initial_chars:longint):PGtkEntryBuffer;cdecl;external;
function gtk_entry_buffer_get_bytes(buffer:PGtkEntryBuffer):Tgsize;cdecl;external;
function gtk_entry_buffer_get_length(buffer:PGtkEntryBuffer):Tguint;cdecl;external;
(* Const before type ignored *)
function gtk_entry_buffer_get_text(buffer:PGtkEntryBuffer):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_buffer_set_text(buffer:PGtkEntryBuffer; chars:Pchar; n_chars:longint);cdecl;external;
procedure gtk_entry_buffer_set_max_length(buffer:PGtkEntryBuffer; max_length:longint);cdecl;external;
function gtk_entry_buffer_get_max_length(buffer:PGtkEntryBuffer):longint;cdecl;external;
(* Const before type ignored *)
function gtk_entry_buffer_insert_text(buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:longint):Tguint;cdecl;external;
function gtk_entry_buffer_delete_text(buffer:PGtkEntryBuffer; position:Tguint; n_chars:longint):Tguint;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_buffer_emit_inserted_text(buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:Tguint);cdecl;external;
procedure gtk_entry_buffer_emit_deleted_text(buffer:PGtkEntryBuffer; position:Tguint; n_chars:Tguint);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEntryBuffer, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_ENTRY_BUFFER : longint; { return type might be wrong }
  begin
    GTK_TYPE_ENTRY_BUFFER:=gtk_entry_buffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER(obj : longint) : longint;
begin
  GTK_ENTRY_BUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_ENTRY_BUFFER,GtkEntryBuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER_CLASS(klass : longint) : longint;
begin
  GTK_ENTRY_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_ENTRY_BUFFER,GtkEntryBufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_BUFFER(obj : longint) : longint;
begin
  GTK_IS_ENTRY_BUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_ENTRY_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_BUFFER_CLASS(klass : longint) : longint;
begin
  GTK_IS_ENTRY_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_ENTRY_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_BUFFER_GET_CLASS(obj : longint) : longint;
begin
  GTK_ENTRY_BUFFER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_ENTRY_BUFFER,GtkEntryBufferClass);
end;


end.

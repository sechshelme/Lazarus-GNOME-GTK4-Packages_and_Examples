unit gtkentrybuffer;

interface

uses
  fp_glib2, fp_gtk4;

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

type
  PGtkEntryBuffer = ^TGtkEntryBuffer;
  TGtkEntryBuffer = record
      parent_instance : TGObject;
    end;

{ Signals  }
{ Virtual Methods  }
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


function gtk_entry_buffer_get_type:TGType;cdecl;external libgtk4;
function gtk_entry_buffer_new(initial_chars:Pchar; n_initial_chars:longint):PGtkEntryBuffer;cdecl;external libgtk4;
function gtk_entry_buffer_get_bytes(buffer:PGtkEntryBuffer):Tgsize;cdecl;external libgtk4;
function gtk_entry_buffer_get_length(buffer:PGtkEntryBuffer):Tguint;cdecl;external libgtk4;
function gtk_entry_buffer_get_text(buffer:PGtkEntryBuffer):Pchar;cdecl;external libgtk4;
procedure gtk_entry_buffer_set_text(buffer:PGtkEntryBuffer; chars:Pchar; n_chars:longint);cdecl;external libgtk4;
procedure gtk_entry_buffer_set_max_length(buffer:PGtkEntryBuffer; max_length:longint);cdecl;external libgtk4;
function gtk_entry_buffer_get_max_length(buffer:PGtkEntryBuffer):longint;cdecl;external libgtk4;
function gtk_entry_buffer_insert_text(buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:longint):Tguint;cdecl;external libgtk4;
function gtk_entry_buffer_delete_text(buffer:PGtkEntryBuffer; position:Tguint; n_chars:longint):Tguint;cdecl;external libgtk4;
procedure gtk_entry_buffer_emit_inserted_text(buffer:PGtkEntryBuffer; position:Tguint; chars:Pchar; n_chars:Tguint);cdecl;external libgtk4;
procedure gtk_entry_buffer_emit_deleted_text(buffer:PGtkEntryBuffer; position:Tguint; n_chars:Tguint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEntryBuffer, g_object_unref) }

// === Konventiert am: 6-7-26 16:15:16 ===

function GTK_TYPE_ENTRY_BUFFER : TGType;
function GTK_ENTRY_BUFFER(obj : Pointer) : PGtkEntryBuffer;
function GTK_ENTRY_BUFFER_CLASS(klass : Pointer) : PGtkEntryBufferClass;
function GTK_IS_ENTRY_BUFFER(obj : Pointer) : Tgboolean;
function GTK_IS_ENTRY_BUFFER_CLASS(klass : Pointer) : Tgboolean;
function GTK_ENTRY_BUFFER_GET_CLASS(obj : Pointer) : PGtkEntryBufferClass;

implementation

function GTK_TYPE_ENTRY_BUFFER : TGType;
  begin
    GTK_TYPE_ENTRY_BUFFER:=gtk_entry_buffer_get_type;
  end;

function GTK_ENTRY_BUFFER(obj : Pointer) : PGtkEntryBuffer;
begin
  Result := PGtkEntryBuffer(g_type_check_instance_cast(obj, GTK_TYPE_ENTRY_BUFFER));
end;

function GTK_ENTRY_BUFFER_CLASS(klass : Pointer) : PGtkEntryBufferClass;
begin
  Result := PGtkEntryBufferClass(g_type_check_class_cast(klass, GTK_TYPE_ENTRY_BUFFER));
end;

function GTK_IS_ENTRY_BUFFER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ENTRY_BUFFER);
end;

function GTK_IS_ENTRY_BUFFER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_ENTRY_BUFFER);
end;

function GTK_ENTRY_BUFFER_GET_CLASS(obj : Pointer) : PGtkEntryBufferClass;
begin
  Result := PGtkEntryBufferClass(PGTypeInstance(obj)^.g_class);
end;



end.

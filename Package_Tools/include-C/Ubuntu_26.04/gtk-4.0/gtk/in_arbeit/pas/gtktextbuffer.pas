unit gtktextbuffer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtktextbuffer.h Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtktexttagtable.h>}
{$include <gtk/gtktextiter.h>}
{$include <gtk/gtktextmark.h>}
{$include <gtk/gtktextchild.h>}

type
  PGtkTextBuffer = ^TGtkTextBuffer;
  TGtkTextBuffer = record
      parent_instance : TGObject;
      priv : PGtkTextBufferPrivate;
    end;

{*
 * GtkTextBufferCommitNotify:
 * @buffer: the text buffer being notified
 * @flags: the type of commit notification
 * @position: the position of the text operation
 * @length: the length of the text operation in characters
 * @user_data: (closure): user data passed to the callback
 *
 * A notification callback used by [method@Gtk.TextBuffer.add_commit_notify].
 *
 * You may not modify the [class@Gtk.TextBuffer] from a
 * [callback@Gtk.TextBufferCommitNotify] callback and that is enforced
 * by the [class@Gtk.TextBuffer] API.
 *
 * [callback@Gtk.TextBufferCommitNotify] may be used to be notified about
 * changes to the underlying buffer right before-or-after the changes are
 * committed to the underlying B-Tree. This is useful if you want to observe
 * changes to the buffer without other signal handlers potentially modifying
 * state on the way to the default signal handler.
 *
 * When @flags is `GTK_TEXT_BUFFER_NOTIFY_BEFORE_INSERT`, `position` is set to
 * the offset in characters from the start of the buffer where the insertion
 * will occur. `length` is set to the number of characters to be inserted.  You
 * may not yet retrieve the text until it has been inserted. You may access the
 * text from `GTK_TEXT_BUFFER_NOTIFY_AFTER_INSERT` using
 * [method@Gtk.TextBuffer.get_slice].
 *
 * When @flags is `GTK_TEXT_BUFFER_NOTIFY_AFTER_INSERT`, `position` is set to
 * offset in characters where the insertion occurred and `length` is set
 * to the number of characters inserted.
 *
 * When @flags is `GTK_TEXT_BUFFER_NOTIFY_BEFORE_DELETE`, `position` is set to
 * offset in characters where the deletion will occur and `length` is set
 * to the number of characters that will be removed. You may still retrieve
 * the text from this handler using `position` and `length`.
 *
 * When @flags is `GTK_TEXT_BUFFER_NOTIFY_AFTER_DELETE`, `length` is set to
 * zero to denote that the delete-range has already been committed to the
 * underlying B-Tree. You may no longer retrieve the text that has been
 * deleted from the [class@Gtk.TextBuffer].
 *
 * Since: 4.16
  }

  TGtkTextBufferCommitNotify = procedure (buffer:PGtkTextBuffer; flags:TGtkTextBufferNotifyFlags; position:Tguint; length:Tguint; user_data:Tgpointer);cdecl;
{*
 * GtkTextBufferClass:
 * @parent_class: The object class structure needs to be the first.
 * @insert_text: The class handler for the `GtkTextBuffer::insert-text` signal.
 * @insert_paintable: The class handler for the `GtkTextBuffer::insert-paintable` signal.
 * @insert_child_anchor: The class handler for the `GtkTextBuffer::insert-child-anchor` signal.
 * @delete_range: The class handler for the `GtkTextBuffer::delete-range` signal.
 * @changed: The class handler for the `GtkTextBuffer::changed` signal.
 * @modified_changed: The class handler for the `GtkTextBuffer::modified-changed` signal.
 * @mark_set: The class handler for the `GtkTextBuffer::mark-set` signal.
 * @mark_deleted: The class handler for the `GtkTextBuffer::mark-deleted` signal.
 * @apply_tag: The class handler for the `GtkTextBuffer::apply-tag` signal.
 * @remove_tag: The class handler for the `GtkTextBuffer::remove-tag` signal.
 * @begin_user_action: The class handler for the `GtkTextBuffer::begin-user-action` signal.
 * @end_user_action: The class handler for the `GtkTextBuffer::end-user-action` signal.
 * @paste_done: The class handler for the `GtkTextBuffer::paste-done` signal.
 * @undo: The class handler for the `GtkTextBuffer::undo` signal
 * @redo: The class handler for the `GtkTextBuffer::redo` signal
 *
 * The class structure for `GtkTextBuffer`.
  }
{< private > }
{ Padding for future expansion  }
  PGtkTextBufferClass = ^TGtkTextBufferClass;
  TGtkTextBufferClass = record
      parent_class : TGObjectClass;cdecl;
      insert_text : procedure (buffer:PGtkTextBuffer; pos:PGtkTextIter; new_text:Pchar; new_text_length:longint);cdecl;
      insert_paintable : procedure (buffer:PGtkTextBuffer; iter:PGtkTextIter; paintable:PGdkPaintable);cdecl;
      insert_child_anchor : procedure (buffer:PGtkTextBuffer; iter:PGtkTextIter; anchor:PGtkTextChildAnchor);cdecl;
      delete_range : procedure (buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;
      changed : procedure (buffer:PGtkTextBuffer);cdecl;
      modified_changed : procedure (buffer:PGtkTextBuffer);cdecl;
      mark_set : procedure (buffer:PGtkTextBuffer; location:PGtkTextIter; mark:PGtkTextMark);cdecl;
      mark_deleted : procedure (buffer:PGtkTextBuffer; mark:PGtkTextMark);cdecl;
      apply_tag : procedure (buffer:PGtkTextBuffer; tag:PGtkTextTag; start:PGtkTextIter; end:PGtkTextIter);cdecl;
      remove_tag : procedure (buffer:PGtkTextBuffer; tag:PGtkTextTag; start:PGtkTextIter; end:PGtkTextIter);cdecl;
      begin_user_action : procedure (buffer:PGtkTextBuffer);cdecl;
      end_user_action : procedure (buffer:PGtkTextBuffer);cdecl;
      paste_done : procedure (buffer:PGtkTextBuffer; clipboard:PGdkClipboard);cdecl;
      undo : procedure (buffer:PGtkTextBuffer);cdecl;
      redo : procedure (buffer:PGtkTextBuffer);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_text_buffer_get_type:TGType;cdecl;external libgtk4;
{ table is NULL to create a new one  }
function gtk_text_buffer_new(table:PGtkTextTagTable):PGtkTextBuffer;cdecl;external libgtk4;
function gtk_text_buffer_get_line_count(buffer:PGtkTextBuffer):longint;cdecl;external libgtk4;
function gtk_text_buffer_get_char_count(buffer:PGtkTextBuffer):longint;cdecl;external libgtk4;
function gtk_text_buffer_get_tag_table(buffer:PGtkTextBuffer):PGtkTextTagTable;cdecl;external libgtk4;
{ Delete whole buffer, then insert  }
procedure gtk_text_buffer_set_text(buffer:PGtkTextBuffer; text:Pchar; len:longint);cdecl;external libgtk4;
{ Insert into the buffer  }
procedure gtk_text_buffer_insert(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint);cdecl;external libgtk4;
procedure gtk_text_buffer_insert_at_cursor(buffer:PGtkTextBuffer; text:Pchar; len:longint);cdecl;external libgtk4;
function gtk_text_buffer_insert_interactive(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_insert_interactive_at_cursor(buffer:PGtkTextBuffer; text:Pchar; len:longint; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_insert_range(buffer:PGtkTextBuffer; iter:PGtkTextIter; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
function gtk_text_buffer_insert_range_interactive(buffer:PGtkTextBuffer; iter:PGtkTextIter; start:PGtkTextIter; end:PGtkTextIter; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_insert_with_tags(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint; first_tag:PGtkTextTag; 
            args:array of const);cdecl;external libgtk4;
procedure gtk_text_buffer_insert_with_tags(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint; first_tag:PGtkTextTag);cdecl;external libgtk4;
procedure gtk_text_buffer_insert_with_tags_by_name(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint; first_tag_name:Pchar; 
            args:array of const);cdecl;external libgtk4;
procedure gtk_text_buffer_insert_with_tags_by_name(buffer:PGtkTextBuffer; iter:PGtkTextIter; text:Pchar; len:longint; first_tag_name:Pchar);cdecl;external libgtk4;
procedure gtk_text_buffer_insert_markup(buffer:PGtkTextBuffer; iter:PGtkTextIter; markup:Pchar; len:longint);cdecl;external libgtk4;
{ Delete from the buffer  }
procedure gtk_text_buffer_delete(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
function gtk_text_buffer_delete_interactive(buffer:PGtkTextBuffer; start_iter:PGtkTextIter; end_iter:PGtkTextIter; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_backspace(buffer:PGtkTextBuffer; iter:PGtkTextIter; interactive:Tgboolean; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
{ Obtain strings from the buffer  }
function gtk_text_buffer_get_text(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter; include_hidden_chars:Tgboolean):Pchar;cdecl;external libgtk4;
function gtk_text_buffer_get_slice(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter; include_hidden_chars:Tgboolean):Pchar;cdecl;external libgtk4;
{ Insert a paintable  }
procedure gtk_text_buffer_insert_paintable(buffer:PGtkTextBuffer; iter:PGtkTextIter; paintable:PGdkPaintable);cdecl;external libgtk4;
{ Insert a child anchor  }
procedure gtk_text_buffer_insert_child_anchor(buffer:PGtkTextBuffer; iter:PGtkTextIter; anchor:PGtkTextChildAnchor);cdecl;external libgtk4;
{ Convenience, create and insert a child anchor  }
function gtk_text_buffer_create_child_anchor(buffer:PGtkTextBuffer; iter:PGtkTextIter):PGtkTextChildAnchor;cdecl;external libgtk4;
{ Mark manipulation  }
procedure gtk_text_buffer_add_mark(buffer:PGtkTextBuffer; mark:PGtkTextMark; where:PGtkTextIter);cdecl;external libgtk4;
function gtk_text_buffer_create_mark(buffer:PGtkTextBuffer; mark_name:Pchar; where:PGtkTextIter; left_gravity:Tgboolean):PGtkTextMark;cdecl;external libgtk4;
procedure gtk_text_buffer_move_mark(buffer:PGtkTextBuffer; mark:PGtkTextMark; where:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_delete_mark(buffer:PGtkTextBuffer; mark:PGtkTextMark);cdecl;external libgtk4;
function gtk_text_buffer_get_mark(buffer:PGtkTextBuffer; name:Pchar):PGtkTextMark;cdecl;external libgtk4;
procedure gtk_text_buffer_move_mark_by_name(buffer:PGtkTextBuffer; name:Pchar; where:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_delete_mark_by_name(buffer:PGtkTextBuffer; name:Pchar);cdecl;external libgtk4;
function gtk_text_buffer_get_insert(buffer:PGtkTextBuffer):PGtkTextMark;cdecl;external libgtk4;
function gtk_text_buffer_get_selection_bound(buffer:PGtkTextBuffer):PGtkTextMark;cdecl;external libgtk4;
{ efficiently move insert and selection_bound at the same time  }
procedure gtk_text_buffer_place_cursor(buffer:PGtkTextBuffer; where:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_select_range(buffer:PGtkTextBuffer; ins:PGtkTextIter; bound:PGtkTextIter);cdecl;external libgtk4;
{ Tag manipulation  }
procedure gtk_text_buffer_apply_tag(buffer:PGtkTextBuffer; tag:PGtkTextTag; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_remove_tag(buffer:PGtkTextBuffer; tag:PGtkTextTag; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_apply_tag_by_name(buffer:PGtkTextBuffer; name:Pchar; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_remove_tag_by_name(buffer:PGtkTextBuffer; name:Pchar; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_remove_all_tags(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
{ You can either ignore the return value, or use it to
 * set the attributes of the tag. tag_name can be NULL
  }
function gtk_text_buffer_create_tag(buffer:PGtkTextBuffer; tag_name:Pchar; first_property_name:Pchar; args:array of const):PGtkTextTag;cdecl;external libgtk4;
function gtk_text_buffer_create_tag(buffer:PGtkTextBuffer; tag_name:Pchar; first_property_name:Pchar):PGtkTextTag;cdecl;external libgtk4;
{ Obtain iterators pointed at various places, then you can move the
 * iterator around using the GtkTextIter operators
  }
function gtk_text_buffer_get_iter_at_line_offset(buffer:PGtkTextBuffer; iter:PGtkTextIter; line_number:longint; char_offset:longint):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_get_iter_at_line_index(buffer:PGtkTextBuffer; iter:PGtkTextIter; line_number:longint; byte_index:longint):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_get_iter_at_offset(buffer:PGtkTextBuffer; iter:PGtkTextIter; char_offset:longint);cdecl;external libgtk4;
function gtk_text_buffer_get_iter_at_line(buffer:PGtkTextBuffer; iter:PGtkTextIter; line_number:longint):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_get_start_iter(buffer:PGtkTextBuffer; iter:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_get_end_iter(buffer:PGtkTextBuffer; iter:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_get_bounds(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter);cdecl;external libgtk4;
procedure gtk_text_buffer_get_iter_at_mark(buffer:PGtkTextBuffer; iter:PGtkTextIter; mark:PGtkTextMark);cdecl;external libgtk4;
procedure gtk_text_buffer_get_iter_at_child_anchor(buffer:PGtkTextBuffer; iter:PGtkTextIter; anchor:PGtkTextChildAnchor);cdecl;external libgtk4;
{ There's no get_first_iter because you just get the iter for
   line or char 0  }
{ Used to keep track of whether the buffer needs saving; anytime the
   buffer contents change, the modified flag is turned on. Whenever
   you save, turn it off. Tags and marks do not affect the modified
   flag, but if you would like them to you can connect a handler to
   the tag/mark signals and call set_modified in your handler  }
function gtk_text_buffer_get_modified(buffer:PGtkTextBuffer):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_set_modified(buffer:PGtkTextBuffer; setting:Tgboolean);cdecl;external libgtk4;
function gtk_text_buffer_get_has_selection(buffer:PGtkTextBuffer):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_add_selection_clipboard(buffer:PGtkTextBuffer; clipboard:PGdkClipboard);cdecl;external libgtk4;
procedure gtk_text_buffer_remove_selection_clipboard(buffer:PGtkTextBuffer; clipboard:PGdkClipboard);cdecl;external libgtk4;
procedure gtk_text_buffer_cut_clipboard(buffer:PGtkTextBuffer; clipboard:PGdkClipboard; default_editable:Tgboolean);cdecl;external libgtk4;
procedure gtk_text_buffer_copy_clipboard(buffer:PGtkTextBuffer; clipboard:PGdkClipboard);cdecl;external libgtk4;
procedure gtk_text_buffer_paste_clipboard(buffer:PGtkTextBuffer; clipboard:PGdkClipboard; override_location:PGtkTextIter; default_editable:Tgboolean);cdecl;external libgtk4;
function gtk_text_buffer_get_selection_bounds(buffer:PGtkTextBuffer; start:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_delete_selection(buffer:PGtkTextBuffer; interactive:Tgboolean; default_editable:Tgboolean):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_get_selection_content(buffer:PGtkTextBuffer):PGdkContentProvider;cdecl;external libgtk4;
function gtk_text_buffer_get_can_undo(buffer:PGtkTextBuffer):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_get_can_redo(buffer:PGtkTextBuffer):Tgboolean;cdecl;external libgtk4;
function gtk_text_buffer_get_enable_undo(buffer:PGtkTextBuffer):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_buffer_set_enable_undo(buffer:PGtkTextBuffer; enable_undo:Tgboolean);cdecl;external libgtk4;
function gtk_text_buffer_get_max_undo_levels(buffer:PGtkTextBuffer):Tguint;cdecl;external libgtk4;
procedure gtk_text_buffer_set_max_undo_levels(buffer:PGtkTextBuffer; max_undo_levels:Tguint);cdecl;external libgtk4;
procedure gtk_text_buffer_undo(buffer:PGtkTextBuffer);cdecl;external libgtk4;
procedure gtk_text_buffer_redo(buffer:PGtkTextBuffer);cdecl;external libgtk4;
procedure gtk_text_buffer_begin_irreversible_action(buffer:PGtkTextBuffer);cdecl;external libgtk4;
procedure gtk_text_buffer_end_irreversible_action(buffer:PGtkTextBuffer);cdecl;external libgtk4;
procedure gtk_text_buffer_begin_user_action(buffer:PGtkTextBuffer);cdecl;external libgtk4;
procedure gtk_text_buffer_end_user_action(buffer:PGtkTextBuffer);cdecl;external libgtk4;
function gtk_text_buffer_add_commit_notify(buffer:PGtkTextBuffer; flags:TGtkTextBufferNotifyFlags; commit_notify:TGtkTextBufferCommitNotify; user_data:Tgpointer; destroy:TGDestroyNotify):Tguint;cdecl;external libgtk4;
procedure gtk_text_buffer_remove_commit_notify(buffer:PGtkTextBuffer; commit_notify_handler:Tguint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextBuffer, g_object_unref) }

// === Konventiert am: 6-7-26 14:19:12 ===

function GTK_TYPE_TEXT_BUFFER : TGType;
function GTK_TEXT_BUFFER(obj : Pointer) : PGtkTextBuffer;
function GTK_TEXT_BUFFER_CLASS(klass : Pointer) : PGtkTextBufferClass;
function GTK_IS_TEXT_BUFFER(obj : Pointer) : Tgboolean;
function GTK_IS_TEXT_BUFFER_CLASS(klass : Pointer) : Tgboolean;
function GTK_TEXT_BUFFER_GET_CLASS(obj : Pointer) : PGtkTextBufferClass;

implementation

function GTK_TYPE_TEXT_BUFFER : TGType;
  begin
    GTK_TYPE_TEXT_BUFFER:=gtk_text_buffer_get_type;
  end;

function GTK_TEXT_BUFFER(obj : Pointer) : PGtkTextBuffer;
begin
  Result := PGtkTextBuffer(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_BUFFER));
end;

function GTK_TEXT_BUFFER_CLASS(klass : Pointer) : PGtkTextBufferClass;
begin
  Result := PGtkTextBufferClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_BUFFER));
end;

function GTK_IS_TEXT_BUFFER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT_BUFFER);
end;

function GTK_IS_TEXT_BUFFER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TEXT_BUFFER);
end;

function GTK_TEXT_BUFFER_GET_CLASS(obj : Pointer) : PGtkTextBufferClass;
begin
  Result := PGtkTextBufferClass(PGTypeInstance(obj)^.g_class);
end;



end.

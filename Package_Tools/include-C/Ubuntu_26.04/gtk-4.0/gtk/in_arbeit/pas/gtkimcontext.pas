unit gtkimcontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2000 Red Hat Software
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
  PGtkIMContext = ^TGtkIMContext;
  TGtkIMContext = record
      parent_instance : TGObject;
    end;

{< private > }
{< public > }
{ Signals  }
{ Virtual functions  }
{< private > }
{ another signal  }
{ Padding for future expansion  }
  PGtkIMContextClass = ^TGtkIMContextClass;
  TGtkIMContextClass = record
      parent_class : TGObjectClass;
      preedit_start : procedure (context:PGtkIMContext);cdecl;
      preedit_end : procedure (context:PGtkIMContext);cdecl;
      preedit_changed : procedure (context:PGtkIMContext);cdecl;
      commit : procedure (context:PGtkIMContext; str:Pchar);cdecl;
      retrieve_surrounding : function (context:PGtkIMContext):Tgboolean;cdecl;
      delete_surrounding : function (context:PGtkIMContext; offset:longint; n_chars:longint):Tgboolean;cdecl;
      set_client_widget : procedure (context:PGtkIMContext; widget:PGtkWidget);cdecl;
      get_preedit_string : procedure (context:PGtkIMContext; str:PPchar; attrs:PPPangoAttrList; cursor_pos:Plongint);cdecl;
      filter_keypress : function (context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;
      focus_in : procedure (context:PGtkIMContext);cdecl;
      focus_out : procedure (context:PGtkIMContext);cdecl;
      reset : procedure (context:PGtkIMContext);cdecl;
      set_cursor_location : procedure (context:PGtkIMContext; area:PGdkRectangle);cdecl;
      set_use_preedit : procedure (context:PGtkIMContext; use_preedit:Tgboolean);cdecl;
      set_surrounding : procedure (context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint);cdecl;
      get_surrounding : function (context:PGtkIMContext; text:PPchar; cursor_index:Plongint):Tgboolean;cdecl;
      set_surrounding_with_selection : procedure (context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint; anchor_index:longint);cdecl;
      get_surrounding_with_selection : function (context:PGtkIMContext; text:PPchar; cursor_index:Plongint; anchor_index:Plongint):Tgboolean;cdecl;
      activate_osk : procedure (context:PGtkIMContext);cdecl;
      activate_osk_with_event : function (context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;
      invalid_composition : function (context:PGtkIMContext; str:Pchar):Tgboolean;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_im_context_get_type:TGType;cdecl;external libgtk4;
procedure gtk_im_context_set_client_widget(context:PGtkIMContext; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_im_context_get_preedit_string(context:PGtkIMContext; str:PPchar; attrs:PPPangoAttrList; cursor_pos:Plongint);cdecl;external libgtk4;
function gtk_im_context_filter_keypress(context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;external libgtk4;
function gtk_im_context_filter_key(context:PGtkIMContext; press:Tgboolean; surface:PGdkSurface; device:PGdkDevice; time:Tguint32; 
           keycode:Tguint; state:TGdkModifierType; group:longint):Tgboolean;cdecl;external libgtk4;
procedure gtk_im_context_focus_in(context:PGtkIMContext);cdecl;external libgtk4;
procedure gtk_im_context_focus_out(context:PGtkIMContext);cdecl;external libgtk4;
procedure gtk_im_context_reset(context:PGtkIMContext);cdecl;external libgtk4;
procedure gtk_im_context_set_cursor_location(context:PGtkIMContext; area:PGdkRectangle);cdecl;external libgtk4;
procedure gtk_im_context_set_use_preedit(context:PGtkIMContext; use_preedit:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_2_FOR(gtk_im_context_set_surrounding_with_selection) }
procedure gtk_im_context_set_surrounding(context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_2_FOR(gtk_im_context_get_surrounding_with_selection) }
function gtk_im_context_get_surrounding(context:PGtkIMContext; text:PPchar; cursor_index:Plongint):Tgboolean;cdecl;external libgtk4;
procedure gtk_im_context_set_surrounding_with_selection(context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint; anchor_index:longint);cdecl;external libgtk4;
function gtk_im_context_get_surrounding_with_selection(context:PGtkIMContext; text:PPchar; cursor_index:Plongint; anchor_index:Plongint):Tgboolean;cdecl;external libgtk4;
function gtk_im_context_delete_surrounding(context:PGtkIMContext; offset:longint; n_chars:longint):Tgboolean;cdecl;external libgtk4;
function gtk_im_context_activate_osk(context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIMContext, g_object_unref) }

// === Konventiert am: 6-7-26 16:08:13 ===

function GTK_TYPE_IM_CONTEXT : TGType;
function GTK_IM_CONTEXT(obj : Pointer) : PGtkIMContext;
function GTK_IM_CONTEXT_CLASS(klass : Pointer) : PGtkIMContextClass;
function GTK_IS_IM_CONTEXT(obj : Pointer) : Tgboolean;
function GTK_IS_IM_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GTK_IM_CONTEXT_GET_CLASS(obj : Pointer) : PGtkIMContextClass;

implementation

function GTK_TYPE_IM_CONTEXT : TGType;
  begin
    GTK_TYPE_IM_CONTEXT:=gtk_im_context_get_type;
  end;

function GTK_IM_CONTEXT(obj : Pointer) : PGtkIMContext;
begin
  Result := PGtkIMContext(g_type_check_instance_cast(obj, GTK_TYPE_IM_CONTEXT));
end;

function GTK_IM_CONTEXT_CLASS(klass : Pointer) : PGtkIMContextClass;
begin
  Result := PGtkIMContextClass(g_type_check_class_cast(klass, GTK_TYPE_IM_CONTEXT));
end;

function GTK_IS_IM_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_IM_CONTEXT);
end;

function GTK_IS_IM_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_IM_CONTEXT);
end;

function GTK_IM_CONTEXT_GET_CLASS(obj : Pointer) : PGtkIMContextClass;
begin
  Result := PGtkIMContextClass(PGTypeInstance(obj)^.g_class);
end;



end.

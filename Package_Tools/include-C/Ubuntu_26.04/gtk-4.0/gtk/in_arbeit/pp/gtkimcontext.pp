
unit gtkimcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkimcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkimcontext.h
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
PGdkDevice  = ^GdkDevice;
PGdkEvent  = ^GdkEvent;
PGdkRectangle  = ^GdkRectangle;
PGdkSurface  = ^GdkSurface;
PGtkIMContext  = ^GtkIMContext;
PGtkIMContextClass  = ^GtkIMContextClass;
PGtkWidget  = ^GtkWidget;
Plongint  = ^longint;
PPangoAttrList  = ^PangoAttrList;
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

{ was #define dname def_expr }
function GTK_TYPE_IM_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_GET_CLASS(obj : longint) : longint;

type
  PGtkIMContext = ^TGtkIMContext;
  TGtkIMContext = record
      parent_instance : TGObject;
    end;

{< private > }
{< public > }
{ Signals  }
(* Const before type ignored *)
{ Virtual functions  }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ another signal  }
(* Const before type ignored *)
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


function gtk_im_context_get_type:TGType;cdecl;external;
procedure gtk_im_context_set_client_widget(context:PGtkIMContext; widget:PGtkWidget);cdecl;external;
procedure gtk_im_context_get_preedit_string(context:PGtkIMContext; str:PPchar; attrs:PPPangoAttrList; cursor_pos:Plongint);cdecl;external;
function gtk_im_context_filter_keypress(context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;external;
function gtk_im_context_filter_key(context:PGtkIMContext; press:Tgboolean; surface:PGdkSurface; device:PGdkDevice; time:Tguint32; 
           keycode:Tguint; state:TGdkModifierType; group:longint):Tgboolean;cdecl;external;
procedure gtk_im_context_focus_in(context:PGtkIMContext);cdecl;external;
procedure gtk_im_context_focus_out(context:PGtkIMContext);cdecl;external;
procedure gtk_im_context_reset(context:PGtkIMContext);cdecl;external;
(* Const before type ignored *)
procedure gtk_im_context_set_cursor_location(context:PGtkIMContext; area:PGdkRectangle);cdecl;external;
procedure gtk_im_context_set_use_preedit(context:PGtkIMContext; use_preedit:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_2_FOR(gtk_im_context_set_surrounding_with_selection) }
(* Const before type ignored *)
procedure gtk_im_context_set_surrounding(context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_2_FOR(gtk_im_context_get_surrounding_with_selection) }
function gtk_im_context_get_surrounding(context:PGtkIMContext; text:PPchar; cursor_index:Plongint):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_im_context_set_surrounding_with_selection(context:PGtkIMContext; text:Pchar; len:longint; cursor_index:longint; anchor_index:longint);cdecl;external;
function gtk_im_context_get_surrounding_with_selection(context:PGtkIMContext; text:PPchar; cursor_index:Plongint; anchor_index:Plongint):Tgboolean;cdecl;external;
function gtk_im_context_delete_surrounding(context:PGtkIMContext; offset:longint; n_chars:longint):Tgboolean;cdecl;external;
function gtk_im_context_activate_osk(context:PGtkIMContext; event:PGdkEvent):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIMContext, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_IM_CONTEXT : longint; { return type might be wrong }
  begin
    GTK_TYPE_IM_CONTEXT:=gtk_im_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT(obj : longint) : longint;
begin
  GTK_IM_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_IM_CONTEXT,GtkIMContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_CLASS(klass : longint) : longint;
begin
  GTK_IM_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_IM_CONTEXT,GtkIMContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT(obj : longint) : longint;
begin
  GTK_IS_IM_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_IM_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IM_CONTEXT_CLASS(klass : longint) : longint;
begin
  GTK_IS_IM_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_IM_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IM_CONTEXT_GET_CLASS(obj : longint) : longint;
begin
  GTK_IM_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_IM_CONTEXT,GtkIMContextClass);
end;


end.

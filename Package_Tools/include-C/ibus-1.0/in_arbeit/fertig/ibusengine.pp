
unit ibusengine;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusengine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusengine.h
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
Pgchar  = ^gchar;
PGDBusConnection  = ^GDBusConnection;
Pgdouble  = ^gdouble;
Pguint  = ^guint;
PIBusEngine  = ^IBusEngine;
PIBusEngineClass  = ^IBusEngineClass;
PIBusEnginePrivate  = ^IBusEnginePrivate;
PIBusLookupTable  = ^IBusLookupTable;
PIBusProperty  = ^IBusProperty;
PIBusPropList  = ^IBusPropList;
PIBusText  = ^IBusText;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2012-2022 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2008-2022 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_ENGINE_H_}
{$define __IBUS_ENGINE_H_}
{*
 * SECTION: ibusengine
 * @short_description: Input method engine abstract.
 * @title: IBusEngine
 * @stability: Stable
 *
 * An IBusEngine provides infrastructure for input method engine.
 * Developers can "extend" this class for input method engine development.
 *
 * see_also: #IBusComponent, #IBusEngineDesc
  }
{$include "ibusservice.h"}
{$include "ibusattribute.h"}
{$include "ibuslookuptable.h"}
{$include "ibusproplist.h"}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_ENGINE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusEngine:
 * @enabled: Whether the engine is enabled.
 * @has_focus: Whether the engine has focus.
 * @cursor_area: Area of cursor.
 * @client_capabilities: IBusCapabilite (client capabilities) flags.
 *
 * IBusEngine properties.
  }
{< private > }
{ instance members  }
{< public > }
{ cursor location  }
  PIBusEngine = ^TIBusEngine;
  TIBusEngine = record
      parent : TIBusService;
      priv : PIBusEnginePrivate;
      enabled : Tgboolean;
      has_focus : Tgboolean;
      cursor_area : TIBusRectangle;
      client_capabilities : Tguint;
    end;

{< private > }
{ class members  }
{< public > }
{ signals  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ padding  }
  PIBusEngineClass = ^TIBusEngineClass;
  TIBusEngineClass = record
      parent : TIBusServiceClass;
      process_key_event : function (engine:PIBusEngine; keyval:Tguint; keycode:Tguint; state:Tguint):Tgboolean;cdecl;
      focus_in : procedure (engine:PIBusEngine);cdecl;
      focus_out : procedure (engine:PIBusEngine);cdecl;
      reset : procedure (engine:PIBusEngine);cdecl;
      enable : procedure (engine:PIBusEngine);cdecl;
      disable : procedure (engine:PIBusEngine);cdecl;
      set_cursor_location : procedure (engine:PIBusEngine; x:Tgint; y:Tgint; w:Tgint; h:Tgint);cdecl;
      set_capabilities : procedure (engine:PIBusEngine; caps:Tguint);cdecl;
      page_up : procedure (engine:PIBusEngine);cdecl;
      page_down : procedure (engine:PIBusEngine);cdecl;
      cursor_up : procedure (engine:PIBusEngine);cdecl;
      cursor_down : procedure (engine:PIBusEngine);cdecl;
      property_activate : procedure (engine:PIBusEngine; prop_name:Pgchar; prop_state:Tguint);cdecl;
      property_show : procedure (engine:PIBusEngine; prop_name:Pgchar);cdecl;
      property_hide : procedure (engine:PIBusEngine; prop_name:Pgchar);cdecl;
      candidate_clicked : procedure (engine:PIBusEngine; index:Tguint; button:Tguint; state:Tguint);cdecl;
      set_surrounding_text : procedure (engine:PIBusEngine; text:PIBusText; cursor_index:Tguint; anchor_pos:Tguint);cdecl;
      process_hand_writing_event : procedure (engine:PIBusEngine; coordinates:Pgdouble; coordinates_len:Tguint);cdecl;
      cancel_hand_writing : procedure (engine:PIBusEngine; n_strokes:Tguint);cdecl;
      set_content_type : procedure (engine:PIBusEngine; purpose:Tguint; hints:Tguint);cdecl;
      focus_in_id : procedure (engine:PIBusEngine; object_path:Pgchar; client:Pgchar);cdecl;
      focus_out_id : procedure (engine:PIBusEngine; object_path:Pgchar);cdecl;
      pdummy : array[0..1] of Tgpointer;
    end;


function ibus_engine_get_type:TGType;cdecl;external;
{*
 * ibus_engine_new:
 * @engine_name: Name of the IBusObject.
 * @object_path: Path for IBusService.
 * @connection: An opened GDBusConnection.
 *
 * Create a new #IBusEngine.
 *
 * Returns: A newly allocated IBusEngine.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ibus_engine_new(engine_name:Pgchar; object_path:Pgchar; connection:PGDBusConnection):PIBusEngine;cdecl;external;
{*
 * ibus_engine_new_with_type:
 * @engine_type: GType of #IBusEngine.
 * @engine_name: Name of the IBusObject.
 * @object_path: Path for IBusService.
 * @connection: An opened GDBusConnection.
 *
 * Create a new #IBusEngine.
 *
 * Returns: A newly allocated IBusEngine.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ibus_engine_new_with_type(engine_type:TGType; engine_name:Pgchar; object_path:Pgchar; connection:PGDBusConnection):PIBusEngine;cdecl;external;
{*
 * ibus_engine_commit_text:
 * @engine: An IBusEngine.
 * @text: String commit to IBusEngine.
 *
 * Commit output of input method to IBus client.
 *
 * (Note: The text object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_commit_text(engine:PIBusEngine; text:PIBusText);cdecl;external;
{*
 * ibus_engine_update_preedit_text:
 * @engine: An IBusEngine.
 * @text: Update content.
 * @cursor_pos: Current position of cursor
 * @visible: Whether the pre-edit buffer is visible.
 *
 * Update the pre-edit buffer.
 *
 * (Note: The text object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_preedit_text(engine:PIBusEngine; text:PIBusText; cursor_pos:Tguint; visible:Tgboolean);cdecl;external;
{*
 * ibus_engine_update_preedit_text_with_mode:
 * @engine: An IBusEngine.
 * @text: Update content.
 * @cursor_pos: Current position of cursor
 * @visible: Whether the pre-edit buffer is visible.
 * @mode: Pre-edit commit mode when the focus is lost.
 *
 * Update the pre-edit buffer with commit mode. Similar to
 * ibus_engine_update_preedit_text(), this function allows users to specify
 * the behavior on focus out when the pre-edit buffer is visible.
 *
 * If @mode is IBUS_ENGINE_PREEDIT_COMMIT, contents of the pre-edit buffer
 * will be committed and cleared.
 * If @mode is IBUS_ENGINE_PREEDIT_CLEAR, contents of the pre-edit buffer
 * will be cleared only.
 *
 * (Note: The text object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_preedit_text_with_mode(engine:PIBusEngine; text:PIBusText; cursor_pos:Tguint; visible:Tgboolean; mode:TIBusPreeditFocusMode);cdecl;external;
{*
 * ibus_engine_show_preedit_text:
 * @engine: An IBusEngine.
 *
 * Show the pre-edit buffer.
  }
procedure ibus_engine_show_preedit_text(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_hide_preedit_text:
 * @engine: An IBusEngine.
 *
 * Hide the pre-edit buffer.
  }
procedure ibus_engine_hide_preedit_text(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_update_auxiliary_text:
 * @engine: An IBusEngine.
 * @text: Update content.
 * @visible: Whether the auxiliary text bar is visible.
 *
 * Update the auxiliary bar.
 *
 * (Note: The text object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_auxiliary_text(engine:PIBusEngine; text:PIBusText; visible:Tgboolean);cdecl;external;
{*
 * ibus_engine_show_auxiliary_text:
 * @engine: An IBusEngine.
 *
 * Show the auxiliary bar.
  }
procedure ibus_engine_show_auxiliary_text(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_hide_auxiliary_text:
 * @engine: An IBusEngine.
 *
 * Hide the auxiliary bar.
  }
procedure ibus_engine_hide_auxiliary_text(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_update_lookup_table:
 * @engine: An IBusEngine.
 * @lookup_table: An lookup_table.
 * @visible: Whether the lookup_table is visible.
 *
 * Update the lookup table.
 *
 * (Note: The table object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_lookup_table(engine:PIBusEngine; lookup_table:PIBusLookupTable; visible:Tgboolean);cdecl;external;
{*
 * ibus_engine_update_lookup_table_fast:
 * @engine: An IBusEngine.
 * @lookup_table: An lookup_table.
 * @visible: Whether the lookup_table is visible.
 *
 * Fast update for big lookup table.
 *
 * If size of lookup table is not over table page size *4,
 * then it calls ibus_engine_update_lookup_table().
 *
 * (Note: The table object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_lookup_table_fast(engine:PIBusEngine; lookup_table:PIBusLookupTable; visible:Tgboolean);cdecl;external;
{*
 * ibus_engine_show_lookup_table:
 * @engine: An IBusEngine.
 *
 * Show the lookup table.
  }
procedure ibus_engine_show_lookup_table(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_hide_lookup_table:
 * @engine: An IBusEngine.
 *
 * Hide the lookup table.
  }
procedure ibus_engine_hide_lookup_table(engine:PIBusEngine);cdecl;external;
{*
 * ibus_engine_forward_key_event:
 * @engine: An IBusEngine.
 * @keyval: KeySym.
 * @keycode: keyboard scancode.
 * @state: Key modifier flags.
 *
 * Forward the key event.
  }
procedure ibus_engine_forward_key_event(engine:PIBusEngine; keyval:Tguint; keycode:Tguint; state:Tguint);cdecl;external;
{*
 * ibus_engine_register_properties:
 * @engine: An IBusEngine.
 * @prop_list: Property List.
 *
 * Register and show properties in language bar.
 *
 * (Note: The prop_list object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_register_properties(engine:PIBusEngine; prop_list:PIBusPropList);cdecl;external;
{*
 * ibus_engine_update_property:
 * @engine: An IBusEngine.
 * @prop: IBusProperty to be updated.
 *
 * Update the state displayed in language bar.
 *
 * (Note: The prop object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_engine_update_property(engine:PIBusEngine; prop:PIBusProperty);cdecl;external;
{*
 * ibus_engine_delete_surrounding_text:
 * @engine: An IBusEngine.
 * @offset: The offset of the first char.
 * @nchars: Number of chars to be deleted.
 *
 * Delete surrounding text.
  }
procedure ibus_engine_delete_surrounding_text(engine:PIBusEngine; offset:Tgint; nchars:Tguint);cdecl;external;
{*
 * ibus_engine_get_surrounding_text:
 * @engine: An IBusEngine.
 * @text: (out) (transfer none) (allow-none): Location to store surrounding text.
 * @cursor_pos: (out) (allow-none): Cursor position in characters in @text.
 * @anchor_pos: (out) (allow-none): Anchor position of selection in @text.
 *
 * Get surrounding text.
 *
 * It is also used to tell the input-context that the engine will
 * utilize surrounding-text.  In that case, it must be called in
 * #IBusEngine::enable handler, with both @text and @cursor set to
 * %NULL.
 *
 * See also: #IBusEngine::set-surrounding-text
  }
procedure ibus_engine_get_surrounding_text(engine:PIBusEngine; text:PPIBusText; cursor_pos:Pguint; anchor_pos:Pguint);cdecl;external;
{*
 * ibus_engine_get_content_type:
 * @engine: An #IBusEngine.
 * @purpose: (out) (allow-none): Primary purpose of the input context.
 * @hints: (out) (allow-none): Hints that augument @purpose.
 *
 * Get content-type (primary purpose and hints) of the current input
 * context.
 *
 * See also: #IBusEngine::set-content-type
  }
procedure ibus_engine_get_content_type(engine:PIBusEngine; purpose:Pguint; hints:Pguint);cdecl;external;
{*
 * ibus_engine_get_name:
 * @engine: An IBusEngine.
 *
 * Return the name of #IBusEngine.
 *
 * Returns: Name of #IBusEngine.
  }
(* Const before type ignored *)
function ibus_engine_get_name(engine:PIBusEngine):Pgchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_ENGINE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_ENGINE:=ibus_engine_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE(obj : longint) : longint;
begin
  IBUS_ENGINE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_ENGINE,IBusEngine);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_CLASS(klass : longint) : longint;
begin
  IBUS_ENGINE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_ENGINE,IBusEngineClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE(obj : longint) : longint;
begin
  IBUS_IS_ENGINE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_ENGINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_ENGINE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_ENGINE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_ENGINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_ENGINE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_ENGINE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_ENGINE,IBusEngineClass);
end;


end.

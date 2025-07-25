
unit ibuspanelservice;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibuspanelservice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibuspanelservice.h
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
PIBusExtensionEvent  = ^IBusExtensionEvent;
PIBusLookupTable  = ^IBusLookupTable;
PIBusPanelService  = ^IBusPanelService;
PIBusPanelServiceClass  = ^IBusPanelServiceClass;
PIBusProperty  = ^IBusProperty;
PIBusPropList  = ^IBusPropList;
PIBusText  = ^IBusText;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (c) 2009-2014 Google Inc. All rights reserved.
 * Copyright (c) 2017-2018 Takao Fujiwara <takao.fujiwara1@gmail.com>
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
{$ifndef __IBUS_PANEL_SERVICE_H_}
{$define __IBUS_PANEL_SERVICE_H_}
{*
 * SECTION: ibuspanelservice
 * @short_description: Panel service back-end.
 * @stability: Stable
 *
 * An IBusPanelService is a base class for UI services.
 * Developers can "extend" this class for panel UI development.
  }
{$include "ibuslookuptable.h"}
{$include "ibusservice.h"}
{$include "ibusproplist.h"}
{$include "ibusxevent.h"}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_PANEL_SERVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PANEL_SERVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PANEL_SERVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE_GET_CLASS(obj : longint) : longint;

type
{*
 * IBusPanelService:
 *
 * An opaque data type representing an IBusPanelService.
  }
{ instance members  }
  PIBusPanelService = ^TIBusPanelService;
  TIBusPanelService = record
      parent : TIBusService;
    end;

{ class members  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ padding  }
{ We can add 8 pointers without breaking the ABI. }
  PIBusPanelServiceClass = ^TIBusPanelServiceClass;
  TIBusPanelServiceClass = record
      parent : TIBusServiceClass;
      focus_in : procedure (panel:PIBusPanelService; input_context_path:Pgchar);cdecl;
      focus_out : procedure (panel:PIBusPanelService; input_context_path:Pgchar);cdecl;
      register_properties : procedure (panel:PIBusPanelService; prop_list:PIBusPropList);cdecl;
      set_cursor_location : procedure (panel:PIBusPanelService; x:Tgint; y:Tgint; w:Tgint; h:Tgint);cdecl;
      update_auxiliary_text : procedure (panel:PIBusPanelService; text:PIBusText; visible:Tgboolean);cdecl;
      update_lookup_table : procedure (panel:PIBusPanelService; lookup_table:PIBusLookupTable; visible:Tgboolean);cdecl;
      update_preedit_text : procedure (panel:PIBusPanelService; text:PIBusText; cursor_pos:Tguint; visible:Tgboolean);cdecl;
      update_property : procedure (panel:PIBusPanelService; prop:PIBusProperty);cdecl;
      cursor_down_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      cursor_up_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      hide_auxiliary_text : procedure (panel:PIBusPanelService);cdecl;
      hide_language_bar : procedure (panel:PIBusPanelService);cdecl;
      hide_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      hide_preedit_text : procedure (panel:PIBusPanelService);cdecl;
      page_down_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      page_up_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      reset : procedure (panel:PIBusPanelService);cdecl;
      show_auxiliary_text : procedure (panel:PIBusPanelService);cdecl;
      show_language_bar : procedure (panel:PIBusPanelService);cdecl;
      show_lookup_table : procedure (panel:PIBusPanelService);cdecl;
      show_preedit_text : procedure (panel:PIBusPanelService);cdecl;
      start_setup : procedure (panel:PIBusPanelService);cdecl;
      state_changed : procedure (panel:PIBusPanelService);cdecl;
      destroy_context : procedure (panel:PIBusPanelService; input_context_path:Pgchar);cdecl;
      set_content_type : procedure (panel:PIBusPanelService; purpose:Tguint; hints:Tguint);cdecl;
      set_cursor_location_relative : procedure (panel:PIBusPanelService; x:Tgint; y:Tgint; w:Tgint; h:Tgint);cdecl;
      panel_extension_received : procedure (panel:PIBusPanelService; event:PIBusExtensionEvent);cdecl;
      process_key_event : function (panel:PIBusPanelService; keyval:Tguint; keycode:Tguint; state:Tguint):Tgboolean;cdecl;
      commit_text_received : procedure (panel:PIBusPanelService; text:PIBusText);cdecl;
      candidate_clicked_lookup_table : procedure (panel:PIBusPanelService; index:Tguint; button:Tguint; state:Tguint);cdecl;
      pdummy : array[0..1] of Tgpointer;
    end;


function ibus_panel_service_get_type:TGType;cdecl;external;
{*
 * ibus_panel_service_new:
 * @connection: An GDBusConnection.
 *
 * Creates a new #IBusPanelService from an #GDBusConnection.
 *
 * Returns: A newly allocated #IBusPanelService.
  }
function ibus_panel_service_new(connection:PGDBusConnection):PIBusPanelService;cdecl;external;
{*
 * ibus_panel_service_candidate_clicked:
 * @panel: An IBusPanelService
 * @index: Index in the Lookup table
 * @button: GdkEventButton::button (1: left button, etc.)
 * @state: GdkEventButton::state (key modifier flags)
 *
 * Notify that a candidate is clicked
 * by sending a "CandidateClicked" to IBus service.
  }
procedure ibus_panel_service_candidate_clicked(panel:PIBusPanelService; index:Tguint; button:Tguint; state:Tguint);cdecl;external;
{*
 * ibus_panel_service_cursor_down:
 * @panel: An IBusPanelService
 *
 * Notify that the cursor is down
 * by sending a "CursorDown" to IBus service.
  }
procedure ibus_panel_service_cursor_down(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_cursor_up:
 * @panel: An IBusPanelService
 *
 * Notify that the cursor is up
 * by sending a "CursorUp" to IBus service.
  }
procedure ibus_panel_service_cursor_up(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_page_down:
 * @panel: An IBusPanelService
 *
 * Notify that the page is down
 * by sending a "PageDown" to IBus service.
  }
procedure ibus_panel_service_page_down(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_page_up:
 * @panel: An IBusPanelService
 *
 * Notify that the page is up
 * by sending a "PageUp" to IBus service.
  }
procedure ibus_panel_service_page_up(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_property_activate:
 * @panel: An IBusPanelService
 * @prop_name: A property name
 * @prop_state: State of the property
 *
 * Notify that a property is active
 * by sending a "PropertyActivate" message to IBus service.
  }
(* Const before type ignored *)
procedure ibus_panel_service_property_activate(panel:PIBusPanelService; prop_name:Pgchar; prop_state:Tguint);cdecl;external;
{*
 * ibus_panel_service_property_show:
 * @panel: An IBusPanelService
 * @prop_name: A property name
 *
 * Notify that a property is shown
 * by sending a "ValueChanged" message to IBus service.
  }
(* Const before type ignored *)
procedure ibus_panel_service_property_show(panel:PIBusPanelService; prop_name:Pgchar);cdecl;external;
{*
 * ibus_panel_service_property_hide:
 * @panel: An IBusPanelService
 * @prop_name: A property name
 *
 * Notify that a property is hidden
 * by sending a "ValueChanged" message to IBus service.
  }
(* Const before type ignored *)
procedure ibus_panel_service_property_hide(panel:PIBusPanelService; prop_name:Pgchar);cdecl;external;
{*
 * ibus_panel_service_commit_text:
 * @panel: An #IBusPanelService
 * @text: An #IBusText
 *
 * Notify that a text is sent
 * by sending a "CommitText" message to IBus service.
  }
procedure ibus_panel_service_commit_text(panel:PIBusPanelService; text:PIBusText);cdecl;external;
{*
 * ibus_panel_service_panel_extension:
 * @panel: An #IBusPanelService
 * @event: (transfer full): A #PanelExtensionEvent which is sent to a
 *                          panel extension. 
 *
 * Enable or disable a panel extension with #IBusExtensionEvent.
 * Notify that a data is sent
 * by sending a "PanelExtension" message to IBus panel extension service.
  }
procedure ibus_panel_service_panel_extension(panel:PIBusPanelService; event:PIBusExtensionEvent);cdecl;external;
{*
 * ibus_panel_service_panel_extension_register_keys:
 * @panel: An #IBusPanelService
 * @first_property_name: the first name of the shortcut keys. This is %NULL
 " terminated.
 *
 * Register shortcut keys to enable panel extensions with #IBusExtensionEvent.
 * Notify that a data is sent
 * by sending a "PanelExtensionRegisterKeys" message to IBus panel extension
 * service. Seems Vala does not support uint[][3] and use
 * IBusProcessKeyEventData[]. E.g.
 * IBusProcessKeyEventData[] keys = 
 *         IBUS_KEY_e, 0, IBUS_SHIFT_MASK | IBUS_SUPER_MASK ;
 * ibus_panel_service_panel_extension_register_keys(panel, "emoji", keys, NULL);
  }
(* Const before type ignored *)
procedure ibus_panel_service_panel_extension_register_keys(panel:PIBusPanelService; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure ibus_panel_service_panel_extension_register_keys(panel:PIBusPanelService; first_property_name:Pgchar);cdecl;external;
{*
 * ibus_panel_service_update_preedit_text_received:
 * @panel: An #IBusPanelService
 * @text: Update content.
 * @cursor_pos: Current position of cursor
 * @visible: Whether the pre-edit buffer is visible.
 *
 * Notify that the preedit is updated by the panel extension
 *
 * (Note: The table object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_panel_service_update_preedit_text_received(panel:PIBusPanelService; text:PIBusText; cursor_pos:Tguint; visible:Tgboolean);cdecl;external;
{*
 * ibus_panel_service_show_preedit_text_received:
 * @panel: An IBusPanelService
 *
 * Notify that the preedit is shown by the panel extension
  }
procedure ibus_panel_service_show_preedit_text_received(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_hide_preedit_text_received:
 * @panel: An IBusPanelService
 *
 * Notify that the preedit is hidden by the panel extension
  }
procedure ibus_panel_service_hide_preedit_text_received(panel:PIBusPanelService);cdecl;external;
{*
 * ibus_panel_service_update_auxiliary_text_received:
 * @panel: An #IBusPanelService
 * @text: An #IBusText
 * @visible: Whether the auxilirary text is visible.
 *
 * Notify that the auxilirary is updated by the panel extension.
 *
 * (Note: The table object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_panel_service_update_auxiliary_text_received(panel:PIBusPanelService; text:PIBusText; visible:Tgboolean);cdecl;external;
{*
 * ibus_panel_service_update_lookup_table_received:
 * @panel: An #IBusPanelService
 * @table: An #IBusLookupTable
 * @visible: Whether the lookup table is visible.
 *
 * Notify that the lookup table is updated by the panel extension.
 *
 * (Note: The table object will be released, if it is floating.
 *  If caller want to keep the object, caller should make the object
 *  sink by g_object_ref_sink.)
  }
procedure ibus_panel_service_update_lookup_table_received(panel:PIBusPanelService; table:PIBusLookupTable; visible:Tgboolean);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_PANEL_SERVICE : longint; { return type might be wrong }
  begin
    IBUS_TYPE_PANEL_SERVICE:=ibus_panel_service_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE(obj : longint) : longint;
begin
  IBUS_PANEL_SERVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_PANEL_SERVICE,IBusPanelService);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE_CLASS(klass : longint) : longint;
begin
  IBUS_PANEL_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_PANEL_SERVICE,IBusPanelServiceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PANEL_SERVICE(obj : longint) : longint;
begin
  IBUS_IS_PANEL_SERVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_PANEL_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PANEL_SERVICE_CLASS(klass : longint) : longint;
begin
  IBUS_IS_PANEL_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_PANEL_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PANEL_SERVICE_GET_CLASS(obj : longint) : longint;
begin
  IBUS_PANEL_SERVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_PANEL_SERVICE,IBusPanelServiceClass);
end;


end.

unit ibuspanelservice;

interface

uses
  fp_glib2, ibus, ibusservice, ibusproperty, ibustext, ibuslookuptable, ibusxevent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TIBusPanelService = record
    parent: TIBusService;
  end;
  PIBusPanelService = ^TIBusPanelService;

  TIBusPanelServiceClass = record
    parent: TIBusServiceClass;
    focus_in: procedure(panel: PIBusPanelService; input_context_path: Pgchar); cdecl;
    focus_out: procedure(panel: PIBusPanelService; input_context_path: Pgchar); cdecl;
    register_properties: procedure(panel: PIBusPanelService; prop_list: PIBusPropList); cdecl;
    set_cursor_location: procedure(panel: PIBusPanelService; x: Tgint; y: Tgint; w: Tgint; h: Tgint); cdecl;
    update_auxiliary_text: procedure(panel: PIBusPanelService; text: PIBusText; visible: Tgboolean); cdecl;
    update_lookup_table: procedure(panel: PIBusPanelService; lookup_table: PIBusLookupTable; visible: Tgboolean); cdecl;
    update_preedit_text: procedure(panel: PIBusPanelService; text: PIBusText; cursor_pos: Tguint; visible: Tgboolean); cdecl;
    update_property: procedure(panel: PIBusPanelService; prop: PIBusProperty); cdecl;
    cursor_down_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    cursor_up_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    hide_auxiliary_text: procedure(panel: PIBusPanelService); cdecl;
    hide_language_bar: procedure(panel: PIBusPanelService); cdecl;
    hide_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    hide_preedit_text: procedure(panel: PIBusPanelService); cdecl;
    page_down_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    page_up_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    reset: procedure(panel: PIBusPanelService); cdecl;
    show_auxiliary_text: procedure(panel: PIBusPanelService); cdecl;
    show_language_bar: procedure(panel: PIBusPanelService); cdecl;
    show_lookup_table: procedure(panel: PIBusPanelService); cdecl;
    show_preedit_text: procedure(panel: PIBusPanelService); cdecl;
    start_setup: procedure(panel: PIBusPanelService); cdecl;
    state_changed: procedure(panel: PIBusPanelService); cdecl;
    destroy_context: procedure(panel: PIBusPanelService; input_context_path: Pgchar); cdecl;
    set_content_type: procedure(panel: PIBusPanelService; purpose: Tguint; hints: Tguint); cdecl;
    set_cursor_location_relative: procedure(panel: PIBusPanelService; x: Tgint; y: Tgint; w: Tgint; h: Tgint); cdecl;
    panel_extension_received: procedure(panel: PIBusPanelService; event: PIBusExtensionEvent); cdecl;
    process_key_event: function(panel: PIBusPanelService; keyval: Tguint; keycode: Tguint; state: Tguint): Tgboolean; cdecl;
    commit_text_received: procedure(panel: PIBusPanelService; text: PIBusText); cdecl;
    candidate_clicked_lookup_table: procedure(panel: PIBusPanelService; index: Tguint; button: Tguint; state: Tguint); cdecl;
    pdummy: array[0..1] of Tgpointer;
  end;
  PIBusPanelServiceClass = ^TIBusPanelServiceClass;

function ibus_panel_service_get_type: TGType; cdecl; external libibus;
function ibus_panel_service_new(connection: PGDBusConnection): PIBusPanelService; cdecl; external libibus;
procedure ibus_panel_service_candidate_clicked(panel: PIBusPanelService; index: Tguint; button: Tguint; state: Tguint); cdecl; external libibus;
procedure ibus_panel_service_cursor_down(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_cursor_up(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_page_down(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_page_up(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_property_activate(panel: PIBusPanelService; prop_name: Pgchar; prop_state: Tguint); cdecl; external libibus;
procedure ibus_panel_service_property_show(panel: PIBusPanelService; prop_name: Pgchar); cdecl; external libibus;
procedure ibus_panel_service_property_hide(panel: PIBusPanelService; prop_name: Pgchar); cdecl; external libibus;
procedure ibus_panel_service_commit_text(panel: PIBusPanelService; text: PIBusText); cdecl; external libibus;
procedure ibus_panel_service_panel_extension(panel: PIBusPanelService; event: PIBusExtensionEvent); cdecl; external libibus;
procedure ibus_panel_service_panel_extension_register_keys(panel: PIBusPanelService; first_property_name: Pgchar; args: array of const); cdecl; external libibus;
procedure ibus_panel_service_panel_extension_register_keys(panel: PIBusPanelService; first_property_name: Pgchar); cdecl; external libibus;
procedure ibus_panel_service_update_preedit_text_received(panel: PIBusPanelService; text: PIBusText; cursor_pos: Tguint; visible: Tgboolean); cdecl; external libibus;
procedure ibus_panel_service_show_preedit_text_received(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_hide_preedit_text_received(panel: PIBusPanelService); cdecl; external libibus;
procedure ibus_panel_service_update_auxiliary_text_received(panel: PIBusPanelService; text: PIBusText; visible: Tgboolean); cdecl; external libibus;
procedure ibus_panel_service_update_lookup_table_received(panel: PIBusPanelService; table: PIBusLookupTable; visible: Tgboolean); cdecl; external libibus;


// === Konventiert am: 25-7-25 19:42:51 ===

function IBUS_TYPE_PANEL_SERVICE: TGType;
function IBUS_PANEL_SERVICE(obj: Pointer): PIBusPanelService;
function IBUS_PANEL_SERVICE_CLASS(klass: Pointer): PIBusPanelServiceClass;
function IBUS_IS_PANEL_SERVICE(obj: Pointer): Tgboolean;
function IBUS_IS_PANEL_SERVICE_CLASS(klass: Pointer): Tgboolean;
function IBUS_PANEL_SERVICE_GET_CLASS(obj: Pointer): PIBusPanelServiceClass;

implementation

function IBUS_TYPE_PANEL_SERVICE: TGType;
begin
  IBUS_TYPE_PANEL_SERVICE := ibus_panel_service_get_type;
end;

function IBUS_PANEL_SERVICE(obj: Pointer): PIBusPanelService;
begin
  Result := PIBusPanelService(g_type_check_instance_cast(obj, IBUS_TYPE_PANEL_SERVICE));
end;

function IBUS_PANEL_SERVICE_CLASS(klass: Pointer): PIBusPanelServiceClass;
begin
  Result := PIBusPanelServiceClass(g_type_check_class_cast(klass, IBUS_TYPE_PANEL_SERVICE));
end;

function IBUS_IS_PANEL_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_PANEL_SERVICE);
end;

function IBUS_IS_PANEL_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_PANEL_SERVICE);
end;

function IBUS_PANEL_SERVICE_GET_CLASS(obj: Pointer): PIBusPanelServiceClass;
begin
  Result := PIBusPanelServiceClass(PGTypeInstance(obj)^.g_class);
end;



end.

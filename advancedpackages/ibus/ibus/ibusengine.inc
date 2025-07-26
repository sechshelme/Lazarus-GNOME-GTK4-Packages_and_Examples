{$IFDEF read_interface}


type
  PIBusEnginePrivate = type Pointer;

  TIBusEngine = record
    parent: TIBusService;
    priv: PIBusEnginePrivate;
    enabled: Tgboolean;
    has_focus: Tgboolean;
    cursor_area: TIBusRectangle;
    client_capabilities: Tguint;
  end;
  PIBusEngine = ^TIBusEngine;

  TIBusEngineClass = record
    parent: TIBusServiceClass;
    process_key_event: function(engine: PIBusEngine; keyval: Tguint; keycode: Tguint; state: Tguint): Tgboolean; cdecl;
    focus_in: procedure(engine: PIBusEngine); cdecl;
    focus_out: procedure(engine: PIBusEngine); cdecl;
    reset: procedure(engine: PIBusEngine); cdecl;
    enable: procedure(engine: PIBusEngine); cdecl;
    disable: procedure(engine: PIBusEngine); cdecl;
    set_cursor_location: procedure(engine: PIBusEngine; x: Tgint; y: Tgint; w: Tgint; h: Tgint); cdecl;
    set_capabilities: procedure(engine: PIBusEngine; caps: Tguint); cdecl;
    page_up: procedure(engine: PIBusEngine); cdecl;
    page_down: procedure(engine: PIBusEngine); cdecl;
    cursor_up: procedure(engine: PIBusEngine); cdecl;
    cursor_down: procedure(engine: PIBusEngine); cdecl;
    property_activate: procedure(engine: PIBusEngine; prop_name: Pgchar; prop_state: Tguint); cdecl;
    property_show: procedure(engine: PIBusEngine; prop_name: Pgchar); cdecl;
    property_hide: procedure(engine: PIBusEngine; prop_name: Pgchar); cdecl;
    candidate_clicked: procedure(engine: PIBusEngine; index: Tguint; button: Tguint; state: Tguint); cdecl;
    set_surrounding_text: procedure(engine: PIBusEngine; text: PIBusText; cursor_index: Tguint; anchor_pos: Tguint); cdecl;
    process_hand_writing_event: procedure(engine: PIBusEngine; coordinates: Pgdouble; coordinates_len: Tguint); cdecl;
    cancel_hand_writing: procedure(engine: PIBusEngine; n_strokes: Tguint); cdecl;
    set_content_type: procedure(engine: PIBusEngine; purpose: Tguint; hints: Tguint); cdecl;
    focus_in_id: procedure(engine: PIBusEngine; object_path: Pgchar; client: Pgchar); cdecl;
    focus_out_id: procedure(engine: PIBusEngine; object_path: Pgchar); cdecl;
    pdummy: array[0..1] of Tgpointer;
  end;
  PIBusEngineClass = ^TIBusEngineClass;

function ibus_engine_get_type: TGType; cdecl; external libibus;
function ibus_engine_new(engine_name: Pgchar; object_path: Pgchar; connection: PGDBusConnection): PIBusEngine; cdecl; external libibus;
function ibus_engine_new_with_type(engine_type: TGType; engine_name: Pgchar; object_path: Pgchar; connection: PGDBusConnection): PIBusEngine; cdecl; external libibus;
procedure ibus_engine_commit_text(engine: PIBusEngine; text: PIBusText); cdecl; external libibus;
procedure ibus_engine_update_preedit_text(engine: PIBusEngine; text: PIBusText; cursor_pos: Tguint; visible: Tgboolean); cdecl; external libibus;
procedure ibus_engine_update_preedit_text_with_mode(engine: PIBusEngine; text: PIBusText; cursor_pos: Tguint; visible: Tgboolean; mode: TIBusPreeditFocusMode); cdecl; external libibus;
procedure ibus_engine_show_preedit_text(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_hide_preedit_text(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_update_auxiliary_text(engine: PIBusEngine; text: PIBusText; visible: Tgboolean); cdecl; external libibus;
procedure ibus_engine_show_auxiliary_text(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_hide_auxiliary_text(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_update_lookup_table(engine: PIBusEngine; lookup_table: PIBusLookupTable; visible: Tgboolean); cdecl; external libibus;
procedure ibus_engine_update_lookup_table_fast(engine: PIBusEngine; lookup_table: PIBusLookupTable; visible: Tgboolean); cdecl; external libibus;
procedure ibus_engine_show_lookup_table(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_hide_lookup_table(engine: PIBusEngine); cdecl; external libibus;
procedure ibus_engine_forward_key_event(engine: PIBusEngine; keyval: Tguint; keycode: Tguint; state: Tguint); cdecl; external libibus;
procedure ibus_engine_register_properties(engine: PIBusEngine; prop_list: PIBusPropList); cdecl; external libibus;
procedure ibus_engine_update_property(engine: PIBusEngine; prop: PIBusProperty); cdecl; external libibus;
procedure ibus_engine_delete_surrounding_text(engine: PIBusEngine; offset: Tgint; nchars: Tguint); cdecl; external libibus;
procedure ibus_engine_get_surrounding_text(engine: PIBusEngine; text: PPIBusText; cursor_pos: Pguint; anchor_pos: Pguint); cdecl; external libibus;
procedure ibus_engine_get_content_type(engine: PIBusEngine; purpose: Pguint; hints: Pguint); cdecl; external libibus;
function ibus_engine_get_name(engine: PIBusEngine): Pgchar; cdecl; external libibus;

// === Konventiert am: 25-7-25 19:42:34 ===

function IBUS_TYPE_ENGINE: TGType;
function IBUS_ENGINE(obj: Pointer): PIBusEngine;
function IBUS_ENGINE_CLASS(klass: Pointer): PIBusEngineClass;
function IBUS_IS_ENGINE(obj: Pointer): Tgboolean;
function IBUS_IS_ENGINE_CLASS(klass: Pointer): Tgboolean;
function IBUS_ENGINE_GET_CLASS(obj: Pointer): PIBusEngineClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_ENGINE: TGType;
begin
  IBUS_TYPE_ENGINE := ibus_engine_get_type;
end;

function IBUS_ENGINE(obj: Pointer): PIBusEngine;
begin
  Result := PIBusEngine(g_type_check_instance_cast(obj, IBUS_TYPE_ENGINE));
end;

function IBUS_ENGINE_CLASS(klass: Pointer): PIBusEngineClass;
begin
  Result := PIBusEngineClass(g_type_check_class_cast(klass, IBUS_TYPE_ENGINE));
end;

function IBUS_IS_ENGINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_ENGINE);
end;

function IBUS_IS_ENGINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_ENGINE);
end;

function IBUS_ENGINE_GET_CLASS(obj: Pointer): PIBusEngineClass;
begin
  Result := PIBusEngineClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

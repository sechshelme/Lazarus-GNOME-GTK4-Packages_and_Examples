{$IFDEF read_interface}


type
  TShumateSymbolEvent = record
  end;
  PShumateSymbolEvent = ^TShumateSymbolEvent;

  TShumateSymbolEventClass = record
    parent_class: TGObjectClass;
  end;
  PShumateSymbolEventClass = ^TShumateSymbolEventClass;

function shumate_symbol_event_get_type: TGType; cdecl; external libshumate;
function shumate_symbol_event_get_layer(self: PShumateSymbolEvent): pchar; cdecl; external libshumate;
function shumate_symbol_event_get_source_layer(self: PShumateSymbolEvent): pchar; cdecl; external libshumate;
function shumate_symbol_event_get_feature_id(self: PShumateSymbolEvent): pchar; cdecl; external libshumate;
function shumate_symbol_event_get_keys(self: PShumateSymbolEvent): TGStrv; cdecl; external libshumate;
function shumate_symbol_event_get_tag(self: PShumateSymbolEvent; tag_name: pchar): pchar; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:35 ===

function SHUMATE_TYPE_SYMBOL_EVENT: TGType;
function SHUMATE_SYMBOL_EVENT(obj: Pointer): PShumateSymbolEvent;
function SHUMATE_IS_SYMBOL_EVENT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_SYMBOL_EVENT: TGType;
begin
  Result := shumate_symbol_event_get_type;
end;

function SHUMATE_SYMBOL_EVENT(obj: Pointer): PShumateSymbolEvent;
begin
  Result := PShumateSymbolEvent(g_type_check_instance_cast(obj, SHUMATE_TYPE_SYMBOL_EVENT));
end;

function SHUMATE_IS_SYMBOL_EVENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_SYMBOL_EVENT);
end;


{$ENDIF read_implementation}

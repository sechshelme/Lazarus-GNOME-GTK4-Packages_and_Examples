{$IFDEF read_interface}


type
  PNMAWs = type Pointer;
  PNMAWsInterface = type Pointer;

function nma_ws_get_type: TGType; cdecl; external libnma;
function nma_ws_validate(self: PNMAWs; error: PPGError): Tgboolean; cdecl; external libnma;
procedure nma_ws_add_to_size_group(self: PNMAWs; group: PGtkSizeGroup); cdecl; external libnma;
procedure nma_ws_fill_connection(self: PNMAWs; connection: PNMConnection); cdecl; external libnma;
procedure nma_ws_update_secrets(self: PNMAWs; connection: PNMConnection); cdecl; external libnma;
procedure nma_ws_focus_secrets_default(self: PNMAWs); cdecl; external libnma;
function nma_ws_adhoc_compatible(self: PNMAWs): Tgboolean; cdecl; external libnma;
function nma_ws_hotspot_compatible(self: PNMAWs): Tgboolean; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:24:46 ===

function NMA_TYPE_WS: TGType;
function NMA_WS(obj: Pointer): PNMAWs;
function NMA_IS_WS(obj: Pointer): Tgboolean;
function NMA_WS_GET_INTERFACE(obj: Pointer): PNMAWsInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_WS: TGType;
begin
  NMA_TYPE_WS := nma_ws_get_type;
end;

function NMA_WS(obj: Pointer): PNMAWs;
begin
  Result := PNMAWs(g_type_check_instance_cast(obj, NMA_TYPE_WS));
end;

function NMA_IS_WS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_WS);
end;

function NMA_WS_GET_INTERFACE(obj: Pointer): PNMAWsInterface;
begin
  Result := g_type_interface_peek(obj, NMA_TYPE_WS);
end;



{$ENDIF read_implementation}

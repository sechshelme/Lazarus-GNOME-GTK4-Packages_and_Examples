{$IFDEF read_interface}


type
  PNMAWsWpaEap = type Pointer;
  PNMAWsWpaEapClass = type Pointer;

function nma_ws_wpa_eap_get_type: TGType; cdecl; external libnma;
function nma_ws_wpa_eap_new(connection: PNMConnection; is_editor: Tgboolean; secrets_only: Tgboolean; secrets_hints: PPchar): PNMAWsWpaEap; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:23:57 ===

function NMA_TYPE_WS_WPA_EAP: TGType;
function NMA_WS_WPA_EAP(obj: Pointer): PNMAWsWpaEap;
function NMA_WS_WPA_EAP_CLASS(klass: Pointer): PNMAWsWpaEapClass;
function NMA_IS_WS_WPA_EAP(obj: Pointer): Tgboolean;
function NMA_IS_WS_WPA_EAP_CLASS(klass: Pointer): Tgboolean;
function NMA_WS_WPA_EAP_GET_CLASS(obj: Pointer): PNMAWsWpaEapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_WS_WPA_EAP: TGType;
begin
  NMA_TYPE_WS_WPA_EAP := nma_ws_wpa_eap_get_type;
end;

function NMA_WS_WPA_EAP(obj: Pointer): PNMAWsWpaEap;
begin
  Result := PNMAWsWpaEap(g_type_check_instance_cast(obj, NMA_TYPE_WS_WPA_EAP));
end;

function NMA_WS_WPA_EAP_CLASS(klass: Pointer): PNMAWsWpaEapClass;
begin
  Result := PNMAWsWpaEapClass(g_type_check_class_cast(klass, NMA_TYPE_WS_WPA_EAP));
end;

function NMA_IS_WS_WPA_EAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_WS_WPA_EAP);
end;

function NMA_IS_WS_WPA_EAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_WS_WPA_EAP);
end;

function NMA_WS_WPA_EAP_GET_CLASS(obj: Pointer): PNMAWsWpaEapClass;
begin
  Result := PNMAWsWpaEapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

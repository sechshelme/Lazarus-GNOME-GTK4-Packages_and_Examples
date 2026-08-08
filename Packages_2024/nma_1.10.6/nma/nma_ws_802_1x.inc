{$IFDEF read_interface}


type
  PNMAWs8021x = type Pointer;
  PNMAWs8021xClass = type Pointer;

function nma_ws_802_1x_get_type: TGType; cdecl; external libnma;
function nma_ws_802_1x_new(connection: PNMConnection; is_editor: Tgboolean; secrets_only: Tgboolean): PNMAWs8021x; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:24:36 ===

function NMA_TYPE_WS_802_1X: TGType;
function NMA_WS_802_1X(obj: Pointer): PNMAWs8021x;
function NMA_WS_802_1X_CLASS(klass: Pointer): PNMAWs8021xClass;
function NMA_IS_WS_802_1X(obj: Pointer): Tgboolean;
function NMA_IS_WS_802_1X_CLASS(klass: Pointer): Tgboolean;
function NMA_WS_802_1X_GET_CLASS(obj: Pointer): PNMAWs8021xClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_WS_802_1X: TGType;
begin
  NMA_TYPE_WS_802_1X := nma_ws_802_1x_get_type;
end;

function NMA_WS_802_1X(obj: Pointer): PNMAWs8021x;
begin
  Result := PNMAWs8021x(g_type_check_instance_cast(obj, NMA_TYPE_WS_802_1X));
end;

function NMA_WS_802_1X_CLASS(klass: Pointer): PNMAWs8021xClass;
begin
  Result := PNMAWs8021xClass(g_type_check_class_cast(klass, NMA_TYPE_WS_802_1X));
end;

function NMA_IS_WS_802_1X(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_WS_802_1X);
end;

function NMA_IS_WS_802_1X_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_WS_802_1X);
end;

function NMA_WS_802_1X_GET_CLASS(obj: Pointer): PNMAWs8021xClass;
begin
  Result := PNMAWs8021xClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

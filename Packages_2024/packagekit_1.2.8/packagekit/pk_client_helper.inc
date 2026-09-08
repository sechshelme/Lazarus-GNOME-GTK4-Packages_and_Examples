{$IFDEF read_interface}


type
  PPkClientHelperPrivate = type Pointer;

  PPkClientHelper = ^TPkClientHelper;
  TPkClientHelper = record
    parent: TGObject;
    priv: PPkClientHelperPrivate;
  end;

  PPkClientHelperClass = ^TPkClientHelperClass;
  TPkClientHelperClass = record
    parent_class: TGObjectClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_client_helper_get_type: TGType; cdecl; external libpackagekit;
function pk_client_helper_new: PPkClientHelper; cdecl; external libpackagekit;
function pk_client_helper_stop(client_helper: PPkClientHelper; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_client_helper_start(client_helper: PPkClientHelper; socket_filename: Pgchar; argv: PPgchar; envp: PPgchar; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_client_helper_start_with_socket(client_helper: PPkClientHelper; socket: PGSocket; argv: PPgchar; envp: PPgchar; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_client_helper_is_active(client_helper: PPkClientHelper): Tgboolean; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:04:11 ===

function PK_TYPE_CLIENT_HELPER: TGType;
function PK_CLIENT_HELPER(obj: Pointer): PPkClientHelper;
function PK_CLIENT_HELPER_CLASS(klass: Pointer): PPkClientHelperClass;
function PK_IS_CLIENT_HELPER(obj: Pointer): Tgboolean;
function PK_IS_CLIENT_HELPER_CLASS(klass: Pointer): Tgboolean;
function PK_CLIENT_HELPER_GET_CLASS(obj: Pointer): PPkClientHelperClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_CLIENT_HELPER: TGType;
begin
  PK_TYPE_CLIENT_HELPER := pk_client_helper_get_type;
end;

function PK_CLIENT_HELPER(obj: Pointer): PPkClientHelper;
begin
  Result := PPkClientHelper(g_type_check_instance_cast(obj, PK_TYPE_CLIENT_HELPER));
end;

function PK_CLIENT_HELPER_CLASS(klass: Pointer): PPkClientHelperClass;
begin
  Result := PPkClientHelperClass(g_type_check_class_cast(klass, PK_TYPE_CLIENT_HELPER));
end;

function PK_IS_CLIENT_HELPER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_CLIENT_HELPER);
end;

function PK_IS_CLIENT_HELPER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_CLIENT_HELPER);
end;

function PK_CLIENT_HELPER_GET_CLASS(obj: Pointer): PPkClientHelperClass;
begin
  Result := PPkClientHelperClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

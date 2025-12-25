{$IFDEF read_interface}


type
  PGaClientState = ^TGaClientState;
  TGaClientState = longint;

const
  GA_CLIENT_STATE_NOT_STARTED = -(1);
  GA_CLIENT_STATE_S_REGISTERING = AVAHI_CLIENT_S_REGISTERING;
  GA_CLIENT_STATE_S_RUNNING = AVAHI_CLIENT_S_RUNNING;
  GA_CLIENT_STATE_S_COLLISION = AVAHI_CLIENT_S_COLLISION;
  GA_CLIENT_STATE_FAILURE = AVAHI_CLIENT_FAILURE;
  GA_CLIENT_STATE_CONNECTING = AVAHI_CLIENT_CONNECTING;

type
  PGaClientFlags = ^TGaClientFlags;
  TGaClientFlags = longint;

const
  GA_CLIENT_FLAG_NO_FLAGS = 0;
  GA_CLIENT_FLAG_IGNORE_USER_CONFIG = AVAHI_CLIENT_IGNORE_USER_CONFIG;
  GA_CLIENT_FLAG_NO_FAIL = AVAHI_CLIENT_NO_FAIL;

type
  TGaClientClass = record
    parent_class: TGObjectClass;
  end;
  PGaClientClass = ^TGaClientClass;

  TGaClient = record
    parent: TGObject;
    avahi_client: PAvahiClient;
  end;
  PGaClient = ^TGaClient;


function ga_client_get_type: TGType; cdecl; external libavahi_gobject;
function ga_client_new(flags: TGaClientFlags): PGaClient; cdecl; external libavahi_gobject;
function ga_client_start(client: PGaClient; error: PPGError): Tgboolean; cdecl; external libavahi_gobject;
function ga_client_start_in_context(client: PGaClient; context: PGMainContext; error: PPGError): Tgboolean; cdecl; external libavahi_gobject;

// === Konventiert am: 25-12-25 15:56:24 ===

function GA_TYPE_CLIENT: TGType;
function GA_CLIENT(obj: Pointer): PGaClient;
function GA_CLIENT_CLASS(klass: Pointer): PGaClientClass;
function IS_GA_CLIENT(obj: Pointer): Tgboolean;
function IS_GA_CLIENT_CLASS(klass: Pointer): Tgboolean;
function GA_CLIENT_GET_CLASS(obj: Pointer): PGaClientClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GA_TYPE_CLIENT: TGType;
begin
  GA_TYPE_CLIENT := ga_client_get_type;
end;

function GA_CLIENT(obj: Pointer): PGaClient;
begin
  Result := PGaClient(g_type_check_instance_cast(obj, GA_TYPE_CLIENT));
end;

function GA_CLIENT_CLASS(klass: Pointer): PGaClientClass;
begin
  Result := PGaClientClass(g_type_check_class_cast(klass, GA_TYPE_CLIENT));
end;

function IS_GA_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GA_TYPE_CLIENT);
end;

function IS_GA_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GA_TYPE_CLIENT);
end;

function GA_CLIENT_GET_CLASS(obj: Pointer): PGaClientClass;
begin
  Result := PGaClientClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

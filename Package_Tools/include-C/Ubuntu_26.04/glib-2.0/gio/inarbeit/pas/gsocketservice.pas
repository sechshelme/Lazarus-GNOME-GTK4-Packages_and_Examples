unit gsocketservice;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gsocketlistener, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGSocketServicePrivate = type Pointer;

  PGSocketService = ^TGSocketService;
  TGSocketService = record
    parent_instance: TGSocketListener;
    priv: PGSocketServicePrivate;
  end;

  PGSocketServiceClass = ^TGSocketServiceClass;
  TGSocketServiceClass = record
    parent_class: TGSocketListenerClass;
    incoming: function(service: PGSocketService; connection: PGSocketConnection; source_object: PGObject): Tgboolean; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_socket_service_get_type: TGType; cdecl; external libgio2;
function g_socket_service_new: PGSocketService; cdecl; external libgio2;
procedure g_socket_service_start(service: PGSocketService); cdecl; external libgio2;
procedure g_socket_service_stop(service: PGSocketService); cdecl; external libgio2;
function g_socket_service_is_active(service: PGSocketService): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:00:27 ===

function G_TYPE_SOCKET_SERVICE: TGType;
function G_SOCKET_SERVICE(obj: Pointer): PGSocketService;
function G_SOCKET_SERVICE_CLASS(klass: Pointer): PGSocketServiceClass;
function G_IS_SOCKET_SERVICE(obj: Pointer): Tgboolean;
function G_IS_SOCKET_SERVICE_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_SERVICE_GET_CLASS(obj: Pointer): PGSocketServiceClass;
{$ENDIF read_function}

implementation

function G_TYPE_SOCKET_SERVICE: TGType;
begin
  G_TYPE_SOCKET_SERVICE := g_socket_service_get_type;
end;

function G_SOCKET_SERVICE(obj: Pointer): PGSocketService;
begin
  Result := PGSocketService(g_type_check_instance_cast(obj, G_TYPE_SOCKET_SERVICE));
end;

function G_SOCKET_SERVICE_CLASS(klass: Pointer): PGSocketServiceClass;
begin
  Result := PGSocketServiceClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_SERVICE));
end;

function G_IS_SOCKET_SERVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_SERVICE);
end;

function G_IS_SOCKET_SERVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_SERVICE);
end;

function G_SOCKET_SERVICE_GET_CLASS(obj: Pointer): PGSocketServiceClass;
begin
  Result := PGSocketServiceClass(PGTypeInstance(obj)^.g_class);
end;



end.

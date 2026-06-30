unit gdbusauthobserver;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, giostream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function g_dbus_auth_observer_get_type: TGType; cdecl; external libgio2;
function g_dbus_auth_observer_new: PGDBusAuthObserver; cdecl; external libgio2;
function g_dbus_auth_observer_authorize_authenticated_peer(observer: PGDBusAuthObserver; stream: PGIOStream; credentials: PGCredentials): Tgboolean; cdecl; external libgio2;
function g_dbus_auth_observer_allow_mechanism(observer: PGDBusAuthObserver; mechanism: Pgchar): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:43:33 ===

function G_TYPE_DBUS_AUTH_OBSERVER: TGType;
function G_DBUS_AUTH_OBSERVER(obj: Pointer): PGDBusAuthObserver;
function G_IS_DBUS_AUTH_OBSERVER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function G_TYPE_DBUS_AUTH_OBSERVER: TGType;
begin
  G_TYPE_DBUS_AUTH_OBSERVER := g_dbus_auth_observer_get_type;
end;

function G_DBUS_AUTH_OBSERVER(obj: Pointer): PGDBusAuthObserver;
begin
  Result := PGDBusAuthObserver(g_type_check_instance_cast(obj, G_TYPE_DBUS_AUTH_OBSERVER));
end;

function G_IS_DBUS_AUTH_OBSERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_AUTH_OBSERVER);
end;



end.

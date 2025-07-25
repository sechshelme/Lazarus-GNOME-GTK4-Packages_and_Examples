unit ibusshare;

interface

uses
  fp_glib2, ibus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  IBUS_SERVICE_IBUS = 'org.freedesktop.IBus';
  IBUS_SERVICE_PORTAL = 'org.freedesktop.portal.IBus';
  IBUS_SERVICE_PANEL = 'org.freedesktop.IBus.Panel';
  IBUS_SERVICE_PANEL_EXTENSION = 'org.freedesktop.IBus.Panel.Extension';
  IBUS_SERVICE_PANEL_EXTENSION_EMOJI = 'org.freedesktop.IBus.Panel.Extension.Emoji';
  IBUS_SERVICE_CONFIG = 'org.freedesktop.IBus.Config';
  IBUS_SERVICE_NOTIFICATIONS = 'org.freedesktop.IBus.Notifications';
  IBUS_PATH_IBUS = '/org/freedesktop/IBus';
  IBUS_PATH_FACTORY = '/org/freedesktop/IBus/Factory';
  IBUS_PATH_PANEL = '/org/freedesktop/IBus/Panel';
  IBUS_PATH_PANEL_EXTENSION_EMOJI = '/org/freedesktop/IBus/Panel/Extension/Emoji';
  IBUS_PATH_CONFIG = '/org/freedesktop/IBus/Config';
  IBUS_PATH_NOTIFICATIONS = '/org/freedesktop/IBus/Notifications';
  IBUS_PATH_INPUT_CONTEXT = '/org/freedesktop/IBus/InputContext_%d';
  IBUS_INTERFACE_IBUS = 'org.freedesktop.IBus';
  IBUS_INTERFACE_PORTAL = 'org.freedesktop.IBus.Portal';
  IBUS_INTERFACE_INPUT_CONTEXT = 'org.freedesktop.IBus.InputContext';
  IBUS_INTERFACE_FACTORY = 'org.freedesktop.IBus.Factory';
  IBUS_INTERFACE_ENGINE = 'org.freedesktop.IBus.Engine';
  IBUS_INTERFACE_PANEL = 'org.freedesktop.IBus.Panel';
  IBUS_INTERFACE_CONFIG = 'org.freedesktop.IBus.Config';
  IBUS_INTERFACE_NOTIFICATIONS = 'org.freedesktop.IBus.Notifications';

function ibus_get_local_machine_id: Pgchar; cdecl; external libibus;
procedure ibus_set_display(display: Pgchar); cdecl; external libibus;
function ibus_get_address: Pgchar; cdecl; external libibus;
procedure ibus_write_address(address: Pgchar); cdecl; external libibus;
function ibus_get_user_name: Pgchar; cdecl; external libibus;
function ibus_get_daemon_uid: Tglong; cdecl; external libibus; deprecated;
function ibus_get_socket_path: Pgchar; cdecl; external libibus;
function ibus_get_timeout: Tgint; cdecl; external libibus;
procedure ibus_free_strv(strv: PPgchar); cdecl; external libibus; deprecated;
function ibus_key_event_to_string(keyval: Tguint; modifiers: Tguint): Pgchar; cdecl; external libibus;
function ibus_key_event_from_string(_string: Pgchar; keyval: Pguint; modifiers: Pguint): Tgboolean; cdecl; external libibus;
procedure ibus_init; cdecl; external libibus;
procedure ibus_main; cdecl; external libibus;
procedure ibus_quit; cdecl; external libibus;
procedure ibus_set_log_handler(verbose: Tgboolean); cdecl; external libibus;
procedure ibus_unset_log_handler; cdecl; external libibus;

// === Konventiert am: 25-7-25 14:31:47 ===


implementation



end.

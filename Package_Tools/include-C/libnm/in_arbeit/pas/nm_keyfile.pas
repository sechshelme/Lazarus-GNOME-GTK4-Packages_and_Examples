unit nm_keyfile;

interface

uses
  fp_glib2, fp_nm, nm_core_types, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PNMKeyfileHandlerFlags = ^TNMKeyfileHandlerFlags;
  TNMKeyfileHandlerFlags = longint;

const
  NM_KEYFILE_HANDLER_FLAGS_NONE = 0;

type
  PNMKeyfileHandlerType = ^TNMKeyfileHandlerType;
  TNMKeyfileHandlerType = longint;

const
  NM_KEYFILE_HANDLER_TYPE_WARN = 1;
  NM_KEYFILE_HANDLER_TYPE_WRITE_CERT = 2;

type
  PNMKeyfileHandlerData = type Pointer;

  TNMKeyfileReadHandler = function(keyfile: PGKeyFile; connection: PNMConnection; handler_type: TNMKeyfileHandlerType; handler_data: PNMKeyfileHandlerData; user_data: pointer): Tgboolean; cdecl;

function nm_keyfile_read(keyfile: PGKeyFile; base_dir: pchar; handler_flags: TNMKeyfileHandlerFlags; handler: TNMKeyfileReadHandler; user_data: pointer;
  error: PPGError): PNMConnection; cdecl; external libnm;

type
  TNMKeyfileWriteHandler = function(connection: PNMConnection; keyfile: PGKeyFile; handler_type: TNMKeyfileHandlerType; handler_data: PNMKeyfileHandlerData; user_data: pointer): Tgboolean; cdecl;

function nm_keyfile_write(connection: PNMConnection; handler_flags: TNMKeyfileHandlerFlags; handler: TNMKeyfileWriteHandler; user_data: pointer; error: PPGError): PGKeyFile; cdecl; external libnm;

procedure nm_keyfile_handler_data_fail_with_error(handler_data: PNMKeyfileHandlerData; src: PGError); cdecl; external libnm;
procedure nm_keyfile_handler_data_get_context(handler_data: PNMKeyfileHandlerData; out_kf_group_name: PPchar; out_kf_key_name: PPchar; out_cur_setting: PPNMSetting; out_cur_property_name: PPchar); cdecl; external libnm;

type
  PNMKeyfileWarnSeverity = ^TNMKeyfileWarnSeverity;
  TNMKeyfileWarnSeverity = longint;

const
  NM_KEYFILE_WARN_SEVERITY_DEBUG = 1000;
  NM_KEYFILE_WARN_SEVERITY_INFO = 2000;
  NM_KEYFILE_WARN_SEVERITY_INFO_MISSING_FILE = 2901;
  NM_KEYFILE_WARN_SEVERITY_WARN = 3000;

procedure nm_keyfile_handler_data_warn_get(handler_data: PNMKeyfileHandlerData; out_message: PPchar; out_severity: PNMKeyfileWarnSeverity); cdecl; external libnm;

// === Konventiert am: 5-8-26 17:33:52 ===


implementation



end.

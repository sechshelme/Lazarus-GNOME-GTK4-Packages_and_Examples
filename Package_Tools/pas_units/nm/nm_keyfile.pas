unit nm_keyfile;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMKeyfileHandlerData = type Pointer;

  TNMKeyfileReadHandler = function(keyfile: PGKeyFile; connection: PNMConnection; handler_type: TNMKeyfileHandlerType; handler_data: PNMKeyfileHandlerData; user_data: pointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_keyfile_read(keyfile: PGKeyFile; base_dir: pchar; handler_flags: TNMKeyfileHandlerFlags; handler: TNMKeyfileReadHandler; user_data: pointer;
  error: PPGError): PNMConnection; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TNMKeyfileWriteHandler = function(connection: PNMConnection; keyfile: PGKeyFile; handler_type: TNMKeyfileHandlerType; handler_data: PNMKeyfileHandlerData; user_data: pointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_keyfile_write(connection: PNMConnection; handler_flags: TNMKeyfileHandlerFlags; handler: TNMKeyfileWriteHandler; user_data: pointer; error: PPGError): PGKeyFile; cdecl; external libnm;

procedure nm_keyfile_handler_data_fail_with_error(handler_data: PNMKeyfileHandlerData; src: PGError); cdecl; external libnm;
procedure nm_keyfile_handler_data_get_context(handler_data: PNMKeyfileHandlerData; out_kf_group_name: PPchar; out_kf_key_name: PPchar; out_cur_setting: PPNMSetting; out_cur_property_name: PPchar); cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMKeyfileWarnSeverity = ^TNMKeyfileWarnSeverity;
  TNMKeyfileWarnSeverity = longint;

const
  NM_KEYFILE_WARN_SEVERITY_DEBUG = 1000;
  NM_KEYFILE_WARN_SEVERITY_INFO = 2000;
  NM_KEYFILE_WARN_SEVERITY_INFO_MISSING_FILE = 2901;
  NM_KEYFILE_WARN_SEVERITY_WARN = 3000;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure nm_keyfile_handler_data_warn_get(handler_data: PNMKeyfileHandlerData; out_message: PPchar; out_severity: PNMKeyfileWarnSeverity); cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:28:44 ===


implementation



end.

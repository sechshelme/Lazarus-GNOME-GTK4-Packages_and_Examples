unit gphoto2_port_log;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGPLogLevel = ^TGPLogLevel;
  TGPLogLevel = longint;

const
  GP_LOG_ERROR = 0;
  GP_LOG_VERBOSE = 1;
  GP_LOG_DEBUG = 2;
  GP_LOG_DATA_ = 3;
  GP_LOG_ALL = GP_LOG_DATA_;

type
  TGPLogFunc = procedure(level: TGPLogLevel; domain: pchar; str: pchar; data: pointer); cdecl;

type
  TStringFlagItem = record
    str: pchar;
    flag: dword;
  end;
  PStringFlagItem = ^TStringFlagItem;

  Tstring_item_func = procedure(str: pchar; data: pointer); cdecl;

// === Konventiert am: 17-11-25 15:47:06 ===


implementation



end.

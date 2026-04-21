unit fwupd_error;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function FWUPD_ERROR: TGQuark;

type
  PFwupdError = ^TFwupdError;
  TFwupdError = longint;

const
  FWUPD_ERROR_INTERNAL = 0;
  FWUPD_ERROR_VERSION_NEWER = 1;
  FWUPD_ERROR_VERSION_SAME = 2;
  FWUPD_ERROR_ALREADY_PENDING = 3;
  FWUPD_ERROR_AUTH_FAILED = 4;
  FWUPD_ERROR_READ = 5;
  FWUPD_ERROR_WRITE = 6;
  FWUPD_ERROR_INVALID_FILE = 7;
  FWUPD_ERROR_NOT_FOUND = 8;
  FWUPD_ERROR_NOTHING_TO_DO = 9;
  FWUPD_ERROR_NOT_SUPPORTED = 10;
  FWUPD_ERROR_SIGNATURE_INVALID = 11;
  FWUPD_ERROR_AC_POWER_REQUIRED = 12;
  FWUPD_ERROR_PERMISSION_DENIED = 13;
  FWUPD_ERROR_BROKEN_SYSTEM = 14;
  FWUPD_ERROR_BATTERY_LEVEL_TOO_LOW = 15;
  FWUPD_ERROR_NEEDS_USER_ACTION = 16;
  FWUPD_ERROR_AUTH_EXPIRED = 17;
  FWUPD_ERROR_INVALID_DATA = 18;
  FWUPD_ERROR_LAST = 19;

function fwupd_error_quark: TGQuark; cdecl; external libfwupd;
function fwupd_error_to_string(error: TFwupdError): Pgchar; cdecl; external libfwupd;
function fwupd_error_from_string(error: Pgchar): TFwupdError; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:35:42 ===


implementation


function FWUPD_ERROR: TGQuark;
begin
  FWUPD_ERROR := fwupd_error_quark;
end;


end.

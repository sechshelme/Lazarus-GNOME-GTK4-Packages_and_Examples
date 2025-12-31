unit raqm_version;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  RAQM_VERSION_MAJOR = 0;
  RAQM_VERSION_MINOR = 10;
  RAQM_VERSION_MICRO = 1;
  RAQM_VERSION_STRING = '0.10.1';

function RAQM_VERSION_ATLEAST(major, minor, micro: longint): Boolean;


// === Konventiert am: 29-12-25 19:51:35 ===


implementation


function RAQM_VERSION_ATLEAST(major, minor, micro: longint): Boolean;
begin
  RAQM_VERSION_ATLEAST := (((major * 10000) + (minor * 100)) + micro) <= (((RAQM_VERSION_MAJOR * 10000) + (RAQM_VERSION_MINOR * 100)) + RAQM_VERSION_MICRO);
end;


end.

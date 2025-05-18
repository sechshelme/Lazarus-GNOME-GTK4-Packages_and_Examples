unit eina_fnmatch;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEina_Fnmatch_Flags = ^TEina_Fnmatch_Flags;
  TEina_Fnmatch_Flags = longint;

const
  EINA_FNMATCH_PATHNAME = 1 shl 0;
  EINA_FNMATCH_NOESCAPE = 1 shl 1;
  EINA_FNMATCH_PERIOD = 1 shl 2;
  EINA_FNMATCH_LEADING_DIR = 1 shl 3;
  EINA_FNMATCH_CASEFOLD = 1 shl 4;
  EINA_FNMATCH_FILE_NAME = EINA_FNMATCH_PATHNAME;


function eina_fnmatch(glob: pchar; _string: pchar; flags: TEina_Fnmatch_Flags): TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:31:56 ===


implementation



end.

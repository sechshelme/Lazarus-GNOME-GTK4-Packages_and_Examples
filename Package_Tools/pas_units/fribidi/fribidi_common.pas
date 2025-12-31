unit fribidi_common;

interface

uses
  fp_fribidi;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  FRIBIDI = 'fribidi';  
  FRIBIDI_NAME = 'fribidi';  
  FRIBIDI_VERSION = 'unknown';  
  FRIBIDI_BUGREPORT = 'unknown';  
  FRIBIDI_INTERFACE_VERSION_STRING = 'unknown';  

function fribidi_debug_status:longint;cdecl;external libfribidi;
function fribidi_set_debug(state:longint):longint;cdecl;external libfribidi;

// === Konventiert am: 31-12-25 16:08:54 ===


implementation



end.

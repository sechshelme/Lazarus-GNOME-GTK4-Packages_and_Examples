unit eina_safepointer;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEina_Safepointer = record
  end;
  PEina_Safepointer = ^TEina_Safepointer;

function eina_safepointer_register(target: pointer): PEina_Safepointer; cdecl; external libeina;
procedure eina_safepointer_unregister(safe: PEina_Safepointer); cdecl; external libeina;

// === Konventiert am: 17-5-25 16:24:07 ===


implementation



end.

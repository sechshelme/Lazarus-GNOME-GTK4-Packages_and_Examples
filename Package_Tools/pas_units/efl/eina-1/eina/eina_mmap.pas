unit eina_mmap;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function eina_mmap_safety_enabled_set(enabled: TEina_Bool): TEina_Bool; cdecl; external libeina;
function eina_mmap_safety_enabled_get: TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:23:56 ===


implementation



end.

unit efl_file;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efl_file_simple_load(obj: PEo; file_: pchar; key: pchar): TEina_Bool; cdecl; external libefl;
function efl_file_simple_mmap_load(obj: PEo; file_: PEina_File; key: pchar): TEina_Bool; cdecl; external libefl;
procedure efl_file_simple_get(obj: PEo; file_: PPchar; key: PPchar); cdecl; external libefl;
procedure efl_file_simple_mmap_get(obj: PEo; file_: PPEina_File; key: PPchar); cdecl; external libefl;

// === Konventiert am: 20-5-25 14:59:54 ===


implementation



end.

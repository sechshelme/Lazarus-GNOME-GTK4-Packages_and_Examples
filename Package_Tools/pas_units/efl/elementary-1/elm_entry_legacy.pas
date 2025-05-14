unit elm_entry_legacy;

interface

uses
  ctypes, efl, Evas_Common, elm_general;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function elm_entry_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_entry_entry_set(obj: PEvas_Object; entry: pchar); cdecl; external libelementary;
function elm_entry_entry_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_entry_file_set(obj: PEvas_Object; file_: pchar; format: TElm_Text_Format): TEina_Bool; cdecl; external libelementary;
procedure elm_entry_file_get(obj: PEvas_Object; file_: PPchar; format: PElm_Text_Format); cdecl; external libelementary;
procedure elm_entry_calc_force(obj: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 13-5-25 13:58:04 ===


implementation



end.

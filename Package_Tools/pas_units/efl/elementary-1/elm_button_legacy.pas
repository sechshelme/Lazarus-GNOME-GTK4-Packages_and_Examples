unit elm_button_legacy;

interface

uses
  ctypes, efl, fp_eina,fp_eo, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Button = ^TElm_Button;
  TElm_Button = TEo;

function elm_button_add(parent: PEvas_Object): PEvas_Object; cdecl; external libevas;
procedure elm_button_autorepeat_initial_timeout_set(obj: PEvas_Object; t: double); cdecl; external libevas;
function elm_button_autorepeat_initial_timeout_get(obj: PEvas_Object): double; cdecl; external libevas;
procedure elm_button_autorepeat_gap_timeout_set(obj: PEvas_Object; t: double); cdecl; external libevas;
function elm_button_autorepeat_gap_timeout_get(obj: PEvas_Object): double; cdecl; external libevas;
procedure elm_button_autorepeat_set(obj: PEvas_Object; on: TEina_Bool); cdecl; external libevas;
function elm_button_autorepeat_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 11-5-25 16:03:06 ===


implementation



end.

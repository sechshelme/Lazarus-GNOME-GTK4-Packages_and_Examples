unit elm_spinner_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_spinner_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_spinner_special_value_del(obj: PEvas_Object; value: double); cdecl; external libelementary;
function elm_spinner_special_value_get(obj: PEvas_Object; value: double): pchar; cdecl; external libelementary;
procedure elm_spinner_min_max_set(obj: PEvas_Object; min: double; max: double); cdecl; external libelementary;
procedure elm_spinner_min_max_get(obj: PEvas_Object; min: Pdouble; max: Pdouble); cdecl; external libelementary;
procedure elm_spinner_step_set(obj: PEvas_Object; step: double); cdecl; external libelementary;
function elm_spinner_step_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_spinner_value_set(obj: PEvas_Object; val: double); cdecl; external libelementary;
function elm_spinner_value_get(obj: PEvas_Object): double; cdecl; external libelementary;

// === Konventiert am: 29-5-25 19:47:18 ===


implementation



end.

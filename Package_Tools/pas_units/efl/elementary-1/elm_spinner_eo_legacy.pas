unit elm_spinner_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Spinner = ^TElm_Spinner;
  TElm_Spinner = TEo;

procedure elm_spinner_wrap_set(obj: PElm_Spinner; wrap: TEina_Bool); cdecl; external libelementary;
function elm_spinner_wrap_get(obj: PElm_Spinner): TEina_Bool; cdecl; external libelementary;
procedure elm_spinner_interval_set(obj: PElm_Spinner; interval: double); cdecl; external libelementary;
function elm_spinner_interval_get(obj: PElm_Spinner): double; cdecl; external libelementary;
procedure elm_spinner_round_set(obj: PElm_Spinner; rnd: longint); cdecl; external libelementary;
function elm_spinner_round_get(obj: PElm_Spinner): longint; cdecl; external libelementary;
procedure elm_spinner_editable_set(obj: PElm_Spinner; editable: TEina_Bool); cdecl; external libelementary;
function elm_spinner_editable_get(obj: PElm_Spinner): TEina_Bool; cdecl; external libelementary;
procedure elm_spinner_base_set(obj: PElm_Spinner; base: double); cdecl; external libelementary;
function elm_spinner_base_get(obj: PElm_Spinner): double; cdecl; external libelementary;
procedure elm_spinner_label_format_set(obj: PElm_Spinner; fmt: pchar); cdecl; external libelementary;
function elm_spinner_label_format_get(obj: PElm_Spinner): pchar; cdecl; external libelementary;
procedure elm_spinner_special_value_add(obj: PElm_Spinner; value: double; _label: pchar); cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:57:21 ===


implementation



end.

unit efl_ui_radio_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Radio = ^TEfl_Ui_Radio;
  TEfl_Ui_Radio = TEo;

procedure elm_radio_state_value_set(obj: PEfl_Ui_Radio; value: longint); cdecl; external libelementary;
function elm_radio_state_value_get(obj: PEfl_Ui_Radio): longint; cdecl; external libelementary;
procedure elm_radio_value_pointer_set(obj: PEfl_Ui_Radio; valuep: Plongint); cdecl; external libelementary;
function elm_radio_selected_object_get(obj: PEfl_Ui_Radio): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_radio_group_add(obj: PEfl_Ui_Radio; group: PEfl_Ui_Radio); cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:52:11 ===


implementation



end.

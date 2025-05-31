unit efl_ui_table_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Table = ^TEfl_Ui_Table;
  TEfl_Ui_Table = TEo;

function EFL_UI_TABLE_CLASS: PEfl_Class;

function efl_ui_table_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_table_homogeneous_set(obj: PEo; homogeneoush: TEina_Bool; homogeneousv: TEina_Bool); cdecl; external libelementary;
procedure efl_ui_table_homogeneous_get(obj: PEo; homogeneoush: PEina_Bool; homogeneousv: PEina_Bool); cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:38:00 ===


implementation


function EFL_UI_TABLE_CLASS: PEfl_Class;
begin
  EFL_UI_TABLE_CLASS := efl_ui_table_class_get;
end;


end.

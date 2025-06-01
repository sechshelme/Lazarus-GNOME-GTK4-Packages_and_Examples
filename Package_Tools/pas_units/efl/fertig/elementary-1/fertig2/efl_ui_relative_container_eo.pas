unit efl_ui_relative_container_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Relative_Container = ^TEfl_Ui_Relative_Container;
  TEfl_Ui_Relative_Container = TEo;

function EFL_UI_RELATIVE_CONTAINER_CLASS: PEfl_Class;

function efl_ui_relative_container_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_relative_container_relation_left_set(obj: PEo; child: PEfl_Gfx_Entity; base: PEfl_Gfx_Entity; relative_position: TEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_left_get(obj: PEo; child: PEfl_Gfx_Entity; base: PPEfl_Gfx_Entity; relative_position: PEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_right_set(obj: PEo; child: PEfl_Gfx_Entity; base: PEfl_Gfx_Entity; relative_position: TEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_right_get(obj: PEo; child: PEfl_Gfx_Entity; base: PPEfl_Gfx_Entity; relative_position: PEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_top_set(obj: PEo; child: PEfl_Gfx_Entity; base: PEfl_Gfx_Entity; relative_position: TEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_top_get(obj: PEo; child: PEfl_Gfx_Entity; base: PPEfl_Gfx_Entity; relative_position: PEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_bottom_set(obj: PEo; child: PEfl_Gfx_Entity; base: PEfl_Gfx_Entity; relative_position: TEfl_Gfx_Align); cdecl; external libelementary;
procedure efl_ui_relative_container_relation_bottom_get(obj: PEo; child: PEfl_Gfx_Entity; base: PPEfl_Gfx_Entity; relative_position: PEfl_Gfx_Align); cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:56:57 ===


implementation


function EFL_UI_RELATIVE_CONTAINER_CLASS: PEfl_Class;
begin
  EFL_UI_RELATIVE_CONTAINER_CLASS := efl_ui_relative_container_class_get;
end;


end.

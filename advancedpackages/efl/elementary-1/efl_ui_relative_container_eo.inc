{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_RELATIVE_CONTAINER_CLASS: PEfl_Class;
begin
  EFL_UI_RELATIVE_CONTAINER_CLASS := efl_ui_relative_container_class_get;
end;


{$ENDIF read_implementation}

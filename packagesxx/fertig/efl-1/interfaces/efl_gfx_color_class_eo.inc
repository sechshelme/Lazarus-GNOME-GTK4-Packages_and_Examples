{$IFDEF read_interface}


type
  PEfl_Gfx_Color_Class = ^TEfl_Gfx_Color_Class;
  TEfl_Gfx_Color_Class = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_COLOR_CLASS_MIXIN: PEfl_Class;

function efl_gfx_color_class_mixin_get: PEfl_Class; cdecl; external libefl;
function efl_gfx_color_class_set(obj: PEo; color_class: pchar; layer: TEfl_Gfx_Color_Class_Layer; r: longint; g: longint; b: longint; a: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_color_class_get(obj: PEo; color_class: pchar; layer: TEfl_Gfx_Color_Class_Layer; r: Plongint; g: Plongint; b: Plongint; a: Plongint): TEina_Bool; cdecl; external libefl;
function efl_gfx_color_class_code_set(obj: PEo; color_class: pchar; layer: TEfl_Gfx_Color_Class_Layer; colorcode: pchar): TEina_Bool; cdecl; external libefl;
function efl_gfx_color_class_code_get(obj: PEo; color_class: pchar; layer: TEfl_Gfx_Color_Class_Layer): pchar; cdecl; external libefl;
function efl_gfx_color_class_description_get(obj: PEo; color_class: pchar): pchar; cdecl; external libefl;
procedure efl_gfx_color_class_del(obj: PEo; color_class: pchar); cdecl; external libefl;
procedure efl_gfx_color_class_clear(obj: PEo); cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 19:23:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_COLOR_CLASS_MIXIN: PEfl_Class;
begin
  EFL_GFX_COLOR_CLASS_MIXIN := efl_gfx_color_class_mixin_get;
end;


{$ENDIF read_implementation}

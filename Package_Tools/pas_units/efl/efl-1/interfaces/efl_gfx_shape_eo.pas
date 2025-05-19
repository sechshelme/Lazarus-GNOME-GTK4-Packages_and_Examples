unit efl_gfx_shape_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Shape = ^TEfl_Gfx_Shape;
  TEfl_Gfx_Shape = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_SHAPE_MIXIN: PEfl_Class;

function efl_gfx_shape_mixin_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_shape_stroke_scale_set(obj: PEo; s: double); cdecl; external libefl;
function efl_gfx_shape_stroke_scale_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_shape_stroke_color_set(obj: PEo; r: longint; g: longint; b: longint; a: longint); cdecl; external libefl;
procedure efl_gfx_shape_stroke_color_get(obj: PEo; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libefl;
procedure efl_gfx_shape_stroke_width_set(obj: PEo; w: double); cdecl; external libefl;
function efl_gfx_shape_stroke_width_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_shape_stroke_location_set(obj: PEo; centered: double); cdecl; external libefl;
function efl_gfx_shape_stroke_location_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_shape_stroke_dash_set(obj: PEo; dash: PEfl_Gfx_Dash; length: dword); cdecl; external libefl;
procedure efl_gfx_shape_stroke_dash_get(obj: PEo; dash: PPEfl_Gfx_Dash; length: Pdword); cdecl; external libefl;
procedure efl_gfx_shape_stroke_cap_set(obj: PEo; c: TEfl_Gfx_Cap); cdecl; external libefl;
function efl_gfx_shape_stroke_cap_get(obj: PEo): TEfl_Gfx_Cap; cdecl; external libefl;
procedure efl_gfx_shape_stroke_join_set(obj: PEo; j: TEfl_Gfx_Join); cdecl; external libefl;
function efl_gfx_shape_stroke_join_get(obj: PEo): TEfl_Gfx_Join; cdecl; external libefl;
procedure efl_gfx_shape_stroke_miterlimit_set(obj: PEo; miterlimit: double); cdecl; external libefl;
function efl_gfx_shape_stroke_miterlimit_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_shape_fill_rule_set(obj: PEo; fill_rule: TEfl_Gfx_Fill_Rule); cdecl; external libefl;
function efl_gfx_shape_fill_rule_get(obj: PEo): TEfl_Gfx_Fill_Rule; cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 19:23:23 ===


implementation


function EFL_GFX_SHAPE_MIXIN: PEfl_Class;
begin
  EFL_GFX_SHAPE_MIXIN := efl_gfx_shape_mixin_get;
end;


end.

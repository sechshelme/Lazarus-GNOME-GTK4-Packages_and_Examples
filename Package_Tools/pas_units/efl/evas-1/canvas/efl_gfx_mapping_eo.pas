unit efl_gfx_mapping_eo;

interface

uses
  ctypes, efl, fp_eina,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Gfx_Mapping = ^TEfl_Gfx_Mapping;
  TEfl_Gfx_Mapping = TEo;

function efl_gfx_mapping_mixin_get: PEfl_Class; cdecl; external libevas;
function efl_gfx_mapping_has(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_gfx_mapping_reset(obj: PEo); cdecl; external libevas;
procedure efl_gfx_mapping_point_count_set(obj: PEo; count: longint); cdecl; external libevas;
function efl_gfx_mapping_point_count_get(obj: PEo): longint; cdecl; external libevas;
function efl_gfx_mapping_clockwise_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_gfx_mapping_smooth_set(obj: PEo; smooth: TEina_Bool); cdecl; external libevas;
function efl_gfx_mapping_smooth_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_gfx_mapping_alpha_set(obj: PEo; alpha: TEina_Bool); cdecl; external libevas;
function efl_gfx_mapping_alpha_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_gfx_mapping_coord_absolute_set(obj: PEo; idx: longint; x: double; y: double; z: double); cdecl; external libevas;
procedure efl_gfx_mapping_coord_absolute_get(obj: PEo; idx: longint; x: Pdouble; y: Pdouble; z: Pdouble); cdecl; external libevas;
procedure efl_gfx_mapping_uv_set(obj: PEo; idx: longint; u: double; v: double); cdecl; external libevas;
procedure efl_gfx_mapping_uv_get(obj: PEo; idx: longint; u: Pdouble; v: Pdouble); cdecl; external libevas;
procedure efl_gfx_mapping_color_set(obj: PEo; idx: longint; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure efl_gfx_mapping_color_get(obj: PEo; idx: longint; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure efl_gfx_mapping_translate(obj: PEo; dx: double; dy: double; dz: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate(obj: PEo; degrees: double; pivot: PEfl_Gfx_Entity; cx: double; cy: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate_3d(obj: PEo; dx: double; dy: double; dz: double; pivot: PEfl_Gfx_Entity; cx: double; cy: double; cz: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate_quat(obj: PEo; qx: double; qy: double; qz: double; qw: double; pivot: PEfl_Gfx_Entity; cx: double; cy: double; cz: double); cdecl; external libevas;
procedure efl_gfx_mapping_zoom(obj: PEo; zoomx: double; zoomy: double; pivot: PEfl_Gfx_Entity; cx: double; cy: double); cdecl; external libevas;
procedure efl_gfx_mapping_lighting_3d(obj: PEo; pivot: PEfl_Gfx_Entity; lx: double; ly: double; lz: double; lr: longint; lg: longint; lb: longint; ar: longint; ag: longint; ab: longint); cdecl; external libevas;
procedure efl_gfx_mapping_perspective_3d(obj: PEo; pivot: PEfl_Gfx_Entity; px: double; py: double; z0: double; foc: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate_absolute(obj: PEo; degrees: double; cx: double; cy: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate_3d_absolute(obj: PEo; dx: double; dy: double; dz: double; cx: double; cy: double; cz: double); cdecl; external libevas;
procedure efl_gfx_mapping_rotate_quat_absolute(obj: PEo; qx: double; qy: double; qz: double; qw: double; cx: double; cy: double; cz: double); cdecl; external libevas;
procedure efl_gfx_mapping_zoom_absolute(obj: PEo; zoomx: double; zoomy: double; cx: double; cy: double); cdecl; external libevas;
procedure efl_gfx_mapping_lighting_3d_absolute(obj: PEo; lx: double; ly: double; lz: double; lr: longint; lg: longint; lb: longint; ar: longint; ag: longint; ab: longint); cdecl; external libevas;
procedure efl_gfx_mapping_perspective_3d_absolute(obj: PEo; px: double; py: double; z0: double; foc: double); cdecl; external libevas;

function EFL_GFX_MAPPING_MIXIN: PEfl_Class;

// === Konventiert am: 12-5-25 19:37:43 ===


implementation


function EFL_GFX_MAPPING_MIXIN: PEfl_Class;
begin
  EFL_GFX_MAPPING_MIXIN := efl_gfx_mapping_mixin_get;
end;


end.

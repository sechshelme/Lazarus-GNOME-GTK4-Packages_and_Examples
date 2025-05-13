unit efl_gfx_vg_value_provider_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Gfx_Vg_Value_Provider = ^TEfl_Gfx_Vg_Value_Provider;
  TEfl_Gfx_Vg_Value_Provider = TEo;
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Vg_Value_Provider_Flags = ^TEfl_Gfx_Vg_Value_Provider_Flags;
  TEfl_Gfx_Vg_Value_Provider_Flags = longint;

const
  EFL_GFX_VG_VALUE_PROVIDER_FLAGS_NONE = 0;
  EFL_GFX_VG_VALUE_PROVIDER_FLAGS_FILL_COLOR = 1;
  EFL_GFX_VG_VALUE_PROVIDER_FLAGS_STROKE_COLOR = 2;
  EFL_GFX_VG_VALUE_PROVIDER_FLAGS_STROKE_WIDTH = 4;
  EFL_GFX_VG_VALUE_PROVIDER_FLAGS_TRANSFORM_MATRIX = 8;
  {$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_VG_VALUE_PROVIDER_CLASS: PEfl_Class;

function efl_gfx_vg_value_provider_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_gfx_vg_value_provider_keypath_set(obj: PEo; keypath: PEina_Stringshare); cdecl; external libevas;
function efl_gfx_vg_value_provider_keypath_get(obj: PEo): PEina_Stringshare; cdecl; external libevas;
procedure efl_gfx_vg_value_provider_transform_set(obj: PEo; m: PEina_Matrix4); cdecl; external libevas;
function efl_gfx_vg_value_provider_transform_get(obj: PEo): PEina_Matrix4; cdecl; external libevas;
procedure efl_gfx_vg_value_provider_fill_color_set(obj: PEo; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure efl_gfx_vg_value_provider_fill_color_get(obj: PEo; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure efl_gfx_vg_value_provider_stroke_color_set(obj: PEo; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure efl_gfx_vg_value_provider_stroke_color_get(obj: PEo; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure efl_gfx_vg_value_provider_stroke_width_set(obj: PEo; width: double); cdecl; external libevas;
function efl_gfx_vg_value_provider_stroke_width_get(obj: PEo): double; cdecl; external libevas;
function efl_gfx_vg_value_provider_updated_get(obj: PEo): TEfl_Gfx_Vg_Value_Provider_Flags; cdecl; external libevas;
{$endif}

// === Konventiert am: 13-5-25 19:18:16 ===


implementation


function EFL_GFX_VG_VALUE_PROVIDER_CLASS: PEfl_Class;
begin
  EFL_GFX_VG_VALUE_PROVIDER_CLASS := efl_gfx_vg_value_provider_class_get;
end;


end.

unit efl_gfx_path_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Path = ^TEfl_Gfx_Path;
  TEfl_Gfx_Path = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_PATH_MIXIN: PEfl_Class;

function efl_gfx_path_mixin_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_path_set(obj: PEo; op: PEfl_Gfx_Path_Command_Type; points: Pdouble); cdecl; external libefl;
procedure efl_gfx_path_get(obj: PEo; op: PPEfl_Gfx_Path_Command_Type; points: PPdouble); cdecl; external libefl;
procedure efl_gfx_path_length_get(obj: PEo; commands: Pdword; points: Pdword); cdecl; external libefl;
procedure efl_gfx_path_current_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_gfx_path_current_ctrl_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_gfx_path_copy_from(obj: PEo; dup_from: PEfl_Object); cdecl; external libefl;
procedure efl_gfx_path_bounds_get(obj: PEo; r: PEina_Rect); cdecl; external libefl;
procedure efl_gfx_path_reset(obj: PEo); cdecl; external libefl;
procedure efl_gfx_path_append_move_to(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_path_append_line_to(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_path_append_quadratic_to(obj: PEo; x: double; y: double; ctrl_x: double; ctrl_y: double); cdecl; external libefl;
procedure efl_gfx_path_append_squadratic_to(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_path_append_cubic_to(obj: PEo; ctrl_x0: double; ctrl_y0: double; ctrl_x1: double; ctrl_y1: double; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_path_append_scubic_to(obj: PEo; x: double; y: double; ctrl_x: double; ctrl_y: double); cdecl; external libefl;
procedure efl_gfx_path_append_arc_to(obj: PEo; x: double; y: double; rx: double; ry: double; angle: double; large_arc: TEina_Bool; sweep: TEina_Bool); cdecl; external libefl;
procedure efl_gfx_path_append_arc(obj: PEo; x: double; y: double; w: double; h: double; start_angle: double; sweep_length: double); cdecl; external libefl;
procedure efl_gfx_path_append_close(obj: PEo); cdecl; external libefl;
procedure efl_gfx_path_append_circle(obj: PEo; x: double; y: double; radius: double); cdecl; external libefl;
procedure efl_gfx_path_append_rect(obj: PEo; x: double; y: double; w: double; h: double; rx: double; ry: double); cdecl; external libefl;
procedure efl_gfx_path_append_svg_path(obj: PEo; svg_path_data: pchar); cdecl; external libefl;
function efl_gfx_path_interpolate(obj: PEo; from: PEfl_Object; to_: PEfl_Object; pos_map: double): TEina_Bool; cdecl; external libefl;
function efl_gfx_path_equal_commands(obj: PEo; with_: PEfl_Object): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_path_reserve(obj: PEo; cmd_count: dword; pts_count: dword); cdecl; external libefl;
procedure efl_gfx_path_commit(obj: PEo); cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 17:35:03 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_PATH_MIXIN: PEfl_Class;
begin
  EFL_GFX_PATH_MIXIN := efl_gfx_path_mixin_get;
end;
{$endif}


end.

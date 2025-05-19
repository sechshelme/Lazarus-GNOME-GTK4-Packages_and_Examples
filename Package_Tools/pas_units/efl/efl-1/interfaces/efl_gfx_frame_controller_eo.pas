unit efl_gfx_frame_controller_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Frame_Controller = ^TEfl_Gfx_Frame_Controller;
  TEfl_Gfx_Frame_Controller = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Frame_Controller_Loop_Hint = ^TEfl_Gfx_Frame_Controller_Loop_Hint;
  TEfl_Gfx_Frame_Controller_Loop_Hint = longint;

const
  EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_NONE = 0;
  EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_LOOP = 1;
  EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_PINGPONG = 2;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_FRAME_CONTROLLER_INTERFACE: PEfl_Class;

function efl_gfx_frame_controller_interface_get: PEfl_Class; cdecl; external libefl;
function efl_gfx_frame_controller_animated_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_gfx_frame_controller_frame_set(obj: PEo; frame_index: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_frame_controller_frame_get(obj: PEo): longint; cdecl; external libefl;
function efl_gfx_frame_controller_frame_count_get(obj: PEo): longint; cdecl; external libefl;
function efl_gfx_frame_controller_loop_type_get(obj: PEo): TEfl_Gfx_Frame_Controller_Loop_Hint; cdecl; external libefl;
function efl_gfx_frame_controller_loop_count_get(obj: PEo): longint; cdecl; external libefl;
function efl_gfx_frame_controller_frame_duration_get(obj: PEo; start_frame: longint; frame_num: longint): double; cdecl; external libefl;
function efl_gfx_frame_controller_sector_set(obj: PEo; name: pchar; startframe: longint; endframe: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_frame_controller_sector_get(obj: PEo; name: pchar; startframe: Plongint; endframe: Plongint): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 19:44:05 ===


implementation


function EFL_GFX_FRAME_CONTROLLER_INTERFACE: PEfl_Class;
begin
  EFL_GFX_FRAME_CONTROLLER_INTERFACE := efl_gfx_frame_controller_interface_get;
end;


end.

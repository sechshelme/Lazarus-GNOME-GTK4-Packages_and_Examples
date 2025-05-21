unit efl_core_command_line_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Core_Command_Line = ^TEfl_Core_Command_Line;
  TEfl_Core_Command_Line = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CORE_COMMAND_LINE_MIXIN: PEfl_Class;

function efl_core_command_line_mixin_get: PEfl_Class; cdecl; external libecore;
function efl_core_command_line_command_get(obj: PEo): pchar; cdecl; external libecore;
function efl_core_command_line_command_access(obj: PEo): PEina_Accessor; cdecl; external libecore;
function efl_core_command_line_command_array_set(obj: PEo; arr: PEina_Array): TEina_Bool; cdecl; external libecore;
function efl_core_command_line_command_string_set(obj: PEo; str: pchar): TEina_Bool; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 15:43:50 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CORE_COMMAND_LINE_MIXIN: PEfl_Class;
begin
  EFL_CORE_COMMAND_LINE_MIXIN := efl_core_command_line_mixin_get;
end;
{$endif}


end.

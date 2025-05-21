unit efl_io_stdin_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Io_Stdin = ^TEfl_Io_Stdin;
  TEfl_Io_Stdin = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_STDIN_CLASS: PEfl_Class;

function efl_io_stdin_class_get: PEfl_Class; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:19:16 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_STDIN_CLASS: PEfl_Class;
begin
  EFL_IO_STDIN_CLASS := efl_io_stdin_class_get;
end;
{$endif}


end.

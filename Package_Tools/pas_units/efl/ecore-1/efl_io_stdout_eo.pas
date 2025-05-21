unit efl_io_stdout_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Io_Stdout = ^TEfl_Io_Stdout;
  TEfl_Io_Stdout = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_STDOUT_CLASS: PEfl_Class;

function efl_io_stdout_class_get: PEfl_Class; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:19:19 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_STDOUT_CLASS: PEfl_Class;
begin
  EFL_IO_STDOUT_CLASS := efl_io_stdout_class_get;
end;
{$endif}


end.

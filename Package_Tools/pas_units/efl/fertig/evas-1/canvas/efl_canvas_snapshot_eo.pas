unit efl_canvas_snapshot_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Snapshot = ^TEfl_Canvas_Snapshot;
  TEfl_Canvas_Snapshot = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_SNAPSHOT_CLASS: PEfl_Class;

function efl_canvas_snapshot_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:27:34 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_SNAPSHOT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_SNAPSHOT_CLASS := efl_canvas_snapshot_class_get;
end;
{$endif}


end.

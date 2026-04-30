unit export_dif;

interface

uses
  fp_ode, common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure dWorldExportDIF(w: TdWorldID; file_: PFILE; world_name: pchar); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:51 ===


implementation



end.

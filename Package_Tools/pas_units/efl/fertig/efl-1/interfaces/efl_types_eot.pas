unit efl_types_eot;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
    flavor: pchar;
    build_id: pchar;
  end;
  PEfl_Version = ^TEfl_Version;

  // === Konventiert am: 20-5-25 15:00:15 ===


implementation



end.

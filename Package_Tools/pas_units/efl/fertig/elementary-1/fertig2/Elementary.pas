unit Elementary;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELM_VERSION_MAJOR = EFL_VERSION_MAJOR;
  ELM_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TElm_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PElm_Version = ^TElm_Version;

var
  elm_version: PElm_Version; cvar;external libelementary;

  // === Konventiert am: 28-5-25 19:48:38 ===


implementation



end.

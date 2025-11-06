unit ParU_definitions;

interface

uses
  fp_suitesparse;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PParU_Ret = ^TParU_Ret;
  TParU_Ret = longint;

const
  PARU_SUCCESS = 0;
  PARU_OUT_OF_MEMORY = -(1);
  PARU_INVALID = -(2);
  PARU_SINGULAR = -(3);
  PARU_TOO_LARGE = -(4);

const
  PARU_MEM_CHUNK = 1024 * 1024;
  PARU_DATE = 'Jan 20, 2024';
  PARU_VERSION_MAJOR = 0;
  PARU_VERSION_MINOR = 1;
  PARU_VERSION_UPDATE = 2;
  PARU_STRATEGY_AUTO = 0;
  PARU_STRATEGY_UNSYMMETRIC = 1;
  PARU_STRATEGY_SYMMETRIC = 3;

  // === Konventiert am: 4-11-25 19:29:19 ===


implementation



end.

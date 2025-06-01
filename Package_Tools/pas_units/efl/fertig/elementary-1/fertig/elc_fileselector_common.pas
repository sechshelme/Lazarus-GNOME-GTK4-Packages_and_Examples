unit elc_fileselector_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Fileselector_Filter_Func = function(path: pchar; dir: TEina_Bool; data: pointer): TEina_Bool; cdecl;

var
  ELM_FILESELECTOR_ERROR_UNKNOWN: TEina_Error; cvar;external libelementary;
  ELM_FILESELECTOR_ERROR_INVALID_MODEL: TEina_Error; cvar;external libelementary;

  // === Konventiert am: 27-5-25 17:07:16 ===


implementation



end.

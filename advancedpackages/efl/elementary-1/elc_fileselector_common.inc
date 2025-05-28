{$IFDEF read_interface}


type
  TElm_Fileselector_Filter_Func = function(path: pchar; dir: TEina_Bool; data: pointer): TEina_Bool; cdecl;

var
  ELM_FILESELECTOR_ERROR_UNKNOWN: TEina_Error; cvar;external libelementary;
  ELM_FILESELECTOR_ERROR_INVALID_MODEL: TEina_Error; cvar;external libelementary;

  // === Konventiert am: 27-5-25 17:07:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

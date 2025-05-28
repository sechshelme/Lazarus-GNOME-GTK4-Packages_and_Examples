{$IFDEF read_interface}


{$ifdef EFL_BETA_API_SUPPORT}
function elm_code_create: PElm_Code; cdecl; external libelementary;
procedure elm_code_free(code: PElm_Code); cdecl; external libelementary;
procedure elm_code_callback_fire(code: PElm_Code; signal: PEfl_Event_Description; data: pointer); cdecl; external libelementary;
{$endif}

// === Konventiert am: 26-5-25 16:44:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

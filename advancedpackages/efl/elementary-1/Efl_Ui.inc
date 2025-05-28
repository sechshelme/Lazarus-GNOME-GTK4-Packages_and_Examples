{$IFDEF read_interface}


var
  _efl_startup_time: double; cvar;external libelementary;

  EFL_UI_THEME_APPLY_ERROR_NONE: TEina_Error; cvar;external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_focus_relation_free(rel: PEfl_Ui_Focus_Relations); cdecl; external libelementary;
procedure efl_ui_win_autodel_set(obj: PEfl_Ui_Win; autodel: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_autodel_get(obj: PEfl_Ui_Win): TEina_Bool; cdecl; external libelementary;
{$endif}

type
  TContext_Item_Clicked_Cb = procedure(data: pointer; obj: PEo; event_info: pointer); cdecl;

// === Konventiert am: 27-5-25 19:20:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

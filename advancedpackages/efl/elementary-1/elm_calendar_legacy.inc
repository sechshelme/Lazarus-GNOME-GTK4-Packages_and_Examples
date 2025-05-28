{$IFDEF read_interface}


function elm_calendar_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_calendar_mark_del(mark: PElm_Calendar_Mark); cdecl; external libelementary;
procedure elm_calendar_min_max_year_set(obj: PElm_Calendar; min: longint; max: longint); cdecl; external libelementary;
procedure elm_calendar_min_max_year_get(obj: PElm_Calendar; min: Plongint; max: Plongint); cdecl; external libelementary;

// === Konventiert am: 26-5-25 19:44:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

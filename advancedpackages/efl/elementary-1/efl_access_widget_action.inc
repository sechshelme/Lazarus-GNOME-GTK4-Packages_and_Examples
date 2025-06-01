{$IFDEF read_interface}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Action_Data = record
    name: pchar;
    action: pchar;
    param: pchar;
    func: function(obj: PEvas_Object; params: pchar): TEina_Bool; cdecl;
  end;
  PEfl_Access_Action_Data = ^TEfl_Access_Action_Data;
  {$endif}

  // === Konventiert am: 31-5-25 13:24:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

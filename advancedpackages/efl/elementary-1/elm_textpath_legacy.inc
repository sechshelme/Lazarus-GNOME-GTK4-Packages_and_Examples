{$IFDEF read_interface}


type
  PElm_Textpath = ^TElm_Textpath;
  TElm_Textpath = TEo;

function elm_textpath_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_textpath_text_user_style_set(obj: PEvas_Object; style: pchar); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

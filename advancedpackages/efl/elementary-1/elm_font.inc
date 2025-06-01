{$IFDEF read_interface}


type
  TElm_Font_Properties = record
    name: pchar;
    styles: PEina_List;
  end;
  PElm_Font_Properties = ^TElm_Font_Properties;

function elm_font_properties_get(font: pchar): PElm_Font_Properties; cdecl; external libelementary;
procedure elm_font_properties_free(efp: PElm_Font_Properties); cdecl; external libelementary;
function elm_font_fontconfig_name_get(name: pchar; style: pchar): pchar; cdecl; external libelementary;
procedure elm_font_fontconfig_name_free(name: pchar); cdecl; external libelementary;
function elm_font_available_hash_add(list: PEina_List): PEina_Hash; cdecl; external libelementary;
procedure elm_font_available_hash_del(hash: PEina_Hash); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

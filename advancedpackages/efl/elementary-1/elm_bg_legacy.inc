{$IFDEF read_interface}


type
  PElm_Bg = ^TElm_Bg;
  TElm_Bg = TEo;

type
  PElm_Bg_Option = ^TElm_Bg_Option;
  TElm_Bg_Option = longint;

const
  ELM_BG_OPTION_CENTER = 0;
  ELM_BG_OPTION_SCALE = 1;
  ELM_BG_OPTION_STRETCH = 2;
  ELM_BG_OPTION_TILE = 3;
  ELM_BG_OPTION_LAST = 4;

function elm_bg_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_bg_color_set(obj: PEvas_Object; r: longint; g: longint; b: longint); cdecl; external libelementary;
procedure elm_bg_color_get(obj: PEvas_Object; r: Plongint; g: Plongint; b: Plongint); cdecl; external libelementary;
function elm_bg_file_set(obj: PEo; file_: pchar; group: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_bg_file_get(obj: PEo; file_: PPchar; group: PPchar); cdecl; external libelementary;
procedure elm_bg_option_set(obj: PEvas_Object; option: TElm_Bg_Option); cdecl; external libelementary;
function elm_bg_option_get(obj: PEvas_Object): TElm_Bg_Option; cdecl; external libelementary;
procedure elm_bg_load_size_set(obj: PEvas_Object; w: longint; h: longint); cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:25:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}

type
  PElm_Input_Panel_Layout_Normal_Variation = ^TElm_Input_Panel_Layout_Normal_Variation;
  TElm_Input_Panel_Layout_Normal_Variation = longint;

const
  ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
  ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
  ELM_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;

type
  PElm_Input_Panel_Layout_Numberonly_Variation = ^TElm_Input_Panel_Layout_Numberonly_Variation;
  TElm_Input_Panel_Layout_Numberonly_Variation = longint;

const
  ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
  ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
  ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
  ELM_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;

type
  PElm_Input_Panel_Layout_Password_Variation = ^TElm_Input_Panel_Layout_Password_Variation;
  TElm_Input_Panel_Layout_Password_Variation = longint;

const
  ELM_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
  ELM_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;

type
  TElm_Entry_Anchor_Info = record
    name: pchar;
    button: longint;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
  end;
  PElm_Entry_Anchor_Info = ^TElm_Entry_Anchor_Info;

  TElm_Entry_Context_Menu_Item = record
  end;
  PElm_Entry_Context_Menu_Item = ^TElm_Entry_Context_Menu_Item;

  TElm_Entry_Anchor_Hover_Info = bitpacked record
    anchor_info: PElm_Entry_Anchor_Info;
    hover: PEvas_Object;
    hover_parent: record
      x: TEvas_Coord;
      y: TEvas_Coord;
      w: TEvas_Coord;
      h: TEvas_Coord;
      end;
    hover_left: 0..1;
    hover_right: 0..1;
    hover_top: 0..1;
    hover_bottom: 0..1;
  end;
  PElm_Entry_Anchor_Hover_Info = ^TElm_Entry_Anchor_Hover_Info;

type
  PElm_Entry_Item_Provider_Cb = ^TElm_Entry_Item_Provider_Cb;
  TElm_Entry_Item_Provider_Cb = function(data: pointer; entry: PEvas_Object; item: pchar): PEvas_Object; cdecl;
  TElm_Entry_Filter_Cb = procedure(data: pointer; entry: PEvas_Object; text: PPchar); cdecl;
  PElm_Entry_Change_Info = ^TElm_Entry_Change_Info;
  TElm_Entry_Change_Info = TEdje_Entry_Change_Info;

function elm_entry_markup_to_utf8(s: pchar): pchar; cdecl; external libelementary;
function elm_entry_utf8_to_markup(s: pchar): pchar; cdecl; external libelementary;

type
  TElm_Entry_Filter_Limit_Size = record
    max_char_count: longint;
    max_byte_count: longint;
  end;
  PElm_Entry_Filter_Limit_Size = ^TElm_Entry_Filter_Limit_Size;

procedure elm_entry_filter_limit_size(data: pointer; entry: PEvas_Object; text: PPchar); cdecl; external libelementary;

type
  TElm_Entry_Filter_Accept_Set = record
    accepted: pchar;
    rejected: pchar;
  end;
  PElm_Entry_Filter_Accept_Set = ^TElm_Entry_Filter_Accept_Set;

procedure elm_entry_filter_accept_set(data: pointer; entry: PEvas_Object; text: PPchar); cdecl; external libelementary;
function elm_entry_context_menu_item_label_get(item: PElm_Entry_Context_Menu_Item): pchar; cdecl; external libelementary;
procedure elm_entry_context_menu_item_icon_get(item: PElm_Entry_Context_Menu_Item; icon_file: PPchar; icon_group: PPchar; icon_type: PElm_Icon_Type); cdecl; external libelementary;

// === Konventiert am: 13-5-25 14:55:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}

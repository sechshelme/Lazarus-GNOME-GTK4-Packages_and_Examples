unit efl_input_text_entity_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Input_Text_Entity = ^TEfl_Input_Text_Entity;
  TEfl_Input_Text_Entity = TEo;

type
  PEfl_Input_Text_Panel_Layout_Type = ^TEfl_Input_Text_Panel_Layout_Type;
  TEfl_Input_Text_Panel_Layout_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NORMAL = 0;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NUMBER = 1;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_EMAIL = 2;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_URL = 3;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_PHONE_NUMBER = 4;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_IP = 5;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_MONTH = 6;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_NUMBER_ONLY = 7;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_INVALID = 8;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_HEX = 9;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_TERMINAL = 10;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_PASSWORD = 11;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_DATETIME = 12;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_EMOTICON = 13;
  EFL_INPUT_TEXT_PANEL_LAYOUT_TYPE_VOICE = 14;

type
  PEfl_Input_Text_Panel_Language_Type = ^TEfl_Input_Text_Panel_Language_Type;
  TEfl_Input_Text_Panel_Language_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_LANGUAGE_TYPE_AUTOMATIC = 0;
  EFL_INPUT_TEXT_PANEL_LANGUAGE_TYPE_ALPHABET = 1;

type
  PEfl_Input_Text_Capitalize_Type = ^TEfl_Input_Text_Capitalize_Type;
  TEfl_Input_Text_Capitalize_Type = longint;

const
  EFL_INPUT_TEXT_CAPITALIZE_TYPE_NONE = 0;
  EFL_INPUT_TEXT_CAPITALIZE_TYPE_WORD = 1;
  EFL_INPUT_TEXT_CAPITALIZE_TYPE_SENTENCE = 2;
  EFL_INPUT_TEXT_CAPITALIZE_TYPE_ALL = 3;

type
  PEfl_Input_Text_Panel_Return_Key_Type = ^TEfl_Input_Text_Panel_Return_Key_Type;
  TEfl_Input_Text_Panel_Return_Key_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_DONE = 1;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_GO = 2;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SEND = 7;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;

type
  PEfl_Input_Text_Panel_Return_Key_State = ^TEfl_Input_Text_Panel_Return_Key_State;
  TEfl_Input_Text_Panel_Return_Key_State = longint;

const
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_AUTO = 0;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_ENABLED = 1;
  EFL_INPUT_TEXT_PANEL_RETURN_KEY_STATE_DISABLED = 2;

type
  PEfl_Input_Text_Content_Type = ^TEfl_Input_Text_Content_Type;
  TEfl_Input_Text_Content_Type = longint;

const
  EFL_INPUT_TEXT_CONTENT_TYPE_NONE = 0;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTO_COMPLETE = 1;
  EFL_INPUT_TEXT_CONTENT_TYPE_SENSITIVE_DATA = 2;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = 256;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = 512;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = 768;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = 1024;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_CREDIT_CARD_NUMBER = 1280;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_EMAIL_ADDRESS = 1536;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_NAME = 1792;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_PHONE = 2048;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_POSTAL_ADDRESS = 2304;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_POSTAL_CODE = 2560;
  EFL_INPUT_TEXT_CONTENT_TYPE_AUTOFILL_ID = 2816;
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Input_Text_Panel_Layout_Normal_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Normal_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Normal_Variation_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_NORMAL = 0;
  EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_FILE_NAME = 1;
  EFL_INPUT_TEXT_PANEL_LAYOUT_NORMAL_VARIATION_TYPE_PERSON_NAME = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Numberonly_Variation_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_NORMAL = 0;
  EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_SIGNED = 1;
  EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_DECIMAL = 2;
  EFL_INPUT_TEXT_PANEL_LAYOUT_NUMBERONLY_VARIATION_TYPE_SIGNED_AND_DECIMAL = 3;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Input_Text_Panel_Layout_Password_Variation_Type = ^TEfl_Input_Text_Panel_Layout_Password_Variation_Type;
  TEfl_Input_Text_Panel_Layout_Password_Variation_Type = longint;

const
  EFL_INPUT_TEXT_PANEL_LAYOUT_PASSWORD_VARIATION_TYPE_NORMAL = 0;
  EFL_INPUT_TEXT_PANEL_LAYOUT_PASSWORD_VARIATION_TYPE_NUMBER_ONLY = 1;
{$endif}
function EFL_INPUT_TEXT_ENTITY_INTERFACE: PEfl_Class;

function efl_input_text_entity_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_input_text_input_panel_show_on_demand_set(obj: PEo; ondemand: TEina_Bool); cdecl; external libefl;
function efl_input_text_input_panel_show_on_demand_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_input_text_input_panel_language_set(obj: PEo; lang: TEfl_Input_Text_Panel_Language_Type); cdecl; external libefl;
function efl_input_text_input_panel_language_get(obj: PEo): TEfl_Input_Text_Panel_Language_Type; cdecl; external libefl;
procedure efl_input_text_input_panel_layout_variation_set(obj: PEo; variation: longint); cdecl; external libefl;
function efl_input_text_input_panel_layout_variation_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_input_text_autocapitalization_set(obj: PEo; autocapital_type: TEfl_Input_Text_Capitalize_Type); cdecl; external libefl;
function efl_input_text_autocapitalization_get(obj: PEo): TEfl_Input_Text_Capitalize_Type; cdecl; external libefl;
procedure efl_input_text_predictable_set(obj: PEo; prediction: TEina_Bool); cdecl; external libefl;
function efl_input_text_predictable_get(obj: PEo): TEina_Bool; cdecl; external libefl;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_input_text_input_content_type_set(obj: PEo; hints: TEfl_Input_Text_Content_Type); cdecl; external libefl;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_text_input_content_type_get(obj: PEo): TEfl_Input_Text_Content_Type; cdecl; external libefl;
{$endif}

procedure efl_input_text_input_panel_layout_set(obj: PEo; layout: TEfl_Input_Text_Panel_Layout_Type); cdecl; external libefl;
function efl_input_text_input_panel_layout_get(obj: PEo): TEfl_Input_Text_Panel_Layout_Type; cdecl; external libefl;
procedure efl_input_text_input_panel_return_key_type_set(obj: PEo; return_key_type: TEfl_Input_Text_Panel_Return_Key_Type); cdecl; external libefl;
function efl_input_text_input_panel_return_key_type_get(obj: PEo): TEfl_Input_Text_Panel_Return_Key_Type; cdecl; external libefl;
procedure efl_input_text_input_panel_autoshow_set(obj: PEo; enabled: TEina_Bool); cdecl; external libefl;
function efl_input_text_input_panel_autoshow_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_input_text_input_panel_return_key_state_set(obj: PEo; state: TEfl_Input_Text_Panel_Return_Key_State); cdecl; external libefl;
function efl_input_text_input_panel_return_key_state_get(obj: PEo): TEfl_Input_Text_Panel_Return_Key_State; cdecl; external libefl;
procedure efl_input_text_input_panel_show(obj: PEo); cdecl; external libefl;
procedure efl_input_text_input_panel_hide(obj: PEo); cdecl; external libefl;
procedure efl_input_text_input_panel_imdata_set(obj: PEo; value: TEina_Slice); cdecl; external libefl;
function efl_input_text_input_panel_imdata_get(obj: PEo): TEina_Slice; cdecl; external libefl;

// === Konventiert am: 18-5-25 19:21:58 ===


implementation


function EFL_INPUT_TEXT_ENTITY_INTERFACE: PEfl_Class;
begin
  EFL_INPUT_TEXT_ENTITY_INTERFACE := efl_input_text_entity_interface_get;
end;


end.

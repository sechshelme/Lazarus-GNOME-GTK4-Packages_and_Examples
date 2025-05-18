unit efl_text_style_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Text_Style = ^TEfl_Text_Style;
  TEfl_Text_Style = TEo;

type
  PEfl_Text_Style_Background_Type = ^TEfl_Text_Style_Background_Type;
  TEfl_Text_Style_Background_Type = longint;

const
  EFL_TEXT_STYLE_BACKGROUND_TYPE_NONE = 0;
  EFL_TEXT_STYLE_BACKGROUND_TYPE_SOLID_COLOR = 1;

type
  PEfl_Text_Style_Strikethrough_Type = ^TEfl_Text_Style_Strikethrough_Type;
  TEfl_Text_Style_Strikethrough_Type = longint;

const
  EFL_TEXT_STYLE_STRIKETHROUGH_TYPE_NONE = 0;
  EFL_TEXT_STYLE_STRIKETHROUGH_TYPE_SINGLE = 1;

type
  PEfl_Text_Style_Effect_Type = ^TEfl_Text_Style_Effect_Type;
  TEfl_Text_Style_Effect_Type = longint;

const
  EFL_TEXT_STYLE_EFFECT_TYPE_NONE = 0;
  EFL_TEXT_STYLE_EFFECT_TYPE_SHADOW = 1;
  EFL_TEXT_STYLE_EFFECT_TYPE_FAR_SHADOW = 2;
  EFL_TEXT_STYLE_EFFECT_TYPE_SOFT_SHADOW = 3;
  EFL_TEXT_STYLE_EFFECT_TYPE_FAR_SOFT_SHADOW = 4;
  EFL_TEXT_STYLE_EFFECT_TYPE_GLOW = 5;
  EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE = 6;
  EFL_TEXT_STYLE_EFFECT_TYPE_SOFT_OUTLINE = 7;
  EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE_SHADOW = 8;
  EFL_TEXT_STYLE_EFFECT_TYPE_OUTLINE_SOFT_SHADOW = 9;

type
  PEfl_Text_Style_Shadow_Direction = ^TEfl_Text_Style_Shadow_Direction;
  TEfl_Text_Style_Shadow_Direction = longint;

const
  EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_RIGHT = 0;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM = 1;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_LEFT = 2;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_LEFT = 3;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP_LEFT = 4;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP = 5;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_TOP_RIGHT = 6;
  EFL_TEXT_STYLE_SHADOW_DIRECTION_RIGHT = 7;

type
  PEfl_Text_Style_Underline_Type = ^TEfl_Text_Style_Underline_Type;
  TEfl_Text_Style_Underline_Type = longint;

const
  EFL_TEXT_STYLE_UNDERLINE_TYPE_NONE = 0;
  EFL_TEXT_STYLE_UNDERLINE_TYPE_SINGLE = 1;
  EFL_TEXT_STYLE_UNDERLINE_TYPE_DOUBLE = 2;
  EFL_TEXT_STYLE_UNDERLINE_TYPE_DASHED = 3;

function EFL_TEXT_STYLE_INTERFACE: PEfl_Class;

function efl_text_style_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_text_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_background_type_set(obj: PEo; _type: TEfl_Text_Style_Background_Type); cdecl; external libefl;
function efl_text_background_type_get(obj: PEo): TEfl_Text_Style_Background_Type; cdecl; external libefl;
procedure efl_text_background_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_background_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_underline_type_set(obj: PEo; _type: TEfl_Text_Style_Underline_Type); cdecl; external libefl;
function efl_text_underline_type_get(obj: PEo): TEfl_Text_Style_Underline_Type; cdecl; external libefl;
procedure efl_text_underline_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_underline_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_underline_height_set(obj: PEo; height: double); cdecl; external libefl;
function efl_text_underline_height_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_underline_dashed_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_underline_dashed_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_underline_dashed_width_set(obj: PEo; width: longint); cdecl; external libefl;
function efl_text_underline_dashed_width_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_text_underline_dashed_gap_set(obj: PEo; gap: longint); cdecl; external libefl;
function efl_text_underline_dashed_gap_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_text_secondary_underline_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_secondary_underline_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_strikethrough_type_set(obj: PEo; _type: TEfl_Text_Style_Strikethrough_Type); cdecl; external libefl;
function efl_text_strikethrough_type_get(obj: PEo): TEfl_Text_Style_Strikethrough_Type; cdecl; external libefl;
procedure efl_text_strikethrough_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_strikethrough_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_effect_type_set(obj: PEo; _type: TEfl_Text_Style_Effect_Type); cdecl; external libefl;
function efl_text_effect_type_get(obj: PEo): TEfl_Text_Style_Effect_Type; cdecl; external libefl;
procedure efl_text_outline_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_outline_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_shadow_direction_set(obj: PEo; _type: TEfl_Text_Style_Shadow_Direction); cdecl; external libefl;
function efl_text_shadow_direction_get(obj: PEo): TEfl_Text_Style_Shadow_Direction; cdecl; external libefl;
procedure efl_text_shadow_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_shadow_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_glow_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_glow_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_secondary_glow_color_set(obj: PEo; r: byte; g: byte; b: byte; a: byte); cdecl; external libefl;
procedure efl_text_secondary_glow_color_get(obj: PEo; r: pbyte; g: pbyte; b: pbyte; a: pbyte); cdecl; external libefl;
procedure efl_text_gfx_filter_set(obj: PEo; code: pchar); cdecl; external libefl;
function efl_text_gfx_filter_get(obj: PEo): pchar; cdecl; external libefl;

// === Konventiert am: 18-5-25 19:22:01 ===


implementation


function EFL_TEXT_STYLE_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_STYLE_INTERFACE := efl_text_style_interface_get;
end;


end.

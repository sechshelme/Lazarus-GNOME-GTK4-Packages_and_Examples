unit efl_gfx_types_eot;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Gfx_Align = ^TEfl_Gfx_Align;
  TEfl_Gfx_Align = double;
  {$ifdef EFL_BETA_API_SUPPORT}

  PEfl_Gfx_Colorspace = ^TEfl_Gfx_Colorspace;
  TEfl_Gfx_Colorspace = longint;

const
  EFL_GFX_COLORSPACE_ARGB8888 = 0;
  EFL_GFX_COLORSPACE_YCBCR422P601_PL = 1;
  EFL_GFX_COLORSPACE_YCBCR422P709_PL = 2;
  EFL_GFX_COLORSPACE_RGB565_A5P = 3;
  EFL_GFX_COLORSPACE_GRY8 = 4;
  EFL_GFX_COLORSPACE_YCBCR422601_PL = 5;
  EFL_GFX_COLORSPACE_YCBCR420NV12601_PL = 6;
  EFL_GFX_COLORSPACE_YCBCR420TM12601_PL = 7;
  EFL_GFX_COLORSPACE_AGRY88 = 8;
  EFL_GFX_COLORSPACE_ETC1 = 9;
  EFL_GFX_COLORSPACE_RGB8_ETC2 = 10;
  EFL_GFX_COLORSPACE_RGBA8_ETC2_EAC = 11;
  EFL_GFX_COLORSPACE_ETC1_ALPHA = 12;
  EFL_GFX_COLORSPACE_RGB_S3TC_DXT1 = 13;
  EFL_GFX_COLORSPACE_RGBA_S3TC_DXT1 = 14;
  EFL_GFX_COLORSPACE_RGBA_S3TC_DXT2 = 15;
  EFL_GFX_COLORSPACE_RGBA_S3TC_DXT3 = 16;
  EFL_GFX_COLORSPACE_RGBA_S3TC_DXT4 = 17;
  EFL_GFX_COLORSPACE_RGBA_S3TC_DXT5 = 18;
  {$endif}

type
  PEfl_Gfx_Render_Op = ^TEfl_Gfx_Render_Op;
  TEfl_Gfx_Render_Op = longint;

const
  EFL_GFX_RENDER_OP_BLEND = 0;
  EFL_GFX_RENDER_OP_COPY = 1;
  EFL_GFX_RENDER_OP_LAST = 2;

type
  PPEfl_Gfx_Path_Command_Type = ^PEfl_Gfx_Path_Command_Type;
  PEfl_Gfx_Path_Command_Type = ^TEfl_Gfx_Path_Command_Type;
  TEfl_Gfx_Path_Command_Type = longint;

const
  EFL_GFX_PATH_COMMAND_TYPE_END = 0;
  EFL_GFX_PATH_COMMAND_TYPE_MOVE_TO = 1;
  EFL_GFX_PATH_COMMAND_TYPE_LINE_TO = 2;
  EFL_GFX_PATH_COMMAND_TYPE_CUBIC_TO = 3;
  EFL_GFX_PATH_COMMAND_TYPE_CLOSE = 4;
  EFL_GFX_PATH_COMMAND_TYPE_LAST = 5;

type
  PEfl_Gfx_Cap = ^TEfl_Gfx_Cap;
  TEfl_Gfx_Cap = longint;

const
  EFL_GFX_CAP_BUTT = 0;
  EFL_GFX_CAP_ROUND = 1;
  EFL_GFX_CAP_SQUARE = 2;
  EFL_GFX_CAP_LAST = 3;

type
  PEfl_Gfx_Join = ^TEfl_Gfx_Join;
  TEfl_Gfx_Join = longint;

const
  EFL_GFX_JOIN_MITER = 0;
  EFL_GFX_JOIN_ROUND = 1;
  EFL_GFX_JOIN_BEVEL = 2;
  EFL_GFX_JOIN_LAST = 3;

type
  PEfl_Gfx_Gradient_Spread = ^TEfl_Gfx_Gradient_Spread;
  TEfl_Gfx_Gradient_Spread = longint;

const
  EFL_GFX_GRADIENT_SPREAD_PAD = 0;
  EFL_GFX_GRADIENT_SPREAD_REFLECT = 1;
  EFL_GFX_GRADIENT_SPREAD_REPEAT = 2;
  EFL_GFX_GRADIENT_SPREAD_LAST = 3;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Fill_Rule = ^TEfl_Gfx_Fill_Rule;
  TEfl_Gfx_Fill_Rule = longint;

const
  EFL_GFX_FILL_RULE_WINDING = 0;
  EFL_GFX_FILL_RULE_ODD_EVEN = 1;
  {$endif}

type
  TEfl_Gfx_Dash = record
    length: double;
    gap: double;
  end;
  PEfl_Gfx_Dash = ^TEfl_Gfx_Dash;
  PPEfl_Gfx_Dash = ^PEfl_Gfx_Dash;

  TEfl_Gfx_Gradient_Stop = record
    offset: double;
    r: longint;
    g: longint;
    b: longint;
    a: longint;
  end;
  PEfl_Gfx_Gradient_Stop = ^TEfl_Gfx_Gradient_Stop;
  PPEfl_Gfx_Gradient_Stop = ^PEfl_Gfx_Gradient_Stop;

  {$ifdef EFL_BETA_API_SUPPORT}
  TEfl_Gfx_Stroke_Color = record
    r: longint;
    g: longint;
    b: longint;
    a: longint;
  end;
  PEfl_Gfx_Stroke_Color = ^TEfl_Gfx_Stroke_Color;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Gfx_Stroke = record
    scale: double;
    width: double;
    centered: double;
    color: TEfl_Gfx_Stroke_Color;
    dash: PEfl_Gfx_Dash;
    dash_length: dword;
    cap: TEfl_Gfx_Cap;
    join: TEfl_Gfx_Join;
    miterlimit: double;
  end;
  PEfl_Gfx_Stroke = ^TEfl_Gfx_Stroke;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Shape_Public = ^TEfl_Gfx_Shape_Public;

  TEfl_Gfx_Shape_Public = record
    stroke: TEfl_Gfx_Stroke;
  end;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Vg_Composite_Method = ^TEfl_Gfx_Vg_Composite_Method;
  TEfl_Gfx_Vg_Composite_Method = longint;

const
  EFL_GFX_VG_COMPOSITE_METHOD_NONE = 0;
  EFL_GFX_VG_COMPOSITE_METHOD_MATTE_ALPHA = 1;
  EFL_GFX_VG_COMPOSITE_METHOD_MATTE_ALPHA_INVERSE = 2;
  EFL_GFX_VG_COMPOSITE_METHOD_MASK_ADD = 3;
  EFL_GFX_VG_COMPOSITE_METHOD_MASK_SUBSTRACT = 4;
  EFL_GFX_VG_COMPOSITE_METHOD_MASK_INTERSECT = 5;
  EFL_GFX_VG_COMPOSITE_METHOD_MASK_DIFFERENCE = 6;
  {$endif}

type
  PEfl_Gfx_Center_Fill_Mode = ^TEfl_Gfx_Center_Fill_Mode;
  TEfl_Gfx_Center_Fill_Mode = longint;

const
  EFL_GFX_CENTER_FILL_MODE_NONE = 0;
  EFL_GFX_CENTER_FILL_MODE_DEFAULT = 1;
  EFL_GFX_CENTER_FILL_MODE_SOLID = 2;

type
  PEfl_Gfx_Change_Flag = ^TEfl_Gfx_Change_Flag;
  TEfl_Gfx_Change_Flag = longint;

const
  EFL_GFX_CHANGE_FLAG_NONE = 0;
  EFL_GFX_CHANGE_FLAG_MATRIX = 1;
  EFL_GFX_CHANGE_FLAG_PATH = 2;
  EFL_GFX_CHANGE_FLAG_FILL = 4;
  EFL_GFX_CHANGE_FLAG_ALL = 65535;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Gfx_Event_Render_Post = record
    updated_area: PEina_List;
  end;
  PEfl_Gfx_Event_Render_Post = ^TEfl_Gfx_Event_Render_Post;
  {$endif}

type
  PEfl_Gfx_Hint_Aspect = ^TEfl_Gfx_Hint_Aspect;
  TEfl_Gfx_Hint_Aspect = longint;

const
  EFL_GFX_HINT_ASPECT_NONE = 0;
  EFL_GFX_HINT_ASPECT_NEITHER = 1;
  EFL_GFX_HINT_ASPECT_HORIZONTAL = 2;
  EFL_GFX_HINT_ASPECT_VERTICAL = 3;
  EFL_GFX_HINT_ASPECT_BOTH = 4;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Color_Class_Layer = ^TEfl_Gfx_Color_Class_Layer;
  TEfl_Gfx_Color_Class_Layer = longint;

const
  EFL_GFX_COLOR_CLASS_LAYER_NORMAL = 0;
  EFL_GFX_COLOR_CLASS_LAYER_OUTLINE = 1;
  EFL_GFX_COLOR_CLASS_LAYER_SHADOW = 2;
  {$endif}

type
  PEfl_Font_Size = ^TEfl_Font_Size;
  TEfl_Font_Size = longint;

  // === Konventiert am: 18-5-25 17:58:52 ===


implementation



end.

{$IFDEF read_interface}


type
  PEfl_Gfx_Image = ^TEfl_Gfx_Image;
  TEfl_Gfx_Image = TEo;

type
  PEfl_Gfx_Image_Content_Hint = ^TEfl_Gfx_Image_Content_Hint;
  TEfl_Gfx_Image_Content_Hint = longint;

const
  EFL_GFX_IMAGE_CONTENT_HINT_NONE = 0;
  EFL_GFX_IMAGE_CONTENT_HINT_DYNAMIC = 1;
  EFL_GFX_IMAGE_CONTENT_HINT_STATIC = 2;

type
  PEfl_Gfx_Image_Scale_Hint = ^TEfl_Gfx_Image_Scale_Hint;
  TEfl_Gfx_Image_Scale_Hint = longint;

const
  EFL_GFX_IMAGE_SCALE_HINT_NONE = 0;
  EFL_GFX_IMAGE_SCALE_HINT_DYNAMIC = 1;
  EFL_GFX_IMAGE_SCALE_HINT_STATIC = 2;

type
  PEfl_Gfx_Image_Scale_Method = ^TEfl_Gfx_Image_Scale_Method;
  TEfl_Gfx_Image_Scale_Method = longint;

const
  EFL_GFX_IMAGE_SCALE_METHOD_NONE = 0;
  EFL_GFX_IMAGE_SCALE_METHOD_FILL = 1;
  EFL_GFX_IMAGE_SCALE_METHOD_FIT = 2;
  EFL_GFX_IMAGE_SCALE_METHOD_FIT_WIDTH = 3;
  EFL_GFX_IMAGE_SCALE_METHOD_FIT_HEIGHT = 4;
  EFL_GFX_IMAGE_SCALE_METHOD_EXPAND = 5;
  EFL_GFX_IMAGE_SCALE_METHOD_TILE = 6;

type
  TEfl_Gfx_Image_Stretch_Region = record
    offset: dword;
    length: dword;
  end;
  PEfl_Gfx_Image_Stretch_Region = ^TEfl_Gfx_Image_Stretch_Region;

function EFL_GFX_IMAGE_INTERFACE: PEfl_Class;

function efl_gfx_image_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_image_smooth_scale_set(obj: PEo; smooth_scale: TEina_Bool); cdecl; external libefl;
function efl_gfx_image_smooth_scale_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_image_scale_method_set(obj: PEo; scale_method: TEfl_Gfx_Image_Scale_Method); cdecl; external libefl;
function efl_gfx_image_scale_method_get(obj: PEo): TEfl_Gfx_Image_Scale_Method; cdecl; external libefl;
procedure efl_gfx_image_can_upscale_set(obj: PEo; upscale: TEina_Bool); cdecl; external libefl;
function efl_gfx_image_can_upscale_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_image_can_downscale_set(obj: PEo; downscale: TEina_Bool); cdecl; external libefl;
function efl_gfx_image_can_downscale_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_gfx_image_ratio_get(obj: PEo): double; cdecl; external libefl;
function efl_gfx_image_content_region_get(obj: PEo): TEina_Rect; cdecl; external libefl;
procedure efl_gfx_image_border_insets_set(obj: PEo; l: longint; r: longint; t: longint; b: longint); cdecl; external libefl;
procedure efl_gfx_image_border_insets_get(obj: PEo; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libefl;
procedure efl_gfx_image_border_insets_scale_set(obj: PEo; scale: double); cdecl; external libefl;
function efl_gfx_image_border_insets_scale_get(obj: PEo): double; cdecl; external libefl;
procedure efl_gfx_image_center_fill_mode_set(obj: PEo; fill: TEfl_Gfx_Center_Fill_Mode); cdecl; external libefl;
function efl_gfx_image_center_fill_mode_get(obj: PEo): TEfl_Gfx_Center_Fill_Mode; cdecl; external libefl;
function efl_gfx_image_stretch_region_set(obj: PEo; horizontal: PEina_Iterator; vertical: PEina_Iterator): TEina_Error; cdecl; external libefl;
procedure efl_gfx_image_stretch_region_get(obj: PEo; horizontal: PPEina_Iterator; vertical: PPEina_Iterator); cdecl; external libefl;
function efl_gfx_image_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_image_content_hint_set(obj: PEo; hint: TEfl_Gfx_Image_Content_Hint); cdecl; external libefl;
function efl_gfx_image_content_hint_get(obj: PEo): TEfl_Gfx_Image_Content_Hint; cdecl; external libefl;
procedure efl_gfx_image_scale_hint_set(obj: PEo; hint: TEfl_Gfx_Image_Scale_Hint); cdecl; external libefl;
function efl_gfx_image_scale_hint_get(obj: PEo): TEfl_Gfx_Image_Scale_Hint; cdecl; external libefl;
function efl_gfx_image_load_error_get(obj: PEo): TEina_Error; cdecl; external libefl;

var
  _EFL_GFX_IMAGE_EVENT_IMAGE_PRELOAD_STATE_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_GFX_IMAGE_EVENT_IMAGE_RESIZED: TEfl_Event_Description; cvar;external libefl;

function EFL_GFX_IMAGE_EVENT_IMAGE_RESIZED: PEfl_Event_Description;
function EFL_GFX_IMAGE_EVENT_IMAGE_PRELOAD_STATE_CHANGED: PEfl_Event_Description;


// === Konventiert am: 18-5-25 19:22:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_IMAGE_INTERFACE: PEfl_Class;
begin
  EFL_GFX_IMAGE_INTERFACE := efl_gfx_image_interface_get;
end;

function EFL_GFX_IMAGE_EVENT_IMAGE_PRELOAD_STATE_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_IMAGE_EVENT_IMAGE_PRELOAD_STATE_CHANGED := @(_EFL_GFX_IMAGE_EVENT_IMAGE_PRELOAD_STATE_CHANGED);
end;

function EFL_GFX_IMAGE_EVENT_IMAGE_RESIZED: PEfl_Event_Description;
begin
  EFL_GFX_IMAGE_EVENT_IMAGE_RESIZED := @(_EFL_GFX_IMAGE_EVENT_IMAGE_RESIZED);
end;


{$ENDIF read_implementation}

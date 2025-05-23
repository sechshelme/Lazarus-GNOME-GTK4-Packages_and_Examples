{$IFDEF read_interface}


type
  PEfl_Gfx_Image_Load_Controller = ^TEfl_Gfx_Image_Load_Controller;
  TEfl_Gfx_Image_Load_Controller = TEo;

function EFL_GFX_IMAGE_LOAD_CONTROLLER_INTERFACE: PEfl_Class;

function efl_gfx_image_load_controller_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_async_start(obj: PEo); cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_async_cancel(obj: PEo); cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_size_set(obj: PEo; size: TEina_Size2D); cdecl; external libefl;
function efl_gfx_image_load_controller_load_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_dpi_set(obj: PEo; dpi: double); cdecl; external libefl;
function efl_gfx_image_load_controller_load_dpi_get(obj: PEo): double; cdecl; external libefl;
function efl_gfx_image_load_controller_load_region_support_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_region_set(obj: PEo; region: TEina_Rect); cdecl; external libefl;
function efl_gfx_image_load_controller_load_region_get(obj: PEo): TEina_Rect; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_orientation_set(obj: PEo; enable: TEina_Bool); cdecl; external libefl;
function efl_gfx_image_load_controller_load_orientation_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_scale_down_set(obj: PEo; div_: longint); cdecl; external libefl;
function efl_gfx_image_load_controller_load_scale_down_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_gfx_image_load_controller_load_skip_header_set(obj: PEo; skip: TEina_Bool); cdecl; external libefl;
function efl_gfx_image_load_controller_load_skip_header_get(obj: PEo): TEina_Bool; cdecl; external libefl;

// === Konventiert am: 19-5-25 17:35:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_IMAGE_LOAD_CONTROLLER_INTERFACE: PEfl_Class;
begin
  EFL_GFX_IMAGE_LOAD_CONTROLLER_INTERFACE := efl_gfx_image_load_controller_interface_get;
end;


{$ENDIF read_implementation}

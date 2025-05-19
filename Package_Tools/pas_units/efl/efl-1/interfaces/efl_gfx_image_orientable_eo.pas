unit efl_gfx_image_orientable_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Image_Orientable = ^TEfl_Gfx_Image_Orientable;
  TEfl_Gfx_Image_Orientable = TEo;

type
  PEfl_Gfx_Image_Orientation = ^TEfl_Gfx_Image_Orientation;
  TEfl_Gfx_Image_Orientation = longint;

const
  EFL_GFX_IMAGE_ORIENTATION_NONE = 0;
  EFL_GFX_IMAGE_ORIENTATION_UP = 0;
  EFL_GFX_IMAGE_ORIENTATION_RIGHT = 1;
  EFL_GFX_IMAGE_ORIENTATION_DOWN = 2;
  EFL_GFX_IMAGE_ORIENTATION_LEFT = 3;
  EFL_GFX_IMAGE_ORIENTATION_ROTATION_BITMASK = 3;
  EFL_GFX_IMAGE_ORIENTATION_FLIP_HORIZONTAL = 4;
  EFL_GFX_IMAGE_ORIENTATION_FLIP_VERTICAL = 8;
  EFL_GFX_IMAGE_ORIENTATION_FLIP_BITMASK = 12;

function EFL_GFX_IMAGE_ORIENTABLE_INTERFACE: PEfl_Class;

function efl_gfx_image_orientable_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_image_orientation_set(obj: PEo; dir: TEfl_Gfx_Image_Orientation); cdecl; external libefl;
function efl_gfx_image_orientation_get(obj: PEo): TEfl_Gfx_Image_Orientation; cdecl; external libefl;

// === Konventiert am: 19-5-25 19:44:08 ===


implementation


function EFL_GFX_IMAGE_ORIENTABLE_INTERFACE: PEfl_Class;
begin
  EFL_GFX_IMAGE_ORIENTABLE_INTERFACE := efl_gfx_image_orientable_interface_get;
end;


end.

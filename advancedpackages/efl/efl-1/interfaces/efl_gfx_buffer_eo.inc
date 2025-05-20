{$IFDEF read_interface}


type
  PEfl_Gfx_Buffer = ^TEfl_Gfx_Buffer;
  TEfl_Gfx_Buffer = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gfx_Buffer_Access_Mode = ^TEfl_Gfx_Buffer_Access_Mode;
  TEfl_Gfx_Buffer_Access_Mode = longint;

const
  EFL_GFX_BUFFER_ACCESS_MODE_NONE = 0;
  EFL_GFX_BUFFER_ACCESS_MODE_READ = 1;
  EFL_GFX_BUFFER_ACCESS_MODE_WRITE = 2;
  EFL_GFX_BUFFER_ACCESS_MODE_COW = 4;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_BUFFER_INTERFACE: PEfl_Class;

function efl_gfx_buffer_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_buffer_size_set(obj: PEo; sz: TEina_Size2D); cdecl; external libefl;
function efl_gfx_buffer_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
function efl_gfx_buffer_colorspace_get(obj: PEo): TEfl_Gfx_Colorspace; cdecl; external libefl;
procedure efl_gfx_buffer_alpha_set(obj: PEo; alpha: TEina_Bool); cdecl; external libefl;
function efl_gfx_buffer_alpha_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_gfx_buffer_stride_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_gfx_buffer_update_add(obj: PEo; region: PEina_Rect); cdecl; external libefl;
procedure efl_gfx_buffer_borders_get(obj: PEo; l: Pdword; r: Pdword; t: Pdword; b: Pdword); cdecl; external libefl;
function efl_gfx_buffer_map(obj: PEo; mode: TEfl_Gfx_Buffer_Access_Mode; region: PEina_Rect; cspace: TEfl_Gfx_Colorspace; plane: longint;
  stride: Plongint): TEina_Rw_Slice; cdecl; external libefl;
function efl_gfx_buffer_unmap(obj: PEo; slice: TEina_Rw_Slice): TEina_Bool; cdecl; external libefl;
function efl_gfx_buffer_copy_set(obj: PEo; slice: PEina_Slice; size: TEina_Size2D; stride: longint; cspace: TEfl_Gfx_Colorspace;
  plane: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_buffer_managed_set(obj: PEo; slice: PEina_Slice; size: TEina_Size2D; stride: longint; cspace: TEfl_Gfx_Colorspace;
  plane: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_buffer_managed_get(obj: PEo; plane: longint): TEina_Slice; cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 17:34:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_BUFFER_INTERFACE: PEfl_Class;
begin
  EFL_GFX_BUFFER_INTERFACE := efl_gfx_buffer_interface_get;
end;


{$ENDIF read_implementation}

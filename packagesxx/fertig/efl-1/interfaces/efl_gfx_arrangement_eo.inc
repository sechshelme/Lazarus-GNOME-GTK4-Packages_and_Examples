{$IFDEF read_interface}


type
  PEfl_Gfx_Arrangement = ^TEfl_Gfx_Arrangement;
  TEfl_Gfx_Arrangement = TEo;

function EFL_GFX_ARRANGEMENT_INTERFACE: PEfl_Class;

function efl_gfx_arrangement_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_arrangement_content_align_set(obj: PEo; align_horiz: TEfl_Gfx_Align; align_vert: TEfl_Gfx_Align); cdecl; external libefl;
procedure efl_gfx_arrangement_content_align_get(obj: PEo; align_horiz: PEfl_Gfx_Align; align_vert: PEfl_Gfx_Align); cdecl; external libefl;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_gfx_arrangement_content_padding_set(obj: PEo; pad_horiz: dword; pad_vert: dword); cdecl; external libefl;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_gfx_arrangement_content_padding_get(obj: PEo; pad_horiz: Pdword; pad_vert: Pdword); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:05:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname def_expr }
function EFL_GFX_ARRANGEMENT_INTERFACE: PEfl_Class;
begin
  EFL_GFX_ARRANGEMENT_INTERFACE := efl_gfx_arrangement_interface_get;
end;


{$ENDIF read_implementation}

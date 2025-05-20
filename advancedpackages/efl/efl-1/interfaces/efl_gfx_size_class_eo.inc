{$IFDEF read_interface}


type
  PEfl_Gfx_Size_Class = ^TEfl_Gfx_Size_Class;
  TEfl_Gfx_Size_Class = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_SIZE_CLASS_INTERFACE: PEfl_Class;

function efl_gfx_size_class_interface_get: PEfl_Class; cdecl; external libefl;
function efl_gfx_size_class_set(obj: PEo; size_class: pchar; minw: longint; minh: longint; maxw: longint; maxh: longint): TEina_Bool; cdecl; external libefl;
function efl_gfx_size_class_get(obj: PEo; size_class: pchar; minw: Plongint; minh: Plongint; maxw: Plongint; maxh: Plongint): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_size_class_del(obj: PEo; size_class: pchar); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:30:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_SIZE_CLASS_INTERFACE: PEfl_Class;
begin
  EFL_GFX_SIZE_CLASS_INTERFACE := efl_gfx_size_class_interface_get;
end;
{$endif}


{$ENDIF read_implementation}

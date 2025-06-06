{$IFDEF read_interface}


type
  PEfl_Cached_Item = ^TEfl_Cached_Item;
  TEfl_Cached_Item = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CACHED_ITEM_INTERFACE: PEfl_Class;

function efl_cached_item_interface_get: PEfl_Class; cdecl; external libefl;
function efl_cached_item_memory_size_get(obj: PEo): dword; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:59:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CACHED_ITEM_INTERFACE: PEfl_Class;
begin
  EFL_CACHED_ITEM_INTERFACE := efl_cached_item_interface_get;
end;
{$endif}


{$ENDIF read_implementation}

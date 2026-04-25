

{$IFDEF read_function}
function nm_client_instance_flags_get_type: TGType; cdecl; external libnm;
function NM_TYPE_CLIENT_INSTANCE_FLAGS: TGType;

function nm_client_error_get_type: TGType; cdecl; external libnm;
function NM_TYPE_CLIENT_ERROR: TGType;
{$ENDIF read_function}



{$IFDEF read_implementation}


function NM_TYPE_CLIENT_INSTANCE_FLAGS: TGType;
begin
  NM_TYPE_CLIENT_INSTANCE_FLAGS := nm_client_instance_flags_get_type;
end;

function NM_TYPE_CLIENT_ERROR: TGType;
begin
  NM_TYPE_CLIENT_ERROR := nm_client_error_get_type;
end;


{$ENDIF read_implementation}

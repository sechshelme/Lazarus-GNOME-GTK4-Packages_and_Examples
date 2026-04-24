unit nm_enum_types;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function nm_client_instance_flags_get_type: TGType; cdecl; external libnm;
function NM_TYPE_CLIENT_INSTANCE_FLAGS: TGType;

function nm_client_error_get_type: TGType; cdecl; external libnm;
function NM_TYPE_CLIENT_ERROR: TGType;
{$ENDIF read_function}


implementation


function NM_TYPE_CLIENT_INSTANCE_FLAGS: TGType;
begin
  NM_TYPE_CLIENT_INSTANCE_FLAGS := nm_client_instance_flags_get_type;
end;

function NM_TYPE_CLIENT_ERROR: TGType;
begin
  NM_TYPE_CLIENT_ERROR := nm_client_error_get_type;
end;


end.

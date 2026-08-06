unit nm_enum_types;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function nm_client_instance_flags_get_type: TGType; cdecl; external libnm;
function nm_client_error_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:34:21 ===

function NM_TYPE_CLIENT_INSTANCE_FLAGS: TGType;
function NM_TYPE_CLIENT_ERROR: TGType;

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

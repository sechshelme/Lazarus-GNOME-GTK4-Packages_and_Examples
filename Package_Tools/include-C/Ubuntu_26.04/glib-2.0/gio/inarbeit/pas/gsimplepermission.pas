unit gsimplepermission;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gpermission;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function g_simple_permission_get_type: TGType; cdecl; external libgio2;
function g_simple_permission_new(allowed: Tgboolean): PGPermission; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:56:02 ===

function G_TYPE_SIMPLE_PERMISSION: TGType;
function G_SIMPLE_PERMISSION(obj: Pointer): PGSimplePermission;
function G_IS_SIMPLE_PERMISSION(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function G_TYPE_SIMPLE_PERMISSION: TGType;
begin
  G_TYPE_SIMPLE_PERMISSION := g_simple_permission_get_type;
end;

function G_SIMPLE_PERMISSION(obj: Pointer): PGSimplePermission;
begin
  Result := PGSimplePermission(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_PERMISSION));
end;

function G_IS_SIMPLE_PERMISSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_PERMISSION);
end;



end.

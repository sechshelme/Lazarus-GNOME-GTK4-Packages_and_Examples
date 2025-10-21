unit givalueinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_value_info_get_value(info: PGIValueInfo): Tint64_t; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:37:25 ===

function GI_TYPE_VALUE_INFO: TGType;
function GI_VALUE_INFO(obj: Pointer): PGIValueInfo;
function GI_IS_VALUE_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_VALUE_INFO: TGType;
begin
  GI_TYPE_VALUE_INFO := gi_value_info_get_type;
end;

function GI_VALUE_INFO(obj: Pointer): PGIValueInfo;
begin
  Result := PGIValueInfo(g_type_check_instance_cast(obj, GI_TYPE_VALUE_INFO));
end;

function GI_IS_VALUE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_VALUE_INFO);
end;



end.

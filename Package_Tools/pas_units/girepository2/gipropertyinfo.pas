unit gipropertyinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_property_info_get_flags(info: PGIPropertyInfo): TGParamFlags; cdecl; external libgirepository2;
function gi_property_info_get_type_info(info: PGIPropertyInfo): PGITypeInfo; cdecl; external libgirepository2;
function gi_property_info_get_ownership_transfer(info: PGIPropertyInfo): TGITransfer; cdecl; external libgirepository2;
function gi_property_info_get_setter(info: PGIPropertyInfo): PGIFunctionInfo; cdecl; external libgirepository2;
function gi_property_info_get_getter(info: PGIPropertyInfo): PGIFunctionInfo; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:37 ===

function GI_TYPE_PROPERTY_INFO: TGType;
function GI_PROPERTY_INFO(obj: Pointer): PGIPropertyInfo;
function GI_IS_PROPERTY_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_PROPERTY_INFO: TGType;
begin
  GI_TYPE_PROPERTY_INFO := gi_property_info_get_type;
end;

function GI_PROPERTY_INFO(obj: Pointer): PGIPropertyInfo;
begin
  Result := PGIPropertyInfo(g_type_check_instance_cast(obj, GI_TYPE_PROPERTY_INFO));
end;

function GI_IS_PROPERTY_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_PROPERTY_INFO);
end;



end.

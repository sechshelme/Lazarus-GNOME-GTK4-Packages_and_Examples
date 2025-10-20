unit gipropertyinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_PROPERTY_INFO(info: Pointer): boolean;

function g_property_info_get_flags(info: PGIPropertyInfo): TGParamFlags; cdecl; external libgirepository;
function g_property_info_get_type(info: PGIPropertyInfo): PGITypeInfo; cdecl; external libgirepository;
function g_property_info_get_ownership_transfer(info: PGIPropertyInfo): TGITransfer; cdecl; external libgirepository;
function g_property_info_get_setter(info: PGIPropertyInfo): PGIFunctionInfo; cdecl; external libgirepository;
function g_property_info_get_getter(info: PGIPropertyInfo): PGIFunctionInfo; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:05 ===


implementation


function GI_IS_PROPERTY_INFO(info: Pointer): boolean;
begin
  GI_IS_PROPERTY_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_PROPERTY;
end;


end.

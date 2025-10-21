unit gifieldinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gi_field_info_get_flags(info: PGIFieldInfo): TGIFieldInfoFlags; cdecl; external libgirepository2;
function gi_field_info_get_size(info: PGIFieldInfo): Tsize_t; cdecl; external libgirepository2;
function gi_field_info_get_offset(info: PGIFieldInfo): Tsize_t; cdecl; external libgirepository2;
function gi_field_info_get_type_info(info: PGIFieldInfo): PGITypeInfo; cdecl; external libgirepository2;
function gi_field_info_get_field(field_info: PGIFieldInfo; mem: pointer; value: PGIArgument): Tgboolean; cdecl; external libgirepository2;
function gi_field_info_set_field(field_info: PGIFieldInfo; mem: pointer; value: PGIArgument): Tgboolean; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:35:04 ===

function GI_TYPE_FIELD_INFO: TGType;
function GI_FIELD_INFO(obj: Pointer): PGIFieldInfo;
function GI_IS_FIELD_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_FIELD_INFO: TGType;
begin
  GI_TYPE_FIELD_INFO := gi_field_info_get_type;
end;

function GI_FIELD_INFO(obj: Pointer): PGIFieldInfo;
begin
  Result := PGIFieldInfo(g_type_check_instance_cast(obj, GI_TYPE_FIELD_INFO));
end;

function GI_IS_FIELD_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_FIELD_INFO);
end;



end.

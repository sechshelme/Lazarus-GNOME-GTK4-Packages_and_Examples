unit giflagsinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  // === Konventiert am: 21-10-25 13:35:10 ===

function GI_TYPE_FLAGS_INFO: TGType;
function GI_FLAGS_INFO(obj: Pointer): PGIFlagsInfo;
function GI_IS_FLAGS_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_FLAGS_INFO: TGType;
begin
  GI_TYPE_FLAGS_INFO := gi_flags_info_get_type;
end;

function GI_FLAGS_INFO(obj: Pointer): PGIFlagsInfo;
begin
  Result := PGIFlagsInfo(g_type_check_instance_cast(obj, GI_TYPE_FLAGS_INFO));
end;

function GI_IS_FLAGS_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_FLAGS_INFO);
end;



end.

unit ges_project_;

interface

uses
  fp_glib2, fp_gst_pbutils, ges_types, ges_formatter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE( Project, project, PROJECT); }
type
  TGESProjectClass = record
    parent_class: TGESAssetClass;
    asset_added: procedure(self: PGESProject; asset: PGESAsset); cdecl;
    asset_loading: procedure(self: PGESProject; asset: PGESAsset); cdecl;
    asset_removed: procedure(self: PGESProject; asset: PGESAsset); cdecl;
    missing_uri: function(self: PGESProject; error: PGError; wrong_asset: PGESAsset): Pgchar; cdecl;
    loading_error: function(self: PGESProject; error: PGError; id: Pgchar; extractable_type: TGType): Tgboolean; cdecl;
    loaded: function(self: PGESProject; timeline: PGESTimeline): Tgboolean; cdecl;
    loading: procedure(self: PGESProject; timeline: PGESTimeline); cdecl;
    _ges_reserved: array[0..(GES_PADDING - 1) - 1] of Tgpointer;
  end;
  PGESProjectClass = ^TGESProjectClass;

function ges_project_get_type: TGType; cdecl; external libges;
function ges_project_add_asset(project: PGESProject; asset: PGESAsset): Tgboolean; cdecl; external libges;
function ges_project_remove_asset(project: PGESProject; asset: PGESAsset): Tgboolean; cdecl; external libges;
function ges_project_list_assets(project: PGESProject; filter: TGType): PGList; cdecl; external libges;
function ges_project_save(project: PGESProject; timeline: PGESTimeline; uri: Pgchar; formatter_asset: PGESAsset; overwrite: Tgboolean;
  error: PPGError): Tgboolean; cdecl; external libges;
function ges_project_load(project: PGESProject; timeline: PGESTimeline; error: PPGError): Tgboolean; cdecl; external libges;
function ges_project_new(uri: Pgchar): PGESProject; cdecl; external libges;
function ges_project_get_uri(project: PGESProject): Pgchar; cdecl; external libges;
function ges_project_get_asset(project: PGESProject; id: Pgchar; extractable_type: TGType): PGESAsset; cdecl; external libges;
function ges_project_create_asset(project: PGESProject; id: Pgchar; extractable_type: TGType): Tgboolean; cdecl; external libges;
function ges_project_create_asset_sync(project: PGESProject; id: Pgchar; extractable_type: TGType; error: PPGError): PGESAsset; cdecl; external libges;
function ges_project_get_loading_assets(project: PGESProject): PGList; cdecl; external libges;
function ges_project_add_encoding_profile(project: PGESProject; profile: PGstEncodingProfile): Tgboolean; cdecl; external libges;
function ges_project_list_encoding_profiles(project: PGESProject): PGList; cdecl; external libges;
function ges_add_missing_uri_relocation_uri(uri: Pgchar; recurse: Tgboolean): Tgboolean; cdecl; external libges;
procedure ges_project_add_formatter(project: PGESProject; formatter: PGESFormatter); cdecl; external libges;

// === Konventiert am: 12-12-24 19:39:56 ===

function GES_TYPE_PROJECT: TGType;
function GES_PROJECT(obj: Pointer): PGESProject;
function GES_IS_PROJECT(obj: Pointer): Tgboolean;
function GES_PROJECT_CLASS(klass: Pointer): PGESProjectClass;
function GES_IS_PROJECT_CLASS(klass: Pointer): Tgboolean;
function GES_PROJECT_GET_CLASS(obj: Pointer): PGESProjectClass;

implementation

function GES_TYPE_PROJECT: TGType;
begin
  Result := ges_project_get_type;
end;

function GES_PROJECT(obj: Pointer): PGESProject;
begin
  Result := PGESProject(g_type_check_instance_cast(obj, GES_TYPE_PROJECT));
end;

function GES_IS_PROJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_PROJECT);
end;

function GES_PROJECT_CLASS(klass: Pointer): PGESProjectClass;
begin
  Result := PGESProjectClass(g_type_check_class_cast(klass, GES_TYPE_PROJECT));
end;

function GES_IS_PROJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_PROJECT);
end;

function GES_PROJECT_GET_CLASS(obj: Pointer): PGESProjectClass;
begin
  Result := PGESProjectClass(PGTypeInstance(obj)^.g_class);
end;




end.

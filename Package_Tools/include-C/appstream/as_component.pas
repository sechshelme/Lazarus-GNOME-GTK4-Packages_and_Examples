unit as_component;

interface

uses
  fp_glib2, fp_appstream, as_context, as_bundle, as_launchable, as_developer, as_screenshot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAsComponentKind = ^TAsComponentKind;
  TAsComponentKind = longint;
const
  AS_COMPONENT_KIND_UNKNOWN = 0;
  AS_COMPONENT_KIND_GENERIC = 1;
  AS_COMPONENT_KIND_DESKTOP_APP = 2;
  AS_COMPONENT_KIND_CONSOLE_APP = 3;
  AS_COMPONENT_KIND_WEB_APP = 4;
  AS_COMPONENT_KIND_SERVICE = 5;
  AS_COMPONENT_KIND_ADDON = 6;
  AS_COMPONENT_KIND_RUNTIME = 7;
  AS_COMPONENT_KIND_FONT = 8;
  AS_COMPONENT_KIND_CODEC = 9;
  AS_COMPONENT_KIND_INPUT_METHOD = 10;
  AS_COMPONENT_KIND_OPERATING_SYSTEM = 11;
  AS_COMPONENT_KIND_FIRMWARE = 12;
  AS_COMPONENT_KIND_DRIVER = 13;
  AS_COMPONENT_KIND_LOCALIZATION = 14;
  AS_COMPONENT_KIND_REPOSITORY = 15;
  AS_COMPONENT_KIND_ICON_THEME = 16;
  AS_COMPONENT_KIND_LAST = 17;

type
  PAsMergeKind = ^TAsMergeKind;
  TAsMergeKind = longint;
const
  AS_MERGE_KIND_NONE = 0;
  AS_MERGE_KIND_REPLACE = 1;
  AS_MERGE_KIND_APPEND = 2;
  AS_MERGE_KIND_REMOVE_COMPONENT = 3;
  AS_MERGE_KIND_LAST = 4;

type
  PAsComponentScope = ^TAsComponentScope;
  TAsComponentScope = longint;
const
  AS_COMPONENT_SCOPE_UNKNOWN = 0;
  AS_COMPONENT_SCOPE_SYSTEM = 1;
  AS_COMPONENT_SCOPE_USER = 2;
  AS_COMPONENT_SCOPE_LAST = 3;

type
  PAsUrlKind = ^TAsUrlKind;
  TAsUrlKind = longint;
const
  AS_URL_KIND_UNKNOWN = 0;
  AS_URL_KIND_HOMEPAGE = 1;
  AS_URL_KIND_BUGTRACKER = 2;
  AS_URL_KIND_FAQ = 3;
  AS_URL_KIND_HELP = 4;
  AS_URL_KIND_DONATION = 5;
  AS_URL_KIND_TRANSLATE = 6;
  AS_URL_KIND_CONTACT = 7;
  AS_URL_KIND_VCS_BROWSER = 8;
  AS_URL_KIND_CONTRIBUTE = 9;
  AS_URL_KIND_LAST = 10;

type
  TAsComponent = record
    parent_instance: TGObject;
  end;
  PAsComponent = ^TAsComponent;

  PAsComponentClass = ^TAsComponentClass;
  TAsComponentClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;

function as_component_get_type: TGType; cdecl; external libappstream;

function as_component_kind_to_string(kind: TAsComponentKind): Pgchar; cdecl; external libappstream;
function as_component_kind_from_string(kind_str: Pgchar): TAsComponentKind; cdecl; external libappstream;

function as_merge_kind_to_string(kind: TAsMergeKind): Pgchar; cdecl; external libappstream;
function as_merge_kind_from_string(kind_str: Pgchar): TAsMergeKind; cdecl; external libappstream;

function as_component_scope_to_string(scope: TAsComponentScope): Pgchar; cdecl; external libappstream;
function as_component_scope_from_string(scope_str: Pgchar): TAsComponentScope; cdecl; external libappstream;

function as_url_kind_to_string(url_kind: TAsUrlKind): Pgchar; cdecl; external libappstream;
function as_url_kind_from_string(url_kind: Pgchar): TAsUrlKind; cdecl; external libappstream;
function as_component_new: PAsComponent; cdecl; external libappstream;
function as_component_get_context(cpt: PAsComponent): PAsContext; cdecl; external libappstream;
procedure as_component_set_context(cpt: PAsComponent; context: PAsContext); cdecl; external libappstream;
procedure as_component_set_context_locale(cpt: PAsComponent; locale: Pgchar); cdecl; external libappstream;
function as_component_get_id(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_id(cpt: PAsComponent; value: Pgchar); cdecl; external libappstream;
function as_component_get_data_id(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_data_id(cpt: PAsComponent; value: Pgchar); cdecl; external libappstream;
function as_component_get_kind(cpt: PAsComponent): TAsComponentKind; cdecl; external libappstream;
procedure as_component_set_kind(cpt: PAsComponent; value: TAsComponentKind); cdecl; external libappstream;
function as_component_get_date_eol(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_date_eol(cpt: PAsComponent; date: Pgchar); cdecl; external libappstream;
function as_component_get_timestamp_eol(cpt: PAsComponent): Tguint64; cdecl; external libappstream;
function as_component_get_origin(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_origin(cpt: PAsComponent; origin: Pgchar); cdecl; external libappstream;
function as_component_get_branch(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_branch(cpt: PAsComponent; branch: Pgchar); cdecl; external libappstream;
function as_component_get_scope(cpt: PAsComponent): TAsComponentScope; cdecl; external libappstream;
procedure as_component_set_scope(cpt: PAsComponent; scope: TAsComponentScope); cdecl; external libappstream;
function as_component_get_pkgname(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_pkgname(cpt: PAsComponent; pkgname: Pgchar); cdecl; external libappstream;
function as_component_get_pkgnames(cpt: PAsComponent): PPgchar; cdecl; external libappstream;
procedure as_component_set_pkgnames(cpt: PAsComponent; packages: PPgchar); cdecl; external libappstream;
function as_component_get_source_pkgname(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_source_pkgname(cpt: PAsComponent; spkgname: Pgchar); cdecl; external libappstream;
function as_component_get_name(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_name(cpt: PAsComponent; value: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_component_get_summary(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_summary(cpt: PAsComponent; value: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_component_get_description(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_description(cpt: PAsComponent; value: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_component_get_launchables(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_launchable(cpt: PAsComponent; kind: TAsLaunchableKind): PAsLaunchable; cdecl; external libappstream;
procedure as_component_add_launchable(cpt: PAsComponent; launchable: PAsLaunchable); cdecl; external libappstream;
function as_component_get_metadata_license(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_metadata_license(cpt: PAsComponent; value: Pgchar); cdecl; external libappstream;
function as_component_get_project_license(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_project_license(cpt: PAsComponent; value: Pgchar); cdecl; external libappstream;
function as_component_is_floss(cpt: PAsComponent): Tgboolean; cdecl; external libappstream;
function as_component_get_project_group(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_project_group(cpt: PAsComponent; value: Pgchar); cdecl; external libappstream;
function as_component_get_developer(cpt: PAsComponent): PAsDeveloper; cdecl; external libappstream;
procedure as_component_set_developer(cpt: PAsComponent; developer: PAsDeveloper); cdecl; external libappstream;
function as_component_get_compulsory_for_desktops(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_set_compulsory_for_desktop(cpt: PAsComponent; desktop: Pgchar); cdecl; external libappstream;
function as_component_is_compulsory_for_desktop(cpt: PAsComponent; desktop: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_get_categories(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_category(cpt: PAsComponent; category: Pgchar); cdecl; external libappstream;
function as_component_has_category(cpt: PAsComponent; category: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_get_screenshots_all(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_screenshot(cpt: PAsComponent; sshot: PAsScreenshot); cdecl; external libappstream;
procedure as_component_sort_screenshots(cpt: PAsComponent; environment: Pgchar; style: Pgchar; prioritize_style: Tgboolean); cdecl; external libappstream;
function as_component_get_keywords(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_set_keywords(cpt: PAsComponent; new_keywords: PGPtrArray; locale: Pgchar; deep_copy: Tgboolean); cdecl; external libappstream;
procedure as_component_add_keyword(cpt: PAsComponent; keyword: Pgchar; locale: Pgchar); cdecl; external libappstream;
procedure as_component_clear_keywords(cpt: PAsComponent; locale: Pgchar); cdecl; external libappstream;
function as_component_get_icons(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_icon_by_size(cpt: PAsComponent; width: Tguint; height: Tguint): PAsIcon; cdecl; external libappstream;
function as_component_get_icon_stock(cpt: PAsComponent): PAsIcon; cdecl; external libappstream;
procedure as_component_add_icon(cpt: PAsComponent; icon: PAsIcon); cdecl; external libappstream;
function as_component_get_provided(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_provided(cpt: PAsComponent; prov: PAsProvided); cdecl; external libappstream;
function as_component_get_provided_for_kind(cpt: PAsComponent; kind: TAsProvidedKind): PAsProvided; cdecl; external libappstream;
procedure as_component_add_provided_item(cpt: PAsComponent; kind: TAsProvidedKind; item: Pgchar); cdecl; external libappstream;
function as_component_get_url(cpt: PAsComponent; url_kind: TAsUrlKind): Pgchar; cdecl; external libappstream;
procedure as_component_add_url(cpt: PAsComponent; url_kind: TAsUrlKind; url: Pgchar); cdecl; external libappstream;
function as_component_load_releases(cpt: PAsComponent; allow_net: Tgboolean; error: PPGError): PAsReleaseList; cdecl; external libappstream;
function as_component_get_releases_plain(cpt: PAsComponent): PAsReleaseList; cdecl; external libappstream;
procedure as_component_set_releases(cpt: PAsComponent; releases: PAsReleaseList); cdecl; external libappstream;
procedure as_component_add_release(cpt: PAsComponent; release: PAsRelease); cdecl; external libappstream;
function as_component_get_extends(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_extends(cpt: PAsComponent; cpt_id: Pgchar); cdecl; external libappstream;
function as_component_get_addons(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_addon(cpt: PAsComponent; addon: PAsComponent); cdecl; external libappstream;
function as_component_get_languages(cpt: PAsComponent): PGList; cdecl; external libappstream;
function as_component_get_language(cpt: PAsComponent; locale: Pgchar): Tgint; cdecl; external libappstream;
procedure as_component_add_language(cpt: PAsComponent; locale: Pgchar; percentage: Tgint); cdecl; external libappstream;
procedure as_component_clear_languages(cpt: PAsComponent); cdecl; external libappstream;
function as_component_get_translations(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_translation(cpt: PAsComponent; tr: PAsTranslation); cdecl; external libappstream;
function as_component_has_bundle(cpt: PAsComponent): Tgboolean; cdecl; external libappstream;
function as_component_get_bundles(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_bundle(cpt: PAsComponent; bundle_kind: TAsBundleKind): PAsBundle; cdecl; external libappstream;
procedure as_component_add_bundle(cpt: PAsComponent; bundle: PAsBundle); cdecl; external libappstream;
function as_component_get_suggested(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_suggested(cpt: PAsComponent; suggested: PAsSuggested); cdecl; external libappstream;
function as_component_get_search_tokens(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_search_matches(cpt: PAsComponent; term: Pgchar): Tguint; cdecl; external libappstream;
function as_component_search_matches_all(cpt: PAsComponent; terms: PPgchar): Tguint; cdecl; external libappstream;
function as_component_get_merge_kind(cpt: PAsComponent): TAsMergeKind; cdecl; external libappstream;
procedure as_component_set_merge_kind(cpt: PAsComponent; kind: TAsMergeKind); cdecl; external libappstream;
function as_component_is_member_of_category(cpt: PAsComponent; category: PAsCategory): Tgboolean; cdecl; external libappstream;
function as_component_is_ignored(cpt: PAsComponent): Tgboolean; cdecl; external libappstream;
function as_component_is_valid(cpt: PAsComponent): Tgboolean; cdecl; external libappstream;
function as_component_to_string(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
function as_component_get_priority(cpt: PAsComponent): Tgint; cdecl; external libappstream;
procedure as_component_set_priority(cpt: PAsComponent; priority: Tgint); cdecl; external libappstream;
function as_component_get_custom(cpt: PAsComponent): PGHashTable; cdecl; external libappstream;
function as_component_get_custom_value(cpt: PAsComponent; key: Pgchar): Pgchar; cdecl; external libappstream;
function as_component_insert_custom_value(cpt: PAsComponent; key: Pgchar; value: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_get_content_ratings(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_content_rating(cpt: PAsComponent; kind: Pgchar): PAsContentRating; cdecl; external libappstream;
procedure as_component_add_content_rating(cpt: PAsComponent; content_rating: PAsContentRating); cdecl; external libappstream;
function as_component_get_requires(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_recommends(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
function as_component_get_supports(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_relation(cpt: PAsComponent; relation: PAsRelation); cdecl; external libappstream;
function as_component_check_relations(cpt: PAsComponent; sysinfo: PAsSystemInfo; pool: PAsPool; rel_kind: TAsRelationKind): PGPtrArray; cdecl; external libappstream;
function as_component_get_system_compatibility_score(cpt: PAsComponent; sysinfo: PAsSystemInfo; is_template: Tgboolean; results: PPGPtrArray): Tgint; cdecl; external libappstream;
function as_component_get_replaces(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_replaces(cpt: PAsComponent; cid: Pgchar); cdecl; external libappstream;
function as_component_get_agreements(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_agreement(cpt: PAsComponent; agreement: PAsAgreement); cdecl; external libappstream;
function as_component_get_agreement_by_kind(cpt: PAsComponent; kind: TAsAgreementKind): PAsAgreement; cdecl; external libappstream;
function as_component_get_branding(cpt: PAsComponent): PAsBranding; cdecl; external libappstream;
procedure as_component_set_branding(cpt: PAsComponent; branding: PAsBranding); cdecl; external libappstream;
procedure as_component_clear_tags(cpt: PAsComponent); cdecl; external libappstream;
function as_component_add_tag(cpt: PAsComponent; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_remove_tag(cpt: PAsComponent; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_has_tag(cpt: PAsComponent; ns: Pgchar; tag: Pgchar): Tgboolean; cdecl; external libappstream;
function as_component_get_references(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_reference(cpt: PAsComponent; reference: PAsReference); cdecl; external libappstream;
function as_component_get_name_variant_suffix(cpt: PAsComponent): Pgchar; cdecl; external libappstream;
procedure as_component_set_name_variant_suffix(cpt: PAsComponent; value: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_component_get_sort_score(cpt: PAsComponent): Tguint; cdecl; external libappstream;
procedure as_component_set_sort_score(cpt: PAsComponent; score: Tguint); cdecl; external libappstream;
function as_component_get_reviews(cpt: PAsComponent): PGPtrArray; cdecl; external libappstream;
procedure as_component_add_review(cpt: PAsComponent; review: PAsReview); cdecl; external libappstream;
function as_component_get_name_table(cpt: PAsComponent): PGHashTable; cdecl; external libappstream;
function as_component_get_summary_table(cpt: PAsComponent): PGHashTable; cdecl; external libappstream;
function as_component_get_keywords_table(cpt: PAsComponent): PGHashTable; cdecl; external libappstream;
function as_component_load_from_bytes(cpt: PAsComponent; context: PAsContext; format: TAsFormatKind; bytes: PGBytes; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_component_to_xml_data(cpt: PAsComponent; context: PAsContext; error: PPGError): Pgchar; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:31 ===

function AS_TYPE_COMPONENT: TGType;
function AS_COMPONENT(obj: Pointer): PAsComponent;
function AS_IS_COMPONENT(obj: Pointer): Tgboolean;
function AS_COMPONENT_CLASS(klass: Pointer): PAsComponentClass;
function AS_IS_COMPONENT_CLASS(klass: Pointer): Tgboolean;
function AS_COMPONENT_GET_CLASS(obj: Pointer): PAsComponentClass;

implementation

function AS_TYPE_COMPONENT: TGType;
begin
  Result := as_component_get_type;
end;

function AS_COMPONENT(obj: Pointer): PAsComponent;
begin
  Result := PAsComponent(g_type_check_instance_cast(obj, AS_TYPE_COMPONENT));
end;

function AS_IS_COMPONENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_COMPONENT);
end;

function AS_COMPONENT_CLASS(klass: Pointer): PAsComponentClass;
begin
  Result := PAsComponentClass(g_type_check_class_cast(klass, AS_TYPE_COMPONENT));
end;

function AS_IS_COMPONENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_COMPONENT);
end;

function AS_COMPONENT_GET_CLASS(obj: Pointer): PAsComponentClass;
begin
  Result := PAsComponentClass(PGTypeInstance(obj)^.g_class);
end;

end.

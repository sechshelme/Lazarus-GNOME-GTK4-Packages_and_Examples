
unit as_component;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_component.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_component
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAsAgreement  = ^AsAgreement;
PAsBranding  = ^AsBranding;
PAsBundle  = ^AsBundle;
PAsCategory  = ^AsCategory;
PAsComponent  = ^AsComponent;
PAsComponentClass  = ^AsComponentClass;
PAsComponentKind  = ^AsComponentKind;
PAsComponentScope  = ^AsComponentScope;
PAsContentRating  = ^AsContentRating;
PAsContext  = ^AsContext;
PAsDeveloper  = ^AsDeveloper;
PAsIcon  = ^AsIcon;
PAsLaunchable  = ^AsLaunchable;
PAsMergeKind  = ^AsMergeKind;
PAsPool  = ^AsPool;
PAsProvided  = ^AsProvided;
PAsReference  = ^AsReference;
PAsRelation  = ^AsRelation;
PAsRelease  = ^AsRelease;
PAsReleaseList  = ^AsReleaseList;
PAsReview  = ^AsReview;
PAsScreenshot  = ^AsScreenshot;
PAsSuggested  = ^AsSuggested;
PAsSystemInfo  = ^AsSystemInfo;
PAsTranslation  = ^AsTranslation;
PAsUrlKind  = ^AsUrlKind;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGList  = ^GList;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_COMPONENT_H}
{$define __AS_COMPONENT_H}
{$include <glib-object.h>}
{$include "as-context.h"}
{$include "as-enum-types.h"}
{$include "as-provided.h"}
{$include "as-icon.h"}
{$include "as-screenshot.h"}
{$include "as-release-list.h"}
{$include "as-developer.h"}
{$include "as-translation.h"}
{$include "as-suggested.h"}
{$include "as-category.h"}
{$include "as-bundle.h"}
{$include "as-content-rating.h"}
{$include "as-launchable.h"}
{$include "as-relation.h"}
{$include "as-agreement.h"}
{$include "as-branding.h"}
{$include "as-review.h"}
{$include "as-reference.h"}
{ forward declarations  }
type

{ was #define dname def_expr }
function AS_TYPE_COMPONENT : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsComponent, as_component, AS, COMPONENT, GObject) }
{< private > }
type
  PAsComponentClass = ^TAsComponentClass;
  TAsComponentClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsComponentKind:
 * @AS_COMPONENT_KIND_UNKNOWN:		Type invalid or not known
 * @AS_COMPONENT_KIND_GENERIC:		A generic (= without specialized type) component
 * @AS_COMPONENT_KIND_DESKTOP_APP:	An application with a .desktop-file
 * @AS_COMPONENT_KIND_CONSOLE_APP:	A console application
 * @AS_COMPONENT_KIND_WEB_APP:		A web application
 * @AS_COMPONENT_KIND_SERVICE:		A system service launched by the init system
 * @AS_COMPONENT_KIND_ADDON:		An extension of existing software, which does not run standalone
 * @AS_COMPONENT_KIND_RUNTIME:		An application runtime platform
 * @AS_COMPONENT_KIND_FONT:		A font
 * @AS_COMPONENT_KIND_CODEC:		A multimedia codec
 * @AS_COMPONENT_KIND_INPUT_METHOD:	An input-method provider
 * @AS_COMPONENT_KIND_OPERATING_SYSTEM: A computer operating system
 * @AS_COMPONENT_KIND_FIRMWARE:		Firmware
 * @AS_COMPONENT_KIND_DRIVER:		A driver
 * @AS_COMPONENT_KIND_LOCALIZATION:	Software localization (usually l10n resources)
 * @AS_COMPONENT_KIND_REPOSITORY:	A remote software or data source
 * @AS_COMPONENT_KIND_ICON_THEME:	An icon theme following the XDG specification
 *
 * The type of an #AsComponent.
 * }
{< private > }

  PAsComponentKind = ^TAsComponentKind;
  TAsComponentKind =  Longint;
  Const
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
;
(* Const before type ignored *)

function as_component_kind_to_string(kind:TAsComponentKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_component_kind_from_string(kind_str:Pgchar):TAsComponentKind;cdecl;external;
{*
 * AsMergeKind:
 * @AS_MERGE_KIND_NONE:		No merge is happening.
 * @AS_MERGE_KIND_REPLACE:	Merge replacing data of target.
 * @AS_MERGE_KIND_APPEND:	Merge appending data to target.
 * @AS_MERGE_KIND_REMOVE_COMPONENT: Remove the entire component if it matches.
 *
 * Defines how #AsComponent data should be merged if the component is
 * set for merge.
 * }
{< private > }
type
  PAsMergeKind = ^TAsMergeKind;
  TAsMergeKind =  Longint;
  Const
    AS_MERGE_KIND_NONE = 0;
    AS_MERGE_KIND_REPLACE = 1;
    AS_MERGE_KIND_APPEND = 2;
    AS_MERGE_KIND_REMOVE_COMPONENT = 3;
    AS_MERGE_KIND_LAST = 4;
;
(* Const before type ignored *)

function as_merge_kind_to_string(kind:TAsMergeKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_merge_kind_from_string(kind_str:Pgchar):TAsMergeKind;cdecl;external;
{*
 * AsComponentScope:
 * @AS_COMPONENT_SCOPE_UNKNOWN:		Unknown scope
 * @AS_COMPONENT_SCOPE_SYSTEM:		System scope
 * @AS_COMPONENT_SCOPE_USER:		User scope
 *
 * Scope of the #AsComponent (system-wide or user-scope)
 * }
{< private > }
type
  PAsComponentScope = ^TAsComponentScope;
  TAsComponentScope =  Longint;
  Const
    AS_COMPONENT_SCOPE_UNKNOWN = 0;
    AS_COMPONENT_SCOPE_SYSTEM = 1;
    AS_COMPONENT_SCOPE_USER = 2;
    AS_COMPONENT_SCOPE_LAST = 3;
;
(* Const before type ignored *)

function as_component_scope_to_string(scope:TAsComponentScope):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_component_scope_from_string(scope_str:Pgchar):TAsComponentScope;cdecl;external;
{*
 * AsUrlKind:
 * @AS_URL_KIND_UNKNOWN:	Type invalid or not known
 * @AS_URL_KIND_HOMEPAGE:	Project homepage
 * @AS_URL_KIND_BUGTRACKER:	Bugtracker
 * @AS_URL_KIND_FAQ:		FAQ page
 * @AS_URL_KIND_HELP:		Help manual
 * @AS_URL_KIND_DONATION:	Page with information about how to donate to the project
 * @AS_URL_KIND_TRANSLATE:	Page with instructions on how to translate the project / submit translations.
 * @AS_URL_KIND_CONTACT:	Contact the developers
 * @AS_URL_KIND_VCS_BROWSER:	Browse the source code
 * @AS_URL_KIND_CONTRIBUTE:	Help developing
 *
 * The URL type.
 * }
{< private > }
type
  PAsUrlKind = ^TAsUrlKind;
  TAsUrlKind =  Longint;
  Const
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
;
(* Const before type ignored *)

function as_url_kind_to_string(url_kind:TAsUrlKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_url_kind_from_string(url_kind:Pgchar):TAsUrlKind;cdecl;external;
function as_component_new:PAsComponent;cdecl;external;
function as_component_get_context(cpt:PAsComponent):PAsContext;cdecl;external;
procedure as_component_set_context(cpt:PAsComponent; context:PAsContext);cdecl;external;
(* Const before type ignored *)
procedure as_component_set_context_locale(cpt:PAsComponent; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_id(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_id(cpt:PAsComponent; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_data_id(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_data_id(cpt:PAsComponent; value:Pgchar);cdecl;external;
function as_component_get_kind(cpt:PAsComponent):TAsComponentKind;cdecl;external;
procedure as_component_set_kind(cpt:PAsComponent; value:TAsComponentKind);cdecl;external;
(* Const before type ignored *)
function as_component_get_date_eol(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_date_eol(cpt:PAsComponent; date:Pgchar);cdecl;external;
function as_component_get_timestamp_eol(cpt:PAsComponent):Tguint64;cdecl;external;
(* Const before type ignored *)
function as_component_get_origin(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_origin(cpt:PAsComponent; origin:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_branch(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_branch(cpt:PAsComponent; branch:Pgchar);cdecl;external;
function as_component_get_scope(cpt:PAsComponent):TAsComponentScope;cdecl;external;
procedure as_component_set_scope(cpt:PAsComponent; scope:TAsComponentScope);cdecl;external;
function as_component_get_pkgname(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_pkgname(cpt:PAsComponent; pkgname:Pgchar);cdecl;external;
function as_component_get_pkgnames(cpt:PAsComponent):^Pgchar;cdecl;external;
procedure as_component_set_pkgnames(cpt:PAsComponent; packages:PPgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_source_pkgname(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_source_pkgname(cpt:PAsComponent; spkgname:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_name(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_set_name(cpt:PAsComponent; value:Pgchar; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_summary(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_set_summary(cpt:PAsComponent; value:Pgchar; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_description(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_set_description(cpt:PAsComponent; value:Pgchar; locale:Pgchar);cdecl;external;
function as_component_get_launchables(cpt:PAsComponent):PGPtrArray;cdecl;external;
function as_component_get_launchable(cpt:PAsComponent; kind:TAsLaunchableKind):PAsLaunchable;cdecl;external;
procedure as_component_add_launchable(cpt:PAsComponent; launchable:PAsLaunchable);cdecl;external;
(* Const before type ignored *)
function as_component_get_metadata_license(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_metadata_license(cpt:PAsComponent; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_project_license(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_project_license(cpt:PAsComponent; value:Pgchar);cdecl;external;
function as_component_is_floss(cpt:PAsComponent):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_component_get_project_group(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_project_group(cpt:PAsComponent; value:Pgchar);cdecl;external;
function as_component_get_developer(cpt:PAsComponent):PAsDeveloper;cdecl;external;
procedure as_component_set_developer(cpt:PAsComponent; developer:PAsDeveloper);cdecl;external;
function as_component_get_compulsory_for_desktops(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_compulsory_for_desktop(cpt:PAsComponent; desktop:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_is_compulsory_for_desktop(cpt:PAsComponent; desktop:Pgchar):Tgboolean;cdecl;external;
function as_component_get_categories(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_category(cpt:PAsComponent; category:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_has_category(cpt:PAsComponent; category:Pgchar):Tgboolean;cdecl;external;
function as_component_get_screenshots_all(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_screenshot(cpt:PAsComponent; sshot:PAsScreenshot);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_sort_screenshots(cpt:PAsComponent; environment:Pgchar; style:Pgchar; prioritize_style:Tgboolean);cdecl;external;
function as_component_get_keywords(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_component_set_keywords(cpt:PAsComponent; new_keywords:PGPtrArray; locale:Pgchar; deep_copy:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_add_keyword(cpt:PAsComponent; keyword:Pgchar; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure as_component_clear_keywords(cpt:PAsComponent; locale:Pgchar);cdecl;external;
function as_component_get_icons(cpt:PAsComponent):PGPtrArray;cdecl;external;
function as_component_get_icon_by_size(cpt:PAsComponent; width:Tguint; height:Tguint):PAsIcon;cdecl;external;
function as_component_get_icon_stock(cpt:PAsComponent):PAsIcon;cdecl;external;
procedure as_component_add_icon(cpt:PAsComponent; icon:PAsIcon);cdecl;external;
function as_component_get_provided(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_provided(cpt:PAsComponent; prov:PAsProvided);cdecl;external;
function as_component_get_provided_for_kind(cpt:PAsComponent; kind:TAsProvidedKind):PAsProvided;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_provided_item(cpt:PAsComponent; kind:TAsProvidedKind; item:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_component_get_url(cpt:PAsComponent; url_kind:TAsUrlKind):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_url(cpt:PAsComponent; url_kind:TAsUrlKind; url:Pgchar);cdecl;external;
function as_component_load_releases(cpt:PAsComponent; allow_net:Tgboolean; error:PPGError):PAsReleaseList;cdecl;external;
function as_component_get_releases_plain(cpt:PAsComponent):PAsReleaseList;cdecl;external;
procedure as_component_set_releases(cpt:PAsComponent; releases:PAsReleaseList);cdecl;external;
procedure as_component_add_release(cpt:PAsComponent; release:PAsRelease);cdecl;external;
function as_component_get_extends(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_extends(cpt:PAsComponent; cpt_id:Pgchar);cdecl;external;
function as_component_get_addons(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_addon(cpt:PAsComponent; addon:PAsComponent);cdecl;external;
function as_component_get_languages(cpt:PAsComponent):PGList;cdecl;external;
(* Const before type ignored *)
function as_component_get_language(cpt:PAsComponent; locale:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_language(cpt:PAsComponent; locale:Pgchar; percentage:Tgint);cdecl;external;
procedure as_component_clear_languages(cpt:PAsComponent);cdecl;external;
function as_component_get_translations(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_translation(cpt:PAsComponent; tr:PAsTranslation);cdecl;external;
function as_component_has_bundle(cpt:PAsComponent):Tgboolean;cdecl;external;
function as_component_get_bundles(cpt:PAsComponent):PGPtrArray;cdecl;external;
function as_component_get_bundle(cpt:PAsComponent; bundle_kind:TAsBundleKind):PAsBundle;cdecl;external;
procedure as_component_add_bundle(cpt:PAsComponent; bundle:PAsBundle);cdecl;external;
function as_component_get_suggested(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_suggested(cpt:PAsComponent; suggested:PAsSuggested);cdecl;external;
function as_component_get_search_tokens(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function as_component_search_matches(cpt:PAsComponent; term:Pgchar):Tguint;cdecl;external;
function as_component_search_matches_all(cpt:PAsComponent; terms:PPgchar):Tguint;cdecl;external;
function as_component_get_merge_kind(cpt:PAsComponent):TAsMergeKind;cdecl;external;
procedure as_component_set_merge_kind(cpt:PAsComponent; kind:TAsMergeKind);cdecl;external;
function as_component_is_member_of_category(cpt:PAsComponent; category:PAsCategory):Tgboolean;cdecl;external;
function as_component_is_ignored(cpt:PAsComponent):Tgboolean;cdecl;external;
function as_component_is_valid(cpt:PAsComponent):Tgboolean;cdecl;external;
function as_component_to_string(cpt:PAsComponent):Pgchar;cdecl;external;
function as_component_get_priority(cpt:PAsComponent):Tgint;cdecl;external;
procedure as_component_set_priority(cpt:PAsComponent; priority:Tgint);cdecl;external;
function as_component_get_custom(cpt:PAsComponent):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_component_get_custom_value(cpt:PAsComponent; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_component_insert_custom_value(cpt:PAsComponent; key:Pgchar; value:Pgchar):Tgboolean;cdecl;external;
function as_component_get_content_ratings(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function as_component_get_content_rating(cpt:PAsComponent; kind:Pgchar):PAsContentRating;cdecl;external;
procedure as_component_add_content_rating(cpt:PAsComponent; content_rating:PAsContentRating);cdecl;external;
function as_component_get_requires(cpt:PAsComponent):PGPtrArray;cdecl;external;
function as_component_get_recommends(cpt:PAsComponent):PGPtrArray;cdecl;external;
function as_component_get_supports(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_relation(cpt:PAsComponent; relation:PAsRelation);cdecl;external;
function as_component_check_relations(cpt:PAsComponent; sysinfo:PAsSystemInfo; pool:PAsPool; rel_kind:TAsRelationKind):PGPtrArray;cdecl;external;
function as_component_get_system_compatibility_score(cpt:PAsComponent; sysinfo:PAsSystemInfo; is_template:Tgboolean; results:PPGPtrArray):Tgint;cdecl;external;
function as_component_get_replaces(cpt:PAsComponent):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_component_add_replaces(cpt:PAsComponent; cid:Pgchar);cdecl;external;
function as_component_get_agreements(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_agreement(cpt:PAsComponent; agreement:PAsAgreement);cdecl;external;
function as_component_get_agreement_by_kind(cpt:PAsComponent; kind:TAsAgreementKind):PAsAgreement;cdecl;external;
function as_component_get_branding(cpt:PAsComponent):PAsBranding;cdecl;external;
procedure as_component_set_branding(cpt:PAsComponent; branding:PAsBranding);cdecl;external;
procedure as_component_clear_tags(cpt:PAsComponent);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_component_add_tag(cpt:PAsComponent; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_component_remove_tag(cpt:PAsComponent; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_component_has_tag(cpt:PAsComponent; ns:Pgchar; tag:Pgchar):Tgboolean;cdecl;external;
function as_component_get_references(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_reference(cpt:PAsComponent; reference:PAsReference);cdecl;external;
(* Const before type ignored *)
function as_component_get_name_variant_suffix(cpt:PAsComponent):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure as_component_set_name_variant_suffix(cpt:PAsComponent; value:Pgchar; locale:Pgchar);cdecl;external;
function as_component_get_sort_score(cpt:PAsComponent):Tguint;cdecl;external;
procedure as_component_set_sort_score(cpt:PAsComponent; score:Tguint);cdecl;external;
function as_component_get_reviews(cpt:PAsComponent):PGPtrArray;cdecl;external;
procedure as_component_add_review(cpt:PAsComponent; review:PAsReview);cdecl;external;
function as_component_get_name_table(cpt:PAsComponent):PGHashTable;cdecl;external;
function as_component_get_summary_table(cpt:PAsComponent):PGHashTable;cdecl;external;
function as_component_get_keywords_table(cpt:PAsComponent):PGHashTable;cdecl;external;
function as_component_load_from_bytes(cpt:PAsComponent; context:PAsContext; format:TAsFormatKind; bytes:PGBytes; error:PPGError):Tgboolean;cdecl;external;
function as_component_to_xml_data(cpt:PAsComponent; context:PAsContext; error:PPGError):Pgchar;cdecl;external;
{$endif}
{ __AS_COMPONENT_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_COMPONENT : longint; { return type might be wrong }
  begin
    AS_TYPE_COMPONENT:=as_component_get_type;
  end;


end.

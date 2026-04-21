
unit fwupd_release;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_release.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_release.h
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
PFwupdRelease  = ^FwupdRelease;
PFwupdReleaseClass  = ^FwupdReleaseClass;
PFwupdReport  = ^FwupdReport;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "fwupd-enums.h"}
{$include "fwupd-report.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_RELEASE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdRelease, fwupd_release, FWUPD, RELEASE, GObject) }
{< private > }
type
  PFwupdReleaseClass = ^TFwupdReleaseClass;
  TFwupdReleaseClass = record
      parent_class : TGObjectClass;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;


function fwupd_release_new:PFwupdRelease;cdecl;external;
function fwupd_release_to_string(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_version(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_version(self:PFwupdRelease; version:Pgchar);cdecl;external;
{/G_DEPRECATED_FOR(fwupd_release_get_locations) }
(* Const before type ignored *)
function fwupd_release_get_uri(self:PFwupdRelease):Pgchar;cdecl;external;
{/G_DEPRECATED_FOR(fwupd_release_add_location) }
(* Const before type ignored *)
procedure fwupd_release_set_uri(self:PFwupdRelease; uri:Pgchar);cdecl;external;
function fwupd_release_get_locations(self:PFwupdRelease):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_add_location(self:PFwupdRelease; location:Pgchar);cdecl;external;
function fwupd_release_get_issues(self:PFwupdRelease):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_add_issue(self:PFwupdRelease; issue:Pgchar);cdecl;external;
function fwupd_release_get_categories(self:PFwupdRelease):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_add_category(self:PFwupdRelease; category:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_has_category(self:PFwupdRelease; category:Pgchar):Tgboolean;cdecl;external;
function fwupd_release_get_checksums(self:PFwupdRelease):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_add_checksum(self:PFwupdRelease; checksum:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_has_checksum(self:PFwupdRelease; checksum:Pgchar):Tgboolean;cdecl;external;
function fwupd_release_get_tags(self:PFwupdRelease):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_add_tag(self:PFwupdRelease; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_has_tag(self:PFwupdRelease; tag:Pgchar):Tgboolean;cdecl;external;
function fwupd_release_get_metadata(self:PFwupdRelease):PGHashTable;cdecl;external;
procedure fwupd_release_add_metadata(self:PFwupdRelease; hash:PGHashTable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_release_add_metadata_item(self:PFwupdRelease; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fwupd_release_get_metadata_item(self:PFwupdRelease; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_filename(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_filename(self:PFwupdRelease; filename:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_protocol(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_protocol(self:PFwupdRelease; protocol:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_id(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_id(self:PFwupdRelease; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_appstream_id(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_appstream_id(self:PFwupdRelease; appstream_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_detach_caption(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_detach_caption(self:PFwupdRelease; detach_caption:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_detach_image(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_detach_image(self:PFwupdRelease; detach_image:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_remote_id(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_remote_id(self:PFwupdRelease; remote_id:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_vendor(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_vendor(self:PFwupdRelease; vendor:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_name(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_name(self:PFwupdRelease; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_name_variant_suffix(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_name_variant_suffix(self:PFwupdRelease; name_variant_suffix:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_summary(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_summary(self:PFwupdRelease; summary:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_branch(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_branch(self:PFwupdRelease; branch:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_description(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_description(self:PFwupdRelease; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_homepage(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_homepage(self:PFwupdRelease; homepage:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_details_url(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_details_url(self:PFwupdRelease; details_url:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_source_url(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_source_url(self:PFwupdRelease; source_url:Pgchar);cdecl;external;
function fwupd_release_get_size(self:PFwupdRelease):Tguint64;cdecl;external;
procedure fwupd_release_set_size(self:PFwupdRelease; size:Tguint64);cdecl;external;
function fwupd_release_get_created(self:PFwupdRelease):Tguint64;cdecl;external;
procedure fwupd_release_set_created(self:PFwupdRelease; created:Tguint64);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_license(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_license(self:PFwupdRelease; license:Pgchar);cdecl;external;
{//G_DEPRECATED_FOR(fwupd_release_get_flags) }
function fwupd_release_get_trust_flags(self:PFwupdRelease):TFwupdTrustFlags;cdecl;external;
{//G_DEPRECATED_FOR(fwupd_release_set_flags) }
procedure fwupd_release_set_trust_flags(self:PFwupdRelease; trust_flags:TFwupdTrustFlags);cdecl;external;
function fwupd_release_get_flags(self:PFwupdRelease):TFwupdReleaseFlags;cdecl;external;
procedure fwupd_release_set_flags(self:PFwupdRelease; flags:TFwupdReleaseFlags);cdecl;external;
procedure fwupd_release_add_flag(self:PFwupdRelease; flag:TFwupdReleaseFlags);cdecl;external;
procedure fwupd_release_remove_flag(self:PFwupdRelease; flag:TFwupdReleaseFlags);cdecl;external;
function fwupd_release_has_flag(self:PFwupdRelease; flag:TFwupdReleaseFlags):Tgboolean;cdecl;external;
function fwupd_release_get_urgency(self:PFwupdRelease):TFwupdReleaseUrgency;cdecl;external;
procedure fwupd_release_set_urgency(self:PFwupdRelease; urgency:TFwupdReleaseUrgency);cdecl;external;
function fwupd_release_get_install_duration(self:PFwupdRelease):Tguint32;cdecl;external;
procedure fwupd_release_set_install_duration(self:PFwupdRelease; duration:Tguint32);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_update_message(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_update_message(self:PFwupdRelease; update_message:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_release_get_update_image(self:PFwupdRelease):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_release_set_update_image(self:PFwupdRelease; update_image:Pgchar);cdecl;external;
function fwupd_release_get_reports(self:PFwupdRelease):PGPtrArray;cdecl;external;
procedure fwupd_release_add_report(self:PFwupdRelease; report:PFwupdReport);cdecl;external;
function fwupd_release_match_flags(self:PFwupdRelease; include:TFwupdReleaseFlags; exclude:TFwupdReleaseFlags):Tgboolean;cdecl;external;
function fwupd_release_array_filter_flags(rels:PGPtrArray; include:TFwupdReleaseFlags; exclude:TFwupdReleaseFlags; error:PPGError):PGPtrArray;cdecl;external;
function fwupd_release_from_variant(value:PGVariant):PFwupdRelease;cdecl;external;
function fwupd_release_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_RELEASE : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_RELEASE:=fwupd_release_get_type;
  end;


end.

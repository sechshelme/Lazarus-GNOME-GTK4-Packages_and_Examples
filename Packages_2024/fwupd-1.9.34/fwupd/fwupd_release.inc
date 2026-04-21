
  {$IFDEF read_struct}
type
  TFwupdRelease = record
    parent_instance: TGObject;
  end;
  PFwupdRelease = ^TFwupdRelease;

  TFwupdReleaseClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdReleaseClass = ^TFwupdReleaseClass;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function fwupd_release_get_type: TGType; cdecl; external libfwupd;
function fwupd_release_new: PFwupdRelease; cdecl; external libfwupd;
function fwupd_release_to_string(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
function fwupd_release_get_version(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_version(self: PFwupdRelease; version: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_uri(self: PFwupdRelease): Pgchar; cdecl; external libfwupd; deprecated;
procedure fwupd_release_set_uri(self: PFwupdRelease; uri: Pgchar); cdecl; external libfwupd; deprecated;
function fwupd_release_get_locations(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_location(self: PFwupdRelease; location: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_issues(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_issue(self: PFwupdRelease; issue: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_categories(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_category(self: PFwupdRelease; category: Pgchar); cdecl; external libfwupd;
function fwupd_release_has_category(self: PFwupdRelease; category: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_release_get_checksums(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_checksum(self: PFwupdRelease; checksum: Pgchar); cdecl; external libfwupd;
function fwupd_release_has_checksum(self: PFwupdRelease; checksum: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_release_get_tags(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_tag(self: PFwupdRelease; tag: Pgchar); cdecl; external libfwupd;
function fwupd_release_has_tag(self: PFwupdRelease; tag: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_release_get_metadata(self: PFwupdRelease): PGHashTable; cdecl; external libfwupd;
procedure fwupd_release_add_metadata(self: PFwupdRelease; hash: PGHashTable); cdecl; external libfwupd;
procedure fwupd_release_add_metadata_item(self: PFwupdRelease; key: Pgchar; value: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_metadata_item(self: PFwupdRelease; key: Pgchar): Pgchar; cdecl; external libfwupd;
function fwupd_release_get_filename(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_filename(self: PFwupdRelease; filename: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_protocol(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_protocol(self: PFwupdRelease; protocol: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_id(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_id(self: PFwupdRelease; id: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_appstream_id(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_appstream_id(self: PFwupdRelease; appstream_id: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_detach_caption(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_detach_caption(self: PFwupdRelease; detach_caption: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_detach_image(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_detach_image(self: PFwupdRelease; detach_image: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_remote_id(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_remote_id(self: PFwupdRelease; remote_id: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_vendor(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_vendor(self: PFwupdRelease; vendor: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_name(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_name(self: PFwupdRelease; name: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_name_variant_suffix(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_name_variant_suffix(self: PFwupdRelease; name_variant_suffix: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_summary(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_summary(self: PFwupdRelease; summary: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_branch(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_branch(self: PFwupdRelease; branch: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_description(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_description(self: PFwupdRelease; description: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_homepage(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_homepage(self: PFwupdRelease; homepage: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_details_url(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_details_url(self: PFwupdRelease; details_url: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_source_url(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_source_url(self: PFwupdRelease; source_url: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_size(self: PFwupdRelease): Tguint64; cdecl; external libfwupd;
procedure fwupd_release_set_size(self: PFwupdRelease; size: Tguint64); cdecl; external libfwupd;
function fwupd_release_get_created(self: PFwupdRelease): Tguint64; cdecl; external libfwupd;
procedure fwupd_release_set_created(self: PFwupdRelease; created: Tguint64); cdecl; external libfwupd;
function fwupd_release_get_license(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_license(self: PFwupdRelease; license: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_trust_flags(self: PFwupdRelease): TFwupdTrustFlags; cdecl; external libfwupd; deprecated;
procedure fwupd_release_set_trust_flags(self: PFwupdRelease; trust_flags: TFwupdTrustFlags); cdecl; external libfwupd; deprecated;
function fwupd_release_get_flags(self: PFwupdRelease): TFwupdReleaseFlags; cdecl; external libfwupd;
procedure fwupd_release_set_flags(self: PFwupdRelease; flags: TFwupdReleaseFlags); cdecl; external libfwupd;
procedure fwupd_release_add_flag(self: PFwupdRelease; flag: TFwupdReleaseFlags); cdecl; external libfwupd;
procedure fwupd_release_remove_flag(self: PFwupdRelease; flag: TFwupdReleaseFlags); cdecl; external libfwupd;
function fwupd_release_has_flag(self: PFwupdRelease; flag: TFwupdReleaseFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_release_get_urgency(self: PFwupdRelease): TFwupdReleaseUrgency; cdecl; external libfwupd;
procedure fwupd_release_set_urgency(self: PFwupdRelease; urgency: TFwupdReleaseUrgency); cdecl; external libfwupd;
function fwupd_release_get_install_duration(self: PFwupdRelease): Tguint32; cdecl; external libfwupd;
procedure fwupd_release_set_install_duration(self: PFwupdRelease; duration: Tguint32); cdecl; external libfwupd;
function fwupd_release_get_update_message(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_update_message(self: PFwupdRelease; update_message: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_update_image(self: PFwupdRelease): Pgchar; cdecl; external libfwupd;
procedure fwupd_release_set_update_image(self: PFwupdRelease; update_image: Pgchar); cdecl; external libfwupd;
function fwupd_release_get_reports(self: PFwupdRelease): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_release_add_report(self: PFwupdRelease; report: PFwupdReport); cdecl; external libfwupd;
function fwupd_release_match_flags(self: PFwupdRelease; include: TFwupdReleaseFlags; exclude: TFwupdReleaseFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_release_array_filter_flags(rels: PGPtrArray; include: TFwupdReleaseFlags; exclude: TFwupdReleaseFlags; error: PPGError): PGPtrArray; cdecl; external libfwupd;
function fwupd_release_from_variant(value: PGVariant): PFwupdRelease; cdecl; external libfwupd;
function fwupd_release_array_from_variant(value: PGVariant): PGPtrArray; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:10 ===

function FWUPD_TYPE_RELEASE: TGType;
function FWUPD_RELEASE(obj: Pointer): PFwupdRelease;
function FWUPD_IS_RELEASE(obj: Pointer): Tgboolean;
function FWUPD_RELEASE_CLASS(klass: Pointer): PFwupdReleaseClass;
function FWUPD_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
function FWUPD_RELEASE_GET_CLASS(obj: Pointer): PFwupdReleaseClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function FWUPD_TYPE_RELEASE: TGType;
begin
  Result := fwupd_release_get_type;
end;

function FWUPD_RELEASE(obj: Pointer): PFwupdRelease;
begin
  Result := PFwupdRelease(g_type_check_instance_cast(obj, FWUPD_TYPE_RELEASE));
end;

function FWUPD_IS_RELEASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_RELEASE);
end;

function FWUPD_RELEASE_CLASS(klass: Pointer): PFwupdReleaseClass;
begin
  Result := PFwupdReleaseClass(g_type_check_class_cast(klass, FWUPD_TYPE_RELEASE));
end;

function FWUPD_IS_RELEASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_RELEASE);
end;

function FWUPD_RELEASE_GET_CLASS(obj: Pointer): PFwupdReleaseClass;
begin
  Result := PFwupdReleaseClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}

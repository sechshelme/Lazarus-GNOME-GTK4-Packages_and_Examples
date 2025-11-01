{$IFDEF read_interface}


type
  TCdProfile = record
    parent_instance: TGObject;
  end;
  PCdProfile = ^TCdProfile;

  TCdProfileClass = record
    parent_class: TGObjectClass;
    changed: procedure(profile: PCdProfile); cdecl;
    _cd_profile_reserved1: procedure; cdecl;
    _cd_profile_reserved2: procedure; cdecl;
    _cd_profile_reserved3: procedure; cdecl;
    _cd_profile_reserved4: procedure; cdecl;
    _cd_profile_reserved5: procedure; cdecl;
    _cd_profile_reserved6: procedure; cdecl;
    _cd_profile_reserved7: procedure; cdecl;
    _cd_profile_reserved8: procedure; cdecl;
  end;
  PCdProfileClass = ^TCdProfileClass;

function cd_profile_get_type: TGType; cdecl; external libcolord;
function cd_profile_error_quark: TGQuark; cdecl; external libcolord;
function cd_profile_new: PCdProfile; cdecl; external libcolord;
function cd_profile_new_with_object_path(object_path: Pgchar): PCdProfile; cdecl; external libcolord;
procedure cd_profile_connect(profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_profile_connect_finish(profile: PCdProfile; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_profile_set_property(profile: PCdProfile; key: Pgchar; value: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libcolord;
function cd_profile_set_property_finish(profile: PCdProfile; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_profile_install_system_wide(profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_profile_install_system_wide_finish(profile: PCdProfile; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_profile_get_id(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_filename(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_qualifier(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_format(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_title(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_object_path(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_get_kind(profile: PCdProfile): TCdProfileKind; cdecl; external libcolord;
function cd_profile_get_colorspace(profile: PCdProfile): TCdColorspace; cdecl; external libcolord;
function cd_profile_get_scope(profile: PCdProfile): TCdObjectScope; cdecl; external libcolord;
function cd_profile_get_owner(profile: PCdProfile): Tguint; cdecl; external libcolord;
function cd_profile_get_warnings(profile: PCdProfile): PPgchar; cdecl; external libcolord;
function cd_profile_get_created(profile: PCdProfile): Tgint64; cdecl; external libcolord;
function cd_profile_get_age(profile: PCdProfile): Tgint64; cdecl; external libcolord;
function cd_profile_get_has_vcgt(profile: PCdProfile): Tgboolean; cdecl; external libcolord;
function cd_profile_get_is_system_wide(profile: PCdProfile): Tgboolean; cdecl; external libcolord;
function cd_profile_get_metadata(profile: PCdProfile): PGHashTable; cdecl; external libcolord;
function cd_profile_get_metadata_item(profile: PCdProfile; key: Pgchar): Pgchar; cdecl; external libcolord;
procedure cd_profile_set_object_path(profile: PCdProfile; object_path: Pgchar); cdecl; external libcolord;
function cd_profile_get_connected(profile: PCdProfile): Tgboolean; cdecl; external libcolord;
function cd_profile_to_string(profile: PCdProfile): Pgchar; cdecl; external libcolord;
function cd_profile_equal(profile1: PCdProfile; profile2: PCdProfile): Tgboolean; cdecl; external libcolord;
function cd_profile_has_access(profile: PCdProfile): Tgboolean; cdecl; external libcolord;
function cd_profile_load_icc(profile: PCdProfile; flags: TCdIccLoadFlags; cancellable: PGCancellable; error: PPGError): PCdIcc; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:05 ===

function CD_TYPE_PROFILE: TGType;
function CD_PROFILE(obj: Pointer): PCdProfile;
function CD_IS_PROFILE(obj: Pointer): Tgboolean;
function CD_PROFILE_CLASS(klass: Pointer): PCdProfileClass;
function CD_IS_PROFILE_CLASS(klass: Pointer): Tgboolean;
function CD_PROFILE_GET_CLASS(obj: Pointer): PCdProfileClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_TYPE_PROFILE: TGType;
begin
  Result := cd_profile_get_type;
end;

function CD_PROFILE(obj: Pointer): PCdProfile;
begin
  Result := PCdProfile(g_type_check_instance_cast(obj, CD_TYPE_PROFILE));
end;

function CD_IS_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_PROFILE);
end;

function CD_PROFILE_CLASS(klass: Pointer): PCdProfileClass;
begin
  Result := PCdProfileClass(g_type_check_class_cast(klass, CD_TYPE_PROFILE));
end;

function CD_IS_PROFILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_PROFILE);
end;

function CD_PROFILE_GET_CLASS(obj: Pointer): PCdProfileClass;
begin
  Result := PCdProfileClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  TShumateLicense = record
  end;
  PShumateLicense = ^TShumateLicense;

  TShumateLicenseClass = record
    parent_class: TGtkWidgetClass;
  end;
  PShumateLicenseClass = ^TShumateLicenseClass;

function shumate_license_get_type: TGType; cdecl; external libshumate;
function shumate_license_new: PShumateLicense; cdecl; external libshumate;
procedure shumate_license_set_extra_text(license: PShumateLicense; text: pchar); cdecl; external libshumate;
function shumate_license_get_extra_text(license: PShumateLicense): pchar; cdecl; external libshumate;
procedure shumate_license_set_xalign(license: PShumateLicense; xalign: single); cdecl; external libshumate;
function shumate_license_get_xalign(license: PShumateLicense): single; cdecl; external libshumate;
procedure shumate_license_append_map_source(license: PShumateLicense; map_source: PShumateMapSource); cdecl; external libshumate;
procedure shumate_license_prepend_map_source(license: PShumateLicense; map_source: PShumateMapSource); cdecl; external libshumate;
procedure shumate_license_remove_map_source(license: PShumateLicense; map_source: PShumateMapSource); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:34 ===

function SHUMATE_TYPE_LICENSE: TGType;
function SHUMATE_LICENSE(obj: Pointer): PShumateLicense;
function SHUMATE_IS_LICENSE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_LICENSE: TGType;
begin
  Result := shumate_license_get_type;
end;

function SHUMATE_LICENSE(obj: Pointer): PShumateLicense;
begin
  Result := PShumateLicense(g_type_check_instance_cast(obj, SHUMATE_TYPE_LICENSE));
end;

function SHUMATE_IS_LICENSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_LICENSE);
end;


{$ENDIF read_implementation}

unit cd_device;

interface

uses
  fp_glib2, fp_colord, cd_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCdDevice = record
    parent_instance: TGObject;
  end;
  PCdDevice = ^TCdDevice;

  TCdDeviceClass = record
    parent_class: TGObjectClass;
    changed: procedure(device: PCdDevice); cdecl;
    _cd_device_reserved1: procedure; cdecl;
    _cd_device_reserved2: procedure; cdecl;
    _cd_device_reserved3: procedure; cdecl;
    _cd_device_reserved4: procedure; cdecl;
    _cd_device_reserved5: procedure; cdecl;
    _cd_device_reserved6: procedure; cdecl;
    _cd_device_reserved7: procedure; cdecl;
    _cd_device_reserved8: procedure; cdecl;
  end;
  PCdDeviceClass = ^TCdDeviceClass;

function cd_device_get_type: TGType; cdecl; external libcolord;
function cd_device_error_quark: TGQuark; cdecl; external libcolord;
function cd_device_new: PCdDevice; cdecl; external libcolord;
function cd_device_new_with_object_path(object_path: Pgchar): PCdDevice; cdecl; external libcolord;
procedure cd_device_connect(device: PCdDevice; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_connect_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_set_property(device: PCdDevice; key: Pgchar; value: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libcolord;
function cd_device_set_property_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_add_profile(device: PCdDevice; relation: TCdDeviceRelation; profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libcolord;
function cd_device_add_profile_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_remove_profile(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_remove_profile_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_make_profile_default(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_make_profile_default_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_profiling_inhibit(device: PCdDevice; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_profiling_inhibit_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_set_enabled(device: PCdDevice; enabled: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_set_enabled_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_profiling_uninhibit(device: PCdDevice; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_profiling_uninhibit_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_device_get_profile_for_qualifiers(device: PCdDevice; qualifiers: PPgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_get_profile_for_qualifiers_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): PCdProfile; cdecl; external libcolord;
procedure cd_device_get_profile_relation(device: PCdDevice; profile: PCdProfile; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord;
function cd_device_get_profile_relation_finish(device: PCdDevice; res: PGAsyncResult; error: PPGError): TCdDeviceRelation; cdecl; external libcolord;
function cd_device_get_id(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_model(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_vendor(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_serial(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_seat(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_format(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_profiling_inhibitors(device: PCdDevice): PPgchar; cdecl; external libcolord;
function cd_device_get_created(device: PCdDevice): Tguint64; cdecl; external libcolord;
function cd_device_get_modified(device: PCdDevice): Tguint64; cdecl; external libcolord;
function cd_device_get_kind(device: PCdDevice): TCdDeviceKind; cdecl; external libcolord;
function cd_device_get_colorspace(device: PCdDevice): TCdColorspace; cdecl; external libcolord;
function cd_device_get_mode(device: PCdDevice): TCdDeviceMode; cdecl; external libcolord;
function cd_device_get_enabled(device: PCdDevice): Tgboolean; cdecl; external libcolord;
function cd_device_get_embedded(device: PCdDevice): Tgboolean; cdecl; external libcolord;
function cd_device_get_scope(device: PCdDevice): TCdObjectScope; cdecl; external libcolord;
function cd_device_get_owner(device: PCdDevice): Tguint; cdecl; external libcolord;
function cd_device_get_profiles(device: PCdDevice): PGPtrArray; cdecl; external libcolord;
function cd_device_get_default_profile(device: PCdDevice): PCdProfile; cdecl; external libcolord;
function cd_device_get_object_path(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_get_metadata(device: PCdDevice): PGHashTable; cdecl; external libcolord;
function cd_device_get_metadata_item(device: PCdDevice; key: Pgchar): Pgchar; cdecl; external libcolord;
procedure cd_device_set_object_path(device: PCdDevice; object_path: Pgchar); cdecl; external libcolord;
function cd_device_get_connected(device: PCdDevice): Tgboolean; cdecl; external libcolord;
function cd_device_to_string(device: PCdDevice): Pgchar; cdecl; external libcolord;
function cd_device_equal(device1: PCdDevice; device2: PCdDevice): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:24 ===

function CD_TYPE_DEVICE: TGType;
function CD_DEVICE(obj: Pointer): PCdDevice;
function CD_IS_DEVICE(obj: Pointer): Tgboolean;
function CD_DEVICE_CLASS(klass: Pointer): PCdDeviceClass;
function CD_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
function CD_DEVICE_GET_CLASS(obj: Pointer): PCdDeviceClass;

implementation

function CD_TYPE_DEVICE: TGType;
begin
  Result := cd_device_get_type;
end;

function CD_DEVICE(obj: Pointer): PCdDevice;
begin
  Result := PCdDevice(g_type_check_instance_cast(obj, CD_TYPE_DEVICE));
end;

function CD_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_DEVICE);
end;

function CD_DEVICE_CLASS(klass: Pointer): PCdDeviceClass;
begin
  Result := PCdDeviceClass(g_type_check_class_cast(klass, CD_TYPE_DEVICE));
end;

function CD_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_DEVICE);
end;

function CD_DEVICE_GET_CLASS(obj: Pointer): PCdDeviceClass;
begin
  Result := PCdDeviceClass(PGTypeInstance(obj)^.g_class);
end;


end.

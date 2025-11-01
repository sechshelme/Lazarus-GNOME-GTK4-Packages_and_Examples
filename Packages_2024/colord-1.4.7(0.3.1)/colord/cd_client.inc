{$IFDEF read_interface}


type
  TCdClient = record
    parent_instance: TGObject;
  end;
  PCdClient = ^TCdClient;
  TCdClientClass = record
      parent_class : TGObjectClass;
      device_added : procedure (client:PCdClient; device:PCdDevice);cdecl;
      device_removed : procedure (client:PCdClient; device:PCdDevice);cdecl;
      device_changed : procedure (client:PCdClient; device:PCdDevice);cdecl;
      profile_added : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      profile_removed : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      profile_changed : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      sensor_added : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      sensor_removed : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      sensor_changed : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      changed : procedure (client:PCdClient);cdecl;
      _cd_client_reserved1 : procedure ;cdecl;
      _cd_client_reserved2 : procedure ;cdecl;
      _cd_client_reserved3 : procedure ;cdecl;
      _cd_client_reserved4 : procedure ;cdecl;
      _cd_client_reserved5 : procedure ;cdecl;
      _cd_client_reserved6 : procedure ;cdecl;
      _cd_client_reserved7 : procedure ;cdecl;
      _cd_client_reserved8 : procedure ;cdecl;
    end;
  PCdClientClass = ^TCdClientClass;

function cd_client_get_type: TGType; cdecl; external libcolord;
function cd_client_error_quark:TGQuark;cdecl;external libcolord;
function cd_client_new:PCdClient;cdecl;external libcolord;
procedure cd_client_connect(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_connect_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libcolord;
procedure cd_client_create_device(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_create_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external libcolord;
procedure cd_client_create_profile(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_create_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_create_profile_for_icc(client:PCdClient; icc:PCdIcc; scope:TCdObjectScope; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libcolord;
function cd_client_create_profile_for_icc_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_import_profile(client:PCdClient; file_:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_import_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_delete_device(client:PCdClient; device:PCdDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_delete_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libcolord;
procedure cd_client_delete_profile(client:PCdClient; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_delete_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libcolord;
procedure cd_client_find_device(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external libcolord;
procedure cd_client_find_device_by_property(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_device_by_property_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external libcolord;
procedure cd_client_find_profile(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_find_profile_by_filename(client:PCdClient; filename:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_profile_by_filename_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_get_standard_space(client:PCdClient; standard_space:TCdStandardSpace; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_get_standard_space_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_get_devices(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_get_devices_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external libcolord;
procedure cd_client_get_devices_by_kind(client:PCdClient; kind:TCdDeviceKind; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_get_devices_by_kind_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external libcolord;
procedure cd_client_get_profiles(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_get_profiles_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external libcolord;
procedure cd_client_get_sensors(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_get_sensors_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external libcolord;
procedure cd_client_find_profile_by_property(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_profile_by_property_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord;
procedure cd_client_find_sensor(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord;
function cd_client_find_sensor_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdSensor;cdecl;external libcolord;
function cd_client_get_connected(client:PCdClient):Tgboolean;cdecl;external libcolord;
function cd_client_get_has_server(client:PCdClient):Tgboolean;cdecl;external libcolord;
function cd_client_get_daemon_version(client:PCdClient):Pgchar;cdecl;external libcolord;
function cd_client_get_system_vendor(client:PCdClient):Pgchar;cdecl;external libcolord;
function cd_client_get_system_model(client:PCdClient):Pgchar;cdecl;external libcolord;

// === Konventiert am: 1-11-25 16:08:40 ===

function CD_TYPE_CLIENT: TGType;
function CD_CLIENT(obj: Pointer): PCdClient;
function CD_IS_CLIENT(obj: Pointer): Tgboolean;
function CD_CLIENT_CLASS(klass: Pointer): PCdClientClass;
function CD_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
function CD_CLIENT_GET_CLASS(obj: Pointer): PCdClientClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_TYPE_CLIENT: TGType;
begin
  Result := cd_client_get_type;
end;

function CD_CLIENT(obj: Pointer): PCdClient;
begin
  Result := PCdClient(g_type_check_instance_cast(obj, CD_TYPE_CLIENT));
end;

function CD_IS_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_CLIENT);
end;

function CD_CLIENT_CLASS(klass: Pointer): PCdClientClass;
begin
  Result := PCdClientClass(g_type_check_class_cast(klass, CD_TYPE_CLIENT));
end;

function CD_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_CLIENT);
end;

function CD_CLIENT_GET_CLASS(obj: Pointer): PCdClientClass;
begin
  Result := PCdClientClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}

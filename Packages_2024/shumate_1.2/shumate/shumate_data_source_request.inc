{$IFDEF read_interface}


type
  TShumateDataSourceRequest = record
    parent_instance: TGObject;
  end;
  PShumateDataSourceRequest = ^TShumateDataSourceRequest;

  TShumateDataSourceRequestClass = record
    parent_class: TGObjectClass;
    padding: array[0..15] of Tgpointer;
  end;
  PShumateDataSourceRequestClass = ^TShumateDataSourceRequestClass;

function shumate_data_source_request_get_type: TGType; cdecl; external libshumate;
function shumate_data_source_request_new(x: longint; y: longint; zoom_level: longint): PShumateDataSourceRequest; cdecl; external libshumate;
function shumate_data_source_request_get_x(self: PShumateDataSourceRequest): longint; cdecl; external libshumate;
function shumate_data_source_request_get_y(self: PShumateDataSourceRequest): longint; cdecl; external libshumate;
function shumate_data_source_request_get_zoom_level(self: PShumateDataSourceRequest): longint; cdecl; external libshumate;
function shumate_data_source_request_get_data(self: PShumateDataSourceRequest): PGBytes; cdecl; external libshumate;
procedure shumate_data_source_request_emit_data(self: PShumateDataSourceRequest; data: PGBytes; complete: Tgboolean); cdecl; external libshumate;
function shumate_data_source_request_get_error(self: PShumateDataSourceRequest): PGError; cdecl; external libshumate;
procedure shumate_data_source_request_emit_error(self: PShumateDataSourceRequest; error: PGError); cdecl; external libshumate;
function shumate_data_source_request_is_completed(self: PShumateDataSourceRequest): Tgboolean; cdecl; external libshumate;
procedure shumate_data_source_request_complete(self: PShumateDataSourceRequest); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:59 ===

function SHUMATE_TYPE_DATA_SOURCE_REQUEST: TGType;
function SHUMATE_DATA_SOURCE_REQUEST(obj: Pointer): PShumateDataSourceRequest;
function SHUMATE_IS_DATA_SOURCE_REQUEST(obj: Pointer): Tgboolean;
function SHUMATE_DATA_SOURCE_REQUEST_CLASS(klass: Pointer): PShumateDataSourceRequestClass;
function SHUMATE_IS_DATA_SOURCE_REQUEST_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_DATA_SOURCE_REQUEST_GET_CLASS(obj: Pointer): PShumateDataSourceRequestClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_DATA_SOURCE_REQUEST: TGType;
begin
  Result := shumate_data_source_request_get_type;
end;

function SHUMATE_DATA_SOURCE_REQUEST(obj: Pointer): PShumateDataSourceRequest;
begin
  Result := PShumateDataSourceRequest(g_type_check_instance_cast(obj, SHUMATE_TYPE_DATA_SOURCE_REQUEST));
end;

function SHUMATE_IS_DATA_SOURCE_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_DATA_SOURCE_REQUEST);
end;

function SHUMATE_DATA_SOURCE_REQUEST_CLASS(klass: Pointer): PShumateDataSourceRequestClass;
begin
  Result := PShumateDataSourceRequestClass(g_type_check_class_cast(klass, SHUMATE_TYPE_DATA_SOURCE_REQUEST));
end;

function SHUMATE_IS_DATA_SOURCE_REQUEST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_DATA_SOURCE_REQUEST);
end;

function SHUMATE_DATA_SOURCE_REQUEST_GET_CLASS(obj: Pointer): PShumateDataSourceRequestClass;
begin
  Result := PShumateDataSourceRequestClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}

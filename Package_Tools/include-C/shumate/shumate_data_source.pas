unit shumate_data_source;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_data_source_request;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateDataSource = record
    parent_instance: TGObject;
  end;
  PShumateDataSource = ^TShumateDataSource;

  TShumateDataSourceClass = record
    parent_class: TGObjectClass;
    get_tile_data_async: procedure(self: PShumateDataSource; x: longint; y: longint; zoom_level: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    get_tile_data_finish: function(self: PShumateDataSource; result: PGAsyncResult; error: PPGError): PGBytes; cdecl;
    start_request: function(self: PShumateDataSource; x: longint; y: longint; zoom_level: longint; cancellable: PGCancellable): PShumateDataSourceRequest; cdecl;
    padding: array[0..14] of Tgpointer;
  end;
  PShumateDataSourceClass = ^TShumateDataSourceClass;

function shumate_data_source_get_type: TGType; cdecl; external libshumate;
procedure shumate_data_source_get_tile_data_async(self: PShumateDataSource; x: longint; y: longint; zoom_level: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libshumate;
function shumate_data_source_get_tile_data_finish(self: PShumateDataSource; result: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libshumate;
function shumate_data_source_start_request(self: PShumateDataSource; x: longint; y: longint; zoom_level: longint; cancellable: PGCancellable): PShumateDataSourceRequest; cdecl; external libshumate;
function shumate_data_source_get_min_zoom_level(self: PShumateDataSource): Tguint; cdecl; external libshumate;
procedure shumate_data_source_set_min_zoom_level(self: PShumateDataSource; zoom_level: Tguint); cdecl; external libshumate;
function shumate_data_source_get_max_zoom_level(self: PShumateDataSource): Tguint; cdecl; external libshumate;
procedure shumate_data_source_set_max_zoom_level(self: PShumateDataSource; zoom_level: Tguint); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:50:03 ===

function SHUMATE_TYPE_DATA_SOURCE: TGType;
function SHUMATE_DATA_SOURCE(obj: Pointer): PShumateDataSource;
function SHUMATE_IS_DATA_SOURCE(obj: Pointer): Tgboolean;
function SHUMATE_DATA_SOURCE_CLASS(klass: Pointer): PShumateDataSourceClass;
function SHUMATE_IS_DATA_SOURCE_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_DATA_SOURCE_GET_CLASS(obj: Pointer): PShumateDataSourceClass;

implementation

function SHUMATE_TYPE_DATA_SOURCE: TGType;
begin
  Result := shumate_data_source_get_type;
end;

function SHUMATE_DATA_SOURCE(obj: Pointer): PShumateDataSource;
begin
  Result := PShumateDataSource(g_type_check_instance_cast(obj, SHUMATE_TYPE_DATA_SOURCE));
end;

function SHUMATE_IS_DATA_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_DATA_SOURCE);
end;

function SHUMATE_DATA_SOURCE_CLASS(klass: Pointer): PShumateDataSourceClass;
begin
  Result := PShumateDataSourceClass(g_type_check_class_cast(klass, SHUMATE_TYPE_DATA_SOURCE));
end;

function SHUMATE_IS_DATA_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_DATA_SOURCE);
end;

function SHUMATE_DATA_SOURCE_GET_CLASS(obj: Pointer): PShumateDataSourceClass;
begin
  Result := PShumateDataSourceClass(PGTypeInstance(obj)^.g_class);
end;


end.

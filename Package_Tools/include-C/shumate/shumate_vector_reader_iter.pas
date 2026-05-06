unit shumate_vector_reader_iter;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PShumateGeometryType = ^TShumateGeometryType;
  TShumateGeometryType = longint;

const
  SHUMATE_GEOMETRY_TYPE_UNKNOWN = 0;
  SHUMATE_GEOMETRY_TYPE_POINT = 1;
  SHUMATE_GEOMETRY_TYPE_MULTIPOINT = 2;
  SHUMATE_GEOMETRY_TYPE_LINESTRING = 3;
  SHUMATE_GEOMETRY_TYPE_MULTILINESTRING = 4;
  SHUMATE_GEOMETRY_TYPE_POLYGON = 5;
  SHUMATE_GEOMETRY_TYPE_MULTIPOLYGON = 6;

type
  TShumateVectorReaderIter = record
  end;
  PShumateVectorReaderIter = ^TShumateVectorReaderIter;

  TShumateVectorReaderIterClass = record
    parent_class: TGObjectClass;
  end;
  PShumateVectorReaderIterClass = ^TShumateVectorReaderIterClass;

function shumate_vector_reader_iter_get_type: TGType; cdecl; external libshumate;
function shumate_vector_reader_iter_get_layer_count(self: PShumateVectorReaderIter): Tguint; cdecl; external libshumate;
procedure shumate_vector_reader_iter_read_layer(self: PShumateVectorReaderIter; index: longint); cdecl; external libshumate;
function shumate_vector_reader_iter_read_layer_by_name(self: PShumateVectorReaderIter; name: pchar): Tgboolean; cdecl; external libshumate;
function shumate_vector_reader_iter_get_layer_name(self: PShumateVectorReaderIter): pchar; cdecl; external libshumate;
function shumate_vector_reader_iter_get_layer_extent(self: PShumateVectorReaderIter): Tguint; cdecl; external libshumate;
function shumate_vector_reader_iter_get_layer_feature_count(self: PShumateVectorReaderIter): Tguint; cdecl; external libshumate;
procedure shumate_vector_reader_iter_read_feature(self: PShumateVectorReaderIter; index: longint); cdecl; external libshumate;
function shumate_vector_reader_iter_next_feature(self: PShumateVectorReaderIter): Tgboolean; cdecl; external libshumate;
function shumate_vector_reader_iter_get_feature_id(self: PShumateVectorReaderIter): Tguint64; cdecl; external libshumate;
function shumate_vector_reader_iter_get_feature_tag(self: PShumateVectorReaderIter; key: pchar; value: PGValue): Tgboolean; cdecl; external libshumate;
function shumate_vector_reader_iter_get_feature_keys(self: PShumateVectorReaderIter): Ppchar; cdecl; external libshumate;
function shumate_vector_reader_iter_get_feature_geometry_type(self: PShumateVectorReaderIter): TShumateGeometryType; cdecl; external libshumate;
function shumate_vector_reader_iter_get_feature_point(self: PShumateVectorReaderIter; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libshumate;
function shumate_vector_reader_iter_feature_contains_point(self: PShumateVectorReaderIter; x: double; y: double): Tgboolean; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:07 ===

function SHUMATE_TYPE_VECTOR_READER_ITER: TGType;
function SHUMATE_VECTOR_READER_ITER(obj: Pointer): PShumateVectorReaderIter;
function SHUMATE_IS_VECTOR_READER_ITER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_VECTOR_READER_ITER: TGType;
begin
  Result := shumate_vector_reader_iter_get_type;
end;

function SHUMATE_VECTOR_READER_ITER(obj: Pointer): PShumateVectorReaderIter;
begin
  Result := PShumateVectorReaderIter(g_type_check_instance_cast(obj, SHUMATE_TYPE_VECTOR_READER_ITER));
end;

function SHUMATE_IS_VECTOR_READER_ITER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VECTOR_READER_ITER);
end;


end.

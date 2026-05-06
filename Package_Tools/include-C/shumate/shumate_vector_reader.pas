unit shumate_vector_reader;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate,shumate_vector_reader_iter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TShumateVectorReader = record
  end;
  PShumateVectorReader = ^TShumateVectorReader;

  TShumateVectorReaderClass = record
    parent_class: TGObjectClass;
  end;
  PShumateVectorReaderClass = ^TShumateVectorReaderClass;

function shumate_vector_reader_get_type: TGType; cdecl; external libshumate;
function shumate_vector_reader_new(bytes: PGBytes): PShumateVectorReader; cdecl; external libshumate;
function shumate_vector_reader_iterate(self: PShumateVectorReader): PShumateVectorReaderIter; cdecl; external libshumate;
function shumate_vector_reader_iter_get_reader(self: PShumateVectorReaderIter): PShumateVectorReader; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:10 ===

function SHUMATE_TYPE_VECTOR_READER: TGType;
function SHUMATE_VECTOR_READER(obj: Pointer): PShumateVectorReader;
function SHUMATE_IS_VECTOR_READER(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_VECTOR_READER: TGType;
begin
  Result := shumate_vector_reader_get_type;
end;

function SHUMATE_VECTOR_READER(obj: Pointer): PShumateVectorReader;
begin
  Result := PShumateVectorReader(g_type_check_instance_cast(obj, SHUMATE_TYPE_VECTOR_READER));
end;

function SHUMATE_IS_VECTOR_READER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_VECTOR_READER);
end;


end.

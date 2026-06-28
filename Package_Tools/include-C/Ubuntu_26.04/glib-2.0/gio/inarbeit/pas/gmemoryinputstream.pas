unit gmemoryinputstream;

interface

uses
  fp_glib2, ginputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMemoryInputStreamPrivate = type Pointer;

  PGMemoryInputStream = ^TGMemoryInputStream;
  TGMemoryInputStream = record
    parent_instance: TGInputStream;
    priv: PGMemoryInputStreamPrivate;
  end;

  PGMemoryInputStreamClass = ^TGMemoryInputStreamClass;
  TGMemoryInputStreamClass = record
    parent_class: TGInputStreamClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;


function g_memory_input_stream_get_type: TGType; cdecl; external libgio2;
function g_memory_input_stream_new: PGInputStream; cdecl; external libgio2;
function g_memory_input_stream_new_from_data(data: pointer; len: Tgssize; destroy: TGDestroyNotify): PGInputStream; cdecl; external libgio2;
function g_memory_input_stream_new_from_bytes(bytes: PGBytes): PGInputStream; cdecl; external libgio2;
procedure g_memory_input_stream_add_data(stream: PGMemoryInputStream; data: pointer; len: Tgssize; destroy: TGDestroyNotify); cdecl; external libgio2;
procedure g_memory_input_stream_add_bytes(stream: PGMemoryInputStream; bytes: PGBytes); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:39:38 ===

function G_TYPE_MEMORY_INPUT_STREAM: TGType;
function G_MEMORY_INPUT_STREAM(obj: Pointer): PGMemoryInputStream;
function G_MEMORY_INPUT_STREAM_CLASS(klass: Pointer): PGMemoryInputStreamClass;
function G_IS_MEMORY_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_MEMORY_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_MEMORY_INPUT_STREAM_GET_CLASS(obj: Pointer): PGMemoryInputStreamClass;

implementation

function G_TYPE_MEMORY_INPUT_STREAM: TGType;
begin
  G_TYPE_MEMORY_INPUT_STREAM := g_memory_input_stream_get_type;
end;

function G_MEMORY_INPUT_STREAM(obj: Pointer): PGMemoryInputStream;
begin
  Result := PGMemoryInputStream(g_type_check_instance_cast(obj, G_TYPE_MEMORY_INPUT_STREAM));
end;

function G_MEMORY_INPUT_STREAM_CLASS(klass: Pointer): PGMemoryInputStreamClass;
begin
  Result := PGMemoryInputStreamClass(g_type_check_class_cast(klass, G_TYPE_MEMORY_INPUT_STREAM));
end;

function G_IS_MEMORY_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MEMORY_INPUT_STREAM);
end;

function G_IS_MEMORY_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MEMORY_INPUT_STREAM);
end;

function G_MEMORY_INPUT_STREAM_GET_CLASS(obj: Pointer): PGMemoryInputStreamClass;
begin
  Result := PGMemoryInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

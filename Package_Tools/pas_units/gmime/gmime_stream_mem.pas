unit gmime_stream_mem;

interface

uses
  fp_glib2, fp_gmime3, gmime_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeStreamMem = record
    parent_object: TGMimeStream;
    buffer: PGByteArray;
    owner: Tgboolean;
  end;
  PGMimeStreamMem = ^TGMimeStreamMem;

  TGMimeStreamMemClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamMemClass = ^TGMimeStreamMemClass;

function g_mime_stream_mem_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_mem_new: PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_mem_new_with_byte_array(arr: PGByteArray): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_mem_new_with_buffer(buffer: pchar; len: Tsize_t): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_mem_get_byte_array(mem: PGMimeStreamMem): PGByteArray; cdecl; external libgmime3;
procedure g_mime_stream_mem_set_byte_array(mem: PGMimeStreamMem; arr: PGByteArray); cdecl; external libgmime3;
function g_mime_stream_mem_get_owner(mem: PGMimeStreamMem): Tgboolean; cdecl; external libgmime3;
procedure g_mime_stream_mem_set_owner(mem: PGMimeStreamMem; owner: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:09 ===

function GMIME_TYPE_STREAM_MEM: TGType;
function GMIME_STREAM_MEM(obj: Pointer): PGMimeStreamMem;
function GMIME_STREAM_MEM_CLASS(klass: Pointer): PGMimeStreamMemClass;
function GMIME_IS_STREAM_MEM(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_MEM_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_MEM_GET_CLASS(obj: Pointer): PGMimeStreamMemClass;

implementation

function GMIME_TYPE_STREAM_MEM: TGType;
begin
  GMIME_TYPE_STREAM_MEM := g_mime_stream_mem_get_type;
end;

function GMIME_STREAM_MEM(obj: Pointer): PGMimeStreamMem;
begin
  Result := PGMimeStreamMem(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_MEM));
end;

function GMIME_STREAM_MEM_CLASS(klass: Pointer): PGMimeStreamMemClass;
begin
  Result := PGMimeStreamMemClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_MEM));
end;

function GMIME_IS_STREAM_MEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_MEM);
end;

function GMIME_IS_STREAM_MEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_MEM);
end;

function GMIME_STREAM_MEM_GET_CLASS(obj: Pointer): PGMimeStreamMemClass;
begin
  Result := PGMimeStreamMemClass(PGTypeInstance(obj)^.g_class);
end;



end.

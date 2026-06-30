unit gzlibcompressor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGZlibCompressorClass = ^TGZlibCompressorClass;
  TGZlibCompressorClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_zlib_compressor_get_type: TGType; cdecl; external libgio2;
function g_zlib_compressor_new(format: TGZlibCompressorFormat; level: longint): PGZlibCompressor; cdecl; external libgio2;
function g_zlib_compressor_get_file_info(compressor: PGZlibCompressor): PGFileInfo; cdecl; external libgio2;
procedure g_zlib_compressor_set_file_info(compressor: PGZlibCompressor; file_info: PGFileInfo); cdecl; external libgio2;
function g_zlib_compressor_get_os(compressor: PGZlibCompressor): longint; cdecl; external libgio2;
procedure g_zlib_compressor_set_os(compressor: PGZlibCompressor; os: longint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:07:46 ===

function G_TYPE_ZLIB_COMPRESSOR: TGType;
function G_ZLIB_COMPRESSOR(obj: Pointer): PGZlibCompressor;
function G_ZLIB_COMPRESSOR_CLASS(klass: Pointer): PGZlibCompressorClass;
function G_IS_ZLIB_COMPRESSOR(obj: Pointer): Tgboolean;
function G_IS_ZLIB_COMPRESSOR_CLASS(klass: Pointer): Tgboolean;
function G_ZLIB_COMPRESSOR_GET_CLASS(obj: Pointer): PGZlibCompressorClass;
{$ENDIF read_function}

implementation

function G_TYPE_ZLIB_COMPRESSOR: TGType;
begin
  G_TYPE_ZLIB_COMPRESSOR := g_zlib_compressor_get_type;
end;

function G_ZLIB_COMPRESSOR(obj: Pointer): PGZlibCompressor;
begin
  Result := PGZlibCompressor(g_type_check_instance_cast(obj, G_TYPE_ZLIB_COMPRESSOR));
end;

function G_ZLIB_COMPRESSOR_CLASS(klass: Pointer): PGZlibCompressorClass;
begin
  Result := PGZlibCompressorClass(g_type_check_class_cast(klass, G_TYPE_ZLIB_COMPRESSOR));
end;

function G_IS_ZLIB_COMPRESSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ZLIB_COMPRESSOR);
end;

function G_IS_ZLIB_COMPRESSOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_ZLIB_COMPRESSOR);
end;

function G_ZLIB_COMPRESSOR_GET_CLASS(obj: Pointer): PGZlibCompressorClass;
begin
  Result := PGZlibCompressorClass(PGTypeInstance(obj)^.g_class);
end;



end.

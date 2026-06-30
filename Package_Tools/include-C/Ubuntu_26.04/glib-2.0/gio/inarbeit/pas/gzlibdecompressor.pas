unit gzlibdecompressor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGZlibDecompressorClass = ^TGZlibDecompressorClass;
  TGZlibDecompressorClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_zlib_decompressor_get_type: TGType; cdecl; external libgio2;
function g_zlib_decompressor_new(format: TGZlibCompressorFormat): PGZlibDecompressor; cdecl; external libgio2;
function g_zlib_decompressor_get_file_info(decompressor: PGZlibDecompressor): PGFileInfo; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:07:49 ===

function G_TYPE_ZLIB_DECOMPRESSOR: TGType;
function G_ZLIB_DECOMPRESSOR(obj: Pointer): PGZlibDecompressor;
function G_ZLIB_DECOMPRESSOR_CLASS(klass: Pointer): PGZlibDecompressorClass;
function G_IS_ZLIB_DECOMPRESSOR(obj: Pointer): Tgboolean;
function G_IS_ZLIB_DECOMPRESSOR_CLASS(klass: Pointer): Tgboolean;
function G_ZLIB_DECOMPRESSOR_GET_CLASS(obj: Pointer): PGZlibDecompressorClass;
{$ENDIF read_function}

implementation

function G_TYPE_ZLIB_DECOMPRESSOR: TGType;
begin
  G_TYPE_ZLIB_DECOMPRESSOR := g_zlib_decompressor_get_type;
end;

function G_ZLIB_DECOMPRESSOR(obj: Pointer): PGZlibDecompressor;
begin
  Result := PGZlibDecompressor(g_type_check_instance_cast(obj, G_TYPE_ZLIB_DECOMPRESSOR));
end;

function G_ZLIB_DECOMPRESSOR_CLASS(klass: Pointer): PGZlibDecompressorClass;
begin
  Result := PGZlibDecompressorClass(g_type_check_class_cast(klass, G_TYPE_ZLIB_DECOMPRESSOR));
end;

function G_IS_ZLIB_DECOMPRESSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ZLIB_DECOMPRESSOR);
end;

function G_IS_ZLIB_DECOMPRESSOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_ZLIB_DECOMPRESSOR);
end;

function G_ZLIB_DECOMPRESSOR_GET_CLASS(obj: Pointer): PGZlibDecompressorClass;
begin
  Result := PGZlibDecompressorClass(PGTypeInstance(obj)^.g_class);
end;



end.

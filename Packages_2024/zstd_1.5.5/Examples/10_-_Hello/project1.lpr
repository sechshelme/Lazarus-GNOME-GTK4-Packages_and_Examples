program project1;

uses
  fp_zstd;

  procedure main;
  const
    src =
      'Hallo World !'#10 +
      'Hallo World !'#10 +
      'Hallo World !'#10 +
      'Hallo World !';
  var
    dstCapacity, compressedSize, decompSize: Tsize_t;
    dst, decompressed: Pointer;
    srcSize, decompressedCapacity: SizeInt;
  begin
    srcSize := Length(src) + 1;

    dstCapacity := ZSTD_compressBound(srcSize);
    dst := GetMem(dstCapacity);
    compressedSize := ZSTD_compress(dst, dstCapacity, pchar(src), srcSize, ZSTD_CLEVEL_DEFAULT);
    if ZSTD_isError(compressedSize) <> 0 then begin
      WriteLn('Kompression Fehler: ', ZSTD_getErrorName(compressedSize));
      Freemem(dst);
      Exit;
    end;

    decompressedCapacity := srcSize + ZSTD_DECOMPRESSION_MARGIN(srcSize, 128 shl 10);
    decompressed := GetMem(decompressedCapacity);
    decompSize := ZSTD_decompress(decompressed, decompressedCapacity, dst, compressedSize);
    if ZSTD_isError(decompSize) <> 0 then begin
      WriteLn('Dekompression Fehler: ', ZSTD_getErrorName(decompSize));
      Freemem(dst);
      Freemem(decompressed);
      Exit;
    end;

    WriteLn('Original: ', srcSize, ' -> Komprimiert: ', compressedSize, ' -> Dekomprimiert: ', decompSize);
    WriteLn('Text: '#10, pchar(decompressed));

    Freemem(dst);
    Freemem(decompressed);
  end;

begin
  main;
end.

program project1;

uses
  fp_brotli;

  procedure main;
  const
    input =
      'Hallo World !'#10 +
      'Hallo World !'#10 +
      'Hallo World !'#10 +
      'Hallo World !';
  var
    input_size, decompressed_size: integer;
    max_compressed_size, compressed_size: Tsize_t;
    compressed, decompressed: pbyte;
    ok: TBROTLI_BOOL;
    res: TBrotliDecoderResult;
  begin
    input_size := Length(input);
    WriteLn('Dekomprimiert: ', Length(input));

    max_compressed_size := BrotliEncoderMaxCompressedSize(input_size);
    compressed := GetMem(max_compressed_size);
    if compressed = nil then begin
      WriteLn('malloc compressed');
      Exit;
    end;
    compressed_size := max_compressed_size;
    ok := BrotliEncoderCompress(5, 22, BROTLI_MODE_GENERIC, input_size, pbyte(pchar(input)), @compressed_size, compressed);
    if not ok then begin
      WriteLn('BrotliEncoderCompress failed');
      Freemem(compressed);
      Exit;
    end;
    WriteLn('Komprimiert: ', compressed_size);

    decompressed_size := input_size * 2 + 16;
    decompressed := GetMem(decompressed_size);
    if decompressed = nil then begin
      WriteLn('malloc decompressed');
      Freemem(compressed);
      Exit;
    end;

    res := BrotliDecoderDecompress(compressed_size, compressed, @decompressed_size, decompressed);
    if res <> BROTLI_DECODER_RESULT_SUCCESS then begin
      WriteLn('BrotliDecoderDecompress failed: ', res);
      Freemem(compressed);
      Freemem(decompressed);
      Exit;;
    end;

    WriteLn('Dekomprimiert: ', decompressed_size);
    WriteLn('Text: '#10, pchar(decompressed));

    Freemem(compressed);
    Freemem(decompressed);
  end;

begin
  main;
end.

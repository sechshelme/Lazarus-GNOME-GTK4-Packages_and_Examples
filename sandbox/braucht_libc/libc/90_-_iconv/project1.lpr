program project1;

uses
  clib,
  fp_stdlib,
  fp_stdio,
  fp_iconv;

  procedure main;
  const
    input_utf8 = 'Hallo Welt! 🌍';
  var
    in_bytes, out_bytes, in_left, out_left, converted_size: SizeInt;
    in_ptr, output_utf32, out_ptr, res: pchar;
    cd: Ticonv_t;
  begin
    in_bytes := Length(input_utf8);
    out_bytes := (in_bytes + 1) * 4;
    output_utf32 := malloc(out_bytes);

    if output_utf32 = nil then begin Exit; end;

    in_ptr := input_utf8;
    out_ptr := output_utf32;
    in_left := in_bytes;
    out_left := out_bytes;

    cd := iconv_open('UTF-32LE', 'UTF-8');
    if cd = Ticonv_t(-1) then begin
      WriteLn('iconv_open');
      free(output_utf32);
      Exit;;
    end;

    if iconv(cd, @in_ptr, @in_left, @out_ptr, @out_left) = Tsize_t(-1) then begin
      WriteLn('iconv');
      iconv_close(cd);
      free(output_utf32);
      Exit;
    end;

    converted_size := out_bytes - out_left;
    printf('Konvertierung fertig!'#10);
    printf('Eingabe: %zu Bytes, Ausgabe: %zu Bytes (UTF-32LE)'#10, in_bytes, converted_size);

    res := output_utf32;
    printf('Erstes Zeichen als Hex: 0x%08X'#10, res[0]);

    iconv_close(cd);
    free(output_utf32);
  end;

begin
  main;
end.

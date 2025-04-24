program project1;

uses
  tommath;

  // https://www.perplexity.ai/search/gibt-es-eine-alternative-zu-mp-Yz.L3goxQkmufFUlYLzQcQ
  // GMP

  procedure Add;
  var
    a, b, sum: Tmp_int;
    size: longint = 0;
    buf: array[0..127] of char;
    i: integer;
    err: Tmp_err;
  begin
    FillChar(buf, Length(buf), $00);

    mp_init(@a);
    mp_init(@b);
    mp_init(@sum);

    err := mp_read_radix(@a, '1111', 10);
    WriteLn('err: ', err);
    err := mp_read_radix(@b, '2222', 10);
    WriteLn('err: ', err);

    err := mp_add(@a, @b, @sum);
    WriteLn('err: ', err);

    err := mp_radix_size(@sum, 10, @size);
    WriteLn('err: ', err);
    WriteLn('size: ', size);

    err := mp_to_radix(@sum, buf, SizeOf(buf), nil, 10);
    WriteLn('err: ', err);

    WriteLn('len: ', Length(buf), '  Data: ', buf);
    for i := 0 to 20 do begin
      Write(byte(buf[i]), ' - ');
    end;
    WriteLn(#10);

  end;

begin
  Add;
end.

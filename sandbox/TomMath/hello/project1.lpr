program project1;

uses
  tommath;

  // https://www.perplexity.ai/search/gibt-es-eine-alternative-zu-mp-Yz.L3goxQkmufFUlYLzQcQ
  // GMP

  procedure Add;
  var
    a, b, sum: Tmp_int;
    size: longint;
    buf: pchar;
  begin
    mp_init(@a);
    mp_init(@b);
    mp_init(@sum);

    mp_read_radix(@a, '111111', 10);
    mp_read_radix(@b, '222222', 10);

    mp_add(@a, @b, @sum);

    mp_radix_size(@sum, 10, @size);
    WriteLn('size: ', size);
    buf := GetMem(size);

    mp_to_radix(@sum, buf, size, nil, 10);

    WriteLn('len: ',Length(buf));
    WriteLn(buf);

    Freemem(buf);
  end;

begin
  Add;
end.

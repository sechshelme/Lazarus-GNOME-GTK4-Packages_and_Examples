program project1;

uses
  fp_tommath_1_2_1;

  function Read_mp_int(mp: Pmp_int): string;
  var
    size: Tsize_t=0;
    buf: pchar = nil;
  begin
    mp_radix_size(mp, 10, @size);
    buf := GetMem(size);
    mp_to_radix(mp, buf, size, nil, 10);
    Result := buf;
    Freemem(buf);
  end;

  procedure Calc;
  var
    a, b, sum, r: Tmp_int;
  begin
    mp_init(@a);
    mp_init(@b);
    mp_init(@r);
    mp_init(@sum);

    mp_read_radix(@a, '3333', 10);
    mp_read_radix(@b, '2222', 10);

    WriteLn(#10'--- Add ---------');

    mp_add(@a, @b, @sum);
    WriteLn(Read_mp_int(@a), ' + ', Read_mp_int(@b), ' = ', Read_mp_int(@sum));

    WriteLn(#10'--- Sub ---------');

    mp_sub(@a, @b, @sum);
    WriteLn(Read_mp_int(@a), ' - ', Read_mp_int(@b), ' = ', Read_mp_int(@sum));

    WriteLn(#10'--- Mul ---------');

    mp_mul(@a, @b, @sum);
    WriteLn(Read_mp_int(@a), ' * ', Read_mp_int(@b), ' = ', Read_mp_int(@sum));

    WriteLn(#10'--- Div ---------');

    mp_div(@a, @b, @sum, @r);
    WriteLn(Read_mp_int(@a), ' / ', Read_mp_int(@b), ' = ', Read_mp_int(@sum), '   Rest: ', Read_mp_int(@r));

    WriteLn(#10'------------'#10);

    mp_clear(@a);
    mp_clear(@b);
    mp_clear(@sum);
    mp_clear(@r);
  end;

begin
  Calc;
end.

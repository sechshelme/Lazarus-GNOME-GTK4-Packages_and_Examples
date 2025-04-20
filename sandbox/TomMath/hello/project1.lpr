program project1;
uses
  tommath;

// https://www.perplexity.ai/search/gibt-es-eine-alternative-zu-mp-Yz.L3goxQkmufFUlYLzQcQ
// GMP

procedure Add;
var
  a, b, sum: Tmp_int;
  size: Longint;
  buf:PChar;
begin
  mp_init(@a);
  mp_init(@b);
  mp_init(@sum);

  mp_read_radix(@a, '12345678901234567890',10);
  mp_read_radix(@b, '98765432109876543210',10);

  mp_add(@a,@b,@sum);

  mp_radix_size(@sum,10,@size);
  WriteLn('size: ',size);
  buf:=GetMem(size);

  mp_to_radix(@sum,buf,size,nil,10 );

  WriteLn(buf);

  Freemem(buf);
end;

begin
  Add;
end.


program project1;
uses
  fp_setjmp;

var
  buf: Tjmp_buf;

  procedure second;
  begin
    WriteLn('second');
    longjmp(buf, 1);
  end;

  procedure first;
  begin
    second;
    WriteLn('first');
  end;

  procedure main;
  begin
    if setjmp(buf) = 0 then begin
      first;
    end else begin
      WriteLn('main');
    end;
  end;

begin
  main;
end.

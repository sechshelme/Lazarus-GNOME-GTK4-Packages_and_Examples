program project1;

const
  {$IFDEF Linux}
  libclib = 'c';
  {$ENDIF}

  {$IFDEF mswindows}
  libclib = 'msvcrt';
  {$ENDIF}

type
  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

type
  {$ifdef unix}
  Tva_list_struct = record
    gp_offset: uint32;
    fp_offset: uint32;
    overflow_arg_area: Pointer;
    reg_save_area: Pointer;
  end;
  Tva_list = ^Tva_list_struct;
  {$endif}
  {$ifdef windows}
  Tva_list = Pointer;
  {$endif}
  //  Pva_list = ^Tva_list;

  function calloc(num, size: Tsize_t): Pointer; cdecl; external libclib;
  function malloc(size: Tsize_t): Pointer; cdecl; external libclib;
  procedure free(p: Pointer); cdecl; external libclib;

  function memcpy(dest, src: Pointer; n: SizeUInt): Pointer; cdecl; external libclib;
  function memchr(ptr: Pointer; value: integer; num: SizeUInt): Pointer; cdecl; external libclib;
  function memcmp(ptr1, ptr2: Pointer; num: SizeUInt): integer; cdecl; external libclib;

  function vprintf(format: pchar; list: Tva_list): integer; cdecl; external libclib;
  function printf(format: pchar): integer; varargs; cdecl; external libclib;

  procedure main_Integer;
  var
    list: Tva_list;
    ia: PUInt64;
    i: integer;
  const
    COUNT = 8;
  begin
    ia := malloc(SizeOf(uint64) * COUNT);
    for i := 0 to COUNT - 1 do begin
      ia[i] := i * 11;
    end;

    {$ifdef unix}
    list := malloc(SizeOf(Tva_list^));
    list^.gp_offset := $0;
    list^.fp_offset := $0;
    list^.overflow_arg_area := nil;
    list^.reg_save_area := ia;
    {$endif}
    {$ifdef windows}
    list := ia;
    {$endif}

    {$ifdef unix}
    vprintf('Zahl: %ld - %ld - %ld - %ld - %ld', list);
    {$endif}
    {$ifdef windows}
    vprintf('Zahl: %lld - %lld - %lld - %lld - %lld', list);
    {$endif}

    {$ifdef unix}
    free(list);
    {$endif}

    free(ia);
    printf(#10#10);
  end;

  procedure main_Float;
  var
    list: Tva_list;
    ia: PDouble;
    i: integer;
  const
    COUNT = 8;
    {$ifdef unix}
    REG_SIZE = 16;
    MUL = 2;
    {$endif}
    {$ifdef Windows}
    REG_SIZE = 8;
    MUL = 1;
    {$endif}


  begin
    ia := malloc(REG_SIZE * COUNT);
    for i := 0 to COUNT - 1 do begin
      ia[i * MUL] := i * 11.11;
    end;

    {$ifdef unix}
    list := malloc(SizeOf(Tva_list^));
    list^.gp_offset := $0;
    list^.fp_offset := $0;
    list^.overflow_arg_area := nil;
    list^.reg_save_area := ia;
    {$endif}
    {$ifdef windows}
    list := ia;
    {$endif}

    {$ifdef unix}
    vprintf('Zahl: %f - %f - %f - %f - %f', list);
    {$endif}
    {$ifdef windows}
    vprintf('Zahl: %f - %f- %f - %f - %f', list);
    {$endif}

    {$ifdef unix}
    free(list);
    {$endif}

    free(ia);
    printf(#10#10);
  end;

begin
  main_Integer;
  main_Float;
end.

program project1;

const
  {$IFDEF Linux}
  libclib = 'c';
  {$ENDIF}

  {$IFDEF windows}
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


  function InitVa(p: Pointer): Tva_list;
  begin
    {$ifdef unix}
    Result := malloc(SizeOf(Tva_list^));
    Result^.gp_offset := $0;
    Result^.fp_offset := $0;
    Result^.overflow_arg_area := nil;
    Result^.reg_save_area := p;
    {$endif}
    {$ifdef windows}
    Result := p;
    {$endif}
  end;

  function FloatToVa(f: double): Tva_list;
  var
    ia: PDouble;
  begin
    ia := malloc(SizeOf(double));
    ia^ := f;

    Result := InitVa(ia);
  end;

  function IntToVa(i: PtrUInt): Tva_list;
  var
    ia: PPtrUInt;
  begin
    ia := malloc(SizeOf(PtrUInt));
    ia^ := i;

    Result := InitVa(ia);
  end;


  procedure main_Integer;
  var
    list: Tva_list;
  begin
    list := IntToVa(1234);

    vprintf('Int  : %ld', list);

    {$ifdef unix}
    free(list^.reg_save_area);
    {$endif}
    free(list);

    printf(#10#10);
  end;

  procedure main_Float;
  var
    list: Tva_list;
  begin
    list := FloatToVa(11.11);

    vprintf('Float: %f', list);

    {$ifdef unix}
    free(list^.reg_save_area);
    {$endif}
    free(list);

    printf(#10#10);
  end;

begin
  main_Integer;
  main_Float;
end.

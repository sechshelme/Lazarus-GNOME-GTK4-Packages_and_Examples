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


  function NewValueList(ptr: Pointer): Tva_list;
  var
    p: PPointer;
  begin
    p := malloc(16); // Ein Float kann 16 Byte im overflow_arg_area beanspruchen.
    p^ := ptr;

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

  function NewValueList(d: double): Tva_list;
  var
    p: Pointer absolute d;
  begin
    Result := NewValueList(p);
  end;

  function NewValueList(i: PtrUInt): Tva_list;
  var
    p: Pointer absolute i;
  begin
    Result := NewValueList(p);
  end;

  procedure Free_ValueList(list: Tva_list);
  begin
    {$ifdef unix}
    free(list^.reg_save_area);
    {$endif}
    free(list);
  end;


  procedure main_Integer;
  var
    list: Tva_list;
  begin
    list := NewValueList(1234);
    vprintf('Int  : %ld'#10#10, list);
    Free_ValueList(list);
  end;

  procedure main_Float;
  var
    list: Tva_list;
  begin
    list := NewValueList(11.11);
    vprintf('Float: %f'#10#10, list);
    Free_ValueList(list);
  end;

  procedure main_Pointer;
  var
    list: Tva_list;
  begin
    list := NewValueList(Pointer(3333));
    vprintf('Pointer: %ld'#10#10, list);
    Free_ValueList(list);
  end;

begin
  main_Integer;
  main_Float;
  main_Pointer;
end.

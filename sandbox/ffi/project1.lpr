program project1;

uses
  fp_ffi,
  ffitarget;

const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

  //  function puts(str: pansichar): integer; cdecl; external libc;
  //  function printf(format: pansichar): integer; cdecl; varargs; external libc;
var
  puts: Pointer; cvar;external libc;
  printf: Pointer; cvar;external libc;

  // ======================================================================

  procedure main;
  type
    argcount = 0..0;
  var
    args_types: array[argcount] of Pffi_type;
    arg_val: array[argcount] of Pointer;
    cif: Tffi_cif;
    res: Tffi_arg;
    str: pchar;
  begin
    args_types[0] := @ffi_type_pointer;

    if ffi_prep_cif(@cif, FFI_DEFAULT_ABI, 1, @ffi_type_sint, @args_types) = FFI_OK then begin
      str := 'Hello World!';
      arg_val[0] := @str;
      ffi_call(@cif, @puts, @res, arg_val);

      str := 'Hallo Welt!';
      arg_val[0] := @str;
      ffi_call(@cif, @puts, @res, arg_val);
    end;
  end;

  // ======================================================================

  procedure main_varargs;
  type
    argcount = 0..3;
  var
    args_types: array[argcount] of Pffi_type;
    arg_val: array[argcount] of Pointer;
    cif: Tffi_cif;
    res: Tffi_arg;
    str1, str2: pchar;
    f: double;
    i: integer;

  begin
    args_types[0] := @ffi_type_pointer;
    args_types[1] := @ffi_type_double;
    args_types[2] := @ffi_type_sint;
    args_types[3] := @ffi_type_pointer;

    if ffi_prep_cif_var(@cif, FFI_DEFAULT_ABI, 1, 4, @ffi_type_sint, @args_types) = FFI_OK then begin
      str1 := 'Double: %g   Integer: %i   PChar: %s'#10;
      arg_val[0] := @str1;
      f := 12.34;
      arg_val[1] := @f;
      i := 123;
      arg_val[2] := @i;
      str2 := 'String';
      arg_val[3] := @str2;
      ffi_call(@cif, @printf, @res, arg_val);
    end;
  end;

  // ======================================================================

type
  TRect = record
    x, y, w, h: int32;
  end;

  function print_rect(r: TRect): int32; cdecl;
  begin
    with r do begin
      WriteLn('x: ', x, '  y: ', y, '  w: ', w, '  h: ', h);
      Result := r.x + r.y + r.w + r.h;
    end;
  end;

  procedure main_struct;
  type
    argcount = 0..0;
  var
    args_types: array[argcount] of Pffi_type;
    arg_val: array[argcount] of Pointer;
    cif: Tffi_cif;
    res: Tffi_arg;

    elements: array[0..4] of Pffi_type;
    rect_type: Tffi_type;
  const
    r: TRect = (x: 10; y: 20; w: 30; h: 40);
  begin
    elements[0] := @ffi_type_sint32;
    elements[1] := @ffi_type_sint32;
    elements[2] := @ffi_type_sint32;
    elements[3] := @ffi_type_sint32;
    elements[4] := nil;

    rect_type.size := 0;
    rect_type.alignment := 0;
    rect_type._type := FFI_TYPE_STRUCT_;
    rect_type.elements := elements;

    args_types[0] := @rect_type;

    if ffi_prep_cif(@cif, FFI_DEFAULT_ABI, 1, @ffi_type_sint32, @args_types) = FFI_OK then begin
      arg_val[0] := @r;
      ffi_call(@cif, @print_rect, @res, arg_val);
      WriteLn('Resultat: ', int32(res));
    end;
  end;


  // ======================================================================


type
  TRectAndPoint = record
    x, y, w, h: int32;
    point: record
      x, y: int32
      end;
  end;

  procedure print_rect_and_point(r: TRectAndPoint); cdecl;
  begin
    with r do begin
      WriteLn('x: ', x, '  y: ', y, '  w: ', w, '  h: ', h, '  point: ', r.point.x, 'x', r.point.y);
    end;
  end;

  procedure mainkomplex;
  type
    argcount = 0..0;
  var
    args_types: array[argcount] of Pffi_type;
    arg_val: array[argcount] of Pointer;
    cif: Tffi_cif;
    res: Tffi_arg;

    point_elements: array[0..2] of Pffi_type;
    point_type: Tffi_type;

    rect_elements: array[0..5] of Pffi_type;
    rect_type: Tffi_type;
  const
    r: TRectAndPoint = (x: 10; y: 20; w: 30; h: 40; point: (x: 50; y: 60));
  begin
    point_elements[0] := @ffi_type_sint32;
    point_elements[1] := @ffi_type_sint32;
    point_elements[2] := nil;

    point_type.size := 0;
    point_type.alignment := 0;
    point_type._type := FFI_TYPE_STRUCT_;
    point_type.elements := point_elements;

    rect_elements[0] := @ffi_type_sint32;
    rect_elements[1] := @ffi_type_sint32;
    rect_elements[2] := @ffi_type_sint32;
    rect_elements[3] := @ffi_type_sint32;
    rect_elements[4] := @point_type;
    rect_elements[5] := nil;

    rect_type.size := 0;
    rect_type.alignment := 0;
    rect_type._type := FFI_TYPE_STRUCT_;
    rect_type.elements := rect_elements;

    args_types[0] := @rect_type;

    if ffi_prep_cif(@cif, FFI_DEFAULT_ABI, 1, @ffi_type_void, @args_types) = FFI_OK then begin
      arg_val[0] := @r;
      ffi_call(@cif, @print_rect_and_point, @res, arg_val);
    end;
  end;

// ======================================================================

procedure print_Vector(v: array of int32);
var
  i: integer;
begin
  WriteLn('Len Vector: ', Length(v));
  for i := 0 to Length(v) - 1 do begin
    Write(v[i], ' ');
  end;
  WriteLn();
end;


procedure main_dynamic_array;
type
  argcount = 0..1;
const
  a: array of int32 = (11, 22, 33, 44, 55, 66, 77, 88, 99);
var
  args_types: array[argcount] of Pffi_type;
  arg_val: array[argcount] of Pointer;
  cif: Tffi_cif;
  res: Tffi_arg;
  l: SizeInt;
begin
  args_types[0] := @ffi_type_pointer;
  args_types[1] := @ffi_type_sint64;

  if ffi_prep_cif(@cif, FFI_DEFAULT_ABI, 2, @ffi_type_void, @args_types) = FFI_OK then begin
    arg_val[0] := @a;
    l := Length(a) - 1;
    arg_val[1] := @l;
    ffi_call(@cif, @print_Vector, @res, arg_val);
  end;
end;

// ======================================================================

procedure print_string(s: AnsiString);
var
  i: integer;
begin
  WriteLn('Len String: ', Length(s));
  for i := 1 to Length(s) do begin
    Write(s[i], ' ');
  end;
  WriteLn();
end;


procedure main_ansistring;
type
  argcount = 0..1;
const
  s: AnsiString='12345678901234567890';
var
  args_types: array[argcount] of Pffi_type;
  arg_val: array[argcount] of Pointer;
  cif: Tffi_cif;
  res: Tffi_arg;
  l: SizeInt;
begin
  args_types[0] := @ffi_type_pointer;
  args_types[1] := @ffi_type_uint8;

  if ffi_prep_cif(@cif, FFI_DEFAULT_ABI, 2, @ffi_type_void, @args_types) = FFI_OK then begin
    arg_val[0] := @s;
    l := Length(s) - 1;
    arg_val[1] := @l;
    ffi_call(@cif, @print_string, @res, arg_val);
  end;
end;

begin
  main;
  main_varargs;
  main_struct;
  mainkomplex;
  main_dynamic_array;
  main_ansistring;
end.

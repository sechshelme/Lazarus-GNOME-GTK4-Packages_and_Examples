program project1;

uses
  ctypes,
  fp_glib2,
  Rectangle;

  procedure printRectangle(r: PERectangle);
  var
    x, y, w, h: Tgint;
    Name: Pgchar;
  begin
    x := e_rectangle_get_x(r);
    y := e_rectangle_get_y(r);
    w := e_rectangle_get_w(r);
    h := e_rectangle_get_h(r);
    Name := e_rectangle_get_name(r);
    g_printf('x: %6d  y: %6d  w: %6d  h: %6d  name: %s'#10, x, y, w, h, Name);
  end;

  procedure printRectValue(v: PGValue);
  var
    r: PERectangle;
  begin
    if v^.g_type = E_TYPE_RECTANGLE then begin
      r := g_value_get_boxed(v);
      printRectangle(r);
    end;
  end;

  procedure rename_Name_from_GValue(v: PGValue; Name: Pgchar);
  var
    r: PERectangle;
  begin
    r := g_value_get_boxed(v);
    e_rectangle_set_name(r, Name);
    e_rectangle_move(r,1000,1000);
  end;

  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    srcRect, destRect1, destRect2: PERectangle;
    valueRect: TGValue;
  begin
    g_printf(#10'----------- g_boxed -----------------'#10#10);
    g_printf('--- srcRect'#10);
    srcRect := e_rectangle_new(10, 20, 100, 50, 'srcRect');
    printRectangle(srcRect);

    g_printf('--- destRect1'#10);
    destRect1 := g_boxed_copy(E_TYPE_RECTANGLE, srcRect);
    e_rectangle_set_name(destRect1, 'destRect1');
    e_rectangle_move(destRect1, 100, 100);
    e_rectangle_resize(destRect1, -10, -10);
    printRectangle(destRect1);
    g_boxed_free(E_TYPE_RECTANGLE, destRect1);

    g_printf('--- destRect2'#10);
    destRect2 := g_boxed_copy(E_TYPE_RECTANGLE, srcRect);
    e_rectangle_set_name(destRect2, 'destRect2');
    e_rectangle_move(destRect2, 33, 33);
    e_rectangle_resize(destRect2, -22, -22);
    printRectangle(destRect2);
    g_boxed_free(E_TYPE_RECTANGLE, destRect2);

    g_printf(#10'----------- g_value -----------------'#10#10);

    valueRect := G_VALUE_INIT_;
    g_value_init(@valueRect, E_TYPE_RECTANGLE);
    g_value_set_boxed(@valueRect, srcRect);
    printRectValue(@valueRect);
    rename_Name_from_GValue(@valueRect, 'TERectangle in GValue');
    printRectValue(@valueRect);

    printRectangle(srcRect);
    g_value_unset(@valueRect);

    g_boxed_free(E_TYPE_RECTANGLE, srcRect);

    Exit(0);
  end;

begin
  main(argc, argv);

end.

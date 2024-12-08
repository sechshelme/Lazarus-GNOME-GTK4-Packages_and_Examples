program project1;

uses
  ctypes,
  fp_glib2,
  Rectangle;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ
  // https://www.perplexity.ai/search/gibr-mir-ein-beispiel-mit-g-bo-QeQLcJ1sS6uzrPeBbsFeug

  procedure printRectangle(r: PERectangle);
  var
    x, y, w, h: Tgint;
  begin
    x := e_rectangle_get_x(r);
    y := e_rectangle_get_y(r);
    w := e_rectangle_get_w(r);
    h := e_rectangle_get_h(r);

    g_printf('x: %6d  y: %6d  w: %6d  h: %6d'#10, x, y, w, h);
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

  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    srcRect, destRect1, destRect2: PERectangle;
    valueRect1: TGValue;
  begin
    g_printf(#10'----------- g_boxed -----------------'#10#10);
    g_printf('--- srcRect'#10);
    srcRect := e_rectangle_new(10, 20, 100, 50);
    printRectangle(srcRect);

    g_printf('--- destRect1'#10);
    destRect1 := g_boxed_copy(E_TYPE_RECTANGLE, srcRect);
    e_rectangle_move(destRect1, 100, 100);
    e_rectangle_resize(destRect1, -10, -10);
    printRectangle(destRect1);
    g_boxed_free(E_TYPE_RECTANGLE, destRect1);

    g_printf('--- destRect2'#10);
    destRect2 := g_boxed_copy(E_TYPE_RECTANGLE, srcRect);
    e_rectangle_move(destRect2, 33, 33);
    e_rectangle_resize(destRect2, -22, -22);
    printRectangle(destRect2);
    g_boxed_free(E_TYPE_RECTANGLE, destRect2);

    g_printf(#10'----------- gvalue -----------------'#10#10);

    valueRect1 := G_VALUE_INIT_;

    g_value_init(@valueRect1, E_TYPE_RECTANGLE);
    g_value_set_boxed(@valueRect1, srcRect);
    printRectValue(@valueRect1);
    g_value_unset(@valueRect1);

    g_boxed_free(E_TYPE_RECTANGLE, srcRect);

    Exit(0);
  end;

begin
  main(argc, argv);

end.

program project1;

uses
  ctypes,
  fp_glib2,
  Rectangle;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ
  // https://www.perplexity.ai/search/gibr-mir-ein-beispiel-mit-g-bo-QeQLcJ1sS6uzrPeBbsFeug

  procedure printRectangle(r: PERectangle);
  begin
    g_printf('x: %6d  y: %6d  w: %6d  h: %6d'#10, r^.x, r^.y, r^.w, r^.h);
  end;


  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    rect_type: TGType;
    rect, rect_copy: PERectangle;
  begin
    rect_type := E_TYPE_RECTANGLE;
    rect := g_malloc(SizeOf(TERectangle));
    rect^.x := 10;
    rect^.y := 20;
    rect^.w := 100;
    rect^.h := 50;

    rect_copy := e_rectangle_copy(rect);
    e_rectangle_move(rect_copy, 100, 100);

    printRectangle(rect);
    printRectangle(rect_copy);


    e_rectangle_free(rect);
    e_rectangle_free(rect_copy);

    Exit(0);
  end;

begin
  main(argc, argv);

end.

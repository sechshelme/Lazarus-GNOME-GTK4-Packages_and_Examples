program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;

  procedure printSequence(seq: PGSequence);
  var
    iter: PGSequenceIter;
    Value, i: Tgint;
  begin
    i := 0;
    g_printf('Count: %d'#10, g_sequence_get_length(seq));
    iter := g_sequence_get_begin_iter(seq);
    while not g_sequence_iter_is_end(iter) do begin
      Value := GPOINTER_TO_INT(g_sequence_get(iter));
      g_printf('%3d.   %3d'#10, i, Value);
      iter := g_sequence_iter_next(iter);
      Inc(i);
    end;
    g_printf('-------------'#10);
  end;

  procedure destroy_cp(Data: Tgpointer); cdecl;
  begin
    g_printf('%d (destroyed)'#10, GPOINTER_TO_INT(Data));
  end;

  function compare_cp(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  begin
    Result := GPOINTER_TO_INT(a) - GPOINTER_TO_INT(b);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    sequence: PGSequence;
    i: integer;
  begin
    sequence := g_sequence_new(@destroy_cp);

    for i := 0 to 15 do begin
      g_sequence_append(sequence, GINT_TO_POINTER(g_random_int_range(0, 99)));
    end;

    printSequence(sequence);
    g_sequence_sort(sequence, @compare_cp, nil);
    printSequence(sequence);

    g_sequence_free(sequence);
    Result := 0;
  end;


begin
  main(argc, argv);
end.

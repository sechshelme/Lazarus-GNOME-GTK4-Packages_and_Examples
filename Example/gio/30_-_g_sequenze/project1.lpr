program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;

// https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gsequ-ocg8yebdQ42HHUYMUJdsYA

  procedure printSequence(seq:PGSequence);
  var
    iter: PGSequenceIter;
    value: Tgint;
  begin
       iter:=g_sequence_get_begin_iter(seq);
       while not g_sequence_iter_is_end(iter) do begin
         value:=    GPOINTER_TO_INT(g_sequence_get(iter));
         g_printf('iter: %3d'#10,value);
         iter:=g_sequence_iter_next(iter);
       end;
  end;

  procedure destroy_cp(Data: Tgpointer); cdecl;
  begin
    g_printf('%d (destroyed)'#10,GPOINTER_TO_INT(Data));
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    sequence: PGSequence;
    i: Integer;
  begin
    sequence:=g_sequence_new(@destroy_cp);

    for i:=0 to 15 do
    g_sequence_append(sequence, GINT_TO_POINTER(g_random_int_range(0, 99)));

printSequence(sequence);



       g_sequence_free(sequence);
    Result := 0;
  end;


begin
  main(argc, argv);
end.

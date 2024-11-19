program project1;

uses
  ctypes,
  fp_glib2;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-g-a-n4mKsWQORrCdGPfKL009hg

  function main(argc: cint; argv: PPChar): cint;
  var
    garray: PGArray;
    i: cint;
  begin
    garray := g_array_new(True, False, SizeOf(cint));

    for i := 0 to 15 do begin
      g_array_append_val(garray, Pointer(i));
    end;

    g_printf('Count: %i'#10, garray^.len);
    for i := 0 to garray^.len - 1 do begin
      g_printf('%4i. value: %4i'#10, i, pcint(garray^.Data)[i]);
    end;

    g_array_free(garray, True);
  end;

begin
  main(argc, argv);
end.

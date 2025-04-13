program project1;

uses
  ctypes,
  fp_glib2;

const
  hello: array[0..12] of char = 'Hello World !';

  procedure printByte(b: PGBytes);
  var
    retrieved_data: pchar;
    size: Tgsize;
    i: integer;
  begin
    retrieved_data := g_bytes_get_data(b, @size);
    g_printf('size: %d'#10, size);
    g_printf('data: ');
    for i := 0 to size - 1 do begin
      g_printf('%c', retrieved_data[i]);
    end;
    g_printf(#10'-----------'#10);
  end;

  procedure my_free(Data: Tgpointer; user_date:Tgpointer); cdecl;
  begin
    g_printf('(free)'#10);
    g_printf('user_data: %s'#10, user_date);
    g_free(Data);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    bytes, sub_bytes: PGBytes;
  begin
    bytes := g_bytes_new(@hello, SizeOf(hello));
    printByte(bytes);

    sub_bytes := g_bytes_new_from_bytes(bytes, 6, 5);
    printByte(sub_bytes);

    g_bytes_unref(bytes);
    g_bytes_unref(sub_bytes);

    bytes := g_bytes_new_with_free_func(@hello, SizeOf(hello), TGDestroyNotify(@my_free), PChar('blabla'));
    printByte(bytes);
    g_bytes_unref(bytes);
  end;

begin
  main(argc, argv);
end.

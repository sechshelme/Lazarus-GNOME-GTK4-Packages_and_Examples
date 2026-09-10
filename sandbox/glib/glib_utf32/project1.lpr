program project1;

uses
  fp_glib2;

procedure printUCS4(s:PChar);
var
  items_read: Tglong = 0;
  items_written: Tglong = 0;
  output_utf32: Pgunichar;
  err: PGError = nil;
  i: Integer;
begin
  output_utf32 := g_utf8_to_ucs4(s, -1, @items_read, @items_written, @err);

  if err <> nil then begin
    g_printerr('Fehler bei der Konvertierung: %s'#10, err^.message);
    g_error_free(err);
    Exit;
  end;

  g_printf('%s'#10, s);

  g_printf('Konvertierung fertig mit GLib!'#10);
  g_printf('Gelesene Bytes: %ld, Erstellte UTF-32 Zeichen: %ld'#10, items_read, items_written);
  for i:=0 to items_read-1 do Write(int32(s[i]),'  ');
  WriteLn();
  for i:=0 to items_written-1 do Write(int32(output_utf32[i]),'  ');
  WriteLn();

//  g_printf('Erstes Zeichen als Hex: 0x%08X'#10, output_utf32[0]);

//  g_printf('Emoji-Zeichen als Hex: 0x%08X'#10, output_utf32[12]);
  g_printf('--------------------------------'#10, output_utf32[12]);

  g_free(output_utf32);
  end;

  procedure main;
  begin
    printUCS4('1234');
    printUCS4('öäü');
    printUCS4('Ÿ');
    printUCS4('Hallo Welt! 🌍');
  end;

begin
  main;
end.

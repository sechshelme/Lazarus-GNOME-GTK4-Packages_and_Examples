program project1;

uses
  fp_glib2,
  fp_GTK4;

  procedure main;
  var
    s: pchar;
  const
    rgba: TGdkRGBA = (red: 1.0; green: 1.0; blue: 1.0; alpha: 0.5; );
  begin
    s := gdk_rgba_to_string(@rgba);
    g_printf('RGB: %s'#10, s);
    g_free(s);

    gdk_rgba_parse(@rgba, '#FF573380');
    s := gdk_rgba_to_string(@rgba);
    g_printf('RGB: %s'#10, s);
    g_free(s);

    gdk_rgba_parse(@rgba, 'yellow');
    s := gdk_rgba_to_string(@rgba);
    g_printf('RGB: %s'#10, s);
    g_free(s);
  end;

begin
  main;
end.

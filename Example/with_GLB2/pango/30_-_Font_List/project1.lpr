program project1;

uses
  fp_glib2,
  fp_pango;

  procedure main;
  var
    fontmap: PPangoFontMap;
    families: PPPangoFontFamily;
    n_families: longint;
    name: pchar;
    i: integer;
  begin
    fontmap := pango_cairo_font_map_get_default;
    pango_font_map_list_families(fontmap, @families, @n_families);

    for i := 0 to n_families - 1 do begin
      name := pango_font_family_get_name(families[i]);
      g_print('Font family: %s'#10, name);
    end;
    g_print(#10'Total Fonts: %d'#10,n_families );

    g_free(families);
  end;

begin
  main;
end.

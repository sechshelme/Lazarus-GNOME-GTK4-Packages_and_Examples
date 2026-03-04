program project1;

uses
  fp_lasem,
  fp_GLIBTools,
  fp_cairo,
  fp_glib2;

  procedure main;
  const
    filename = 'test.png';
  const
    itex_formel = '<p>$$e^{i \pi} + 1 = 0$$</p>';
    mathml = '<math><msqrt><mi>x</mi><mo>+</mo><mn>1</mn></msqrt></math>';
    scale = 8.0;

  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    mathml_code: pchar;
    view: PLsmDomView;
    width, height: double;
    sw, sh: int64;
    surface: Pcairo_surface_t;
    cr: Pcairo_t;
  begin
    doc := PLsmDomDocument(lsm_mathml_document_new_from_itex(itex_formel, -1, @err));


    //    doc := lsm_dom_document_new_from_memory(mathml, -1, nil);

    //    mathml_code := lsm_itex_to_mathml('e^{i \\pi} + 1 = 0', -1);
    //    doc = lsm_dom_document_new_from_memory(mathml_code, -1, NULL);
    //    g_free(mathml_code); // Speicher wieder freigeben


    if err <> nil then begin
      g_printf('Fehler beim Parsen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    if doc = nil then begin
      g_printf('Fehler: Dokument konnte nicht erstellt werden.'#10);
      Exit;
    end;

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_get_size(view, @width, @height, nil);

    sw := Trunc(width * scale);
    sh := Trunc(height * scale);

    surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, sw, sh);
    cr := cairo_create(surface);
    cairo_scale(cr, scale, scale);

    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);
    cairo_set_source_rgb(cr, 0, 0, 0);
    lsm_dom_view_render(view, cr, 0, 0);

    cairo_surface_write_to_png(surface, filename);
    g_printf('Erfolg! Bild mit itex erstellt: %d x %d px'#10, sw, sh);

    cairo_destroy(cr);
    cairo_surface_destroy(surface);
    g_object_unref(view);
    g_object_unref(doc);
  end;

var

  p1: Pointer;
begin
  p1 := g_object_new(LSM_TYPE_MATHML_MATH_ELEMENT, nil);
  GObjectShowProperty(p1);
  p1 := g_object_new(LSM_TYPE_MATHML_PRESENTATION_TOKEN, nil);
  GObjectShowProperty(p1);
  p1 := g_object_new(LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT, nil);
  GObjectShowProperty(p1);


  main;
end.

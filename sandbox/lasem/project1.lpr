program project1;

uses
  fp_lasem,
  fp_GLIBTools,
  fp_cairo,
  fp_glib2;

  procedure CreateView(x, y: integer; cr: Pcairo_t);
  const
    itex_formel = '<p>$$\color{red}e^{i \pi} + 1 = 0$$</p>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
    width, height: double;
    ch: PLsmMathmlDocument;
  begin
    ch := lsm_mathml_document_new_from_itex(itex_formel, -1, @err);
    doc := LSM_DOM_DOCUMENT(ch);
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
    lsm_dom_view_set_resolution(view, 500);
    lsm_dom_view_get_size(view, @width, @height, nil);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateView2(x, y: integer; cr: Pcairo_t);
  const
    mathml =
      '<math>' +
      '  <mstyle mathcolor="green">' +
      '    <msqrt>' +
      '      <mi>x</mi>' +
      '      <mo>+</mo>' +
      '      <mn>1</mn>' +
      '    </msqrt>' +
      '  </mstyle>' +
      '</math>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
    width, height: double;
  begin
    doc := lsm_dom_document_new_from_memory(mathml, -1, @err);
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
    lsm_dom_view_set_resolution(view, 500);
    lsm_dom_view_get_size(view, @width, @height, nil);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateViewManual(x, y: integer; cr: Pcairo_t);
  var
    doc: PLsmDomDocument;
    view: PLsmDomView;
    root, mstyle, mroot_el, mrow, mi, mo, mn, mindex: PLsmDomElement;
  begin
    doc := lsm_dom_document_new_from_memory('<math></math>', -1, nil);
    root := PLsmDomElement(lsm_dom_document_get_document_element(doc));

    // 1. Elemente erzeugen
    mstyle := lsm_dom_document_create_element(doc, 'mstyle');
    mroot_el := lsm_dom_document_create_element(doc, 'mroot'); // mroot statt msqrt
    mrow := lsm_dom_document_create_element(doc, 'mrow');  // Container für den Inhalt
    mindex := lsm_dom_document_create_element(doc, 'mn');    // Der Index (die 3)

    mi := lsm_dom_document_create_element(doc, 'mi');
    mo := lsm_dom_document_create_element(doc, 'mo');
    mn := lsm_dom_document_create_element(doc, 'mn');

    lsm_dom_element_set_attribute(mstyle, 'mathcolor', 'blue');

    // Textknoten zuweisen
    lsm_dom_node_append_child(LSM_DOM_NODE(mindex), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '13')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mi), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, 'x')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mo), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '·')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mn), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '77')));

    // 2. Hierarchie aufbauen
    lsm_dom_node_append_child(LSM_DOM_NODE(root), LSM_DOM_NODE(mstyle));
    lsm_dom_node_append_child(LSM_DOM_NODE(mstyle), LSM_DOM_NODE(mroot_el));

    // Kind 1 von mroot: Der Inhalt (in eine Reihe gefasst)
    lsm_dom_node_append_child(LSM_DOM_NODE(mroot_el), LSM_DOM_NODE(mrow));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mi));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mo));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mn));

    // Kind 2 von mroot: Der Index
    lsm_dom_node_append_child(LSM_DOM_NODE(mroot_el), LSM_DOM_NODE(mindex));

    // View & Render
    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_set_resolution(view, 500.0);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure main;
  const
    filename = '/tmp/test.png';
  var
    surface: Pcairo_surface_t;
    cr: Pcairo_t;
  begin
    surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 640, 480);
    cr := cairo_create(surface);

    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 0, 0, 0);

    CreateView(0, 0, cr);
    CreateView2(0, 120, cr);
    CreateViewManual(0, 240, cr);

    cairo_surface_write_to_png(surface, filename);

    cairo_destroy(cr);
    cairo_surface_destroy(surface);
  end;

begin
  main;
end.

program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_GSK4,
  fp_GDK4,
  fp_graphene;

  procedure button_quit_cb({%H-}widget: PGtkWidget; {%H-}Data: Tgpointer);
  var
    app: PGApplication;
  begin
    app := g_application_get_default;
    g_application_quit(app);
  end;

  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gtksn-RK5kw09KRSSW_M7erbNCYg

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    snapshot: PGtkSnapshot;
    color: TGdkRGBA;
    gri: Tgraphene_rect_t;
    rr: TGskRoundedRect;
    bw: TVector4f;
    colors: Tborder_colors;
    node: PGskRenderNode;
  begin
    snapshot := gtk_snapshot_new;
    gri := GRAPHENE_RECT_INIT(50, 50, 100, 100);
    color.items := [1.0, 0.0, 0.0, 1.0];
    gtk_snapshot_append_color(snapshot, @color, @gri);

    gri := GRAPHENE_RECT_INIT(70, 70, 120, 120);
    color.items := [0.0, 1.0, 0.0, 1.0];
    gtk_snapshot_append_color(snapshot, @color, @gri);

    rr.bounds := GRAPHENE_RECT_INIT(25, 25, 150, 150);
    rr.corner[0] :=GRAPHENE_SIZE_INIT(5,5);
    rr.corner[1] :=GRAPHENE_SIZE_INIT(5,5);
    rr.corner[2] :=GRAPHENE_SIZE_INIT(5,5);
    rr.corner[3] :=GRAPHENE_SIZE_INIT(5,5);
    bw := [2, 2, 2, 2];
    colors[0].items := [0, 0, 1, 1];
    colors[1].items := [1, 0, 1, 1];
    colors[2].items := [0, 1, 1, 1];
    colors[3].items := [0, 1, 0, 1];
    gtk_snapshot_append_border(snapshot, @rr, bw, colors);
    node := gtk_snapshot_to_node(snapshot);
    cairo_move_to(cr,1000,1000);
    gsk_render_node_draw(node, cr);
    cairo_move_to(cr,1000,1000);
    gsk_render_node_unref(node);
    g_object_unref(snapshot);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, box, button, drawing_area, button_box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(box), button_box);

    button := gtk_button_new_with_label('Quit');
    gtk_widget_set_hexpand(button, True);
    gtk_widget_set_halign(button, GTK_ALIGN_CENTER);
    gtk_box_append(GTK_BOX(button_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_quit_cb), nil);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.

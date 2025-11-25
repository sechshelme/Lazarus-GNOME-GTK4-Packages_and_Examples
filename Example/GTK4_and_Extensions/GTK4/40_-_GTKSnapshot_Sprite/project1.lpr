program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_GLIBTools,
  fp_graphene;

type
  TVector4f = array[0..3] of single;

const
  spriteDataKey = 'SpriteData';
type
  TSpriteData = record
    sprite: array[0..7] of record
      angele,
      step: single;
      end;
  end;
  PSpriteData = ^TSpriteData;

  procedure button_quit_cb({%H-}widget: PGtkWidget; {%H-}Data: Tgpointer); cdecl;
  var
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));
    gtk_window_close(GTK_WINDOW(windowList^.Data));
  end;

  function CreateSprites: PGskRenderNode;
  var
    snapshot: PGtkSnapshot;
    color: TGdkRGBA;
    gri: Tgraphene_rect_t;
    rr: TGskRoundedRect;
    bw: TVector4f;
    colors: Tborder_colors;
  begin
    snapshot := gtk_snapshot_new;
    gtk_snapshot_scale(snapshot, 0.1, 0.1);

    gri := GRAPHENE_RECT_INIT(50, 50, 100, 100);
    color.items := [1.0, 0.0, 0.0, 1.0];
    gtk_snapshot_append_color(snapshot, @color, @gri);

    gri := GRAPHENE_RECT_INIT(70, 70, 120, 120);
    color.items := [0.0, 1.0, 0.0, 1.0];
    gtk_snapshot_append_color(snapshot, @color, @gri);

    rr.bounds := GRAPHENE_RECT_INIT(25, 25, 150, 150);
    rr.corner[0] := GRAPHENE_SIZE_INIT(5, 5);
    rr.corner[1] := GRAPHENE_SIZE_INIT(5, 5);
    rr.corner[2] := GRAPHENE_SIZE_INIT(5, 5);
    rr.corner[3] := GRAPHENE_SIZE_INIT(5, 5);
    bw := [2, 2, 2, 2];
    colors[0].items := [0, 0, 1, 1];
    colors[1].items := [1, 0, 1, 1];
    colors[2].items := [0, 1, 1, 1];
    colors[3].items := [0, 1, 0, 1];
    gtk_snapshot_append_border(snapshot, @rr, bw, colors);

    Result := gtk_snapshot_to_node(snapshot);
    g_object_unref(snapshot);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    sprite: PGskRenderNode absolute user_data;
    snapshot: PGtkSnapshot;
    node: PGskRenderNode;
    point: Tgraphene_point_t;
  var
    spriteData: PSpriteData;
    app: PGApplication;
    i: integer;
  begin
    app := g_application_get_default;
    spriteData := g_object_get_data(G_OBJECT(app), spriteDataKey);
    snapshot := gtk_snapshot_new;

    for i := 0 to Length(spriteData^.sprite) - 1 do begin
      point := GRAPHENE_POINT_INIT(Sin(spriteData^.sprite[i].angele) * 100 + Width / 2, Cos(spriteData^.sprite[i].angele) * 100 + Height / 2);
      gtk_snapshot_save(snapshot);
      gtk_snapshot_translate(snapshot, @point);
      gtk_snapshot_append_node(snapshot, sprite);
      gtk_snapshot_restore(snapshot);
    end;

    node := gtk_snapshot_to_node(snapshot);
    gsk_render_node_draw(node, cr);
    gsk_render_node_unref(node);

    g_object_unref(snapshot);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    spriteData: PSpriteData;
    app: PGApplication;
    i: integer;
  begin
    app := g_application_get_default;
    spriteData := g_object_get_data(G_OBJECT(app), spriteDataKey);
    for i := 0 to Length(spriteData^.sprite) - 1 do begin
      spriteData^.sprite[i].angele += spriteData^.sprite[i].step;
    end;

    gtk_widget_queue_draw(widget);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area, button_box: PGtkWidget;
    sprite: PPGskRenderNode absolute user_data;
  begin
    WriteLn('activate');

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, sprite^, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);

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


  procedure shutdown(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    sprite: PPGskRenderNode absolute user_data;
    spriteData: PSpriteData;
  begin
    WriteLn('shutdown');
    spriteData := g_object_get_data(G_OBJECT(app), spriteDataKey);
    g_free(spriteData);

    gsk_render_node_unref(sprite^);
  end;

  procedure startup(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    sprite: PPGskRenderNode absolute user_data;
    spriteData: PSpriteData;
    i: integer;
  begin
    WriteLn('startup');
    sprite^ := CreateSprites;

    spriteData := g_malloc(SizeOf(TSpriteData));

    for i := 0 to Length(spriteData^.sprite) - 1 do begin
      spriteData^.sprite[i].angele := Random * 2 * G_PI;
      spriteData^.sprite[i].step := Random / 20;
    end;

    g_object_set_data(G_OBJECT(app), spriteDataKey, spriteData);
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
    sprite: PGskRenderNode = nil;
  begin
    GSignalShow(G_TYPE_APPLICATION);
    GSignalShow(GTK_TYPE_APPLICATION);

    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @sprite);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup), @sprite);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown), @sprite);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  Randomize;
  main(argc, argv);
end.

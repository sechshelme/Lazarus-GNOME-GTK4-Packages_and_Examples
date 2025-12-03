program project1;

uses
  geom,
  textspan,          // gemo
  cgraph,
  gvcext,
  types,             // textspan, gvcext, cgraph       // Viele Makros entfernt, struct auf Pointer
  gvplugin,
  gvc,               // types, gvcext, gvplugin

  arith,
  cdt,
  color,
  graphviz_version,
  gvcjob,             // geom, color, gvcext
  gvcommon,
  gvconfig,           // gvcext, gvplugin
  //gvplugin_device,
  //gvplugin_layout,
  //gvplugin_loadimage,
  //gvplugin_render,
  //gvplugin_textlayout,
  //gvpr,
  //pack,
  //pathgeom,
  //pathplan,
  //usershape,
  //xdot,

  ctypes,
  fp_graphviz;

var
  stdout: PFILE; cvar;external 'c';

  procedure main;
  const
    png_filename = 'test.png';
  var
    gvc: PGVC_t;
    g: PAgraph_t;
    n, m: PAgnode_t;
  begin
    gvc := gvContext;
    if gvc = nil then begin
      WriteLn('Fehler: Konnte Graphviz-Kontext nicht initialisieren.');
      Exit;
    end;

    g := agopen('G', Agdirected, nil);
    if g = nil then begin
      WriteLn('Fehler: Konnte Graphen nicht erstellen.');
      gvFreeContext(gvc);
      Exit;
    end;

    n := agnode(g, 'Knoten_A', 1);
    m := agnode(g, 'Knoten_B', 1);
    agedge(g, n, m, nil, 1);

    agsafeset(n, 'color', 'red', '');

    WriteLn('Führe Layout mit ''dot''-Engine durch...');
    if gvLayout(gvc, g, 'dot') <> 0 then begin
      WriteLn('Fehler: Layout fehlgeschlagen.');
      Exit;
      agclose(g);
    end;

    WriteLn(#10'--- Start: DOT-Ausgabe (auf stdout) ---');
    gvRender(gvc, g, 'dot', stdout);
    WriteLn('--- Ende: DOT-Ausgabe ---');

    if gvRenderFilename(gvc, g, 'png', png_filename) = 0 then begin
      WriteLn(#10'Erfolgreich gerendert! Die Datei ', png_filename, ' wurde erstellt.');
    end else begin
      WriteLn(#10'Fehler: Rendern in Datei fehlgeschlagen.');
    end;

    gvFreeLayout(gvc, g);
    agclose(g);
    gvFreeContext(gvc);
  end;


begin
  gvconfig_plugin_install_from_library(nil,nil,nil);
  main;
end.

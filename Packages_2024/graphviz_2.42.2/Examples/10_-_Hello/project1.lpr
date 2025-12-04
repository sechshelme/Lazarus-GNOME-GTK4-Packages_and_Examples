program project1;

uses
  fp_graphviz;

var
  stdout: PFILE; cvar;external 'c';

  procedure main;
  const
    png_filename = '/tmp/test.png';
  var
    gvc: PGVC_t;
    g: PAgraph_t;
    a, b, c, d, e: PAgnode_t;
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

    a := agnode(g, 'Knoten_A', 1);
    b := agnode(g, 'Knoten_B', 1);
    c := agnode(g, 'Knoten_C', 1);
    d := agnode(g, 'Knoten_D', 1);
    e := agnode(g, 'Knoten_E', 1);

    agedge(g, a, b, nil, 1);
    agedge(g, c, d, nil, 1);
    agedge(g, a, c, nil, 1);
    agedge(g, b, d, nil, 1);
    agedge(g, d, e, nil, 1);
    agedge(g, b, e, nil, 1);

    agsafeset(a, 'color', 'red', '');
    agsafeset(b, 'color', 'green', '');
    agsafeset(c, 'color', 'blue', '');
    agsafeset(d, 'color', 'cyan', '');

    WriteLn('Führe Layout mit ''dot''-Engine durch...');
    if gvLayout(gvc, g, 'dot') <> 0 then begin
      WriteLn('Fehler: Layout fehlgeschlagen.');
      agclose(g);
      Exit;
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
  main;
end.

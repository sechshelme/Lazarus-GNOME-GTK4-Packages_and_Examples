program project1;

uses
  fp_sord;

  procedure main;
  var
    world: PSordWorld;
    model: PSordModel;
    alice, knows, bob: PSordNode;
  const
    uri_alice = 'http://example.org/Alice';
    uri_knows = 'http://example.org/knows';
  var
    quad, read_quad: TSordQuad;
    iter: PSordIter;
    s_str, p_str, o_str: pansichar;
  begin
    world := sord_world_new;

    model := sord_new(world, SORD_SPO, False);
    alice := sord_new_uri(world, uri_alice);
    knows := sord_new_uri(world, uri_knows);
    bob := sord_new_literal(world, nil, 'Bob', nil);

    quad[0] := alice;
    quad[1] := knows;
    quad[2] := bob;
    quad[3] := nil;

    sord_add(model, quad);

    WriteLn('Daten hinzugefügt: Alice kennt Bob.');
    WriteLn('-- Starte Suche --');

    iter := sord_search(model, alice, nil, nil, nil);
    if iter <> nil then begin
      while not sord_iter_end(iter) do begin
        sord_iter_get(iter, read_quad);

        s_str := sord_node_get_string(read_quad[SORD_SUBJECT]);
        p_str := sord_node_get_string(read_quad[SORD_PREDICATE]);
        o_str := sord_node_get_string(read_quad[SORD_OBJECT]);

        WriteLn('Gefunden:');
        WriteLn('  Subjekt:  ', s_str);
        WriteLn('  Prädikat: ', p_str);
        WriteLn('  Objekt:   ', o_str);

        sord_iter_next(iter);
      end;
      sord_iter_free(iter);
    end else begin
      WriteLn('Keine Ergebnisse gefunden.');
    end;

    sord_node_free(world, bob);
    sord_node_free(world, knows);
    sord_node_free(world, alice);

    sord_free(model);
    sord_world_free(world);
  end;

begin
  main;
end.

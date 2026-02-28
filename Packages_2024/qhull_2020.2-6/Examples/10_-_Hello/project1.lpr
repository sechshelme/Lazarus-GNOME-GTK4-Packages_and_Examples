program project1;

{$WARN 4110 off}

uses
  fp_qhull_r;

type
  TVector2d = array[0..1] of TcoordT;

  procedure main;
  const
    points: array of TVector2d = (
      (0.0, 0.0),
      (1.0, 0.5),
      (0.5, 1.0),
      (0.2, 0.2),
      (0.8, 0.1));

  var
    qh: PqhT;
    facet, n0, n1: PfacetT;
    curlong, totlong, id, id0, id1: longint;
    vertex, v0, v1: PvertexT;
    vertices, neighbors: PsetT;

  begin
    qh := qh_malloc(SizeOf(TqhT));
    qh_zero(qh, stdout);

    exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull FA Fv Fn Fx s', stdout, stdout);
    WriteLn('----------------------------------'#10);

    if exitcode = 0 then begin
      WriteLn('BETEILIGTE ECKPUNKTE (Vertices):');
      vertex := qh^.vertex_list;
      while (vertex <> nil) and (vertex^.next <> nil) do begin
        id := qh_pointid(qh, vertex^.point);
        WriteLn('  Pin ', id, ' -> (', vertex^.point[0]: 2: 1, ', ', vertex^.point[1]: 2: 1,')');
        vertex := vertex^.next;
      end;
      WriteLn;

      WriteLn('VERBINDUNGSLINIEN (Facets/Kanten):');
      facet := qh^.facet_list;
      while (facet <> nil) and (facet^.next <> nil) do begin
        vertices := facet^.vertices;

        if vertices <> nil then begin
          v0 := vertices^.e[0].p;
          v1 := vertices^.e[1].p;

          id0 := qh_pointid(qh, v0^.point);
          id1 := qh_pointid(qh, v1^.point);

          WriteLn('  Linie: Pin ', id0, ' (', v0^.point[0]: 2: 1, ', ', v0^.point[1]: 2: 1, ') -> Pin ', id1, ' (', v1^.point[0]: 2: 1, ', ', v1^.point[1]: 2: 1, ')');
        end;

        neighbors := facet^.neighbors;
        if neighbors <> nil then begin
          n0 := neighbors^.e[0].p;
          n1 := neighbors^.e[1].p;
          WriteLn('  Kante ', facet^.id, ' grenzt an Kante ', n0^.id, ' und Kante ', n1^.id);
        end;
        WriteLn;
        facet := facet^.next;
      end;

      WriteLn;
      WriteLn('Fläche: ', qh^.totvol: 2: 1);
      WriteLn('Umfang: ', qh^.totarea: 2: 1);
    end;
    qh_freeqhull(qh, qh_ALL);
    qh_memfreeshort(qh, @curlong, @totlong);
    qh_free(qh);
  end;

begin
  main;
end.

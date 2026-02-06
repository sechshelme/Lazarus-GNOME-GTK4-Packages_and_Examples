program project1;

uses
  fp_polylib64;
{$IFDEF linux}
var
stdout: PFILE; cvar; external 'c';
{$ENDIF}

{$IFDEF windows}
function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;
{$ENDIF}

  procedure extract_mesh_data(D: Ppolyhedron);
  var
  p_idx:Integer=0;
  p: Ppolyhedron;
  w: TValue;
  x, y, z: Extended;
  i: Integer;
begin
p := D ; while  p <> nil do begin
      WriteLn(#10'--- Teil-Polyeder ',p_idx,' ---');


      if (p<>nil)and( p^.Ray<>nil) then begin
          for  i := 0 to  p^.NbRays-1 do begin
              // In polylib64 ist Value ein long long.
              // Wir greifen direkt auf das Array zu.
               w := p^.Ray[i][0];

              if w > 0 then begin
                  x := p^.Ray[i][1] / w;
                   y :=p^.Ray[i][2] / w;
                  z := p^.Ray[i][3] / w;

                  WriteLn('Vertex ', i:3,  '  (', x:4:2, ', ', y:4:2,', ',z:4:2,')');

              end;
              end;
end;       p := p^.next
  end;
end;

  procedure print_opengl_indices(C: Ppolyhedron);
begin

end;

  procedure main;
  const
a_con:array [0..5,0..4]of Int64 = (
        (1,  1,  0,  0,   0), //  x >= 0
        (1, -1,  0,  0,  10), // -x + 10 >= 0  => x <= 10
        (1,  0,  1,  0,   0), //  y >= 0
        (1,  0, -1,  0,  10), // -y + 10 >= 0  => y <= 10
        (1,  0,  0,  1,   0), //  z >= 0
        (1,  0,  0, -1,  10)  // -z + 10 >= 0  => z <= 10
    );

b_con:array [0..3,0..4]of Int64 = (
    (1,  1,  0,  0,  -2), //  x - 2 >= 0  => x >= 2
    (1, -1,  0,  0,   8), // -x + 8 >= 0  => x <= 8
    (1,  0,  1,  0,  -2), //  y - 2 >= 0  => y >= 2
    (1,  0, -1,  0,   8)  // -y + 8 >= 0  => y <= 8
);


  var
    A_mat, B_mat: Pmatrix;
    i, j: Integer;
    A, B, C, p: Ppolyhedron;
    count:SizeInt;
  begin
      A_mat := Matrix_Alloc(6, 5); // 6 Zeilen, 5 Spalten (0/1, x, y, z, konst)

      for  i:=0 to 5 do for  j:=0 to 4 do
//      value_set_si(A_mat^.p[i][j], a_con[i][j]);
      A_mat^.p[i][j]:= a_con[i][j];

      // Loch (B): Ein kleinerer Quader in der Mitte (2 <= x,y <= 8, z geht durch)
B_mat := Matrix_Alloc(4, 5);
for  i:=0 to 3 do for  j:=0 to 4 do
//value_set_si(B_mat^.p[i][j], b_con[i][j]);
B_mat^.p[i][j]:= b_con[i][j];

      // 2. In Polyeder-Objekte umwandeln
      A := Constraints2Polyhedron(A_mat, 200); // 200 ist MAX_RAYS
      B := Constraints2Polyhedron(B_mat, 200);

      // 3. Die Differenz berechnen: C = A \ B
      // DomainDifference gibt eine Liste von konvexen Polyedern zurück
      C := DomainDifference(A, B, 200);

      // 4. Ergebnis ausgeben
      WriteLn('Das Objekt mit Loch besteht aus folgenden konvexen Teilen:');
      count := 0;
      p:=C;

      while p<>nil do begin
          WriteLn(#10'Teil-Polyeder ', count);
          Polyhedron_Print(stdout, P_VALUE_FMT, p);
          p := p^.next;
          inc(count);;
      end;


  extract_mesh_data(C);
  print_opengl_indices(C);

      // 5. Speicher aufräumen
      Domain_Free(C);
      Polyhedron_Free(A);
      Polyhedron_Free(B);
      Matrix_Free(A_mat);
      Matrix_Free(B_mat);
  end;

begin
  main;
end.
